//
//  CustomTooltipClickEventCallbackVC.m
//  AAChartKitDemo
//
//  Created by AnAn on 2024/10/16.
//  Copyright © 2024 An An. All rights reserved.
//

#import "CustomTooltipClickEventCallbackVC.h"

#import "AAChartKit.h"

static NSString * const kUserContentMessageNameChartTooltipClicked = @"tooltipClicked";


@interface CustomNewWeakProxy : NSProxy

@property (nonatomic, weak, readonly, nullable) id target;

+ (nonnull instancetype)proxyWithTarget:(nonnull id)target;

@end

@implementation CustomNewWeakProxy

- (instancetype)initWithTarget:(id)target {
    _target = target;
    return self;
}

+ (instancetype)proxyWithTarget:(id)target {
    return [[CustomNewWeakProxy alloc] initWithTarget:target];
}

- (id)forwardingTargetForSelector:(SEL)selector {
    return _target;
}

- (void)forwardInvocation:(NSInvocation *)invocation {
    void *null = NULL;
    [invocation setReturnValue:&null];
}

- (NSMethodSignature *)methodSignatureForSelector:(SEL)selector {
    return [NSObject instanceMethodSignatureForSelector:@selector(init)];
}

- (BOOL)respondsToSelector:(SEL)aSelector {
    return [_target respondsToSelector:aSelector];
}

@end



@interface CustomTooltipClickEventCallbackVC ()

@property (nonatomic, strong) AAChartView *aaChartView;
@property (nonatomic, strong) CustomNewWeakProxy *weakProxy;

@end

@implementation CustomTooltipClickEventCallbackVC


- (void)viewDidLoad {
    [super viewDidLoad];

    self.view.backgroundColor = [UIColor whiteColor];

    [self configureChartView];
    [self configureChartViewCustomEventMessageHandler];

    AAOptions *aaOptions = [self columnChartWithCustomJSFunction];
    [self.aaChartView aa_drawChartWithOptions:aaOptions];
}

- (void)configureChartView {
    self.aaChartView = [[AAChartView alloc]init];
    CGFloat chartViewWidth = self.view.frame.size.width;
    CGFloat chartViewHeight = self.view.frame.size.height;
    self.aaChartView.frame = CGRectMake(0,
                                        60,
                                        chartViewWidth,
                                        chartViewHeight);
    [self.view addSubview:self.aaChartView];
    self.aaChartView.scrollEnabled = false;//Disable chart content scrolling
}

- (void)configureChartViewCustomEventMessageHandler {
    id <WKScriptMessageHandler> scriptMessageHandler = (id<WKScriptMessageHandler>)self.weakProxy;//此处不直接设置为 self 是为了防止循环引用导致内存泄露
    WKWebViewConfiguration *chartConfiguration = self.aaChartView.configuration;

    [chartConfiguration.userContentController addScriptMessageHandler:scriptMessageHandler name:kUserContentMessageNameChartTooltipClicked];

}

- (AAChartModel *)areasplineChart {
    return AAChartModel.new
            .chartTypeSet(AAChartTypeAreaspline)
            .stackingSet(AAChartStackingTypeNormal)
            .titleSet(@"Free-Style Rounded Corners Stacking Column Chart")
            .colorsThemeSet(@[
                    [AAGradientColor gradientColorWithStartColorString:AARgbColor(128, 255, 165) endColorString:AARgbColor(1  , 191, 236)],
                    [AAGradientColor gradientColorWithStartColorString:AARgbColor(0  , 221, 255) endColorString:AARgbColor(77 , 119, 255)],
                    [AAGradientColor gradientColorWithStartColorString:AARgbColor(55 , 162, 255) endColorString:AARgbColor(116, 21 , 219)],
                    [AAGradientColor gradientColorWithStartColorString:AARgbColor(255, 0  , 135) endColorString:AARgbColor(135, 0  , 157)],
                    [AAGradientColor gradientColorWithStartColorString:AARgbColor(255, 191, 0  ) endColorString:AARgbColor(224, 62 , 76 )],
            ])
            .seriesSet(@[
                    AASeriesElement.new
                            .nameSet(@"Tokyo Hot")
                            .dataSet(@[@2.10, @2.54, @2.78, @3.62, @4.41, @4.09, @3.83, @4.47, @4.20, @3.94, @3.80, @3.58, @3.19, @4.30, @3.69, @3.52, @3.02, @3.30]),

            ]);
}

