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

@interface CustomTooltipClickEventCallbackVC ()

@property (nonatomic, strong) AAChartView *aaChartView;
@property (nonatomic, strong) AAWeakProxy *weakProxy;

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
    if (@available(macCatalyst 16.4, *)) {
        self.aaChartView.inspectable = true;
    } else {
        // Fallback on earlier versions
    }
    self.aaChartView.scrollEnabled = false;//Disable chart content scrolling
}

- (void)configureChartViewCustomEventMessageHandler {
    id <WKScriptMessageHandler> scriptMessageHandler = (id<WKScriptMessageHandler>)self.weakProxy;//此处不直接设置为 self 是为了防止循环引用导致内存泄露
    WKWebViewConfiguration *chartConfiguration = self.aaChartView.configuration;

    [chartConfiguration.userContentController addScriptMessageHandler:scriptMessageHandler name:kUserContentMessageNameChartTooltipClicked];
}

/*
 ChatGPT 推荐的方法
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
                             window.webkit.messageHandlers.tooltipClicked.postMessage(tooltipContent);
                         }

                         console.log('Tooltip clicked:', tooltipContent);
                     }
                 }
             }
         });
     }
 });

 */


/*
      Claude 建议优化之后的方法
     // 工具函数：检查点击是否在元素范围内
     const isClickInside = (click, box) => {
         const { x, y } = click;
         return x >= box.x &&
                x <= box.x + box.width &&
                y >= box.y &&
                y <= box.y + box.height;
     };

     // 工具函数：获取点的信息
     const getPointInfo = point => ({
         series: point.series.name,
         x: point.x,
         y: point.y
     });

     // 工具函数：发送消息
     const sendMessage = content => {
         const { webkit } = window;
         if (webkit?.messageHandlers?.tooltipClicked) {
             webkit.messageHandlers.tooltipClicked.postMessage(content);
         }
         console.log('Tooltip clicked:', content);
     };

     Highcharts.wrap(Highcharts.Tooltip.prototype, 'refresh', function(proceed, point) {
         proceed.call(this, point);
         
         const tooltip = this;
         const chart = tooltip.chart;
         
         // 如果已经绑定了事件,直接返回
         if (tooltip.clickHandler) return;

         // 创建点击处理函数
         tooltip.clickHandler = event => {
             const tooltipBox = tooltip.label?.getBBox();
             if (!tooltipBox) return;

             const { left, top } = chart.container.getBoundingClientRect();
             const click = {
                 x: event.clientX - left,
                 y: event.clientY - top
             };

             if (!isClickInside(click, tooltipBox)) return;

             // 处理点击事件
             const points = Array.isArray(point) ? point : [point];
             const tooltipContent = points
                 .map(p => getPointInfo(p))
                 .map(info => `Series: ${info.series}, X: ${info.x}, Y: ${info.y}`)
                 .join('\n');

             sendMessage(tooltipContent);
         };

         // 绑定事件
         Highcharts.addEvent(chart.container, 'click', tooltip.clickHandler);
     });
 */

//https://api.highcharts.com/highcharts/chart.events.load
//https://www.highcharts.com/forum/viewtopic.php?t=36508
- (AAOptions *)columnChartWithCustomJSFunction {
    return AAOptions.new
        .chartSet(AAChart.new
                  .typeSet(AAChartTypeAreaspline)
                  .eventsSet(AAChartEvents.new
                             .loadSet([NSString stringWithFormat:@AAJSFunc((function() {
                                 // 工具函数：检查点击是否在元素范围内
                                     const isClickInside = (click, box) => {
                                         const { x, y } = click;
                                         return x >= box.x &&
                                                x <= box.x + box.width &&
                                                y >= box.y &&
                                                y <= box.y + box.height;
                                     };

                                     // 工具函数：获取点的信息
                                     const getPointInfo = point => ({
                                         series: point.series.name,
                                         x: point.x,
                                         y: point.y
                                     });

                                     // 工具函数：发送消息
                                     const sendMessage = content => {
                                         const { webkit } = window;
                                         if (webkit?.messageHandlers?.%@) {
                                             webkit.messageHandlers.%@.postMessage(content);
                                         }
                                         
                                         //⚠️此行代码仅供测试专用, 正式环境需要移除这段代码
                                         console.log('Tooltip clicked:', content);
                                     };

                                     Highcharts.wrap(Highcharts.Tooltip.prototype, 'refresh', function(proceed, point) {
                                         proceed.call(this, point);
                                         
                                         const tooltip = this;
                                         const chart = tooltip.chart;
                                         
                                         // 如果已经绑定了事件,直接返回
                                         if (tooltip.clickHandler) return;

                                         // 创建点击处理函数
                                         tooltip.clickHandler = event => {
                                             const tooltipBox = tooltip.label?.getBBox();
                                             if (!tooltipBox) return;

                                             const { left, top } = chart.container.getBoundingClientRect();
                                             const click = {
                                                 x: event.clientX - left,
                                                 y: event.clientY - top
                                             };

                                             if (!isClickInside(click, tooltipBox)) return;

                                             // 处理点击事件
                                             const points = Array.isArray(point) ? point : [point];
                                             const tooltipContent = points
                                                 .map(p => getPointInfo(p))
                                                 .map(info => `Series: ${info.series}, X: ${info.x}, Y: ${info.y}`)
                                                 .join('\n');

                                             sendMessage(tooltipContent);
                                         };

                                         // 绑定事件
                                         Highcharts.addEvent(chart.container, 'click', tooltip.clickHandler);
                                     });
                                 
                             })),kUserContentMessageNameChartTooltipClicked, kUserContentMessageNameChartTooltipClicked]))
                  )
        .xAxisSet(AAXAxis.new
                  .categoriesSet(@[@"Jan", @"Feb", @"Mar", @"Apr", @"May", @"Jun", @"Jul", @"Aug", @"Sep", @"Oct", @"Nov", @"Dec"]))
        .seriesSet(@[
            AASeriesElement.new
                .nameSet(@"Tokyo Hot")
                .dataSet(@[@7.0, @6.9, @2.5, @14.5, @18.2, @21.5, @5.2, @26.5, @23.3, @45.3, @13.9, @9.6])
                .markerSet(AAMarker.new
                    .lineColorSet(AAColor.yellowColor)
                    .lineWidthSet(@3)
                    .radiusSet(@10)),
        ]);
}


// MARK: - WKScriptMessageHandler
- (void)userContentController:(WKUserContentController *)userContentController didReceiveScriptMessage:(WKScriptMessage *)message {
    if ([message.name isEqualToString:kUserContentMessageNameChartTooltipClicked]) {
        NSDictionary *clickEventMessage = message.body;
        NSLog(@"获取 tooltipClicked 事件信息: %@", clickEventMessage);
    }
}

//MARK: - getter
- (AAWeakProxy *)weakProxy {
    if (!_weakProxy) {
        _weakProxy = [AAWeakProxy proxyWithTarget:self];
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

