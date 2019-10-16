//
//  CustomStyleChartVC.m
//  AAChartKitDemo
//
//  Created by AnAn on 2018/11/13.
//  Copyright © 2018 Danny boy. All rights reserved.
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

#import "CustomStyleChartVC.h"
#import "AAChartKit.h"
#import "AAEasyTool.h"

@interface CustomStyleChartVC ()

@property (nonatomic, strong) AAChartModel *aaChartModel;
@property (nonatomic, strong) AAChartView  *aaChartView;

@end

@implementation CustomStyleChartVC

- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor = [UIColor whiteColor];
    self.title = self.navigationItemTitleArr[self.chartType];

    self.aaChartView = [self setUpAAChartView];
    self.aaChartModel = [self setUpAAChartModelWithIndex:self.chartType];
    [self.aaChartView aa_drawChartWithChartModel:self.aaChartModel];
    
    [self setUpBarButtonItem];
}

- (AAChartView *)setUpAAChartView {
    CGRect chartViewFrame = CGRectMake(0, 88, self.view.frame.size.width, self.view.frame.size.height - 88);
    AAChartView *aaChartView = [[AAChartView alloc]initWithFrame:chartViewFrame];
    aaChartView.scrollEnabled = NO;
    [self.view addSubview:aaChartView];
    return aaChartView;
}

- (void)setUpBarButtonItem {
    UIBarButtonItem *barItem = [[UIBarButtonItem alloc] initWithTitle:@"Next Chart"
                                                                style:UIBarButtonItemStylePlain
                                                               target:self
                                                               action:@selector(monitorTap)];
    self.navigationItem.rightBarButtonItem = barItem;
}

- (void)monitorTap {
    if (self.selectedIndex == 24) {
        self.title = [NSString stringWithFormat:@"❗️This is the last chart❗️"];
    } else {
        self.selectedIndex = self.selectedIndex + 1;
        self.title = self.navigationItemTitleArr[self.selectedIndex];
        AAChartModel *aaChartModel = [self setUpAAChartModelWithIndex:self.selectedIndex];
        [self.aaChartView aa_refreshChartWithChartModel:aaChartModel];
    }
}

- (AAChartModel *)setUpAAChartModelWithIndex:(NSUInteger)index {
    switch (index) {
        case 0:  return [self setUpColorfulBarChart];
        case 1:  return [self setUpColorfulGradientColorChart];
        case 2:  return [self setUpDiscontinuousDataChart];
        case 3:  return [self configureMixedLineChart];
        case 4:  return [self configureColorfulColumnChart];
        case 5:  return [self configureGradientColorBarChart];
        case 6:  return [self configureHavePlotLinesChart];
        case 7:  return [self configrueWithMinusNumberChart];
        case 8:  return [self configureStepLineChart];
        case 9:  return [self configureStepAreaChart];
        case 10: return [self configureNightingaleRoseChart];
        case 11: return [self configureCustomSingleDataLabelChart];
        case 12: return [self configureChartWithShadowStyle];
        case 13: return [self configureColorfulGradientAreaChart];
        case 14: return [self configureColorfulGradientSplineChart];
        case 15: return [self configureGradientColorAreasplineChart];
        case 16: return [self configureSpecialStyleMarkerOfSingleDataElementChart];
        case 17: return [self configureSpecialStyleColumnOfSingleDataElementChart];
        case 18: return [self configureAreaChartThreshold];
        case 19: return [self customScatterChartMarkerSymbolContent];
        case 20: return [self customLineChartMarkerSymbolContent];
        case 21: return [self configureTriangleRadarChart];
        case 22: return [self configureQuadrangleRadarChart];
        case 23: return [self configurePentagonRadarChart];
        case 24: return [self configureHexagonRadarChart];
        case 25: return [self adjustYAxisMaxAndMinValues];
        case 26: return [self customSpecialStyleDataLabelOfSingleDataElementChart];

        default:
            return nil;
    }
}

- (AAChartModel *)setUpColorfulBarChart {
    NSArray *colorsNameArr =
    @[@"red",
      @"orange",
      @"yellow",
      @"green",
      @"cyan",
      @"blue",
      @"purple",
      @"gray",
      @"darkGray",
      @"lightGray",
      @"magenta",
      @"brown",
      @"black"];
    
    NSArray *colorsArr =
    @[[AAColor redColor],
      [AAColor orangeColor],
      [AAColor yellowColor],
      [AAColor greenColor],
      [AAColor cyanColor],
      [AAColor blueColor],
      [AAColor purpleColor],
      [AAColor grayColor],
      [AAColor darkGrayColor],
      [AAColor lightGrayColor],
      [AAColor magentaColor],
      [AAColor brownColor],
      [AAColor blackColor]
      ];
    
    return AAChartModel.new
    .chartTypeSet(AAChartTypeBar)
    .animationTypeSet(AAChartAnimationBounce)
    .titleSet(@"Colorful Chart")
    .subtitleSet(@"use AAColor to get color string")
    .dataLabelsEnabledSet(false)
    .categoriesSet(colorsNameArr)
    .colorsThemeSet(colorsArr)
    .stackingSet(AAChartStackingTypePercent)
    .seriesSet(@[
                 AASeriesElement.new
                 .nameSet(@"Tokyo")
                 .dataSet(@[@7.0, @6.9, @9.5, @14.5, @18.2, @21.5, @25.2, @26.5, @23.3, @18.3, @13.9, @9.6])
                 .colorByPointSet(@true)
                 ]);
}

- (AAChartModel *)setUpColorfulGradientColorChart {
    NSArray *gradientColorNamesArr =
    @[@"oceanBlue",
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
      ];
    
    NSArray *gradientColorArr =
    @[[AAGradientColor oceanBlueColor],
      [AAGradientColor sanguineColor],
      [AAGradientColor lusciousLimeColor],
      [AAGradientColor purpleLakeColor],
      [AAGradientColor freshPapayaColor],
      [AAGradientColor ultramarineColor],
      [AAGradientColor pinkSugarColor],
      [AAGradientColor lemonDrizzleColor],
      [AAGradientColor victoriaPurpleColor],
      [AAGradientColor springGreensColor],
      [AAGradientColor mysticMauveColor],
      [AAGradientColor reflexSilverColor],
      [AAGradientColor newLeafColor],
      [AAGradientColor cottonCandyColor],
      [AAGradientColor pixieDustColor],
      [AAGradientColor fizzyPeachColor],
      [AAGradientColor sweetDreamColor],
      [AAGradientColor firebrickColor],
      [AAGradientColor wroughtIronColor],
      [AAGradientColor deepSeaColor],
      [AAGradientColor coastalBreezeColor],
      [AAGradientColor eveningDelightColor],
      ];
    
    return AAChartModel.new
    .chartTypeSet(AAChartTypeBar)
    .titleSet(@"Colorful Column Chart")
    .subtitleSet(@"single data array colorful column chart")
    .categoriesSet(gradientColorNamesArr)
    .colorsThemeSet(gradientColorArr)
    .yAxisTitleSet(@"gradient color")
    .stackingSet(AAChartStackingTypePercent)
    .seriesSet(@[
                 AASeriesElement.new
                 .nameSet(@"ElementOne")
                 .dataSet(@[@3.9, @4.2, @5.7, @8.5, @11.9, @15.2, @17.0, @16.6, @14.2, @10.3, @6.6, @4.8,
                            @3.9, @4.2, @5.7, @8.5, @11.9, @15.2, @17.0, @16.6, @14.2, @10.3,])
                 .colorByPointSet(@true),//When using automatic point colors pulled from the options.colors collection, this option determines whether the chart should receive one color per series or one color per point. Default Value：false.
                 ]);
}

