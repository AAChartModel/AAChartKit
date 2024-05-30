//
// Created by AnAn on 2023/3/28.
// Copyright (c) 2023 An An. All rights reserved.
//

#import "CustomClickEventCallbackMessageVC.h"
#import "AAChartKit.h"
#import "AADOMRectModel.h"

static NSString * const kUserContentMessageNameChartClicked = @"click";
static NSString * const kUserContentMessageNameChartMoveOver = @"moveOver";
static NSString * const kUserContentMessageNameChartDefaultSelected = @"defaultSelected";

@interface CustomWeakProxy : NSProxy

@property (nonatomic, weak, readonly, nullable) id target;

+ (nonnull instancetype)proxyWithTarget:(nonnull id)target;

@end

@implementation CustomWeakProxy

- (instancetype)initWithTarget:(id)target {
    _target = target;
    return self;
}

+ (instancetype)proxyWithTarget:(id)target {
    return [[CustomWeakProxy alloc] initWithTarget:target];
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


@interface CustomClickEventCallbackMessageVC ()

@property (nonatomic, strong) AAChartView *aaChartView;
@property (nonatomic, strong) UIView *lineView;
@property (nonatomic, strong) CustomWeakProxy *weakProxy;

@end

@implementation CustomClickEventCallbackMessageVC

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

    [chartConfiguration.userContentController addScriptMessageHandler:scriptMessageHandler name:kUserContentMessageNameChartClicked];
    [chartConfiguration.userContentController addScriptMessageHandler:scriptMessageHandler name:kUserContentMessageNameChartMoveOver];
    [chartConfiguration.userContentController addScriptMessageHandler:scriptMessageHandler name:kUserContentMessageNameChartDefaultSelected];
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

                    AASeriesElement.new
                            .nameSet(@"Berlin Hot")
                            .dataSet(@[@1.56, @1.91, @2.45, @3.87, @3.24, @4.90, @4.61, @4.10, @4.17, @3.85, @4.17, @3.46, @3.46, @3.55, @3.50, @4.13, @2.58, @2.28]),

                    AASeriesElement.new
                            .nameSet(@"Beijing Hot")
                            .dataSet(@[@1.16, @1.67, @2.64, @2.86, @3.00, @3.21, @4.14, @4.07, @3.68, @3.11, @3.41, @3.25, @3.32, @3.07, @3.92, @3.05, @2.18, @3.24]),

                    AASeriesElement.new
                            .nameSet(@"London Hot")
                            .dataSet(@[@5.59, @3.09, @4.09, @6.14, @5.33, @6.05, @5.71, @6.22, @6.56, @4.75, @5.27, @6.02, @5.22, @5.77, @6.19, @5.68, @4.33, @5.48]),
            ]);
}

- (NSString *)configureClickOrMoveOverEventJSEventWithUserContentMessageName:(NSString *)userContentMessageName {
    return [NSString stringWithFormat:@AAJSFunc((function() {
        let svgElement = aaGlobalChart.series[0].data[this.index].graphic.element;
        let rect = svgElement.getBoundingClientRect();
        let messageBody = {
            "name": this.series.name,
            "y": this.y,
            "x": this.x,
            "category": this.category,
            "index": this.index,
            "DOMRect": JSON.stringify(rect),
        };
        window.webkit.messageHandlers.%@.postMessage(messageBody);
    })),userContentMessageName];
}

- (AAOptions *)columnChartWithCustomJSFunction {
    AAOptions *aaOptions = [self areasplineChart].aa_toAAOptions;

    //        获取用户点击位置的代码逻辑, 参考:
    //        * https://www.highcharts.com/forum/viewtopic.php?t=11983
    //        * https://developer.mozilla.org/zh-CN/docs/Web/API/Element/getBoundingClientRect
    //
    //        JSON.stringify(), 参考:
    //        * https://developer.mozilla.org/en-US/docs/Web/JavaScript/Reference/Global_Objects/JSON/stringify
    aaOptions.plotOptions.series
            .pointSet(AAPoint.new
                      .eventsSet(AAPointEvents.new
                                 .clickSet([self configureClickOrMoveOverEventJSEventWithUserContentMessageName:kUserContentMessageNameChartClicked])
                                 .mouseOverSet([self configureClickOrMoveOverEventJSEventWithUserContentMessageName:kUserContentMessageNameChartMoveOver])
                                 ));

    //默认选中的位置索引
    NSInteger defaultSelectedIndex = 5;

    //https://api.highcharts.com/highcharts/chart.events.load
    //https://www.highcharts.com/forum/viewtopic.php?t=36508
    aaOptions.chart
        .eventsSet(AAChartEvents.new
                   .loadSet([NSString stringWithFormat:@AAJSFunc((function() {
                       let points = [],
                       chart = this,
                       series = chart.series,
                       length = series.length;
                       
                       let defaultSelectedIndex = %ld;
                       
                       for (let i = 0; i < length; i++) {
                           let pointElement = series[i].data[defaultSelectedIndex];
                           points.push(pointElement);
                       }
                       chart.tooltip.refresh(points);
                       
                       let selectedPointDataElement = chart.series[0].data[defaultSelectedIndex];
                       let svgElement = selectedPointDataElement.graphic.element;
                       let rect = svgElement.getBoundingClientRect();
                       let messageBody = {
                           "index": defaultSelectedIndex,
                           "DOMRect": JSON.stringify(rect),
                           "x": selectedPointDataElement.x,
                           "x2": selectedPointDataElement.x2,
                           "y": selectedPointDataElement.y,
                       };
                       window.webkit.messageHandlers.%@.postMessage(messageBody);
                   })),defaultSelectedIndex,kUserContentMessageNameChartDefaultSelected]));

    return aaOptions;
}

