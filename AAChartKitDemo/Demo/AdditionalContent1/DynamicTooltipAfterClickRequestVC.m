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
@property (nonatomic, assign) NSUInteger lastClickedPointIndex; // 记录最近一次点击的点索引
@property (nonatomic, assign) BOOL isRequesting; // 是否正在请求中
@property (nonatomic, strong) UIView *loadingHUD; // 自定义HUD容器
@property (nonatomic, strong) UILabel *loadingHUDLabel; // HUD描述文字

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
    
    // 设置加载指示器(HUD)
    [self setupLoadingHUD];
}

- (void)setupChart {
    AAOptions *aaOptions = [self createChartOptions];
    [self.aaChartView aa_drawChartWithOptions:aaOptions];
}

#pragma mark - Loading HUD

- (void)setupLoadingHUD {
    // 容器
    UIView *hud = [[UIView alloc] initWithFrame:CGRectZero];
    hud.backgroundColor = [[UIColor blackColor] colorWithAlphaComponent:0.65];
    hud.layer.cornerRadius = 12;
    hud.layer.masksToBounds = YES;
    hud.alpha = 0;
    hud.userInteractionEnabled = NO; // 不阻挡点击
    [self.view addSubview:hud];
    self.loadingHUD = hud;
    
    // 指示器
    UIActivityIndicatorView *indicator = [[UIActivityIndicatorView alloc] initWithActivityIndicatorStyle:UIActivityIndicatorViewStyleLarge];
    indicator.color = [UIColor whiteColor];
    [hud addSubview:indicator];
    self.loadingIndicator = indicator; // 复用旧属性
    
    // 文字
    UILabel *label = [[UILabel alloc] initWithFrame:CGRectZero];
    label.text = @"加载中...";
    label.font = [UIFont boldSystemFontOfSize:14];
    label.textColor = [UIColor whiteColor];
    label.textAlignment = NSTextAlignmentCenter;
    [hud addSubview:label];
    self.loadingHUDLabel = label;
    
    // 自动布局
    hud.translatesAutoresizingMaskIntoConstraints = NO;
    indicator.translatesAutoresizingMaskIntoConstraints = NO;
    label.translatesAutoresizingMaskIntoConstraints = NO;
    
    // HUD 位置：放在图表区域中央略靠上
    [NSLayoutConstraint activateConstraints:@[
        [hud.centerXAnchor constraintEqualToAnchor:self.aaChartView.centerXAnchor],
        [hud.centerYAnchor constraintEqualToAnchor:self.aaChartView.centerYAnchor constant:-40],
        [hud.widthAnchor constraintGreaterThanOrEqualToConstant:140],
        [hud.heightAnchor constraintEqualToConstant:110]
    ]];
    
    // 指示器 & 文本布局
    [NSLayoutConstraint activateConstraints:@[
        [indicator.topAnchor constraintEqualToAnchor:hud.topAnchor constant:18],
        [indicator.centerXAnchor constraintEqualToAnchor:hud.centerXAnchor],
        [label.topAnchor constraintEqualToAnchor:indicator.bottomAnchor constant:12],
        [label.leadingAnchor constraintEqualToAnchor:hud.leadingAnchor constant:12],
        [label.trailingAnchor constraintEqualToAnchor:hud.trailingAnchor constant:-12],
        [label.bottomAnchor constraintEqualToAnchor:hud.bottomAnchor constant:-14]
    ]];
}

- (void)showLoadingHUDWithText:(NSString *)text {
    if (text.length > 0) {
        self.loadingHUDLabel.text = text;
    } else {
        self.loadingHUDLabel.text = @"加载中...";
    }
    if (self.loadingHUD.alpha > 0.01) { // 已显示
        [self.loadingIndicator startAnimating];
        return;
    }
    self.loadingHUD.transform = CGAffineTransformScale(CGAffineTransformIdentity, 0.8, 0.8);
    [self.loadingIndicator startAnimating];
    [UIView animateWithDuration:0.22 delay:0 options:UIViewAnimationOptionCurveEaseOut animations:^{
        self.loadingHUD.alpha = 1;
        self.loadingHUD.transform = CGAffineTransformIdentity;
    } completion:nil];
}