- (AAChartModel *)setUpDiscontinuousDataChart {
    return AAChartModel.new
    .chartTypeSet(AAChartTypeColumn)
    .yAxisTitleSet(@"")//设置Y轴标题
    .dataLabelsEnabledSet(true)//是否显示值
    .tooltipEnabledSet(true)
    .seriesSet(@[
                 AASeriesElement.new
                 .nameSet(@"所有专业")
                 .dataSet(@[@7.0, @6.9, @9.5, @14.5, @18.2,[NSNull null],[NSNull null],[NSNull null],[NSNull null], @21.5, @25.2, @26.5, @23.3, @18.3, @13.9, @9.6,])
                 .colorSet((id)[AAGradientColor deepSeaColor])
                 ]);
}

- (AAChartModel *)configureMixedLineChart {
    return AAChartModel.new
//    .connectNullsSet(true)//设置折线是否断点重连
    .chartTypeSet(AAChartTypeLine)
    .titleSet(@"")
    .subtitleSet(@"虚拟数据")
    .categoriesSet(@[@"Java",@"Swift",@"Python",@"Ruby", @"PHP",@"Go",@"C",@"C#",@"C++",@"Perl",@"R",@"MATLAB",@"SQL"])
    .yAxisTitleSet(@"摄氏度")
    .dataLabelsEnabledSet(true)
    .seriesSet(@[
                 AASeriesElement.new
                 .nameSet(@"本专业")
                 .dataSet(@[@45,@88,@49,@43,@65,@56,@47,@28,@49,@44,@89,@55])
                 .zoneAxisSet(@"x")
                 .colorSet((id)AAGradientColor.freshPapayaColor)
                 .lineWidthSet(@5)
                 .zonesSet(@[@{@"value": @8},
                             @{@"dashStyle": AAChartLineDashStyleTypeDot}
                             ]),
                 AASeriesElement.new
                 .nameSet(@"所有专业")
                 .colorSet((id)AAGradientColor.pixieDustColor)
                 .lineWidthSet(@5)
                 .dataSet(@[[NSNull null],[NSNull null],@100,@109,@89,[NSNull null],[NSNull null],@120,[NSNull null],[NSNull null],[NSNull null],[NSNull null]])
                 ]);
}

- (AAChartModel *)configureColorfulColumnChart {
    return AAChartModel.new
    .chartTypeSet(AAChartTypeColumn)
    .titleSet(@"Colorful Column Chart")
    .subtitleSet(@"single data array colorful column chart")
    .colorsThemeSet([AAEasyTool configureTheRandomColorArrayWithColorNumber:14])
    .easyGradientColorsSet(true)
    .seriesSet(@[
                 AASeriesElement.new
                 .nameSet(@"ElementOne")
                 .dataSet(@[@211,@183,@157,@133,@111,@91,@73,@57,@43,@31,@21,@13,@7,@3])
                 .colorByPointSet(@true),//When using automatic point colors pulled from the options.colors collection, this option determines whether the chart should receive one color per series or one color per point. Default Value：false.
                 ]);
}

- (AAChartModel *)configureGradientColorBarChart {
    return AAChartModel.new
    .chartTypeSet(AAChartTypeBar)
    .titleSet(@"Bar Chart")
    .subtitleSet(@"gradient color bar")
    .borderRadiusSet(@5)
    .xAxisReversedSet(true)
    .seriesSet(@[
                 AASeriesElement.new
                 .nameSet(@"2020")
                 .dataSet(@[@211,@183,@157,@133,@111,@91,@73,@57,@43,@31,@21,@13,@7,@3])
                 .colorSet((id)[AAGradientColor oceanBlueColor]),
                 AASeriesElement.new
                 .nameSet(@"2021")
                 .dataSet(@[@111,@83,@187,@163,@151,@191,@173,@157,@143,@131,@121,@113,@97,@93])
                 .colorSet((id)[AAGradientColor sanguineColor]),
                 ]
               );
}

- (AAChartModel *)configureHavePlotLinesChart {
    NSArray *aaPlotLinesArr =
    @[AAPlotLinesElement.new
      .colorSet(@"#FF0000")//颜色值(16进制)
      .dashStyleSet(AAChartLineDashStyleTypeLongDashDotDot)//样式：Dash,Dot,Solid等,默认Solid
      .widthSet(@(1)) //标示线粗细
      .valueSet(@(10)) //所在位置
      .zIndexSet(@(1)) //层叠,标示线在图表中显示的层叠级别，值越大，显示越向前
      .labelSet(AALabel.new
                .textSet(@"标示线1")
                .styleSet(AAStyle.new
                          .colorSet(@"#ff0000")))
      ,
      AAPlotLinesElement.new
      .colorSet(@"#FF0000")
      .dashStyleSet(AAChartLineDashStyleTypeLongDashDotDot)
      .widthSet(@(1))
      .valueSet(@(20))
      .labelSet(AALabel.new
                .textSet(@"标示线2")
                .styleSet(AAStyle.new
                          .colorSet(@"#00ff00")))
      ];
    
    return AAChartModel.new
    .chartTypeSet(AAChartTypeArea)
    .markerSymbolSet(AAChartSymbolTypeCircle)
    .titleSet(@"带有数据阈值标志线的区域填充图")
    .markerRadiusSet(@6)//设置折线连接点宽度为0,即是隐藏连接点
    .subtitleSet(@"横屏查看效果更佳")
    .yAxisGridLineWidthSet(@0.5)
    .yAxisTitleSet(@"")
    .markerSymbolStyleSet(AAChartSymbolStyleTypeInnerBlank)
    .dataLabelsEnabledSet(true)
    .yAxisPlotLinesSet(aaPlotLinesArr)
    .seriesSet(@[
                 AASeriesElement.new
                 .nameSet(@"2017")
                 .dataSet(@[@7.0, @6.9, @9.5, @14.5, @18.2, @21.5, @25.2, @26.5, @23.3, @18.3, @13.9, @9.6,])
                 .lineWidthSet(@5)
                 .zonesSet(@[@{@"value": @10,@"color": @"#EA007B"},
                             @{@"value": @20,@"color": @"#FDC20A"},
                             @{@"color": @"#F78320"}]),
                 ]);
}