- (NSNumber *)convertJSValueToFloat:(id)jsValue {
    float floatValue = 0;
    if ([jsValue isKindOfClass:[NSString class]]) {
        floatValue = [jsValue floatValue];
    } else if ([jsValue isKindOfClass:[NSNumber class]]) {
        floatValue = [jsValue floatValue];
    }
    return @(floatValue);
}

- (AADOMRectModel *)getEventMessageModelWithDOMRectDic:(NSDictionary *)DOMRectDic {
    AADOMRectModel *DOMRectModel = AADOMRectModel.new;
    DOMRectModel.x = [self convertJSValueToFloat:DOMRectDic[@"x"]];
    DOMRectModel.y = [self convertJSValueToFloat:DOMRectDic[@"y"]];
    DOMRectModel.width = [self convertJSValueToFloat:DOMRectDic[@"width"]];
    DOMRectModel.height = [self convertJSValueToFloat:DOMRectDic[@"height"]];
    DOMRectModel.top = [self convertJSValueToFloat:DOMRectDic[@"top"]];
    DOMRectModel.right = [self convertJSValueToFloat:DOMRectDic[@"right"]];
    DOMRectModel.bottom = [self convertJSValueToFloat:DOMRectDic[@"bottom"]];
    DOMRectModel.left = [self convertJSValueToFloat:DOMRectDic[@"left"]];
    return DOMRectModel;
}


//字符串转字典
- (NSDictionary *)stringValueDic:(NSString *)str {
    NSData *data = [str dataUsingEncoding:NSUTF8StringEncoding];
    NSDictionary *dict = [NSJSONSerialization JSONObjectWithData:data options:NSJSONReadingMutableContainers error:nil];
    return dict;
}

//格式化为打印效果的字符串
- (NSString *)dicStringToPrettyString:(NSDictionary *)dic {
    NSData *data = [NSJSONSerialization dataWithJSONObject:dic options:NSJSONWritingPrettyPrinted error:nil];
    NSString *str = [[NSString alloc] initWithData:data encoding:NSUTF8StringEncoding];
    return str;
}

