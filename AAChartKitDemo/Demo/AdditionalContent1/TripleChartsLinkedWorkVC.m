//
//  DoubleChartsLinkedWorkVC.m
//  AAChartKitDemo
//
//  Created by AnAn on 2020/1/27.
//  Copyright © 2020 AnAn. All rights reserved.
//*************** ...... SOURCE CODE ...... ***************
//***...................................................***
//*** https://github.com/AAChartModel/AAChartKit        ***
//*** https://github.com/AAChartModel/AAChartKit-Swift  ***
//***...................................................***
//*************** ...... SOURCE CODE ...... ***************

/*
 
 * -------------------------------------------------------------------------------
 *
 * 🌕 🌖 🌗 🌘  ❀❀❀   WARM TIPS!!!   ❀❀❀ 🌑 🌒 🌓 🌔
 *
 * Please contact me on GitHub,if there are any problems encountered in use.
 * GitHub Issues : https://github.com/AAChartModel/AAChartKit/issues
 * -------------------------------------------------------------------------------
 * And if you want to contribute for this project, please contact me as well
 * GitHub        : https://github.com/AAChartModel
 * StackOverflow : https://stackoverflow.com/users/12302132/codeforu
 * JianShu       : https://www.jianshu.com/u/f1e6753d4254
 * SegmentFault  : https://segmentfault.com/u/huanghunbieguan
 *
 * -------------------------------------------------------------------------------
 
 */

#import "TripleChartsLinkedWorkVC.h"
#import "AAChartKit.h"
#import "JSFunctionBeforeAndAfterRenderingComposer3.h"

@interface TripleChartsLinkedWorkVC ()

@property (nonatomic, strong) AAChartView *aaChartView1;
@property (nonatomic, strong) AAChartView *aaChartView2;
@property (nonatomic, strong) AAChartView *aaChartView3;

@end

@implementation TripleChartsLinkedWorkVC

- (void)viewDidLoad {
    [super viewDidLoad];
    self.title = @"Triple Charts Linked Work---3表联动";
    self.view.backgroundColor = [UIColor whiteColor];
    
    [self setUpTheAAChartView1];
    [self setUpTheAAChartView2];
    [self setUpTheAAChartView3];
    
    UIStackView *stackView = [[UIStackView alloc] initWithArrangedSubviews:@[_aaChartView1, _aaChartView2, _aaChartView3]];
    stackView.axis = UILayoutConstraintAxisVertical;
    stackView.distribution = UIStackViewDistributionFillEqually;
    stackView.translatesAutoresizingMaskIntoConstraints = NO;
    [self.view addSubview:stackView];
    
    UILayoutGuide *safeArea = self.view.safeAreaLayoutGuide;
    [NSLayoutConstraint activateConstraints:@[
        [stackView.topAnchor constraintEqualToAnchor:safeArea.topAnchor],
        [stackView.bottomAnchor constraintEqualToAnchor:safeArea.bottomAnchor],
        [stackView.leadingAnchor constraintEqualToAnchor:safeArea.leadingAnchor],
        [stackView.trailingAnchor constraintEqualToAnchor:safeArea.trailingAnchor],
    ]];
}

//配置第 1 个 AAChartView
- (void)setUpTheAAChartView1 {
    AAChartView *aaChartView1 = [[AAChartView alloc] init];
    aaChartView1.scrollEnabled = NO;
    _aaChartView1 = aaChartView1;
    [self setupChartViewHandler];
    
    AAOptions *aaOptions1 = AAOptions.new
        .titleSet(AATitle.new
                  .textSet(@"Speed")
                  .alignSet(AAChartAlignTypeLeft))
        .xAxisSet(AAXAxis.new
                  .crosshairSet(AACrosshair.new
                                .colorSet(AAColor.greenColor)
                                .widthSet(@2)
                                .dashStyleSet(AAChartLineDashStyleTypeLongDashDot)
                                .zIndexSet(@5)))
        .yAxisSet(AAYAxis.new
                  .titleSet((id)NSNull.null))
        .seriesSet(@[
            JSFunctionBeforeAndAfterRenderingComposer3.configureSeriesArray[0]
        ])
    ;
    
    [aaChartView1 aa_drawChartWithOptions:aaOptions1];
}