- (AAChartModel *)configrueWithMinusNumberChart {
    return AAChartModel.new
    .chartTypeSet(AAChartTypeArea)
    .easyGradientColorsSet(true)
    //.dataLabelsEnabledSet(true)
    .titleSet(@"带有负数的区域填充图")
    .markerRadiusSet(@0)//设置折线连接点宽度为0,即是隐藏连接点
    .subtitleSet(@"横屏查看效果更佳")
    .yAxisGridLineWidthSet(@0)
    .categoriesSet(@[@"Java",@"Swift",@"Python",@"Ruby", @"PHP",@"Go",@"C",@"C#",@"C++",@"HTML",@"CSS",@"Perl",@"R",@"MATLAB",@"SQL"])
    .yAxisTitleSet(@"")
    .colorsThemeSet(@[@"#49C1B6", @"#FDC20A", @"#F78320", @"#068E81", @"#EA007B"])
    .seriesSet(@[
                 AASeriesElement.new
                 .nameSet(@"2017")
                 .dataSet(@[@0, @(-7.5), @(-1.0), @3.7, @0, @(-3), @8, @0,@(-3.6), @4, @(-2), @0]),
                 AASeriesElement.new
                 .nameSet(@"2018")
                 .dataSet(@[@0, @(-2.2), @2, @(-2.2), @0, @(-1.5), @0, @2.4, @(-1), @3, @(-1), @0]),
                 AASeriesElement.new
                 .nameSet(@"2019")
                 .dataSet(@[@0, @2.3, @0, @1.2, @(-1), @3, @0, @(-3.3), @0, @2, @(-0.3), @0]),
                 AASeriesElement.new
                 .nameSet(@"2020")
                 .dataSet(@[@0, @10, @0.13,@2,@0, @2, @0, @3.7, @0, @1, @(-3), @0]),
                 AASeriesElement.new
                 .nameSet(@"2020")
                 .dataSet(@[@0, @(-4.5), @(-0.9), @5.5, @(-1.9), @1.3, @(-2.8), @0, @(-1.7), @0, @3, @0, ]),
                 ]
               );
}

- (AAChartModel *)configureStepLineChart {
    return AAChartModel.new
    .chartTypeSet(AAChartTypeLine)//图形类型
    .animationTypeSet(AAChartAnimationBounce)//图形渲染动画类型为"bounce"
    .titleSet(@"STEP LINE CHART")//图形标题
    .subtitleSet(@"2020/08/08")//图形副标题
    .dataLabelsEnabledSet(NO)//是否显示数字
    .markerSymbolStyleSet(AAChartSymbolStyleTypeBorderBlank)//折线连接点样式
    .markerRadiusSet(@7)//折线连接点半径长度,为0时相当于没有折线连接点
    .seriesSet(@[
                 AASeriesElement.new
                 .nameSet(@"Berlin")
                 .dataSet(@[@450, @432, @401, @454, @590, @530, @510])
                 .stepSet(@"right"), //折线连接点靠右👉
                 AASeriesElement.new
                 .nameSet(@"New York")
                 .dataSet(@[@220, @282, @201, @234, @290, @430, @410])
                 .stepSet(@"center"),//折线连接点居中
                 AASeriesElement.new
                 .nameSet(@"Tokyo")
                 .dataSet(@[@120, @132, @101, @134, @90, @230, @210])
                 .stepSet(@"left"),//折线连接点靠左边👈
                 ]
               );
}

- (AAChartModel *)configureStepAreaChart {
    return AAChartModel.new
    .chartTypeSet(AAChartTypeArea)//图形类型
    .animationTypeSet(AAChartAnimationBounce)//图形渲染动画类型为"bounce"
    .easyGradientColorsSet(true)//开启主题渐变色
    .titleSet(@"STEP AREA CHART")//图形标题
    .subtitleSet(@"2020/08/08")//图形副标题
    .dataLabelsEnabledSet(NO)//是否显示数字
    .markerSymbolStyleSet(AAChartSymbolStyleTypeInnerBlank)//折线连接点样式
    .markerRadiusSet(@0)//折线连接点半径长度,为0时相当于没有折线连接点
    .seriesSet(@[
                 AASeriesElement.new
                 .nameSet(@"Berlin")
                 .dataSet(@[@450, @432, @401, @454, @590, @530, @510])
                 .stepSet(@(true))//设置折线样式为直方折线,连接点位置默认靠左👈
                 ,
                 AASeriesElement.new
                 .nameSet(@"New York")
                 .dataSet(@[@220, @282, @201, @234, @290, @430, @410])
                 .stepSet(@(true))//设置折线样式为直方折线,连接点位置默认靠左👈
                 ,
                 AASeriesElement.new
                 .nameSet(@"Tokyo")
                 .dataSet(@[@120, @132, @101, @134, @90, @230, @210])
                 .stepSet(@(true))//设置折线样式为直方折线,连接点位置默认靠左👈
                 ,
                 ]
               );
}

- (AAChartModel *)configureNightingaleRoseChart {
    return AAChartModel.new
    .titleSet(@"南丁格尔玫瑰图")
    .subtitleSet(@"极地图中的一种")
    .yAxisTitleSet(@"cm")
    .chartTypeSet(AAChartTypeColumn)
    //.xAxisVisibleSet(true)//是否显示最外一层圆环
    //.yAxisVisibleSet(false)//是否显示中间的多个圆环
    .legendEnabledSet(false)//隐藏图例(底部可点按的小圆点)
    .categoriesSet(@[@"一月", @"二月", @"三月", @"四月", @"五月", @"六月", @"七月", @"八月", @"九月", @"十月", @"十一月", @"十二月"])
    .dataLabelsEnabledSet(true)
    .polarSet(true)//极地化图形
    .seriesSet(@[
                 AASeriesElement.new
                 .nameSet(@"东京")
                 .dataSet(@[@7.0, @6.9, @9.5, @9.6, @13.9, @14.5, @18.3, @18.2, @21.5, @25.2, @26.5, @23.3]),
                 ]
               )
    ;
}