// MARK: - WKScriptMessageHandler
- (void)userContentController:(WKUserContentController *)userContentController didReceiveScriptMessage:(WKScriptMessage *)message {
    if ([message.name isEqualToString:kUserContentMessageNameChartClicked]) {
        NSDictionary *clickEventMessage = message.body;
        NSDictionary *DOMRectDic = [self stringValueDic:clickEventMessage[@"DOMRect"]];
        AADOMRectModel *DOMRectModel = [self getEventMessageModelWithDOMRectDic:DOMRectDic];
        
        CGFloat frameX = DOMRectModel.x.floatValue + (DOMRectModel.width.floatValue / 2);
        NSLog(@"点击图表后, 获取的 SVG 元素的水平中心点的坐标为:%f", frameX);
        self.lineView.frame = CGRectMake(frameX, 0, 2, self.view.frame.size.height);
        self.lineView.backgroundColor = [UIColor redColor];
        
        NSString *basicMessageInfo = @"                                                              \n\
            Clicked point series element name: [%@]                                                  \n\
            🖱🖱🖱WARNING!!!!!!!!!!!!!!!!!!!! Click Event Message !!!!!!!!!!!!!!!!!!!! WARNING🖱🖱🖱\n\
            ——‧——‧——‧——‧——‧——‧——‧——‧——‧——‧——‧——‧——‧——‧——‧——‧——‧——‧——‧——‧——‧——‧——‧——‧——‧——‧——‧——‧——‧——‧——‧——‧——‧——‧——‧——‧\n\
            %@\n\
            ——‧——‧——‧——‧——‧——‧——‧——‧——‧——‧——‧——‧——‧——‧——‧——‧——‧——‧——‧——‧——‧——‧——‧——‧——‧——‧——‧——‧——‧——‧——‧——‧——‧——‧——‧——‧\n";
        NSString *seriesElementName = clickEventMessage[@"name"];
        NSString *clickMessageStr = [self dicStringToPrettyString:clickEventMessage];
        NSLog(@"%@", [NSString stringWithFormat:basicMessageInfo, seriesElementName, clickMessageStr]);
        
    } else if ([message.name isEqualToString:kUserContentMessageNameChartMoveOver]) {
        NSDictionary *moveOverEventMessage = message.body;
        NSDictionary *DOMRectDic = [self stringValueDic:moveOverEventMessage[@"DOMRect"]];
        AADOMRectModel *DOMRectModel = [self getEventMessageModelWithDOMRectDic:DOMRectDic];

        CGFloat frameX = DOMRectModel.x.floatValue + (DOMRectModel.width.floatValue / 2);
        NSLog(@"手指掠过图表后, 获取的 SVG 元素的水平中心点的坐标为:%f", frameX);
        self.lineView.frame = CGRectMake(frameX, 0, 2, self.view.frame.size.height);
        self.lineView.backgroundColor = [UIColor greenColor];
        
        NSString *basicMessageInfo = @"                                                                  \n\
            Move Over point series element name: [%@]                                                    \n\
            ✈️✈️✈️WARNING!!!!!!!!!!!!!!!!!!!! Move Over Event Message !!!!!!!!!!!!!!!!!!!! WARNING✈️✈️✈️\n\
            ——‧——‧——‧——‧——‧——‧——‧——‧——‧——‧——‧——‧——‧——‧——‧——‧——‧——‧——‧——‧——‧——‧——‧——‧——‧——‧——‧——‧——‧——‧——‧——‧——‧——‧——‧——‧\n\
            %@\n\
            ——‧——‧——‧——‧——‧——‧——‧——‧——‧——‧——‧——‧——‧——‧——‧——‧——‧——‧——‧——‧——‧——‧——‧——‧——‧——‧——‧——‧——‧——‧——‧——‧——‧——‧——‧——‧\n";
        NSString *seriesElementName = moveOverEventMessage[@"name"];
        NSString *moveOverMessageStr = [self dicStringToPrettyString:moveOverEventMessage];
        NSLog(@"%@", [NSString stringWithFormat:basicMessageInfo, seriesElementName, moveOverMessageStr]);


    } else if ([message.name isEqualToString:kUserContentMessageNameChartDefaultSelected]) {
        NSDictionary *defaultSelectedEventMessage = message.body;
        NSDictionary *DOMRectDic = [self stringValueDic:defaultSelectedEventMessage[@"DOMRect"]];
        AADOMRectModel *DOMRectModel = [self getEventMessageModelWithDOMRectDic:DOMRectDic];

        CGFloat frameX = DOMRectModel.x.floatValue + (DOMRectModel.width.floatValue / 2);
        NSLog(@"默认选中图表后, 获取的 SVG 元素的水平中心点的坐标为:%f", frameX);
        self.lineView.frame = CGRectMake(frameX, 0, 3, self.view.frame.size.height);
        self.lineView.backgroundColor = [UIColor blueColor];
        
        NSString *basicMessageInfo = @"                        \n\
            Default Selected point series element name: [%@]   \n\
            🎉🎉🎉 !!!Default Selected Event Message!!! 🎉🎉🎉\n\
            ——‧——‧——‧——‧——‧——‧——‧——‧——‧——‧——‧——‧——‧——‧——‧——‧——‧——‧——‧——‧——‧——‧——‧——‧——‧——‧——‧——‧——‧——‧——‧——‧——‧——‧——‧——‧\n\
            %@\n\
            ——‧——‧——‧——‧——‧——‧——‧——‧——‧——‧——‧——‧——‧——‧——‧——‧——‧——‧——‧——‧——‧——‧——‧——‧——‧——‧——‧——‧——‧——‧——‧——‧——‧——‧——‧——‧\n";
        NSString *seriesElementName = defaultSelectedEventMessage[@"name"];
        NSString *defaultSelectedMessageStr = [self dicStringToPrettyString:defaultSelectedEventMessage];
        NSLog(@"%@", [NSString stringWithFormat:basicMessageInfo, seriesElementName, defaultSelectedMessageStr]);
    }
}

//MARK: - getter
- (CustomWeakProxy *)weakProxy {
    if (!_weakProxy) {
        _weakProxy = [CustomWeakProxy proxyWithTarget:self];
    }
    return _weakProxy;
}

- (UIView *)lineView {
    if (!_lineView) {
        _lineView = [[UIView alloc] init];
        _lineView.backgroundColor = [UIColor redColor];
        [self.view addSubview:_lineView];
    }
    return _lineView;
}

//MARK: - delloc
- (void)dealloc {
    [self.aaChartView.configuration.userContentController removeAllUserScripts];
    [[NSNotificationCenter defaultCenter] removeObserver:self];
    NSLog(@"👻👻👻 AAChartView was destroyed!!!");
}

@end
