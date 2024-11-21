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

#import "DoubleChartsLinkedWorkVC3.h"
#import "AAChartKit.h"
#import "JSFunctionBeforeAndAfterRenderingComposer3.h"

@interface DoubleChartsLinkedWorkVC3 ()

@property (nonatomic, strong) AAChartView *aaChartView1;
@property (nonatomic, strong) AAChartView *aaChartView2;
@property (nonatomic, strong) AAChartView *aaChartView3;

@property (nonatomic, strong) NSArray *gradientColorsArr;
@property (nonatomic, strong) NSDictionary *selectedColor;


@end

@implementation DoubleChartsLinkedWorkVC3

- (void)viewDidLoad {
    [super viewDidLoad];
    self.title = @"Triple Charts Linked Work---3表联动";
    self.view.backgroundColor = [UIColor whiteColor];
    
    [self setUpTheAAChartViewOne];
    [self setUpTheAAChartViewTwo];
    [self setUpTheAAChartView3];
}

//配置第 1 个 AAChartView
- (void)setUpTheAAChartViewOne {
    CGFloat chartViewWidth  = self.view.frame.size.width;
    CGFloat screenHeight = self.view.frame.size.height;
    CGRect frame = CGRectMake(0, 60, chartViewWidth, screenHeight / 3);
    AAChartView *aaChartView = [[AAChartView alloc]initWithFrame:frame];
    aaChartView.scrollEnabled = NO;
    [self.view addSubview:aaChartView];
    _aaChartView1 = aaChartView;
    [self setupChartViewHandler];
    
    AAOptions *aaOptions = AAOptions.new
        .xAxisSet(AAXAxis.new
                  .crosshairSet(AACrosshair.new
                                .colorSet(AAColor.redColor)
                                .dashStyleSet(AAChartLineDashStyleTypeLongDashDot)
                                .zIndexSet(@5)
                                )
                  )
        .seriesSet(@[
            JSFunctionBeforeAndAfterRenderingComposer3.configureSeriesArray[0]
        ])
    ;
    
    [aaChartView aa_drawChartWithOptions:aaOptions];
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

- (void)setupChartViewHandler {
    [_aaChartView1 moveOverEventHandler:^(AAChartView *aaChartView,
                                          AAMoveOverEventMessageModel *message) {
        NSString * jsFunc = [self configureSyncRefreshTooltipJSString:message];
        
        NSLog(@"chart view 111 mouse over event message: %@", message.name);
        
        __weak typeof(self) weakSelf = self;
        [weakSelf.aaChartView2 aa_evaluateJavaScriptStringFunction:jsFunc];
        [weakSelf.aaChartView3 aa_evaluateJavaScriptStringFunction:jsFunc];
        
    }];
}

- (void)setupChartViewHandler2 {
    [_aaChartView2 moveOverEventHandler:^(AAChartView *aaChartView,
                                          AAMoveOverEventMessageModel *message) {
        NSString * jsFunc = [self configureSyncRefreshTooltipJSString:message];
        
        NSLog(@"chart view 222 mouse over event message: %@", message.name);
        __weak typeof(self) weakSelf = self;
        [weakSelf.aaChartView1 aa_evaluateJavaScriptStringFunction:jsFunc];
        [weakSelf.aaChartView3 aa_evaluateJavaScriptStringFunction:jsFunc];
    }];
}

- (void)setupChartViewHandler3 {
    [_aaChartView3 moveOverEventHandler:^(AAChartView *aaChartView,
                                          AAMoveOverEventMessageModel *message) {
        NSString * jsFunc = [self configureSyncRefreshTooltipJSString:message];
        
        NSLog(@"chart view 3 mouse over event message: %@", message.name);
        __weak typeof(self) weakSelf = self;
        [weakSelf.aaChartView1 aa_evaluateJavaScriptStringFunction:jsFunc];
        [weakSelf.aaChartView2 aa_evaluateJavaScriptStringFunction:jsFunc];
    }];
}

- (NSArray *)generateRandomNumberArrayWithLength:(NSUInteger)length
                                     randomRange:(NSUInteger)randomRange
                                          minNum:(NSUInteger)minNum {
    NSMutableArray *randomNumArrA = [NSMutableArray array];
    for (NSUInteger x = 0; x < length; x++) {
        NSUInteger randomNum = arc4random() % randomRange + minNum;
        [randomNumArrA addObject:@(randomNum)];
    }
    return randomNumArrA;
}

//配置第 2 个 AAChartView
- (void)setUpTheAAChartViewTwo {
    CGFloat chartViewWidth  = self.view.frame.size.width;
    CGFloat screenHeight = self.view.frame.size.height;
    CGRect frame = CGRectMake(0, screenHeight / 3 + 60, chartViewWidth, screenHeight / 3 - 60);
    AAChartView *aaChartView2 = [[AAChartView alloc]initWithFrame:frame];
    aaChartView2.scrollEnabled = NO;
    [self.view addSubview:aaChartView2];
    _aaChartView2 = aaChartView2;
    [self setupChartViewHandler2];

    
    AAOptions *aaOptions = AAOptions.new
        .xAxisSet(AAXAxis.new
                  .crosshairSet(AACrosshair.new
                                .colorSet(AAColor.redColor)
                                .dashStyleSet(AAChartLineDashStyleTypeLongDashDot)
                                .zIndexSet(@5)
                                )
                  )
        .seriesSet(@[
            JSFunctionBeforeAndAfterRenderingComposer3.configureSeriesArray[1]
        ]);

    [aaChartView2 aa_drawChartWithOptions:aaOptions];
}

//配置第 3 个 AAChartView
- (void)setUpTheAAChartView3 {
    CGFloat chartViewWidth  = self.view.frame.size.width;
    CGFloat screenHeight = self.view.frame.size.height;
    CGRect frame = CGRectMake(0, (screenHeight / 3) * 2 + 60, chartViewWidth, screenHeight / 3 - 60);
    AAChartView *aaChartView3 = [[AAChartView alloc]initWithFrame:frame];
    aaChartView3.scrollEnabled = NO;
    [self.view addSubview:aaChartView3];
    _aaChartView3 = aaChartView3;
    [self setupChartViewHandler3];
    
    AAOptions *aaOptions = AAOptions.new
        .xAxisSet(AAXAxis.new
                  .crosshairSet(AACrosshair.new
                                .colorSet(AAColor.redColor)
                                .dashStyleSet(AAChartLineDashStyleTypeLongDashDot)
                                .zIndexSet(@5)
                                )
                  )
        .seriesSet(@[
            JSFunctionBeforeAndAfterRenderingComposer3.configureSeriesArray[2]
        ]);
    
    [aaChartView3 aa_drawChartWithOptions:aaOptions];
}


@end