- (AAChartModel*)configureCustomSingleDataLabelChart {
    AADataElement *aaDataElement = AADataElement.new
    .ySet(@1.25)
    .dataLabelsSet(AADataLabels.new
                   .enabledSet(true)
                   .verticalAlignSet(AAChartVerticalAlignTypeMiddle)
                   .formatSet(@"{y} 美元🇺🇸💲")
                   .xSet(@3)
                   .styleSet(AAStyle.new
                             .fontSizeSet(@"20px")
                             .fontWeightSet(AAChartFontWeightTypeBold)
                             .colorSet(AAColor.redColor)
                             .textOutlineSet(@"1px 1px contrast")
                             )
                   );
    
    return AAChartModel.new
    .titleSet(@"单独自定义某个指定数据元素的DataLabel")
    .subtitleSet(@"")
    .colorsThemeSet(@[AAGradientColor.mysticMauveColor])
    .seriesSet(@[
                 AASeriesElement.new
                 .nameSet(@"货币")
                 .dataSet(@[@0.38, @0.31, @0.32, @0.32, @0.64, @0.66, @0.86, aaDataElement, @0.47, @0.52, @0.75, @0.52, @0.56, @0.54, @0.60, @0.46, @0.63, @0.54, @0.51, @0.58, @0.64, @0.60, @0.45, @0.36, @0.67]),
                 ]
               );
}

- (AAChartModel *)configureChartWithShadowStyle {
    return AAChartModel.new
    .titleSet(@"")
    .subtitleSet(@"")
    .yAxisVisibleSet(false)
    .chartTypeSet(AAChartTypeSpline)
    .legendEnabledSet(false)//隐藏图例(底部可点按的小圆点)
    .categoriesSet(@[@"一月", @"二月", @"三月", @"四月", @"五月", @"六月", @"七月", @"八月", @"九月", @"十月", @"十一月", @"十二月"])
    .markerSymbolStyleSet(AAChartSymbolStyleTypeInnerBlank)
    .markerRadiusSet(@8.0)
    .seriesSet(@[
                 AASeriesElement.new
                 .nameSet(@"Tokoyo")
                 .lineWidthSet(@8.0)
                 .dataSet(@[@7.0, @6.9, @2.5, @14.5, @18.2, @21.5, @5.2, @26.5, @23.3, @45.3, @13.9, @9.6])
                 .shadowSet(AAShadow.new
                            .offsetXSet(@15.0)
                            .offsetYSet(@15.0)
                            .opacitySet(@0.2)
                            .widthSet(@8.0)
                            .colorSet(AAColor.redColor)
                            ),
                 ]
               );
}

- (AAChartModel *)configureColorfulGradientAreaChart {
    NSArray *stopsArr = @[@[@0.0, @"#febc0f"],//颜色字符串设置支持十六进制类型和 rgba 类型
                          @[@0.5, @"#FF14d4"],
                          @[@1.0, @"#0bf8f5"]];
    NSDictionary *gradientColorDic1 =
    [AAGradientColor gradientColorWithDirection:AALinearGradientDirectionToRight
                                     stopsArray:stopsArr];
    
    return AAChartModel.new
    .chartTypeSet(AAChartTypeAreaspline)
    .titleSet(@"")
    .subtitleSet(@"")
    .categoriesSet(@[@"一月", @"二月", @"三月", @"四月", @"五月", @"六月",
                     @"七月", @"八月", @"九月", @"十月", @"十一月", @"十二月"])
    .yAxisTitleSet(@"")
    .backgroundColorSet(@"#FFFFFF")
    .markerRadiusSet(@0)
    .yAxisLineWidthSet(@0)
    .yAxisGridLineWidthSet(@0)
    .legendEnabledSet(false)
    .easyGradientColorsSet(true)
    .seriesSet(@[
                 AASeriesElement.new
                 .nameSet(@"Tokyo Hot")
                 .colorSet((id)gradientColorDic1)
                 .dataSet(@[@7.0, @6.9, @2.5, @14.5, @18.2, @21.5, @5.2, @26.5, @23.3, @45.3, @13.9, @9.6]),
                 ]
               );
}

- (AAChartModel *)configureColorfulGradientSplineChart {
    NSArray *stopsArr =
    @[@[@0.00, @"#febc0f"],//颜色字符串设置支持十六进制类型和 rgba 类型
      @[@0.25, @"#FF14d4"],
      @[@0.50, @"#0bf8f5"],
      @[@0.75, @"#F33c52"],
      @[@1.00, @"#1904dd"],
      ];
    
    NSDictionary *gradientColorDic1 =
    [AAGradientColor gradientColorWithDirection:AALinearGradientDirectionToRight
                                     stopsArray:stopsArr];
    
    return AAChartModel.new
    .chartTypeSet(AAChartTypeSpline)
    .titleSet(@"")
    .subtitleSet(@"")
    .categoriesSet(@[@"一月", @"二月", @"三月", @"四月", @"五月", @"六月",
                     @"七月", @"八月", @"九月", @"十月", @"十一月", @"十二月"])
    .yAxisTitleSet(@"")
    .markerRadiusSet(@0)
    .yAxisLineWidthSet(@0)
    .yAxisGridLineWidthSet(@0)
    .legendEnabledSet(false)
    .easyGradientColorsSet(true)
    .seriesSet(@[
                 AASeriesElement.new
                 .nameSet(@"Tokyo Hot")
                 .lineWidthSet(@13)
                 .colorSet((id)gradientColorDic1)
                 .dataSet(@[@7.0, @6.9, @2.5, @14.5, @18.2, @21.5, @5.2, @26.5, @23.3, @45.3, @13.9, @9.6]),
                 ]
               );
}


- (AAChartModel *)configureGradientColorAreasplineChart {
    NSDictionary *gradientColorDic1 =
    [AAGradientColor gradientColorWithDirection:AALinearGradientDirectionToBottom
                               startColorString:@"rgba(255,20,147,1)"//深粉色, alpha 透明度 1
                                 endColorString:@"rgba(255,20,147,0.3)"];//热情的粉红, alpha 透明度 0.3
    
    return AAChartModel.new
    .chartTypeSet(AAChartTypeAreaspline)
    .titleSet(@"")
    .subtitleSet(@"")
    .categoriesSet(@[@"一月", @"二月", @"三月", @"四月", @"五月", @"六月",
                     @"七月", @"八月", @"九月", @"十月", @"十一月", @"十二月"])
    .yAxisTitleSet(@"")
    .markerRadiusSet(@8.0)//marker点半径为8个像素
    .markerSymbolStyleSet(AAChartSymbolStyleTypeInnerBlank)//marker点为空心效果
    .markerSymbolSet(AAChartSymbolTypeCircle)//marker点为圆形点○
    .yAxisLineWidthSet(@0)
    .yAxisGridLineWidthSet(@0)
    .legendEnabledSet(false)
    .easyGradientColorsSet(true)
    .seriesSet(@[
                 AASeriesElement.new
                 .nameSet(@"Tokyo Hot")
                 .lineWidthSet(@5.0)
                 .colorSet(@"rgba(220,20,60,1)")//猩红色, alpha 透明度 1
                 .fillColorSet((id)gradientColorDic1)
                 .dataSet(@[@7.0, @6.9, @2.5, @14.5, @18.2, @21.5, @5.2, @26.5, @23.3, @45.3, @13.9, @9.6]),
                 ]
               );
}

