//
//  QuadraChartsLinkedWorkVC.m
//  AAChartKitDemo
//
//  Created by AnAn on 2020/1/27.
//  Copyright © 2020 AnAn. All rights reserved.
//

#import "QuadraChartsLinkedWorkVC.h"
#import "AAChartKit.h"
#import "JSFunctionBeforeAndAfterRenderingComposer3.h"

@interface QuadraChartsLinkedWorkVC () <AAChartViewEventDelegate>

@property (nonatomic, strong) AAChartView *aaChartView0;
@property (nonatomic, strong) AAChartView *aaChartView1;
@property (nonatomic, strong) AAChartView *aaChartView2;
@property (nonatomic, strong) AAChartView *aaChartView3;
@property (nonatomic, strong) AAChartView *singleAAChartView;

@end

@implementation QuadraChartsLinkedWorkVC

- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor = UIColor.whiteColor;

    if (self.singleChartViewMode) {
        self.title = @"Quadra Charts Linked Work2---4表联动2";
        [self setupSingleChartViewMode];
    } else {
        self.title = @"Quadra Charts Linked Work---4表联动";
        [self setupMultipleChartViewsMode];
    }
}

- (void)setupMultipleChartViewsMode {
    self.aaChartView0 = [self createChartView];
    self.aaChartView1 = [self createChartView];
    self.aaChartView2 = [self createChartView];
    self.aaChartView3 = [self createChartView];

    AAOptions *firstOptions = [JSFunctionBeforeAndAfterRenderingComposer3 synchronizedChart];
    firstOptions.beforeDrawChartJavaScript = nil;
    firstOptions.afterDrawChartJavaScript = nil;
    [self.aaChartView0 aa_drawChartWithOptions:firstOptions];

    [self.aaChartView1 aa_drawChartWithOptions:[self chartOptionsWithTitle:@"Speed"
                                                              seriesIndex:0
                                                           crosshairColor:AAColor.greenColor]];
    [self.aaChartView2 aa_drawChartWithOptions:[self chartOptionsWithTitle:@"Elevation"
                                                              seriesIndex:1
                                                           crosshairColor:AAColor.redColor]];
    [self.aaChartView3 aa_drawChartWithOptions:[self chartOptionsWithTitle:@"Heart Rate"
                                                              seriesIndex:2
                                                           crosshairColor:AAColor.blueColor]];

    UIStackView *stackView = [[UIStackView alloc] initWithArrangedSubviews:@[
        self.aaChartView0,
        self.aaChartView1,
        self.aaChartView2,
        self.aaChartView3
    ]];
    stackView.axis = UILayoutConstraintAxisVertical;
    stackView.alignment = UIStackViewAlignmentFill;
    stackView.distribution = UIStackViewDistributionFillEqually;
    stackView.spacing = 0;
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

- (void)setupSingleChartViewMode {
    self.singleAAChartView = [self createChartView];
    self.singleAAChartView.translatesAutoresizingMaskIntoConstraints = NO;
    [self.view addSubview:self.singleAAChartView];

    UILayoutGuide *safeArea = self.view.safeAreaLayoutGuide;
    [NSLayoutConstraint activateConstraints:@[
        [self.singleAAChartView.topAnchor constraintEqualToAnchor:safeArea.topAnchor],
        [self.singleAAChartView.bottomAnchor constraintEqualToAnchor:safeArea.bottomAnchor],
        [self.singleAAChartView.leadingAnchor constraintEqualToAnchor:self.view.leadingAnchor],
        [self.singleAAChartView.trailingAnchor constraintEqualToAnchor:self.view.trailingAnchor],
    ]];

    AAOptions *aaOptions = [JSFunctionBeforeAndAfterRenderingComposer3 synchronizedChart];
    [self.singleAAChartView aa_drawChartWithOptions:aaOptions];
}

- (AAChartView *)createChartView {
    AAChartView *chartView = [[AAChartView alloc] init];
    chartView.scrollEnabled = NO;
    chartView.delegate = self;
    return chartView;
}

- (AAOptions *)chartOptionsWithTitle:(NSString *)title
                         seriesIndex:(NSUInteger)seriesIndex
                      crosshairColor:(UIColor *)crosshairColor {
    NSArray *seriesArray = [JSFunctionBeforeAndAfterRenderingComposer3 configureSeriesArray];
    AASeriesElement *seriesElement = seriesArray[seriesIndex];

    return AAOptions.new
    .chartSet(AAChart.new
              .typeSet(AAChartTypeArea))
    .titleSet(AATitle.new
              .textSet(title)
              .alignSet(AAChartAlignTypeLeft))
    .tooltipSet(AATooltip.new
                .sharedSet(true))
    .xAxisSet(AAXAxis.new
              .crosshairSet(AACrosshair.new
                            .colorSet(crosshairColor)
                            .widthSet(@2)
                            .dashStyleSet(AAChartLineDashStyleTypeLongDashDot)
                            .zIndexSet(@5)))
    .yAxisSet(AAYAxis.new
              .titleSet((id)NSNull.null))
    .seriesSet(@[
        seriesElement
    ]);
}

- (NSArray<AAChartView *> *)linkedChartViews {
    NSMutableArray<AAChartView *> *chartViews = [NSMutableArray array];
    if (self.aaChartView0) [chartViews addObject:self.aaChartView0];
    if (self.aaChartView1) [chartViews addObject:self.aaChartView1];
    if (self.aaChartView2) [chartViews addObject:self.aaChartView2];
    if (self.aaChartView3) [chartViews addObject:self.aaChartView3];
    return chartViews;
}

- (NSString *)configureSyncRefreshTooltipJSString:(AAMoveOverEventMessageModel *)message {
    NSUInteger selectedIndex = message.index;
    return [NSString stringWithFormat:@AAJSFunc((
        function syncRefreshTooltip() {
            const points = [];
            const chart = aaGlobalChart;
            const series = chart.series;
            const length = series.length;

            for (let i = 0; i < length; i++) {
                const pointElement = series[i].data[%ld];
                points.push(pointElement);
            }
            chart.xAxis[0].drawCrosshair(null, points[0]);
            chart.tooltip.refresh(points);
        }
        syncRefreshTooltip();
    )), selectedIndex];
}

#pragma mark - AAChartViewEventDelegate

- (void)aaChartViewDidFinishLoad:(AAChartView *)aaChartView {
    NSLog(@"🚀🚀🚀 AAChartView content did finish load!!!");
}

- (void)aaChartView:(AAChartView *)aaChartView moveOverEventWithMessage:(AAMoveOverEventMessageModel *)message {
    if (self.singleChartViewMode) {
        return;
    }

    NSString *jsFuncStr = [self configureSyncRefreshTooltipJSString:message];
    for (AAChartView *targetChartView in [self linkedChartViews]) {
        if (targetChartView != aaChartView) {
            [targetChartView aa_evaluateJavaScriptStringFunction:jsFuncStr];
        }
    }
}

@end
