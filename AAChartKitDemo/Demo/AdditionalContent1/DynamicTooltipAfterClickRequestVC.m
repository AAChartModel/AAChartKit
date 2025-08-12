//
//  DynamicTooltipAfterClickRequestVC.m
//  AAChartKitDemo
//
//  Created by AnAn on 2025/8/12.
//  Copyright © 2025 An An. All rights reserved.
//

#import "DynamicTooltipAfterClickRequestVC.h"
#import "AAChartKit.h"

@interface DynamicTooltipAfterClickRequestVC () <AAChartViewEventDelegate>

@property (nonatomic, strong) AAChartView *aaChartView;
@property (nonatomic, strong) UIActivityIndicatorView *loadingIndicator;

@end

@implementation DynamicTooltipAfterClickRequestVC

#pragma mark - Lifecycle

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.title = @"动态Tooltip演示";
    self.view.backgroundColor = [UIColor whiteColor];
    
    [self setupUI];
    [self setupChart];
}

#pragma mark - UI Setup

- (void)setupUI {
    // 添加说明标签
    UILabel *instructionLabel = [[UILabel alloc] initWithFrame:CGRectMake(20, 100, self.view.frame.size.width - 40, 40)];
    instructionLabel.text = @"💡 点击图表中的任意数据点，模拟请求接口获取详细信息";
    instructionLabel.textAlignment = NSTextAlignmentCenter;
    instructionLabel.font = [UIFont systemFontOfSize:14];
    instructionLabel.textColor = [UIColor systemBlueColor];
    instructionLabel.numberOfLines = 2;
    [self.view addSubview:instructionLabel];
    
    // 设置图表视图
    self.aaChartView = [[AAChartView alloc] init];
    CGFloat chartViewWidth = self.view.frame.size.width;
    CGFloat chartViewHeight = self.view.frame.size.height - 200;
    self.aaChartView.frame = CGRectMake(0, 150, chartViewWidth, chartViewHeight);
    self.aaChartView.delegate = self; // 设置代理
    self.aaChartView.scrollEnabled = NO;
    [self.view addSubview:self.aaChartView];
    
    // 设置加载指示器
    self.loadingIndicator = [[UIActivityIndicatorView alloc] initWithActivityIndicatorStyle:UIActivityIndicatorViewStyleLarge];
    self.loadingIndicator.center = CGPointMake(self.view.center.x, self.view.center.y + 50);
    self.loadingIndicator.hidesWhenStopped = YES;
    [self.view addSubview:self.loadingIndicator];
}

- (void)setupChart {
    AAOptions *aaOptions = [self createChartOptions];
    [self.aaChartView aa_drawChartWithOptions:aaOptions];
}

- (AAOptions *)createChartOptions {
    return AAOptions.new
        .chartSet(AAChart.new
                  .typeSet(AAChartTypeColumn))
        .titleSet(AATitle.new
                  .textSet(@"销售数据统计")
                  .styleSet(AAStyle.new
                            .colorSet(@"#333333")
                            .fontSizeSet(@"18px")))
        .subtitleSet(AATitle.new
                     .textSet(@"点击数据列查看详细信息"))
        .xAxisSet(AAXAxis.new
                  .categoriesSet(@[@"1月", @"2月", @"3月", @"4月", @"5月", @"6月"]))
        .yAxisSet(AAYAxis.new
                  .titleSet(AAAxisTitle.new
                            .textSet(@"销售额 (万元)")))
        .tooltipSet(AATooltip.new
                    .enabledSet(@YES)
                    .useHTMLSet(@YES)
//                    .formatterSet(tooltipFormatter)
                    )
        .plotOptionsSet(AAPlotOptions.new
                        .columnSet(AAColumn.new
                                   .pointPaddingSet(@0.1)
                                   .groupPaddingSet(@0.1)
                                   .borderWidthSet(@2)
                                   ))
        .seriesSet(@[
            AASeriesElement.new
                .nameSet(@"目标销售")
                .dataSet(@[@135, @160, @180, @170, @200, @195])
                .colorSet(@"#e74c3c")
        ]);
}