- (AAChartModel *)configureSpecialStyleMarkerOfSingleDataElementChart {
    NSArray *stopsArr =
    @[@[@0.00, @"#febc0f"],//颜色字符串设置支持十六进制类型和 rgba 类型
      @[@0.25, @"#FF14d4"],
      @[@0.50, @"#0bf8f5"],
      @[@0.75, @"#F33c52"],
      @[@1.00, @"#1904dd"],
      ];
    
    NSDictionary *gradientColorDic1 =
    [AAGradientColor gradientColorWithDirection:AALinearGradientDirectionToRight
                                     stopsArray:stopsArr];
    
    AADataElement *singleSpecialData = AADataElement.new
    .markerSet(AAMarker.new
               .radiusSet(@8)//曲线连接点半径
               .symbolSet(AAChartSymbolTypeCircle)//曲线点类型："circle", "square", "diamond", "triangle","triangle-down"，默认是"circle"
               .fillColorSet(@"#FFFFFF")//点的填充色(用来设置折线连接点的填充色)
               .lineWidthSet(@5)//外沿线的宽度(用来设置折线连接点的轮廓描边的宽度)
               //外沿线的颜色(用来设置折线连接点的轮廓描边颜色，当值为空字符串时，默认取数据点或数据列的颜色)
               .lineColorSet(@"#FF0000")
               )
    .ySet(@26.5);
    
    return AAChartModel.new
    .chartTypeSet(AAChartTypeSpline)
    .titleSet(@"")
    .backgroundColorSet(@"#4b2b7f")
    .yAxisTitleSet(@"")//设置Y轴标题
    .dataLabelsEnabledSet(false)//是否显示值
    .tooltipEnabledSet(true)
    .markerRadiusSet(@0)
    .xAxisVisibleSet(false)
    .yAxisVisibleSet(false)
    .seriesSet(@[
                 AASeriesElement.new
                 .nameSet(@"Virtual Data")
                 .lineWidthSet(@6)
                 .dataSet(@[@7.0, @6.9, @2.5, @14.5, @18.2, singleSpecialData, @5.2, @26.5, @23.3, @45.3, @13.9, @9.6])
                 .colorSet((id)gradientColorDic1)
                 ]);
}

- (AAChartModel *)configureSpecialStyleColumnOfSingleDataElementChart {
    AADataElement *singleSpecialData = AADataElement.new
    .colorSet((id)AAGradientColor.freshPapayaColor)
    .ySet(@49.5);
    
    return AAChartModel.new
    .chartTypeSet(AAChartTypeColumn)
    .titleSet(@"")
    .yAxisTitleSet(@"")//设置Y轴标题
    .dataLabelsEnabledSet(false)//是否显示值
    .tooltipEnabledSet(false)
    .markerRadiusSet(@0)
    .xAxisVisibleSet(false)
    .yAxisVisibleSet(false)
    .seriesSet(@[
                 AASeriesElement.new
                 .nameSet(@"Virtual Data")
                 .lineWidthSet(@6)
                 .dataSet(@[@7.0, @6.9, @2.5, @14.5, @18.2, singleSpecialData, @5.2, @26.5, @23.3, @26.5, @13.9, @9.6])
                 .colorSet((id)AAGradientColor.oceanBlueColor)
                 ]);
}

- (AAChartModel *)configureAreaChartThreshold {
    NSDictionary *gradientColorDic1 =
    [AAGradientColor gradientColorWithDirection:AALinearGradientDirectionToBottom
                               startColorString:@"rgba(30, 144, 255,1)"//DodgerBlue, alpha 透明度 1
                                 endColorString:@"rgba(30, 144, 255,0.1)"];//DodgerBlue, alpha 透明度 0.1
    return AAChartModel.new
    .chartTypeSet(AAChartTypeArea)
    .titleSet(@"")
    .yAxisTitleSet(@"")//设置Y轴标题
    .yAxisGridLineWidthSet(@0)
    .categoriesSet(@[@"Jan", @"Feb", @"Mar", @"Apr", @"May", @"Jun",@"July", @"Aug", @"Spe", @"Oct", @"Nov", @"Dec"])
    .dataLabelsEnabledSet(false)//是否显示值
    .markerRadiusSet(@8)
    .markerSymbolSet(AAChartSymbolTypeCircle)
    .markerSymbolStyleSet(AAChartSymbolStyleTypeInnerBlank)
    .legendEnabledSet(false)
    .seriesSet(@[
                 AASeriesElement.new
                 .thresholdSet(@(-200))
                 .dataSet(@[@106.4, @129.2, @269.9, @-100.5, @144.0, @176.0, @135.6, @148.5, @216.4, @194.1, @95.6, @54.4])
                 .lineWidthSet(@6)
                 .colorSet(@"rgba(30, 144, 255,1)")
                 .fillColorSet((id)gradientColorDic1)
                 ]);
}