//配置第 2 个 AAChartView
- (void)setUpTheAAChartView2 {
    AAChartView *aaChartView2 = [[AAChartView alloc] init];
    aaChartView2.scrollEnabled = NO;
    _aaChartView2 = aaChartView2;
    [self setupChartViewHandler2];

    
    AAOptions *aaOptions1 = AAOptions.new
        .titleSet(AATitle.new
                  .textSet(@"Elevation")
                  .alignSet(AAChartAlignTypeLeft))
        .xAxisSet(AAXAxis.new
                  .crosshairSet(AACrosshair.new
                                .colorSet(AAColor.greenColor)
                                .widthSet(@2)
                                .dashStyleSet(AAChartLineDashStyleTypeLongDashDot)
                                .zIndexSet(@5)))
        .yAxisSet(AAYAxis.new
                  .titleSet((id)NSNull.null))
        .seriesSet(@[
            JSFunctionBeforeAndAfterRenderingComposer3.configureSeriesArray[1]
        ]);

    [aaChartView2 aa_drawChartWithOptions:aaOptions1];
}

//配置第 3 个 AAChartView
- (void)setUpTheAAChartView3 {
    AAChartView *aaChartView3 = [[AAChartView alloc] init];
    aaChartView3.scrollEnabled = NO;
    _aaChartView3 = aaChartView3;
    [self setupChartViewHandler3];
    
    AAOptions *aaOptions3 = AAOptions.new
        .titleSet(AATitle.new
                  .textSet(@"Heart Rate")
                  .alignSet(AAChartAlignTypeLeft))
        .xAxisSet(AAXAxis.new
                  .crosshairSet(AACrosshair.new
                                .colorSet(AAColor.greenColor)
                                .widthSet(@2)
                                .dashStyleSet(AAChartLineDashStyleTypeLongDashDot)
                                .zIndexSet(@5)))
        .yAxisSet(AAYAxis.new
                  .titleSet((id)NSNull.null))
        .seriesSet(@[
            JSFunctionBeforeAndAfterRenderingComposer3.configureSeriesArray[2]
        ]);
    
    [aaChartView3 aa_drawChartWithOptions:aaOptions3];
}


- (void)setupChartViewHandler {
    __weak typeof(self) weakSelf = self;
    [_aaChartView1 moveOverEventHandler:^(AAChartView *aaChartView,
                                          AAMoveOverEventMessageModel *message) {
        NSString * jsFunc = [weakSelf configureSyncRefreshTooltipJSString:message];

        NSLog(@"📊chart view 1 mouse over event message: %@", message.name);

        [weakSelf.aaChartView2 aa_evaluateJavaScriptStringFunction:jsFunc];
        [weakSelf.aaChartView3 aa_evaluateJavaScriptStringFunction:jsFunc];
    }];
}

- (void)setupChartViewHandler2 {
    __weak typeof(self) weakSelf = self;
    [_aaChartView2 moveOverEventHandler:^(AAChartView *aaChartView,
                                          AAMoveOverEventMessageModel *message) {
        NSString * jsFunc = [weakSelf configureSyncRefreshTooltipJSString:message];

        NSLog(@"📊chart view 2 mouse over event message: %@", message.name);

        [weakSelf.aaChartView1 aa_evaluateJavaScriptStringFunction:jsFunc];
        [weakSelf.aaChartView3 aa_evaluateJavaScriptStringFunction:jsFunc];
    }];
}

- (void)setupChartViewHandler3 {
    __weak typeof(self) weakSelf = self;
    [_aaChartView3 moveOverEventHandler:^(AAChartView *aaChartView,
                                          AAMoveOverEventMessageModel *message) {
        NSString * jsFunc = [weakSelf configureSyncRefreshTooltipJSString:message];

        NSLog(@"📊chart view 3 mouse over event message: %@", message.name);

        [weakSelf.aaChartView1 aa_evaluateJavaScriptStringFunction:jsFunc];
        [weakSelf.aaChartView2 aa_evaluateJavaScriptStringFunction:jsFunc];
    }];
}

- (NSString *)configureSyncRefreshTooltipJSString:(AAMoveOverEventMessageModel *)message {
    NSUInteger defaultSelectedIndex = message.index;
    
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
