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

#import "DoubleChartsLinkedWorkVC2.h"
#import "AAChartKit.h"
@interface DoubleChartsLinkedWorkVC2 ()

@property (nonatomic, strong) AAChartView *aaChartView1;
@property (nonatomic, strong) AAChartView *aaChartView2;
@property (nonatomic, strong) NSArray *gradientColorsArr;
@property (nonatomic, strong) NSDictionary *selectedColor;


@end

@implementation DoubleChartsLinkedWorkVC2

- (void)viewDidLoad {
    [super viewDidLoad];
    self.title = @"Double Charts Linked Working---双表联动";
    self.view.backgroundColor = [UIColor whiteColor];
    
    [self setUpTheAAChartViewOne];
    [self setUpTheAAChartViewTwo];
    
}

//配置第一个 AAChartView
- (void)setUpTheAAChartViewOne {
    CGFloat chartViewWidth  = self.view.frame.size.width;
    CGFloat screenHeight = self.view.frame.size.height;
    CGRect frame = CGRectMake(0, 60, chartViewWidth, screenHeight / 2);
    AAChartView *aaChartView = [[AAChartView alloc]initWithFrame:frame];
    aaChartView.scrollEnabled = NO;
    [self.view addSubview:aaChartView];
    _aaChartView1 = aaChartView;
    [self setupChartViewHandler];
    
    AAChartModel *aaChartModel = AAChartModel.new
    .chartTypeSet(AAChartTypeColumn)
    .categoriesSet(@[
        @"oceanBlue",
        @"sanguine",
        @"lusciousLime",
        @"purpleLake",
        @"freshPapaya",
        @"ultramarine",
        @"pinkSugar",
        @"lemonDrizzle",
        @"victoriaPurple",
        @"springGreens",
        @"mysticMauve",
        @"reflexSilver",
        @"neonGlowColor",
        @"berrySmoothieColor",
        @"newLeaf",
        @"cottonCandy",
        @"pixieDust",
        @"fizzyPeach",
        @"sweetDream",
        @"firebrick",
        @"wroughtIron",
        @"deepSea",
        @"coastalBreeze",
        @"eveningDelight",
    ])
    .tooltipEnabledSet(false)
    .borderRadiusSet(@3)
    .legendEnabledSet(false)
    .colorsThemeSet(@[
        AAGradientColor.oceanBlueColor,
        AAGradientColor.sanguineColor,
        AAGradientColor.lusciousLimeColor,
        AAGradientColor.purpleLakeColor,
        AAGradientColor.freshPapayaColor,
        AAGradientColor.ultramarineColor,
        AAGradientColor.pinkSugarColor,
        AAGradientColor.lemonDrizzleColor,
        AAGradientColor.victoriaPurpleColor,
        AAGradientColor.springGreensColor,
        AAGradientColor.mysticMauveColor,
        AAGradientColor.reflexSilverColor,
        AAGradientColor.neonGlowColor,
        AAGradientColor.berrySmoothieColor,
        AAGradientColor.newLeafColor,
        AAGradientColor.cottonCandyColor,
        AAGradientColor.pixieDustColor,
        AAGradientColor.fizzyPeachColor,
        AAGradientColor.sweetDreamColor,
        AAGradientColor.firebrickColor,
        AAGradientColor.wroughtIronColor,
        AAGradientColor.deepSeaColor,
        AAGradientColor.coastalBreezeColor,
        AAGradientColor.eveningDelightColor,
    ])

    .seriesSet(@[
        AASeriesElement.new
        .nameSet(@"ElementOne")
        .zIndexSet(@0)
        .borderRadiusBottomLeftSet((id)@"50%")
        .borderRadiusBottomRightSet((id)@"50%")
        .dataSet([self generateRandomNumberArrayWithLength:35.0 randomRange:100 minNum:200])
        .colorByPointSet(@true),//When using automatic point colors pulled from the options.colors collection, this option determines whether the chart should receive one color per series or one color per point. Default Value：false.
               ]);
    
    _gradientColorsArr = aaChartModel.colorsTheme;
    
    AAOptions *aaOptions = aaChartModel.aa_toAAOptions;
    aaOptions.plotOptions.column.groupPadding = @0;
    aaOptions.yAxis.gridLineWidth = @0;
    aaOptions.xAxis
    .crosshairSet(AACrosshair.new
                  .colorSet(AAColor.redColor)
                  .dashStyleSet(AAChartLineDashStyleTypeLongDashDot)
                  .zIndexSet(@5)
                  );
    
    [aaChartView aa_drawChartWithOptions:aaOptions];
}