//refer to online sample https://jshare.com.cn/github/highcharts/highcharts/tree/master/samples/highcharts/plotoptions/series-marker-symbol/
- (AAChartModel *)customScatterChartMarkerSymbolContent {
    NSString *predefinedSymbol1 = AAChartSymbolTypeTriangle;
    NSString *predefinedSymbol2 = AAChartSymbolTypeCircle;
    NSString *imageSymbol = @"url(https://www.highcharts.com/samples/graphics/sun.png)";
    NSString *base64Symbol = @"url(data:image/png;base64,iVBORw0KGgoAAAANSUhEUgAAAA4AAAAOCAYAAAAfSC3RAAAACXBIWXMAAA7EAAAOxAGVKw4bAAAKT2lDQ1BQaG90b3Nob3AgSUNDIHByb2ZpbGUAAHjanVNnVFPpFj333vRCS4iAlEtvUhUIIFJCi4AUkSYqIQkQSoghodkVUcERRUUEG8igiAOOjoCMFVEsDIoK2AfkIaKOg6OIisr74Xuja9a89+bN/rXXPues852zzwfACAyWSDNRNYAMqUIeEeCDx8TG4eQuQIEKJHAAEAizZCFz/SMBAPh+PDwrIsAHvgABeNMLCADATZvAMByH/w/qQplcAYCEAcB0kThLCIAUAEB6jkKmAEBGAYCdmCZTAKAEAGDLY2LjAFAtAGAnf+bTAICd+Jl7AQBblCEVAaCRACATZYhEAGg7AKzPVopFAFgwABRmS8Q5ANgtADBJV2ZIALC3AMDOEAuyAAgMADBRiIUpAAR7AGDIIyN4AISZABRG8lc88SuuEOcqAAB4mbI8uSQ5RYFbCC1xB1dXLh4ozkkXKxQ2YQJhmkAuwnmZGTKBNA/g88wAAKCRFRHgg/P9eM4Ors7ONo62Dl8t6r8G/yJiYuP+5c+rcEAAAOF0ftH+LC+zGoA7BoBt/qIl7gRoXgugdfeLZrIPQLUAoOnaV/Nw+H48PEWhkLnZ2eXk5NhKxEJbYcpXff5nwl/AV/1s+X48/Pf14L7iJIEyXYFHBPjgwsz0TKUcz5IJhGLc5o9H/LcL//wd0yLESWK5WCoU41EScY5EmozzMqUiiUKSKcUl0v9k4t8s+wM+3zUAsGo+AXuRLahdYwP2SycQWHTA4vcAAPK7b8HUKAgDgGiD4c93/+8//UegJQCAZkmScQAAXkQkLlTKsz/HCAAARKCBKrBBG/TBGCzABhzBBdzBC/xgNoRCJMTCQhBCCmSAHHJgKayCQiiGzbAdKmAv1EAdNMBRaIaTcA4uwlW4Dj1wD/phCJ7BKLyBCQRByAgTYSHaiAFiilgjjggXmYX4IcFIBBKLJCDJiBRRIkuRNUgxUopUIFVIHfI9cgI5h1xGupE7yAAygvyGvEcxlIGyUT3UDLVDuag3GoRGogvQZHQxmo8WoJvQcrQaPYw2oefQq2gP2o8+Q8cwwOgYBzPEbDAuxsNCsTgsCZNjy7EirAyrxhqwVqwDu4n1Y8+xdwQSgUXACTYEd0IgYR5BSFhMWE7YSKggHCQ0EdoJNwkDhFHCJyKTqEu0JroR+cQYYjIxh1hILCPWEo8TLxB7iEPENyQSiUMyJ7mQAkmxpFTSEtJG0m5Si +ksqZs0SBojk8naZGuyBzmULCAryIXkneTD5DPkG+Qh8lsKnWJAcaT4U+IoUspqShnlEOU05QZlmDJBVaOaUt2ooVQRNY9aQq2htlKvUYeoEzR1mjnNgxZJS6WtopXTGmgXaPdpr+h0uhHdlR5Ol9BX0svpR+iX6AP0dwwNhhWDx4hnKBmbGAcYZxl3GK+YTKYZ04sZx1QwNzHrmOeZD5lvVVgqtip8FZHKCpVKlSaVGyovVKmqpqreqgtV81XLVi +pXlN9rkZVM1PjqQnUlqtVqp1Q61MbU2epO6iHqmeob1Q/pH5Z/YkGWcNMw09DpFGgsV/jvMYgC2MZs3gsIWsNq4Z1gTXEJrHN2Xx2KruY/R27iz2qqaE5QzNKM1ezUvOUZj8H45hx+Jx0TgnnKKeX836K3hTvKeIpG6Y0TLkxZVxrqpaXllirSKtRq0frvTau7aedpr1Fu1n7gQ5Bx0onXCdHZ4/OBZ3nU9lT3acKpxZNPTr1ri6qa6UbobtEd79up+6Ynr5egJ5Mb6feeb3n+hx9L/1U/W36p/VHDFgGswwkBtsMzhg8xTVxbzwdL8fb8VFDXcNAQ6VhlWGX4YSRudE8o9VGjUYPjGnGXOMk423GbcajJgYmISZLTepN7ppSTbmmKaY7TDtMx83MzaLN1pk1mz0x1zLnm+eb15vft2BaeFostqi2uGVJsuRaplnutrxuhVo5WaVYVVpds0atna0l1rutu6cRp7lOk06rntZnw7Dxtsm2qbcZsOXYBtuutm22fWFnYhdnt8Wuw+6TvZN9un2N/T0HDYfZDqsdWh1+c7RyFDpWOt6azpzuP33F9JbpL2dYzxDP2DPjthPLKcRpnVOb00dnF2e5c4PziIuJS4LLLpc+Lpsbxt3IveRKdPVxXeF60vWdm7Obwu2o26/uNu5p7ofcn8w0nymeWTNz0MPIQ+BR5dE/C5+VMGvfrH5PQ0+BZ7XnIy9jL5FXrdewt6V3qvdh7xc+9j5yn+M+4zw33jLeWV/MN8C3yLfLT8Nvnl+F30N/I/9k/3r/0QCngCUBZwOJgUGBWwL7+Hp8Ib+OPzrbZfay2e1BjKC5QRVBj4KtguXBrSFoyOyQrSH355jOkc5pDoVQfujW0Adh5mGLw34MJ4WHhVeGP45wiFga0TGXNXfR3ENz30T6RJZE3ptnMU85ry1KNSo+qi5qPNo3ujS6P8YuZlnM1VidWElsSxw5LiquNm5svt/87fOH4p3iC+N7F5gvyF1weaHOwvSFpxapLhIsOpZATIhOOJTwQRAqqBaMJfITdyWOCnnCHcJnIi/RNtGI2ENcKh5O8kgqTXqS7JG8NXkkxTOlLOW5hCepkLxMDUzdmzqeFpp2IG0yPTq9MYOSkZBxQqohTZO2Z+pn5mZ2y6xlhbL+xW6Lty8elQfJa7OQrAVZLQq2QqboVFoo1yoHsmdlV2a/zYnKOZarnivN7cyzytuQN5zvn//tEsIS4ZK2pYZLVy0dWOa9rGo5sjxxedsK4xUFK4ZWBqw8uIq2Km3VT6vtV5eufr0mek1rgV7ByoLBtQFr6wtVCuWFfevc1+ 1dT1gvWd+ 1YfqGnRs+FYmKrhTbF5cVf9go3HjlG4dvyr+Z3JS0qavEuWTPZtJm6ebeLZ5bDpaql+aXDm4N2dq0Dd9WtO319kXbL5fNKNu7g7ZDuaO/PLi8ZafJzs07P1SkVPRU+lQ27tLdtWHX+G7R7ht7vPY07NXbW7z3/T7JvttVAVVN1WbVZftJ+7P3P66Jqun4lvttXa1ObXHtxwPSA/0HIw6217nU1R3SPVRSj9Yr60cOxx+ 1/p3vdy0NNg1VjZzG4iNwRHnk6fcJ3/ceDTradox7rOEH0x92HWcdL2pCmvKaRptTmvtbYlu6T8w+0dbq3nr8R9sfD5w0PFl5SvNUyWna6YLTk2fyz4ydlZ19fi753GDborZ752PO32oPb+ 16EHTh0kX/i +c7vDvOXPK4dPKy2+UTV7hXmq86X23qdOo8/pPTT8e7nLuarrlca7nuer21e2b36RueN87d9L158Rb/1tWeOT3dvfN6b/fF9/XfFt1+cif9zsu72Xcn7q28T7xf9EDtQdlD3YfVP1v+3Njv3H9qwHeg89HcR/cGhYPP/pH1jw9DBY+Zj8uGDYbrnjg+OTniP3L96fynQ89kzyaeF/6i/suuFxYvfvjV69fO0ZjRoZfyl5O/bXyl/erA6xmv28bCxh6+yXgzMV70VvvtwXfcdx3vo98PT+R8IH8o/2j5sfVT0Kf7kxmTk/8EA5jz/GMzLdsAAAAgY0hSTQAAeiUAAICDAAD5/wAAgOkAAHUwAADqYAAAOpgAABdvkl/FRgAAAVVJREFUeNpi/P37NwOxYM2pHtm7lw8uYmBgYGAiVtPC3RWh+88vuneT474Dv4DkcUZibJy8PG72le/nkn+zMzAaMhnNyY1clMpCjKbz/86lMLAzMMA0MTAwMOC1Ea6JgYFB9pPwncbMg6owOaY1p3pk15zqkcWnie8j63ddY18nZHmWI2eW3vzN/Jf168c3UfGuHathAXHl+7lkBnYGBtafDP8NVd3jQ8xKHiNrZMyeqPPtE/9vTgYGBgb1H4oHlHXt43ZfWfDwNzsDIwMDA4POX831RXGrg9BdxLhob63VgTurjsAUsv5k+A9jC3/g/NCdfVoQm/+ZIu3qjhnyW3XABJANMNL19cYVcPBQrZpq9eyFwCdJmIT6D8UD5cmbHXFphKccI9Mgc84vTH9goYhPE4rGELOSx0bSjsUMDAwMunJ2FQST0+/fv1Hw5BWJbehi2DBgAHTKsWmiz+rJAAAAAElFTkSuQmCC)";
    
    AASeriesElement *element1 = AASeriesElement.new
    .nameSet(@"Predefined symbol")
    .dataSet(@[@0.45, @0.43, @0.50, @0.55, @0.58, @0.62, @0.83, @0.39, @0.56, @0.67, @0.50, @0.34, @0.50, @0.67, @0.58, @0.29, @0.46, @0.23, @0.47, @0.46, @0.38, @0.56, @0.48, @0.36])
    .markerSet(AAMarker.new
               .symbolSet(predefinedSymbol1))
    ;
    
    AASeriesElement *element2 = AASeriesElement.new
    .nameSet(@"Image symbol")
    .dataSet(@[@0.38, @0.31, @0.32, @0.32, @0.64, @0.66, @0.86, @0.47, @0.52, @0.75, @0.52, @0.56, @0.54, @0.60, @0.46, @0.63, @0.54, @0.51, @0.58, @0.64, @0.60, @0.45, @0.36, @0.67])
    .markerSet(AAMarker.new
               .symbolSet(imageSymbol))
    ;
    
    AASeriesElement *element3 = AASeriesElement.new
    .nameSet(@"Base64 symbol (*)")
    .dataSet(@[@0.46, @0.32, @0.53, @0.58, @0.86, @0.68, @0.85, @0.73, @0.69, @0.71, @0.91, @0.74, @0.60, @0.50, @0.39, @0.67, @0.55, @0.49, @0.65, @0.45, @0.64, @0.47, @0.63, @0.64])
    .markerSet(AAMarker.new
               .symbolSet(base64Symbol))
    ;
    
    AASeriesElement *element4 = AASeriesElement.new
    .nameSet(@"Custom symbol")
    .dataSet(@[@0.60, @0.51, @0.52, @0.53, @0.64, @0.84, @0.65, @0.68, @0.63, @0.47, @0.72, @0.60, @0.65, @0.74, @0.66, @0.65, @0.71, @0.59, @0.65, @0.77, @0.52, @0.53, @0.58, @0.53])
    .markerSet(AAMarker.new
               .symbolSet(predefinedSymbol2))
    ;

    return AAChartModel.new
    .chartTypeSet(AAChartTypeScatter)
    .titleSet(@"")
    .subtitleSet(@"")
    .yAxisTitleSet(@"")
    .yAxisMaxSet(@3.5)
    .yAxisGridLineWidthSet(@0)
    .stackingSet(AAChartStackingTypeNormal)
    .markerRadiusSet(@8)
    .seriesSet(@[element1,element2,element3,element4]);
}