#pragma mark - AAChartViewEventDelegate

- (void)aaChartView:(AAChartView *)aaChartView clickEventWithMessage:(AAClickEventMessageModel *)message {
    NSLog(@"🎯 点击事件: %@ - %@ (值: %@)", message.name, message.category, message.y);
    
    // 显示加载指示器
    [self.loadingIndicator startAnimating];
    
    // 模拟网络请求
    [self simulateNetworkRequestForSeries:message.name 
                                 category:message.category 
                                    value:message.y];
}

#pragma mark - Network Simulation

- (void)simulateNetworkRequestForSeries:(NSString *)seriesName 
                               category:(NSString *)categoryName 
                                  value:(NSNumber *)value {
    
    // 模拟网络延迟 1.5秒
    dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(1.5 * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
        [self.loadingIndicator stopAnimating];
        
        // 生成模拟数据
        NSDictionary *mockData = [self generateMockDataForSeries:seriesName category:categoryName value:value];
        
        // 更新图表tooltip
        [self updateTooltipWithData:mockData forSeries:seriesName category:categoryName];
        
        NSLog(@"✅ 模拟接口请求完成: %@", mockData);
    });
}

- (NSDictionary *)generateMockDataForSeries:(NSString *)seriesName 
                                   category:(NSString *)categoryName 
                                      value:(NSNumber *)value {
    
    // 模拟服务器返回的不同数据
    NSArray *completionRates = @[@"85%", @"92%", @"78%", @"95%", @"88%", @"91%"];
    NSArray *customerCounts = @[@"156人", @"189人", @"134人", @"203人", @"167人", @"178人"];
    NSArray *avgPrices = @[@"8,012", @"7,567", @"13,234", @"7,684", @"11,857", @"10,618"];
    
    // 根据月份索引获取不同的模拟数据
    NSArray *months = @[@"1月", @"2月", @"3月", @"4月", @"5月", @"6月"];
    NSInteger index = [months indexOfObject:categoryName];
    if (index == NSNotFound) index = 0;
    
    NSDateFormatter *formatter = [[NSDateFormatter alloc] init];
    formatter.dateFormat = @"HH:mm:ss";
    NSString *currentTime = [formatter stringFromDate:[NSDate date]];
    
    return @{
        @"completionRate": completionRates[index],
        @"customerCount": customerCounts[index],
        @"avgPrice": avgPrices[index],
        @"updateTime": currentTime
    };
}

- (void)updateTooltipWithData:(NSDictionary *)data 
                    forSeries:(NSString *)seriesName 
                     category:(NSString *)categoryName {
    
    // 构造JavaScript代码
    NSString * jsFunc = [self configureSyncRefreshTooltipJSString:3];

    
    // 执行JavaScript代码
    [self.aaChartView aa_evaluateJavaScriptStringFunction:jsFunc];

}


- (NSString *)configureSyncRefreshTooltipJSString:(NSUInteger )index {
    NSUInteger defaultSelectedIndex = index;
    
    //https://api.highcharts.com/highcharts/chart.events.load
    //https://www.highcharts.com/forum/viewtopic.php?t=36508
    NSString *jsFunc = ([NSString stringWithFormat:@AAJSFunc((
    function syncRefreshTooltip() {
        const points = [];
        const chart = aaGlobalChart;
        const series = chart.series;
        const length = series.length;
                   
        for (let i = 0; i < length; i++) {
            const pointElement = series[i].data[%ld];
//                pointElement.onMouseOver(); //⚠️加上这一行代码会导致其他图表的moveOver事件回调也会触发, 可能会引起不可预料的问题
            points.push(pointElement);
        }
        chart.xAxis[0].drawCrosshair(null, points[0]);
        chart.tooltip.refresh(points);
    }
    syncRefreshTooltip();
     )), defaultSelectedIndex]);
     
    return jsFunc;
}

@end