- (void)setupChartViewHandler {
    __weak typeof(self) weakSelf = self;
    [_aaChartView1 moveOverEventHandler:^(AAChartView *aaChartView,
                                          AAMoveOverEventMessageModel *message) {
        //默认选中的位置索引
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
               pointElement.onMouseOver();
               points.push(pointElement);
           }
           chart.xAxis[0].drawCrosshair(null, points[0]);
           chart.tooltip.refresh(points);
    }
    syncRefreshTooltip();
        )), defaultSelectedIndex]);
        
        
        
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

//配置第二个 AAChartView
- (void)setUpTheAAChartViewTwo {
    CGFloat chartViewWidth  = self.view.frame.size.width;
    CGFloat screenHeight = self.view.frame.size.height;
    CGRect frame = CGRectMake(0, screenHeight / 2 + 60, chartViewWidth, screenHeight / 2 - 60);
    AAChartView *aaChartView2 = [[AAChartView alloc]initWithFrame:frame];
    aaChartView2.scrollEnabled = NO;
    [self.view addSubview:aaChartView2];
    _aaChartView2 = aaChartView2;
    
    AAChartModel *aaChartModel2 = AAChartModel.new
    .chartTypeSet(AAChartTypeAreaspline)
    .markerSymbolStyleSet(AAChartSymbolStyleTypeBorderBlank)
    .markerRadiusSet(@6)
    .stackingSet(AAChartStackingTypeNormal)
    .xAxisCrosshairSet([AACrosshair crosshairWithColor:AAColor.redColor dashStyle:AAChartLineDashStyleTypeDashDot])
    .legendEnabledSet(false)
    .seriesSet(@[
        AASeriesElement.new
            .nameSet(@"2018")
            .lineWidthSet(@6)
            .dataSet([self generateRandomNumberArrayWithLength:35.0  randomRange:100 minNum:200]),
        AASeriesElement.new
            .nameSet(@"2019")
            .lineWidthSet(@6)
            .dataSet([self generateRandomNumberArrayWithLength:35.0 randomRange:150 minNum:400]),
        AASeriesElement.new
            .nameSet(@"2020")
            .lineWidthSet(@6)
            .dataSet([self generateRandomNumberArrayWithLength:35.0 randomRange:150 minNum:600]),
        AASeriesElement.new
            .nameSet(@"2018")
            .lineWidthSet(@6)
            .dataSet([self generateRandomNumberArrayWithLength:35.0 randomRange:100 minNum:200]),
        AASeriesElement.new
            .nameSet(@"2019")
            .lineWidthSet(@6)
            .dataSet([self generateRandomNumberArrayWithLength:35.0 randomRange:150 minNum:400]),
        AASeriesElement.new
            .nameSet(@"2020")
            .lineWidthSet(@6)
            .dataSet([self generateRandomNumberArrayWithLength:35.0 randomRange:150 minNum:600]),
               ]);
    
    AAOptions *aaOptions2 = aaChartModel2.aa_toAAOptions;
    aaOptions2.plotOptions.column.groupPadding = @0;
    aaOptions2.yAxis.gridLineWidth = @0;
    
    [aaChartView2 aa_drawChartWithOptions:aaOptions2];
    
}




@end