- (void)hideLoadingHUD {
    if (self.loadingHUD.alpha < 0.01) return;
    [UIView animateWithDuration:0.18 delay:0 options:UIViewAnimationOptionCurveEaseIn animations:^{
        self.loadingHUD.alpha = 0;
        self.loadingHUD.transform = CGAffineTransformScale(CGAffineTransformIdentity, 0.9, 0.9);
    } completion:^(BOOL finished) {
        self.loadingHUD.transform = CGAffineTransformIdentity;
        [self.loadingIndicator stopAnimating];
    }];
}

// 创建图表配置
- (AAOptions *)createChartOptions {
    // Tooltip JS formatter: 根据 point.dynamicDetail 动态展示; 未加载时显示“加载中”
    NSString *tooltipFormatter = @AAJSFunc(function () {
        var p = this.point;
        var d = p.dynamicDetail; // runtime 注入的后端数据
        var html = '<span style=\"font-size:13px;font-weight:600;\">' + p.category + '</span><br/>';
        html += '销售额: <b>' + p.y + '</b> 万元';
        if (d === null) {
            html += '<br/><span style=\"color:#999;\">加载中...</span>';
        } else if (typeof d === 'object') {
            html += '<br/>完成率: <b>' + d.completionRate + '</b>'
                 + '<br/>客户数: <b>' + d.customerCount + '</b>'
                 + '<br/>客单价: <b>' + d.avgPrice + '</b>'
                 + '<br/><span style=\"color:#999;font-size:10px;\">更新: ' + d.updateTime + '</span>';
        } else {
            html += '<br/><span style=\"color:#f39c12;\">点击加载详情</span>';
        }
        return html;
    });
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
                    .sharedSet(@NO)
                    .borderRadiusSet(@8)
                    .borderWidthSet(@1)
                    .formatterSet(tooltipFormatter)
                    .backgroundColorSet(AAColor.whiteColor)
                    .styleSet(AAStyleColorSize(@"#333", 12))
                    )
        .plotOptionsSet(AAPlotOptions.new
                        .seriesSet(AASeries.new
                                   .pointSet(AAPoint.new
                                             .eventsSet(AAPointEvents.new)))
                        .columnSet(AAColumn.new
                                   .pointPaddingSet(@0.1)
                                   .groupPaddingSet(@0.1)
                                   .borderWidthSet(@1)
                                   ))
        .seriesSet(@[
            AASeriesElement.new
                .nameSet(@"目标销售")
                .dataSet(@[@135, @160, @180, @170, @200, @195])
                .colorSet(@"#e74c3c")
        ]);
}

#pragma mark - AAChartViewEventDelegate

// 点击事件回调
- (void)aaChartView:(AAChartView *)aaChartView clickEventWithMessage:(AAClickEventMessageModel *)message {
        NSLog(@"🎯 点击事件: %@ - %@ (值: %@, index:%lu)", message.name, message.category, message.y, (unsigned long)message.index);
        self.lastClickedPointIndex = message.index; // 记录被点击点索引
    
        // 若已有请求进行中, 允许新的点击中断前一个(简单策略: 覆盖, 旧请求返回时比对索引)
        self.isRequesting = YES;
    
        // UI Loading HUD
        [self showLoadingHUDWithText:@"正在加载详情..."];   
    
        // 先立即把该点 tooltip 置为 "加载中" 状态
        [self showLoadingStateForPointAtIndex:message.index];
    
        // 模拟网络请求
        [self simulateNetworkRequestForSeries:message.name
                                                                 category:message.category
                                                                        value:message.y
                                                                    pIndex:message.index];
}