//refer to online sample https://jshare.com.cn/github/highcharts/highcharts/tree/master/samples/highcharts/plotoptions/series-marker-symbol/
- (AAChartModel *)customLineChartMarkerSymbolContent {
    AAChartModel *aaChartModel = [self customScatterChartMarkerSymbolContent];
    aaChartModel.chartType = AAChartTypeLine;
    return aaChartModel;
}

//三角形雷达图
- (AAChartModel *)configureTriangleRadarChart {
    return AAChartModel.new
    .chartTypeSet(AAChartTypeArea)
    .titleSet(@"")
    .subtitleSet(@"")
    .yAxisTitleSet(@"")
    .yAxisMaxSet(@15.0)
    .yAxisGridLineWidthSet(@0)
    .xAxisVisibleSet(false)
    .markerRadiusSet(@0)
    .polarSet(true)//是否极化图形
    .seriesSet(@[
                 AASeriesElement.new
                 .dataSet(@[@15.0,@15.0,@15.0,]),
                 AASeriesElement.new
                 .dataSet(@[@9.0,@9.0,@9.0,]),
                 AASeriesElement.new
                 .dataSet(@[@6.0,@6.0,@6.0,]),
                 AASeriesElement.new
                 .dataSet(@[@3.0,@3.0,@3.0,]),
                 ]);
}