- (AAOptions *)columnChartWithCustomJSFunction {
    AAOptions *aaOptions = [self areasplineChart].aa_toAAOptions;

    //https://api.highcharts.com/highcharts/chart.events.load
    //https://www.highcharts.com/forum/viewtopic.php?t=36508
    aaOptions.chart
        .eventsSet(AAChartEvents.new
                   .loadSet([NSString stringWithFormat:@AAJSFunc((function() {
                       Highcharts.wrap(Highcharts.Tooltip.prototype, 'refresh', function (proceed, point, mouseEvent) {
                           // 调用原始的 refresh 方法，确保 tooltip 正常显示
                           proceed.apply(this, Array.prototype.slice.call(arguments, 1));

                           const tooltip = this;
                           const chart = tooltip.chart;

                           // 缓存当前的 point 或 points 数据
                           tooltip.currentPoints = point;

                           // 检查是否已绑定 click 事件
                           if (!chart.hasTooltipClickEvent) {
                               chart.hasTooltipClickEvent = true;

                               // 绑定 chart 的 container 的 click 事件
                               Highcharts.addEvent(chart.container, 'click', function (e) {
                                   const tooltipBox = tooltip.label && tooltip.label.getBBox();
                                   if (tooltipBox) {
                                       const { left, top } = chart.container.getBoundingClientRect();
                                       const clickX = e.clientX - left;
                                       const clickY = e.clientY - top;

                                       // 检查点击是否在 tooltip 的范围内
                                       if (
                                           clickX >= tooltipBox.x &&
                                           clickX <= tooltipBox.x + tooltipBox.width &&
                                           clickY >= tooltipBox.y &&
                                           clickY <= tooltipBox.y + tooltipBox.height
                                       ) {
                                           // 处理点击事件，并使用缓存的 points 数据
                                           if (tooltip.currentPoints) {
                                               const points = Array.isArray(tooltip.currentPoints) ? tooltip.currentPoints : [tooltip.currentPoints];
                                               const tooltipContent = points.map(point => `Series: ${point.series.name}, X: ${point.x}, Y: ${point.y}`).join('\n');

                                               // 发送消息或执行自定义逻辑
                                               if (
                                                   window.webkit &&
                                                   window.webkit.messageHandlers &&
                                                   window.webkit.messageHandlers.tooltipClicked
                                               ) {
                                                   window.webkit.messageHandlers.%@.postMessage(tooltipContent);

                                               }

                                               console.log('Tooltip clicked:', tooltipContent);
                                           }
                                       }
                                   }
                               });
                           }
                       });

                   })),kUserContentMessageNameChartTooltipClicked]));

    return aaOptions;
}


// MARK: - WKScriptMessageHandler
- (void)userContentController:(WKUserContentController *)userContentController didReceiveScriptMessage:(WKScriptMessage *)message {
    if ([message.name isEqualToString:kUserContentMessageNameChartTooltipClicked]) {
        NSDictionary *clickEventMessage = message.body;
        NSLog(@"获取 tooltipClicked 事件信息: %@", clickEventMessage);
    }
}

//MARK: - getter
- (CustomNewWeakProxy *)weakProxy {
    if (!_weakProxy) {
        _weakProxy = [CustomNewWeakProxy proxyWithTarget:self];
    }
    return _weakProxy;
}



//MARK: - delloc
- (void)dealloc {
    [self.aaChartView.configuration.userContentController removeAllUserScripts];
    [[NSNotificationCenter defaultCenter] removeObserver:self];
    NSLog(@"👻👻👻 AAChartView was destroyed!!!");
}
 

@end