#pragma mark - Network Simulation

// 模拟网络请求
- (void)simulateNetworkRequestForSeries:(NSString *)seriesName
                               category:(NSString *)categoryName
                                  value:(NSNumber *)value
                                pIndex:(NSUInteger)pointIndex {
    // 模拟网络延迟 1.2 秒
    dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(1.2 * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
        NSDictionary *mockData = [self generateMockDataForSeries:seriesName category:categoryName value:value];
        BOOL isLatestClick = (pointIndex == self.lastClickedPointIndex); // 防止过期请求覆盖最新点击
        
        if (isLatestClick) {
            [self hideLoadingHUD];
            self.isRequesting = NO;
            [self updateTooltipWithData:mockData forPointIndex:pointIndex];
            NSLog(@"✅ 模拟接口请求完成(已应用): %@", mockData);
        } else {
            NSLog(@"⚠️ 过期请求结果已忽略: %@", mockData);
        }
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

// 加载中状态(设置 dynamicDetail = null)
- (void)showLoadingStateForPointAtIndex:(NSUInteger)pointIndex {
    NSString *js = [NSString stringWithFormat:@AAJSFunc((
    function showPointLoading() {
        var chart = aaGlobalChart; if(!chart) return;
        var s = chart.series[0]; if(!s) return; var p = s.data[%lu]; if(!p) return;
        p.dynamicDetail = null; // 标记加载中
        chart.tooltip.refresh(p);
    }
    showPointLoading();
    )), (unsigned long)pointIndex];
    [self.aaChartView aa_evaluateJavaScriptStringFunction:js];
}

// 请求成功后更新 tooltip
- (void)updateTooltipWithData:(NSDictionary *)data forPointIndex:(NSUInteger)pointIndex {
    if (!data) return;
    // 构造 JS 对象字面量，避免 JSON.parse 字符串嵌套转义问题
    NSMutableArray *pairs = [NSMutableArray array];
    [data enumerateKeysAndObjectsUsingBlock:^(id key, id obj, BOOL *stop) {
        NSString *k = [key description];
        NSString *v = [obj description];
        // 转义单引号与反斜杠
        v = [v stringByReplacingOccurrencesOfString:@"\\" withString:@"\\\\"];
        v = [v stringByReplacingOccurrencesOfString:@"'" withString:@"\\'"];
        [pairs addObject:[NSString stringWithFormat:@"%@:'%@'", k, v]];
    }];
    NSString *objectLiteral = [pairs componentsJoinedByString:@", "];
    NSString *js = [NSString stringWithFormat:@AAJSFunc((
    function updatePointTooltip() {
        var chart = aaGlobalChart; if(!chart) return;
        var s = chart.series[0]; if(!s) return; var p = s.data[%lu]; if(!p) return;
        p.dynamicDetail = { %@ };
        chart.tooltip.refresh(p);
    }
    updatePointTooltip();
    )), (unsigned long)pointIndex, objectLiteral];
    [self.aaChartView aa_evaluateJavaScriptStringFunction:js];
}


// (保留示例方法, 但当前逻辑未再使用; 可用于多序列同步刷新参考)
- (NSString *)configureSyncRefreshTooltipJSString:(NSUInteger )index {
    NSUInteger defaultSelectedIndex = index;
    NSString *jsFunc = ([NSString stringWithFormat:@AAJSFunc((
    function syncRefreshTooltip() {
        const chart = aaGlobalChart; if(!chart) return; const series = chart.series; const len = series.length; const pts = [];
        for (let i=0;i<len;i++){ const pt = series[i].data[%lu]; if(pt) pts.push(pt); }
        if(pts.length>0){ chart.xAxis[0].drawCrosshair(null, pts[0]); chart.tooltip.refresh(pts[0]); }
    }
    syncRefreshTooltip();
    )), (unsigned long)defaultSelectedIndex]);
    return jsFunc;
}

@end