//四边形雷达图
- (AAChartModel *)configureQuadrangleRadarChart {
    return AAChartModel.new
    .chartTypeSet(AAChartTypeArea)
    .titleSet(@"")
    .subtitleSet(@"")
    .yAxisTitleSet(@"")
    .yAxisMaxSet(@15.0)
    .yAxisGridLineWidthSet(@0)
    .xAxisVisibleSet(false)
    .markerRadiusSet(@0)
    .polarSet(true)//是否极化图形
    .seriesSet(@[
                 AASeriesElement.new
                 .dataSet(@[@15.0,@15.0,@15.0,@15.0,]),
                 AASeriesElement.new
                 .dataSet(@[@9.0,@9.0,@9.0,@9.0,]),
                 AASeriesElement.new
                 .dataSet(@[@6.0,@6.0,@6.0,@6.0,]),
                 AASeriesElement.new
                 .dataSet(@[@3.0,@3.0,@3.0,@3.0,]),
                 ]);
}

//五边形雷达图
- (AAChartModel *)configurePentagonRadarChart {
    return AAChartModel.new
    .chartTypeSet(AAChartTypeArea)
    .titleSet(@"")
    .subtitleSet(@"")
    .yAxisTitleSet(@"")
    .yAxisMaxSet(@15.0)
    .yAxisGridLineWidthSet(@0)
    .xAxisVisibleSet(false)
    .markerRadiusSet(@0)
    .polarSet(true)//是否极化图形
    .seriesSet(@[
                 AASeriesElement.new
                 .dataSet(@[@15.0,@15.0,@15.0,@15.0,@15.0,]),
                 AASeriesElement.new
                 .dataSet(@[@9.0,@9.0,@9.0,@9.0,@9.0,]),
                 AASeriesElement.new
                 .dataSet(@[@6.0,@6.0,@6.0,@6.0,@6.0,]),
                 AASeriesElement.new
                 .dataSet(@[@3.0,@3.0,@3.0,@3.0,@3.0,]),
                 ]);
}

//六边形雷达图
- (AAChartModel *)configureHexagonRadarChart {
    return AAChartModel.new
    .chartTypeSet(AAChartTypeArea)
    .titleSet(@"")
    .subtitleSet(@"")
    .yAxisTitleSet(@"")
    .yAxisMaxSet(@15.0)
    .yAxisGridLineWidthSet(@0)
    .xAxisVisibleSet(false)
    .markerRadiusSet(@0)
    .polarSet(true)//是否极化图形
    .seriesSet(@[
                 AASeriesElement.new
                 .dataSet(@[@15.0,@15.0,@15.0,@15.0,@15.0,@15.0,]),
                 AASeriesElement.new
                 .dataSet(@[@9.0,@9.0,@9.0,@9.0,@9.0,@9.0,]),
                 AASeriesElement.new
                 .dataSet(@[@6.0,@6.0,@6.0,@6.0,@6.0,@6.0,]),
                 AASeriesElement.new
                 .dataSet(@[@3.0,@3.0,@3.0,@3.0,@3.0,@3.0,]),
                 ]);
}

- (AAChartModel *)adjustYAxisMaxAndMinValues {
   NSArray *categoriesArr = @[
       AAChartTypeColumn,
       AAChartTypeBar,
       AAChartTypeArea,
       AAChartTypeAreaspline,
       AAChartTypeLine,
       AAChartTypeSpline,
       AAChartTypeScatter,
       AAChartTypePie,
       AAChartTypeBubble,
       AAChartTypePyramid,
       AAChartTypeFunnel,
       AAChartTypeColumnrange,
       AAChartTypeArearange,
       AAChartTypeAreasplinerange,
       AAChartTypeBoxplot,
       AAChartTypeWaterfall,
       AAChartTypePolygon,
   ];
    
    return AAChartModel.new
    .chartTypeSet(AAChartTypeAreaspline)
    .titleSet(@"")
    .subtitleSet(@"")
    .legendEnabledSet(false)
    .yAxisVisibleSet(true)
    .easyGradientColorsSet(true)
    .zoomTypeSet(AAChartZoomTypeXY)
    .tooltipValueSuffixSet(@"kg")
    .categoriesSet(categoriesArr)
    .yAxisTitleSet(@"")
    .yAxisMinSet(@2.0)
    .yAxisMaxSet(@45.4)
    .xAxisTickIntervalSet(@2)
    .seriesSet(@[
        AASeriesElement.new
        .nameSet(@"体重")
        .colorSet(@"#2494F3")
        .dataSet(@[@7.0, @6.9, @2.5, @14.5, @18.2, @21.5, @5.2, @26.5, @23.3, @45.3, @13.9, @9.6])
    ])
    ;
}



- (AAChartModel *)customSpecialStyleDataLabelOfSingleDataElementChart {
    NSDictionary *gradientColorDic1 =
    [AAGradientColor gradientColorWithDirection:AALinearGradientDirectionToTop
                               startColorString:@"rgba(255,215,0,0.1)" // gold color, alpha: 0.1
                                 endColorString:@"rgba(255,215,0, 0.6)"]; // gold color, alpha: 0.6
    
    NSString *formatStr = [NSString stringWithFormat:@"%@%@",
                           @"<span style=""color:#FFFFFF;font-weight:thin;font-size:25px"">▲{y}</span>",
                           @"<span style=""color:#FFFFFF;font-weight:thin;font-size:17px""> m</span>"
                           ];
    
    AADataElement *singleSpecialData = AADataElement.new
    .dataLabelsSet(AADataLabels.new
                   .enabledSet(true)
                   .useHTMLSet(true)
                   .formatSet(formatStr)
                   .styleSet(AAStyle.new
                             .fontWeightSet(AAChartFontWeightTypeBold)
                             .colorSet(AAColor.whiteColor)
                             .fontSizeSet(@"16px"))
                   .ySet(@(-35))
                   .alignSet(AAChartAlignTypeCenter)
                   .verticalAlignSet(AAChartVerticalAlignTypeTop)
                   .overflowSet(@"none")
                   .cropSet(false)
                   )
    .ySet(@26.5);
    
    return AAChartModel.new
    .chartTypeSet(AAChartTypeAreaspline)
    .titleSet(@"")
    .backgroundColorSet(@"#4b2b7f")
    .yAxisTitleSet(@"")//设置Y轴标题
    .dataLabelsEnabledSet(false)//是否显示值
    .tooltipEnabledSet(true)
    .markerRadiusSet(@0)
    .xAxisVisibleSet(false)
    .yAxisVisibleSet(false)
    .seriesSet(@[
                 AASeriesElement.new
                 .nameSet(@"Virtual Data")
                 .lineWidthSet(@6)
                 .colorSet(@"rgba(255,215,0,1)")
                 .fillColorSet((id)gradientColorDic1)// gold color, alpha: 1.0
                 .dataSet(@[@7.0, @6.9, @2.5, @14.5, @18.2, singleSpecialData, @5.2, @26.5, @23.3, @45.3, @13.9, @9.6])
                 ]);
}



@end

