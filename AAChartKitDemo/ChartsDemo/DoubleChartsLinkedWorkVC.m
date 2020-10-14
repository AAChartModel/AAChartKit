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
 * StackOverflow : https://stackoverflow.com/users/7842508/codeforu
 * JianShu       : https://www.jianshu.com/u/f1e6753d4254
 * SegmentFault  : https://segmentfault.com/u/huanghunbieguan
 *
 * -------------------------------------------------------------------------------
 
 */

#import "DoubleChartsLinkedWorkVC.h"
#import "AAChartKit.h"
@interface DoubleChartsLinkedWorkVC ()

@property (nonatomic, strong) AAChartView *aaChartView1;
@property (nonatomic, strong) AAChartView *aaChartView2;
@property (nonatomic, strong) NSArray *gradientColorsArr;
@property (nonatomic, strong) NSDictionary *selectedColor;


@end

@implementation DoubleChartsLinkedWorkVC

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
    .yAxisReversedSet(true)
    .xAxisReversedSet(true)
    .invertedSet(true)
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
        .dataSet(@[
            @211, @183, @157, @133, @111, @91, @73, @57, @43, @31, @21, @13,
            @211, @183, @157, @133, @111, @91, @73, @57, @43, @31, @21, @13,
                 ])
        .colorByPointSet(@true),//When using automatic point colors pulled from the options.colors collection, this option determines whether the chart should receive one color per series or one color per point. Default Value：false.
               ]);
    
    _gradientColorsArr = aaChartModel.colorsTheme;
    
    AAOptions *aaOptions = [AAOptionsConstructor configureChartOptionsWithAAChartModel:aaChartModel];
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
    [_aaChartView1 moveOverEventHandler:^(AAChartView *aaChartView,
                                          AAMoveOverEventMessageModel *message) {
        self->_selectedColor = self->_gradientColorsArr[message.index];
        
        NSArray *seriesArr = @[
            AASeriesElement.new
            .dataSet([self configureSeriesDataArray])
        ];
        
        [self->_aaChartView2 aa_onlyRefreshTheChartDataWithOptionsSeries:seriesArr];
    }];
}

- (NSArray *)configureSeriesDataArray {
    NSMutableArray *seriesDataArr = [[NSMutableArray alloc]init];
    CGFloat y1 = 0.f;
    int Q = arc4random() % 39;
    int W = arc4random() % 10;
    for (int x = 0; x <= 68; x++) {
        y1 = sin(Q * (x * M_PI / 180)) + x * W * 0.01 - 1 ;
        
        AADataElement *aaDataElement = AADataElement.new
        .colorSet((id)_selectedColor)
        .ySet(@(y1));
        
        [seriesDataArr addObject:aaDataElement];
    }
    return seriesDataArr;
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
    .chartTypeSet(AAChartTypeColumn)
    .markerSymbolStyleSet(AAChartSymbolStyleTypeBorderBlank)
    .markerRadiusSet(@6)
    .xAxisCrosshairSet([AACrosshair crosshairWithColor:@"#ff0000" dashStyle:AAChartLineDashStyleTypeDashDot])
    .legendEnabledSet(false)
//    .borderRadiusSet((id)@"50%")//Do not work and I dont know why
    .seriesSet(@[
        AASeriesElement.new
        .nameSet(@"2018")
        .borderRadiusBottomLeftSet((id)@"50%")
        .borderRadiusBottomRightSet((id)@"50%")
        .borderRadiusTopLeftSet((id)@"50%")
        .borderRadiusTopRightSet((id)@"50%")
        .dataSet(@[@31,@22,@33,@54,@35,@36,@27,@38,@39,@54,@41,@29]),
               ]);
    
    AAOptions *aaOptions2 = [AAOptionsConstructor configureChartOptionsWithAAChartModel:aaChartModel2];
    aaOptions2.plotOptions.column.groupPadding = @0;
    aaOptions2.yAxis.gridLineWidth = @0;
    
    [aaChartView2 aa_drawChartWithOptions:aaOptions2];
    
}




@end
