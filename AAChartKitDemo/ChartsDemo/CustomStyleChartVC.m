//
//  CustomStyleChartVC.m
//  AAChartKitDemo
//
//  Created by AnAn on 2018/11/13.
//  Copyright © 2018 An An. All rights reserved.
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

#import "CustomStyleChartVC.h"
#import "AAEasyTool.h"
#import "AAChartSymbolConstant.h"

@interface CustomStyleChartVC ()

@end

@implementation CustomStyleChartVC

- (void)viewDidLoad {
    [super viewDidLoad];

}

- (id)chartConfigurationWithSelectedIndex:(NSUInteger)selectedIndex {
    switch (selectedIndex) {
        case 0:  return [self setUpColorfulBarChart];
        case 1:  return [self setUpColorfulGradientColorChart];
        case 2:  return [self setUpDiscontinuousDataChart];
        case 3:  return [self configureMixedLineChart];
        case 4:  return [self configureColorfulColumnChart];
        case 5:  return [self configureGradientColorBarChart];
        case 6:  return [self configureXAxisHaveAAZonesElementChart];
        case 7:  return [self configureYAxisHaveAAZonesElementChart];
        case 8:  return [self configureStepLineChart];
        case 9:  return [self configureStepAreaChart];
        case 10: return [self configureNightingaleRoseChart];
        case 11: return [self configureCustomSingleDataLabelsElementChart];
        case 12: return [self configureChartWithShadowStyle];
        case 13: return [self configureColorfulGradientAreaChart];
        case 14: return [self configureColorfulGradientSplineChart];
        case 15: return [self configureGradientColorAreasplineChart];
        case 16: return [self configureSpecialStyleMarkerOfSingleDataElementChart];
        case 17: return [self configureSpecialStyleColumnOfSingleDataElementChart];
        case 18: return [self configureAreaChartThreshold];
        case 19: return [self customScatterChartMarkerSymbolContent];
        case 20: return [self customLineChartMarkerSymbolContent];
        case 21: return [self configureWithMinusNumberChart];
        case 22: return [self splineChartHoverLineWithNoChangeAndCustomMarkerStatesHoverStyle];
        case 23: return [self configurePentagonRadarChart];
        case 24: return [self configureHexagonRadarChart];
        case 25: return [self adjustYAxisMaxAndMinValues];
        case 26: return [self customSpecialStyleDataLabelOfSingleDataElementChart];
        case 27: return [self customBarChartHoverColorAndSelectColor];
        case 28: return [self customChartHoverAndSelectHaloStyle];
        case 29: return [self customSplineChartMarkerStatesHoverStyle];
        case 30: return [self customNormalStackingChartDataLabelsContentAndStyle];
        case 31: return [self upsideDownPyramidChart];
        case 32: return [self doubleLayerPieChart];
        case 33: return [self doubleLayerDoubleColorsPieChart];
        case 34: return [self disableSomeOfLinesMouseTrackingEffect];
        case 35: return [self configureColorfulShadowSplineChart];
        case 36: return [self configureColorfulDataLabelsStepLineChart];
        case 37: return [self configureColorfulGradientColorAndColorfulDataLabelsStepAreaChart];
        case 38: return [self disableSplineChartMarkerHoverEffect];
        case 39: return [self configureMaxAndMinDataLabelsForChart];
        case 40: return [self customVerticalXAxisCategoriesLabelsByHTMLBreakLineTag];
        case 41: return [self noMoreGroupingAndOverlapEachOtherColumnChart];
        case 42: return [self noMoreGroupingAndNestedColumnChart];
        case 43: return [self topRoundedCornersStackingColumnChart];
        case 44: return [self freeStyleRoundedCornersStackingColumnChart];
        case 45: return [self customColumnChartBorderStyleAndStatesHoverColor];
            
        case 46: return [self customLineChartWithColorfulMarkersAndLines];
        case 47: return [self customLineChartWithColorfulMarkersAndLines2];
        case 48: return [self drawLineChartWithPointsCoordinates];
        case 49: return [self configureSpecialStyleColumnForNegativeDataMixedPositiveData];
        case 50: return [self configureMultiLevelStopsArrGradientColorAreasplineMixedLineChart];
        case 51: return [self connectNullsForSingleAASeriesElement];
        case 52: return [self lineChartsWithLargeDifferencesInTheNumberOfDataInDifferentSeriesElement];
        case 53: return [self customAreasplineChartWithColorfulGradientColorZones];

        default:
            return nil;
    }
}

//https://github.com/AAChartModel/AAChartKit/issues/692
- (AAChartModel *)setUpColorfulBarChart {
    NSArray *colorsNameArr = @[
        @"red",
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
        @"black"
    ];
    
    NSArray *colorsArr = @[
        AAColor.redColor,
        AAColor.orangeColor,
        AAColor.yellowColor,
        AAColor.greenColor,
        AAColor.cyanColor,
        AAColor.blueColor,
        AAColor.purpleColor,
        AAColor.grayColor,
        AAColor.darkGrayColor,
        AAColor.lightGrayColor,
        AAColor.magentaColor,
        AAColor.brownColor,
        AAColor.blackColor,
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


//https://github.com/AAChartModel/AAChartKit/issues/692
- (AAChartModel *)setUpColorfulGradientColorChart {
    NSArray *gradientColorNamesArr = @[
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
    ];
    
    NSArray *gradientColorArr = @[
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
                   @3.9, @4.2, @5.7, @8.5, @11.9, @15.2, @17.0, @16.6, @14.2, @10.3, @6.6, @4.8,])
        .colorByPointSet(@true),//When using automatic point colors pulled from the options.colors collection, this option determines whether the chart should receive one color per series or one color per point. Default Value：false.
               ]);
}

//https://github.com/AAChartModel/AAChartKit/issues/1265
- (AAChartModel *)setUpDiscontinuousDataChart {
    return AAChartModel.new
    .chartTypeSet(AAChartTypeColumn)
    .dataLabelsEnabledSet(true)//是否显示值
    .tooltipEnabledSet(true)
    .seriesSet(@[
        AASeriesElement.new
        .nameSet(@"所有专业")
        .dataSet(@[@7.0, @6.9, @9.5, @14.5, @18.2, [NSNull null], [NSNull null], [NSNull null], [NSNull null], @21.5, @25.2, @26.5, @23.3, @18.3, @13.9, @9.6,])
        .colorSet((id)[AAGradientColor deepSeaColor])
               ]);
}

- (AAChartModel *)configureMixedLineChart {
    return AAChartModel.new
    //        .connectNullsSet(true)//设置折线是否断点重连
    .chartTypeSet(AAChartTypeLine)
    .subtitleSet(@"虚拟数据")
    .categoriesSet(@[
        @"Java", @"Swift", @"Python", @"Ruby", @"PHP", @"Go",
        @"C", @"C#", @"C++", @"Perl", @"R", @"MATLAB", @"SQL"
                   ])
    .yAxisTitleSet(@"摄氏度")
    .dataLabelsEnabledSet(true)
    .yAxisGridLineStyleSet([AALineStyle styleWithWidth:@0])
    .seriesSet(@[
        AASeriesElement.new
        .nameSet(@"本专业")
        .dataSet(@[@45, @88, @49, @43, @65, @56, @47, @28, @49, @44, @89, @55])
        .zoneAxisSet(@"x")
        .colorSet((id)AAGradientColor.freshPapayaColor)
        .lineWidthSet(@5)
        .zonesSet(@[
            AAZonesElement.new
            .valueSet(@3)
            .dashStyleSet(AAChartLineDashStyleTypeDash),
            AAZonesElement.new
            .valueSet(@8)
            .dashStyleSet(AAChartLineDashStyleTypeDot)
                  ]),
        AASeriesElement.new
        .nameSet(@"所有专业")
        .colorSet((id)AAGradientColor.pixieDustColor)
        .lineWidthSet(@5)
        .dataSet(@[[NSNull null], [NSNull null], @100, @109, @89, [NSNull null], [NSNull null], @120, [NSNull null], [NSNull null], [NSNull null], [NSNull null]])
               ]);
}

- (AAChartModel *)configureColorfulColumnChart {
    return AAChartModel.new
    .chartTypeSet(AAChartTypeColumn)
    .titleSet(@"Colorful Column Chart")
    .subtitleSet(@"single data array colorful column chart")
    .colorsThemeSet([AAEasyTool configureTheRandomColorArrayWithColorNumber:14])
    .seriesSet(@[
        AASeriesElement.new
        .nameSet(@"ElementOne")
        .dataSet(@[@211, @183, @157, @133, @111, @91, @73, @57, @43, @31, @21, @13, @7, @3])
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
        .dataSet(@[@211, @183, @157, @133, @111, @91, @73, @57, @43, @31, @21, @13, @7, @3])
        .colorSet((id)[AAGradientColor oceanBlueColor]),
        AASeriesElement.new
        .nameSet(@"2021")
        .dataSet(@[@111, @83, @187, @163, @151, @191, @173, @157, @143, @131, @121, @113, @97, @93])
        .colorSet((id)[AAGradientColor sanguineColor]),
               ]);
}

- (AAChartModel *)configureYAxisHaveAAZonesElementChart {
    NSArray *aaPlotLinesArr = @[
        AAPlotLinesElement.new
        .colorSet(AAColor.greenColor)//颜色值(16进制)
        .dashStyleSet(AAChartLineDashStyleTypeLongDashDotDot)//样式：Dash,Dot,Solid等,默认Solid
        .widthSet(@(1)) //标示线粗细
        .valueSet(@(10)) //所在位置
        .zIndexSet(@(1)) //层叠,标示线在图表中显示的层叠级别，值越大，显示越向前
        .labelSet(AALabel.new
                  .textSet(@"标示线1")
                  .styleSet(AAStyleColor(AAColor.greenColor)))
        ,
        AAPlotLinesElement.new
        .colorSet(AAColor.purpleColor)
        .dashStyleSet(AAChartLineDashStyleTypeLongDashDotDot)
        .widthSet(@(1))
        .valueSet(@(20))
        .labelSet(AALabel.new
                  .textSet(@"标示线2")
                  .styleSet(AAStyleColor(AAColor.purpleColor)))
    ];
    
    return AAChartModel.new
    .chartTypeSet(AAChartTypeArea)
    .markerSymbolSet(AAChartSymbolTypeCircle)
    .titleSet(@"带有数据阈值标志线的区域填充图")
    .markerRadiusSet(@6)//设置折线连接点宽度为0,即是隐藏连接点
    .subtitleSet(@"横屏查看效果更佳")
    .yAxisGridLineStyleSet([AALineStyle styleWithWidth:@0.5])
    .markerSymbolStyleSet(AAChartSymbolStyleTypeInnerBlank)
    .dataLabelsEnabledSet(true)
    .yAxisPlotLinesSet(aaPlotLinesArr)
    .seriesSet(@[
        AASeriesElement.new
        .nameSet(@"2017")
        .dataSet(@[@7.0, @6.9, @9.5, @14.5, @18.2, @21.5, @25.2, @26.5, @23.3, @18.3, @13.9, @9.6,])
        .lineWidthSet(@5)
        .zonesSet(@[
            AAZonesElement.new
            .valueSet(@10)
            .colorSet(@"#EA007B"),
            AAZonesElement.new
            .valueSet(@20)
            .colorSet(@"#FDC20A"),
            AAZonesElement.new
            .colorSet(@"#00BFFF"),
                  ]),
               ]);
}

- (AAChartModel *)configureXAxisHaveAAZonesElementChart {
    AAChartModel *aaChartModel = [self configureYAxisHaveAAZonesElementChart];
    aaChartModel.chartTypeSet(AAChartTypeAreaspline)
    .seriesSet(@[
        AASeriesElement.new
        .nameSet(@"2017")
        .dataSet(@[@7.0, @6.9, @2.5, @14.5, @18.2, @21.5, @5.2, @26.5, @23.3, @45.3, @13.9, @9.6])
        .lineWidthSet(@5)
        .zoneAxisSet(@"x")
        .zonesSet(@[
            AAZonesElement.new
            .valueSet(@5)
            .colorSet(@"#EA007B"),
            AAZonesElement.new
            .valueSet(@8)
            .colorSet(@"#FDC20A"),
            AAZonesElement.new
            .colorSet(@"#00BFFF"),
                  ]),
               ]);
    return aaChartModel;
}

- (AAChartModel *)configureWithMinusNumberChart {
    return AAChartModel.new
    .chartTypeSet(AAChartTypeArea)
    .titleSet(@"带有负数的区域填充图")
    .markerRadiusSet(@0)//设置折线连接点宽度为0,即是隐藏连接点
    .subtitleSet(@"横屏查看效果更佳")
    .yAxisGridLineStyleSet([AALineStyle styleWithWidth:@0])
    .categoriesSet(@[
        @"Java", @"Swift", @"Python", @"Ruby", @"PHP", @"Go",
        @"C", @"C#", @"C++", @"Perl", @"R", @"MATLAB", @"SQL"
                   ])
    .colorsThemeSet(@[@"#49C1B6", @"#FDC20A", @"#F78320", @"#068E81", @"#EA007B"])
    .seriesSet(@[
        AASeriesElement.new
        .nameSet(@"2017")
        .dataSet(@[@0, @-7.5, @-1.0, @3.7, @0, @-3, @8, @0,@-3.6, @4, @-2, @0]),
        AASeriesElement.new
        .nameSet(@"2018")
        .dataSet(@[@0, @-2.2, @2, @-2.2, @0, @-1.5, @0, @2.4, @-1, @3, @-1, @0]),
        AASeriesElement.new
        .nameSet(@"2019")
        .dataSet(@[@0, @2.3, @0, @1.2, @-1, @3, @0, @-3.3, @0, @2, @-0.3, @0]),
        AASeriesElement.new
        .nameSet(@"2020")
        .dataSet(@[@0, @10, @0.13, @2, @0, @2, @0, @3.7, @0, @1, @-3, @0]),
        AASeriesElement.new
        .nameSet(@"2020")
        .dataSet(@[@0, @-4.5, @-0.9, @5.5, @-1.9, @1.3, @-2.8, @0, @-1.7, @0, @3, @0,]),
               ]);
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
        .stepSet(AAChartAlignTypeRight), //折线连接点靠右👉
        AASeriesElement.new
        .nameSet(@"New York")
        .dataSet(@[@220, @282, @201, @234, @290, @430, @410])
        .stepSet(AAChartAlignTypeCenter),//折线连接点居中
        AASeriesElement.new
        .nameSet(@"Tokyo")
        .dataSet(@[@120, @132, @101, @134, @90, @230, @210])
        .stepSet(AAChartAlignTypeLeft),//折线连接点靠左边👈
               ]);
}

- (AAChartModel *)configureStepAreaChart {
    return AAChartModel.new
    .chartTypeSet(AAChartTypeArea)//图形类型
    .animationTypeSet(AAChartAnimationBounce)//图形渲染动画类型为"bounce"
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
               ]);
}

- (AAChartModel *)configureNightingaleRoseChart {
    return AAChartModel.new
    .titleSet(@"南丁格尔玫瑰图")
    .subtitleSet(@"极地图中的一种")
    .yAxisTitleSet(@"cm")
    .chartTypeSet(AAChartTypeColumn)
    .xAxisVisibleSet(true)//是否显示最外一层圆环
    .yAxisVisibleSet(false)//是否显示中间的多个圆环
    .legendEnabledSet(false)//隐藏图例(底部可点按的小圆点)
    .categoriesSet(@[
        @"一月", @"二月", @"三月", @"四月", @"五月", @"六月",
        @"七月", @"八月", @"九月", @"十月", @"十一月", @"十二月"
                   ])
    .dataLabelsEnabledSet(true)
    .polarSet(true)//极地化图形
    .seriesSet(@[
        AASeriesElement.new
        .nameSet(@"东京")
        .dataSet(@[@7.0, @6.9, @9.5, @9.6, @13.9, @14.5, @18.3, @18.2, @21.5, @25.2, @26.5, @23.3]),
               ]);
}

- (AAChartModel*)configureCustomSingleDataLabelsElementChart {
    AADataElement *aaDataElement = AADataElement.new
    .ySet(@1.25)
    .dataLabelsSet(AADataLabels.new
                   .enabledSet(true)
                   .verticalAlignSet(AAChartVerticalAlignTypeMiddle)
                   .formatSet(@"{y} 美元🇺🇸💲")
                   .xSet(@3)
                   .styleSet(AAStyleColorSizeWeight(AAColor.redColor, 20, AAChartFontWeightTypeBold))
                   );
    
    return AAChartModel.new
    .titleSet(@"单独自定义某个指定数据元素的DataLabel")
    .colorsThemeSet(@[AAGradientColor.mysticMauveColor])
    .seriesSet(@[
        AASeriesElement.new
        .nameSet(@"货币")
        .dataSet(@[@0.38, @0.31, @0.32, @0.32, @0.64, @0.66, @0.86, aaDataElement, @0.47, @0.52, @0.75, @0.52, @0.56, @0.54, @0.60, @0.46, @0.63, @0.54, @0.51, @0.58, @0.64, @0.60, @0.45, @0.36, @0.67]),
               ]);
}

- (AAChartModel *)configureChartWithShadowStyle {
    return AAChartModel.new
    .yAxisVisibleSet(false)
    .chartTypeSet(AAChartTypeSpline)
    .legendEnabledSet(false)//隐藏图例(底部可点按的小圆点)
    .categoriesSet(@[
        @"一月", @"二月", @"三月", @"四月", @"五月", @"六月",
        @"七月", @"八月", @"九月", @"十月", @"十一月", @"十二月"
                   ])
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
                   .colorSet(AAColor.redColor)),
               ]);
}

- (AAChartModel *)configureColorfulGradientAreaChart {
    NSArray *stopsArr = @[
        @[@0.0, @"#febc0f"],//颜色字符串设置支持十六进制类型和 rgba 类型
        @[@0.4, @"#FF14d4"],
        @[@1.0, @"#0bf8f5"]
    ];
    NSDictionary *gradientColorDic1 =
    [AAGradientColor gradientColorWithDirection:AALinearGradientDirectionToRight
                                     stopsArray:stopsArr];
    
    return AAChartModel.new
    .chartTypeSet(AAChartTypeAreaspline)
    .categoriesSet(@[
        @"一月", @"二月", @"三月", @"四月", @"五月", @"六月",
        @"七月", @"八月", @"九月", @"十月", @"十一月", @"十二月"
                   ])
    .backgroundColorSet(AAColor.whiteColor)
    .markerRadiusSet(@0)
    .yAxisLineWidthSet(@0)
    .yAxisGridLineStyleSet([AALineStyle styleWithWidth:@0])
    .legendEnabledSet(false)
    .seriesSet(@[
        AASeriesElement.new
        .nameSet(@"Tokyo Hot")
        .lineWidthSet(@5)
        .colorSet(AAColor.redColor)
        .fillColorSet((id)gradientColorDic1)
        .dataSet(@[@7.0, @6.9, @2.5, @14.5, @18.2, @21.5, @5.2, @26.5, @23.3, @45.3, @13.9, @9.6]),
               ]);
}

//https://github.com/AAChartModel/AAChartKit/issues/751#issuecomment-543019799
- (AAChartModel *)configureColorfulGradientSplineChart {
    NSArray *stopsArr = @[
        @[@0.00, @"#febc0f"],//颜色字符串设置支持十六进制类型和 rgba 类型
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
    .categoriesSet(@[
        @"一月", @"二月", @"三月", @"四月", @"五月", @"六月",
        @"七月", @"八月", @"九月", @"十月", @"十一月", @"十二月"
                   ])
    .markerRadiusSet(@0)
    .yAxisLineWidthSet(@0)
    .yAxisGridLineStyleSet([AALineStyle styleWithWidth:@0])
    .legendEnabledSet(false)
    .seriesSet(@[
        AASeriesElement.new
        .nameSet(@"Tokyo Hot")
        .lineWidthSet(@13)
        .colorSet((id)gradientColorDic1)
        .dataSet(@[@7.0, @6.9, @2.5, @14.5, @18.2, @21.5, @5.2, @26.5, @23.3, @45.3, @13.9, @9.6]),
               ]);
}


- (AAChartModel *)configureGradientColorAreasplineChart {
    NSDictionary *gradientColorDic1 =
    [AAGradientColor gradientColorWithDirection:AALinearGradientDirectionToBottom
                               startColorString:AARgbaColor(255, 20, 147, 1.0)//热情的粉红, alpha 透明度 1
                                 endColorString:AARgbaColor(255, 20, 147, 0.3)];//热情的粉红, alpha 透明度 0.3
    
    return AAChartModel.new
    .chartTypeSet(AAChartTypeAreaspline)
    .categoriesSet(@[
        @"一月", @"二月", @"三月", @"四月", @"五月", @"六月",
        @"七月", @"八月", @"九月", @"十月", @"十一月", @"十二月"
                   ])
    .markerRadiusSet(@8.0)//marker点半径为8个像素
    .markerSymbolStyleSet(AAChartSymbolStyleTypeInnerBlank)//marker点为空心效果
    .markerSymbolSet(AAChartSymbolTypeCircle)//marker点为圆形点○
    .yAxisLineWidthSet(@0)
    .yAxisGridLineStyleSet([AALineStyle styleWithWidth:@0])
    .legendEnabledSet(false)
    .seriesSet(@[
        AASeriesElement.new
        .nameSet(@"Tokyo Hot")
        .lineWidthSet(@5.0)
        .colorSet(AARgbaColor(220, 20, 60, 1.0))//猩红色, alpha 透明度 1
        .fillColorSet((id)gradientColorDic1)
        .dataSet(@[@7.0, @6.9, @2.5, @14.5, @18.2, @21.5, @5.2, @26.5, @23.3, @45.3, @13.9, @9.6]),
               ]);
}

//https://github.com/AAChartModel/AAChartKit/issues/695
- (AAChartModel *)configureSpecialStyleMarkerOfSingleDataElementChart {
    NSArray *stopsArr = @[
        @[@0.00, @"#febc0f"],//颜色字符串设置支持十六进制类型和 rgba 类型
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
               .fillColorSet(AAColor.whiteColor)//点的填充色(用来设置折线连接点的填充色)
               .lineWidthSet(@5)//外沿线的宽度(用来设置折线连接点的轮廓描边的宽度)
               //外沿线的颜色(用来设置折线连接点的轮廓描边颜色，当值为空字符串时，默认取数据点或数据列的颜色)
               .lineColorSet(AAColor.redColor)
               )
    .ySet(@26.5);
    
    return AAChartModel.new
    .chartTypeSet(AAChartTypeSpline)
    .backgroundColorSet(@"#4b2b7f")
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
    .dataLabelsEnabledSet(false)//是否显示值
    .tooltipEnabledSet(false)
    .xAxisVisibleSet(false)
    .yAxisVisibleSet(false)
    .seriesSet(@[
        AASeriesElement.new
        .nameSet(@"Virtual Data")
        .dataSet(@[@7.0, @6.9, @2.5, @14.5, @18.2, singleSpecialData, @5.2, @26.5, @23.3, @26.5, @13.9, @9.6])
        .colorSet((id)AAGradientColor.oceanBlueColor)
               ]);
}

- (AAChartModel *)configureAreaChartThreshold {
    NSDictionary *gradientColorDic1 =
    [AAGradientColor gradientColorWithDirection:AALinearGradientDirectionToBottom
                               startColorString:AARgbaColor(30, 144, 255, 1.0)//DodgerBlue, alpha 透明度 1
                                 endColorString:AARgbaColor(30, 144, 255, 0.1)];//DodgerBlue, alpha 透明度 0.1
    return AAChartModel.new
    .chartTypeSet(AAChartTypeArea)
    .yAxisGridLineStyleSet([AALineStyle styleWithWidth:@0])
    .categoriesSet(@[
        @"Jan", @"Feb", @"Mar", @"Apr", @"May", @"Jun",
        @"July", @"Aug", @"Spe", @"Oct", @"Nov", @"Dec"
                   ])
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
        .colorSet(AARgbaColor(30, 144, 255, 1.0))
        .fillColorSet((id)gradientColorDic1)
               ]);
}

//refer to online sample https://jshare.com.cn/github/highcharts/highcharts/tree/master/samples/highcharts/plotoptions/series-marker-symbol/
- (AAChartModel *)customScatterChartMarkerSymbolContent {
    AASeriesElement *element1 = AASeriesElement.new
    .nameSet(@"Predefined symbol")
    .dataSet(@[@0.45, @0.43, @0.50, @0.55, @0.58, @0.62, @0.83, @0.39, @0.56, @0.67, @0.50, @0.34, @0.50, @0.67, @0.58, @0.29, @0.46, @0.23, @0.47, @0.46, @0.38, @0.56, @0.48, @0.36])
    .markerSet(AAMarker.new
               .symbolSet(predefinedSymbol1));
    
    AASeriesElement *element2 = AASeriesElement.new
    .nameSet(@"Image symbol")
    .dataSet(@[@0.38, @0.31, @0.32, @0.32, @0.64, @0.66, @0.86, @0.47, @0.52, @0.75, @0.52, @0.56, @0.54, @0.60, @0.46, @0.63, @0.54, @0.51, @0.58, @0.64, @0.60, @0.45, @0.36, @0.67])
    .markerSet(AAMarker.new
               .symbolSet(imageSymbol));
    
    AASeriesElement *element3 = AASeriesElement.new
    .nameSet(@"Base64 symbol (*)")
    .dataSet(@[@0.46, @0.32, @0.53, @0.58, @0.86, @0.68, @0.85, @0.73, @0.69, @0.71, @0.91, @0.74, @0.60, @0.50, @0.39, @0.67, @0.55, @0.49, @0.65, @0.45, @0.64, @0.47, @0.63, @0.64])
    .markerSet(AAMarker.new
               .symbolSet(base64Symbol));
    
    AASeriesElement *element4 = AASeriesElement.new
    .nameSet(@"Custom symbol")
    .dataSet(@[@0.60, @0.51, @0.52, @0.53, @0.64, @0.84, @0.65, @0.68, @0.63, @0.47, @0.72, @0.60, @0.65, @0.74, @0.66, @0.65, @0.71, @0.59, @0.65, @0.77, @0.52, @0.53, @0.58, @0.53])
    .markerSet(AAMarker.new
               .symbolSet(predefinedSymbol2));
    
    return AAChartModel.new
    .chartTypeSet(AAChartTypeScatter)
    .yAxisMaxSet(@3.5)
    .yAxisGridLineStyleSet([AALineStyle styleWithWidth:@0])
    .stackingSet(AAChartStackingTypeNormal)
    .markerRadiusSet(@8)
    .seriesSet(@[element1, element2, element3, element4]);
}

//refer to online sample https://jshare.com.cn/github/highcharts/highcharts/tree/master/samples/highcharts/plotoptions/series-marker-symbol/
- (AAChartModel *)customLineChartMarkerSymbolContent {
    AAChartModel *aaChartModel = [self customScatterChartMarkerSymbolContent];
    aaChartModel.chartType = AAChartTypeLine;
    return aaChartModel;
}

//五边形雷达图
- (AAChartModel *)configurePentagonRadarChart {
    return AAChartModel.new
    .chartTypeSet(AAChartTypeArea)
    .yAxisMaxSet(@15.0)
    .yAxisGridLineStyleSet([AALineStyle styleWithWidth:@0])
    .xAxisVisibleSet(false)
    .markerRadiusSet(@0)
    .polarSet(true)//是否极化图形
    .seriesSet(@[
        AASeriesElement.new
        .dataSet(@[@15.0, @15.0, @15.0, @15.0, @15.0,]),
        AASeriesElement.new
        .dataSet(@[@9.0, @9.0, @9.0, @9.0, @9.0,]),
        AASeriesElement.new
        .dataSet(@[@6.0, @6.0, @6.0, @6.0, @6.0,]),
        AASeriesElement.new
        .dataSet(@[@3.0, @3.0, @3.0, @3.0, @3.0,]),
               ]);
}

//六边形雷达图
- (AAChartModel *)configureHexagonRadarChart {
    return AAChartModel.new
    .chartTypeSet(AAChartTypeArea)
    .yAxisMaxSet(@15.0)
    .yAxisGridLineStyleSet([AALineStyle styleWithWidth:@0])
    .xAxisVisibleSet(false)
    .markerRadiusSet(@0)
    .polarSet(true)//是否极化图形
    .seriesSet(@[
        AASeriesElement.new
        .dataSet(@[@15.0, @15.0, @15.0, @15.0, @15.0, @15.0,]),
        AASeriesElement.new
        .dataSet(@[@9.0, @9.0, @9.0, @9.0, @9.0, @9.0,]),
        AASeriesElement.new
        .dataSet(@[@6.0, @6.0, @6.0, @6.0, @6.0, @6.0,]),
        AASeriesElement.new
        .dataSet(@[@3.0, @3.0, @3.0, @3.0, @3.0, @3.0,]),
               ]);
}

- (AAChartModel *)adjustYAxisMaxAndMinValues {
    NSArray *categoriesArr = @[
        @"孤岛危机",
        @"使命召唤",
        @"荣誉勋章",
        @"狙击精英",
        @"神秘海域",
        @"最后生还者",
        @"巫师3狂猎",
        @"对马之魂",
        @"蝙蝠侠阿甘骑士",
        @"地狱边境",
        @"闪客",
        @"忍者之印"
    ];
    
    return AAChartModel.new
    .chartTypeSet(AAChartTypeAreaspline)
    .legendEnabledSet(false)
    .yAxisVisibleSet(true)
    .markerRadiusSet(@6)
    .markerSymbolStyleSet(AAChartSymbolStyleTypeInnerBlank)
    .zoomTypeSet(AAChartZoomTypeXY)
    .tooltipValueSuffixSet(@"kg")
    .categoriesSet(categoriesArr)
    .yAxisMinSet(@2.0)
    .yAxisMaxSet(@45.4)
    .xAxisTickIntervalSet(@2)
    .seriesSet(@[
        AASeriesElement.new
        .nameSet(@"体重")
        .colorSet(@"#2494F3")
        .dataSet(@[@7.0, @6.9, @2.5, @14.5, @18.2, @21.5, @5.2, @26.5, @23.3, @45.3, @13.9, @9.6])
               ]);
}


//https://github.com/AAChartModel/AAChartKit/issues/747
- (AAChartModel *)customSpecialStyleDataLabelOfSingleDataElementChart {
    NSDictionary *gradientColorDic1 =
    [AAGradientColor gradientColorWithDirection:AALinearGradientDirectionToTop
                               startColorString:AARgbaColor(255, 215, 0, 0.1) // gold color, alpha: 0.1
                                 endColorString:AARgbaColor(255, 215, 0, 0.6)]; // gold color, alpha: 0.6
    
    NSString *formatStr = [NSString stringWithFormat:@"%@%@%@",
                           @"<img src=""https://www.highcharts.com/samples/graphics/sun.png"">",
                           @"<span style=""color:#FFFFFF;font-weight:thin;font-size:25px"">{y}</span>",
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
                   .cropSet(false))
    .ySet(@26.5);
    
    return AAChartModel.new
    .chartTypeSet(AAChartTypeAreaspline)
    .backgroundColorSet(@"#4b2b7f")
    .dataLabelsEnabledSet(false)//是否显示值
    .tooltipEnabledSet(true)
    .markerRadiusSet(@0)
    .xAxisVisibleSet(false)
    .yAxisVisibleSet(false)
    .seriesSet(@[
        AASeriesElement.new
        .nameSet(@"Virtual Data")
        .lineWidthSet(@6)
        .colorSet(AARgbaColor(255, 215, 0, 1.0))
        .fillColorSet((id)gradientColorDic1)// gold color, alpha: 1.0
        .dataSet(@[@7.0, @6.9, @2.5, @14.5, @18.2, singleSpecialData, @5.2, @26.5, @23.3, @45.3, @13.9, @9.6])
               ]);
}

//https://github.com/AAChartModel/AAChartKit/issues/838
- (AAChartModel *)customBarChartHoverColorAndSelectColor {
    return AAChartModel.new
    .chartTypeSet(AAChartTypeBar)
    .titleSet(@"Custom Bar Chart Hover Color And Select Color")
    .yAxisReversedSet(true)
    .xAxisReversedSet(true)
    .seriesSet(@[
        AASeriesElement.new
        .nameSet(@"ElementOne")
        .dataSet(@[@211, @183, @157, @133, @111, @91, @73, @57, @43, @31, @21, @13, @7, @3])
        .allowPointSelectSet(YES)
        .statesSet(AAStates.new
                   .hoverSet(AAHover.new
                             .colorSet(AAColor.orangeColor))
                   .selectSet(AASelect.new
                              .colorSet(AAColor.redColor)))
               ]);
}

- (AAChartModel *)customChartHoverAndSelectHaloStyle {
    return AAChartModel.new
    .chartTypeSet(AAChartTypeLine)
    .titleSet(@"Custom Chart Hover And Select Halo Style")
    .colorsThemeSet(@[AAColor.redColor])
    .yAxisReversedSet(true)
    .xAxisReversedSet(true)
    .markerRadiusSet(@20)
    .seriesSet(@[
        AASeriesElement.new
        .nameSet(@"ElementOne")
        .dataSet(@[@211, @183, @157, @133, @111, @91, @73, @57, @43, @31, @21, @13, @7, @3])
        .allowPointSelectSet(YES)
        .statesSet(AAStates.new
                   .hoverSet(AAHover.new
                             .haloSet(AAHalo.new
                                      .sizeSet(@130)
                                      .opacitySet(@0.8)
                                      .attributesSet(AASVGAttributes.new
                                                     .strokeWidthSet(@50)
                                                     .fillSet(@"#00BFFF")
                                                     .strokeSet(@"#00FA9A"))))
                   .selectSet(AASelect.new
                              .haloSet(AAHalo.new
                                       .sizeSet(@130)
                                       .opacitySet(@1.0)
                                       .attributesSet(AASVGAttributes.new
                                                      .strokeWidthSet(@150)
                                                      .fillSet(AARgbaColor(138, 43, 226, 1.0))
                                                      .strokeSet(AARgbaColor(30, 144, 255, 1.0))))))
               ]);
}

//https://github.com/AAChartModel/AAChartKit/issues/1345
- (AAChartModel *)customSplineChartMarkerStatesHoverStyle {
    return AAChartModel.new
    .chartTypeSet(AAChartTypeAreaspline)
    .titleSet(@"Custom Spline Chart Marker States Hover Style")
    .categoriesSet(@[
        @"一月", @"二月", @"三月", @"四月", @"五月", @"六月",
        @"七月", @"八月", @"九月", @"十月", @"十一月", @"十二月"
                   ])
    .markerRadiusSet(@8.0)//marker点半径为8个像素
    .yAxisLineWidthSet(@0)
    .yAxisGridLineStyleSet([AALineStyle styleWithWidth:@0])
    .legendEnabledSet(false)
    .seriesSet(@[
        AASeriesElement.new
        .nameSet(@"Tokyo Hot")
        .lineWidthSet(@5.0)
        .colorSet(AARgbaColor(220, 20, 60, 1.0))//猩红色, alpha 透明度 1
        .markerSet(AAMarker.new
                   .statesSet(AAMarkerStates.new
                              .hoverSet(AAMarkerHover.new
                                        .fillColorSet(AAColor.whiteColor)
                                        .radiusSet(@40)
                                        .lineColorSet(AAColor.greenColor)
                                        .lineWidthSet(@20))))
        .dataSet(@[@7.0, @6.9, @2.5, @14.5, @18.2, @21.5, @5.2, @26.5, @23.3, @45.3, @13.9, @9.6]),
               ]);
}

//Issue: https://github.com/AAChartModel/AAChartKit/issues/948
- (AAChartModel *)splineChartHoverLineWithNoChangeAndCustomMarkerStatesHoverStyle {
    return AAChartModel.new
    .chartTypeSet(AAChartTypeSpline)
    .titleSet(@"Spline Chart Hover Line Width No Change && Custom Marker States Hover Style")
    .categoriesSet(@[
        @"一月", @"二月", @"三月", @"四月", @"五月", @"六月",
        @"七月", @"八月", @"九月", @"十月", @"十一月", @"十二月"
                   ])
    .markerRadiusSet(@8.0)//marker点半径为8个像素
    .yAxisLineWidthSet(@0)
    .yAxisGridLineStyleSet([AALineStyle styleWithWidth:@0])
    .legendEnabledSet(false)
    .markerSymbolStyleSet(AAChartSymbolStyleTypeInnerBlank)
    .seriesSet(@[
        AASeriesElement.new
        .nameSet(@"Tokyo Hot")
        .lineWidthSet(@5.0)
        .colorSet(AAColor.redColor)
        .statesSet(AAStates.new
                   .hoverSet(AAHover.new
                             .enabledSet(true)
                             //手指盘旋或选中图表时,禁止线条变粗
                             .lineWidthPlusSet(@0)))
        .markerSet(AAMarker.new
                   .statesSet(AAMarkerStates.new
                              .hoverSet(AAMarkerHover.new
                                        .fillColorSet(AAColor.redColor)//设置手指选中点的颜色为红色
                                        .radiusSet(@40))))
        .dataSet(@[@7.0, @6.9, @2.5, @14.5, @18.2, @21.5, @5.2, @26.5, @23.3, @45.3, @13.9, @9.6]),
               ]);
}

//Issue: https://github.com/AAChartModel/AAChartKit/issues/827
- (AAChartModel *)customNormalStackingChartDataLabelsContentAndStyle {
    NSArray *categories = @[
        @"孤岛危机",
        @"使命召唤",
        @"荣誉勋章",
        @"狙击精英",
        @"神秘海域",
        @"最后生还者",
        @"巫师3狂猎",
        @"对马之魂",
        @"死亡搁浅",
        @"地狱边境",
        @"闪客",
        @"忍者之印"
    ];
    
    NSArray *colorsTheme = @[
        @"#fe117c",
        @"#ffc069",
        @"#06caf4",
        @"#7dffc0"
    ];
    
    AASeriesElement *element1 = AASeriesElement.new
    .nameSet(@"2017")
    .dataLabelsSet(AADataLabels.new
                   .ySet(@-10)
                   .formatSet(@"{total} mm")
                   .colorSet(AAColor.redColor)
                   .shapeSet(@"callout")
                   .backgroundColorSet(AAColor.whiteColor)
                   .borderColorSet(AAColor.redColor)
                   .borderRadiusSet(@1)
                   .borderWidthSet(@1))
    .dataSet(@[@7.0, @6.9, @9.5, @14.5, @18.2, @21.5, @25.2, @26.5, @23.3, @18.3, @13.9, @9.6]);
    
    
    AASeriesElement *element2 = AASeriesElement.new
    .nameSet(@"2018")
    .dataSet(@[@0.2, @0.8, @5.7, @11.3, @17.0, @22.0, @24.8, @24.1, @20.1, @14.1, @8.6, @2.5]);
    
    AASeriesElement *element3 = AASeriesElement.new
    .nameSet(@"2019")
    .dataSet(@[@0.9, @0.6, @3.5, @8.4, @13.5, @17.0, @18.6, @17.9, @14.3, @9.0, @3.9, @1.0]);
    
    AASeriesElement *element4 = AASeriesElement.new
    .nameSet(@"2020")
    .dataSet(@[@3.9, @4.2, @5.7, @8.5, @11.9, @15.2, @17.0, @16.6, @14.2, @10.3, @6.6, @4.8]);
    
    NSArray *series = @[element1, element2, element3, element4];
    
    return AAChartModel.new
    .chartTypeSet(AAChartTypeColumn)
    .stackingSet(AAChartStackingTypeNormal)
    .yAxisGridLineStyleSet([AALineStyle styleWithWidth:@0])
    .markerRadiusSet(@0)
    .categoriesSet(categories)
    .colorsThemeSet(colorsTheme)
    .seriesSet(series);
}

//Issue: https://github.com/AAChartModel/AAChartKit-Swift/issues/190
//API Doc: https://api.highcharts.com.cn/highcharts#series%3Cpyramid%3E.reversed
- (AAChartModel *)upsideDownPyramidChart {
    return AAChartModel.new
    .chartTypeSet(AAChartTypePyramid)
    .yAxisTitleSet(@"摄氏度")
    .invertedSet(true)
    .legendEnabledSet(true)
    .seriesSet(@[
        AASeriesElement.new
        .nameSet(@"2020")
        .reversedSet(@true)
        .dataSet(@[
            @[@"Swift",       @15654],
            @[@"Objective-C",  @4064],
            @[@"JavaScript",   @1987],
            @[@"GO",            @976],
            @[@"Python",        @846]
        ])
    ]);
}

//Issue: https://github.com/AAChartModel/AAChartKit/issues/888
- (AAChartModel *)doubleLayerPieChart {
    return AAChartModel.new
    .chartTypeSet(AAChartTypePie)
    .titleSet(@"浏览器市场占比历史对比")
    .subtitleSet(@"无任何可靠依据的虚拟数据")
    .dataLabelsEnabledSet(true)//是否直接显示扇形图数据
    .yAxisTitleSet(@"摄氏度")
    .seriesSet(@[
        AASeriesElement.new
        .nameSet(@"Past")
        .sizeSet((id)@"40%")//尺寸大小
        .innerSizeSet(@"30%")//内部圆环半径大小占比
        .borderWidthSet(@0)//描边的宽度
        .allowPointSelectSet(false)//是否允许在点击数据点标记(扇形图点击选中的块发生位移)
        .dataSet(@[
            @[@"Firefox Past",   @3336.2],
            @[@"Chrome Past",      @26.8],
            @[@"Safari Past",      @88.5],
            @[@"Opera Past",       @46.0],
            @[@"Others Past",     @223.0],
                 ]),
        
        AASeriesElement.new
        .nameSet(@"Now")
        .sizeSet((id)@"80%")//尺寸大小
        .innerSizeSet(@"70%")//内部圆环半径大小占比
        .borderWidthSet(@0)//描边的宽度
        .allowPointSelectSet(false)//是否允许在点击数据点标记(扇形图点击选中的块发生位移)
        .dataSet(@[
            @[@"Firefox Now",    @336.2],
            @[@"Chrome Now",    @6926.8],
            @[@"Safari Now",     @388.5],
            @[@"Opera Now",      @446.0],
            @[@"Others Now",     @223.0],
                 ])
               ]);
}

//https://github.com/AAChartModel/AAChartKit/issues/1234
- (AAChartModel *)doubleLayerDoubleColorsPieChart {
    return AAChartModel.new
    .chartTypeSet(AAChartTypePie)
    .titleSet(@"浏览器市场占比历史对比")
    .subtitleSet(@"无任何可靠依据的虚拟数据")
    .dataLabelsEnabledSet(false)//是否直接显示扇形图数据
    .yAxisTitleSet(@"摄氏度")
    .legendEnabledSet(false)
    .seriesSet(@[
        AASeriesElement.new
        .nameSet(@"Past")
        .colorsSet(@[
            AARgbaColor(255, 0, 0, 1.0),
            AARgbaColor(255, 0, 0, 0.8),
            AARgbaColor(255, 0, 0, 0.6),
            AARgbaColor(255, 0, 0, 0.4),
            AARgbaColor(255, 0, 0, 0.2),
                   ])
        .dataLabelsSet(AADataLabels.new
                       .enabledSet(false))
        .sizeSet((id)@"25%")//尺寸大小
        .innerSizeSet(@"20%")//内部圆环半径大小占比
        .borderWidthSet(@0)//描边的宽度
        .allowPointSelectSet(false)//是否允许在点击数据点标记(扇形图点击选中的块发生位移)
        .dataSet(@[
            @[@"Firefox Past",    @336.2],
            @[@"Chrome Past",     @126.8],
            @[@"Safari Past",     @188.5],
            @[@"Opera Past",      @146.0],
            @[@"Others Past",     @223.0],
                 ]),
        AASeriesElement.new
        .nameSet(@"Now")
        .colorsSet(@[
            AARgbaColor(30, 144, 255, 1.0),
            AARgbaColor(30, 144, 255, 0.8),
            AARgbaColor(30, 144, 255, 0.6),
            AARgbaColor(30, 144, 255, 0.4),
            AARgbaColor(30, 144, 255, 0.2),
                   ])
        .dataLabelsSet(AADataLabels.new
                       .enabledSet(true)
                       .formatSet(@"<b>{point.name}</b>: {point.percentage:.1f} %")
                       .alignToSet(@"plotEdges")
                       .connectorShapeSet(@"crookedLine")
                       .crookDistanceSet(@"90%")
                       .styleSet(AAStyleColor(AARgbaColor(30, 144, 255, 1.0))))
        .sizeSet((id)@"80%")//尺寸大小
        .innerSizeSet(@"45%")//内部圆环半径大小占比
        .borderWidthSet(@0)//描边的宽度
        .allowPointSelectSet(false)//是否允许在点击数据点标记(扇形图点击选中的块发生位移)
        .dataSet(@[
            @[@"Firefox Now",    @926.8],
            @[@"Chrome Now",     @336.2],
            @[@"Safari Now",     @388.5],
            @[@"Opera Now",      @446.0],
            @[@"Others Now",     @223.0],
                 ])
               ]);
}


//GitHub issue https://github.com/AAChartModel/AAChartKit/issues/903
- (AAChartModel *)disableSomeOfLinesMouseTrackingEffect {
   return AAChartModel.new
    .chartTypeSet(AAChartTypeLine)//图表类型
    .tooltipValueSuffixSet(@"万元")//设置浮动提示框单位后缀
    .yAxisTitleSet(@"万元")//设置 Y 轴标题
    .categoriesSet(@[
        @"一月", @"二月", @"三月", @"四月", @"五月", @"六月",
        @"七月", @"八月", @"九月", @"十月", @"十一月", @"十二月"
                   ])
    .seriesSet(@[
        AASeriesElement.new
        .nameSet(@"2017")
        .dataSet(@[@7.0, @6.9, @9.5, @14.5, @18.2, @21.5, @25.2, @26.5, @23.3, @18.3, @13.9, @9.6]),
        AASeriesElement.new
        .nameSet(@"2018")
        .enableMouseTrackingSet(@false)
        .dataSet(@[@0.2, @0.8, @5.7, @11.3, @17.0, @22.0, @24.8, @24.1, @20.1, @14.1, @8.6, @2.5]),
        AASeriesElement.new
        .nameSet(@"2019")
        .enableMouseTrackingSet(@false)
        .dataSet(@[@0.9, @0.6, @3.5, @8.4, @13.5, @17.0, @18.6, @17.9, @14.3, @9.0, @3.9, @1.0]),
        AASeriesElement.new
        .nameSet(@"2020")
        .enableMouseTrackingSet(@false)
        .dataSet(@[@3.9, @4.2, @5.7, @8.5, @11.9, @15.2, @17.0, @16.6, @14.2, @10.3, @6.6, @4.8]),
               ]);
}

// GitHub issue https://github.com/AAChartModel/AAChartKit/issues/904
- (AAChartModel *)configureColorfulShadowSplineChart {
    return AAChartModel.new
    .chartTypeSet(AAChartTypeSpline)
    .yAxisVisibleSet(false)
    .stackingSet(AAChartStackingTypeNormal)
    .colorsThemeSet(@[@"#1e90ff", @"#ef476f", @"#ffd066", @"#04d69f"])
    .markerSymbolSet(AAChartSymbolTypeCircle)
    .markerRadiusSet(@8.0)
    .markerSymbolStyleSet(AAChartSymbolStyleTypeBorderBlank)
    .seriesSet(@[
        AASeriesElement.new
        .nameSet(@"2017")
        .lineWidthSet(@5)
        .dataSet(@[@0.45, @0.43, @0.50, @0.55, @0.58, @0.62, @0.83, @0.39, @0.56, @0.67, @0.50, @0.34, @0.50, @0.67, @0.58, @0.29, @0.46, @0.23, @0.47, @0.46, @0.38, @0.56, @0.48, @0.36])
        .shadowSet(AAShadow.new
                   .offsetXSet(@15.0)
                   .offsetYSet(@15.0)
                   .opacitySet(@0.2)
                   .widthSet(@8.0)
                   .colorSet(@"#1e90ff")),
        AASeriesElement.new
        .nameSet(@"2018")
        .lineWidthSet(@5)
        .dataSet(@[@0.38, @0.31, @0.32, @0.32, @0.64, @0.66, @0.86, @0.47, @0.52, @0.75, @0.52, @0.56, @0.54, @0.60, @0.46, @0.63, @0.54, @0.51, @0.58, @0.64, @0.60, @0.45, @0.36, @0.67])
        .shadowSet(AAShadow.new
                   .offsetXSet(@15.0)
                   .offsetYSet(@15.0)
                   .opacitySet(@0.2)
                   .widthSet(@8.0)
                   .colorSet(@"#ef476f")),
        AASeriesElement.new
        .nameSet(@"2019")
        .lineWidthSet(@5)
        .dataSet(@[@0.46, @0.32, @0.53, @0.58, @0.86, @0.68, @0.85, @0.73, @0.69, @0.71, @0.91, @0.74, @0.60, @0.50, @0.39, @0.67, @0.55, @0.49, @0.65, @0.45, @0.64, @0.47, @0.63, @0.64])
        .shadowSet(AAShadow.new
                   .offsetXSet(@15.0)
                   .offsetYSet(@15.0)
                   .opacitySet(@0.2)
                   .widthSet(@8.0)
                   .colorSet(@"#ffd066")),
        AASeriesElement.new
        .nameSet(@"2020")
        .lineWidthSet(@5)
        .dataSet(@[@0.60, @0.51, @0.52, @0.53, @0.64, @0.84, @0.65, @0.68, @0.63, @0.47, @0.72, @0.60, @0.65, @0.74, @0.66, @0.65, @0.71, @0.59, @0.65, @0.77, @0.52, @0.53, @0.58, @0.53])
        .shadowSet(AAShadow.new
                   .offsetXSet(@15.0)
                   .offsetYSet(@15.0)
                   .opacitySet(@0.2)
                   .widthSet(@8.0)
                   .colorSet(@"#04d69f")),
               ]);
}

// GitHub issue https://github.com/AAChartModel/AAChartKit/issues/905
- (AAChartModel *)configureColorfulDataLabelsStepLineChart {
    return AAChartModel.new
    .chartTypeSet(AAChartTypeLine)
    .yAxisVisibleSet(false)
    .stackingSet(AAChartStackingTypeNormal)
    .colorsThemeSet(@[@"#1e90ff", @"#ef476f", @"#ffd066", @"#04d69f"])
    .markerSymbolSet(AAChartSymbolTypeCircle)
    .markerRadiusSet(@8.0)
    .markerSymbolStyleSet(AAChartSymbolStyleTypeInnerBlank)
    .seriesSet(@[
        AASeriesElement.new
        .nameSet(@"2017")
        .stepSet(@(true))
        .dataLabelsSet(AADataLabels.new
                       .styleSet([AAStyle styleWithColor:@"#1e90ff" fontSize:11]))
        .dataSet(@[@2.10, @2.54, @2.78, @3.62, @4.41, @4.09, @3.83, @4.47, @4.20, @3.94, @3.80, @3.58, @3.19, @4.30, @3.69, @3.52, @3.02, @3.30]),
        AASeriesElement.new
        .nameSet(@"2018")
        .stepSet(@(true))
        .dataLabelsSet(AADataLabels.new
                       .styleSet([AAStyle styleWithColor:@"#ef476f" fontSize:11]))
        .dataSet(@[@1.56, @1.91, @2.45, @3.87, @3.24, @4.90, @4.61, @4.10, @4.17, @3.85, @4.17, @3.46, @3.46, @3.55, @3.50, @4.13, @2.58, @2.28]),
        AASeriesElement.new
        .nameSet(@"2019")
        .stepSet(@(true))
        .dataLabelsSet(AADataLabels.new
                       .styleSet([AAStyle styleWithColor:@"#ffd066" fontSize:11]))
        .dataSet(@[@1.16, @1.67, @2.64, @2.86, @3.00, @3.21, @4.14, @4.07, @3.68, @3.11, @3.41, @3.25, @3.32, @3.07, @3.92, @3.05, @2.18, @3.24]),
        AASeriesElement.new
        .nameSet(@"2020")
        .stepSet(@(true))
        .dataLabelsSet(AADataLabels.new
                       .styleSet([AAStyle styleWithColor:@"#04d69f" fontSize:11]))
        .dataSet(@[@5.59, @3.09, @4.09, @6.14, @5.33, @6.05, @5.71, @6.22, @6.56, @4.75, @5.27, @6.02, @5.22, @5.77, @6.19, @5.68, @4.33, @5.48]),
               ]);
}

// GitHub issue https://github.com/AAChartModel/AAChartKit-Swift/issues/223
- (AAChartModel *)configureColorfulGradientColorAndColorfulDataLabelsStepAreaChart {
    NSArray *blueStopsArr = @[
        @[@0.0, AARgbaColor(30, 144, 255, 1.0)],//颜色字符串设置支持十六进制类型和 rgba 类型
        @[@0.6, AARgbaColor(30, 144, 255, 0.2)],
        @[@1.0, AARgbaColor(30, 144, 255, 0.0)]
    ];
    NSDictionary *gradientBlueColorDic =
    [AAGradientColor gradientColorWithDirection:AALinearGradientDirectionToBottom
                                     stopsArray:blueStopsArr];
    
    
    NSArray *redStopsArr = @[
        @[@0.0, AARgbaColor(255, 0, 0, 1.0)],//颜色字符串设置支持十六进制类型和 rgba 类型
        @[@0.6, AARgbaColor(255, 0, 0, 0.2)],
        @[@1.0, AARgbaColor(255, 0, 0, 0.0)]
    ];
    NSDictionary *gradientRedColorDic =
    [AAGradientColor gradientColorWithDirection:AALinearGradientDirectionToBottom
                                     stopsArray:redStopsArr];
    
    
    NSArray *goldStopsArr = @[
        @[@0.0, AARgbaColor(255, 215, 0, 1.0)],//颜色字符串设置支持十六进制类型和 rgba 类型
        @[@0.6, AARgbaColor(255, 215, 0, 0.2)],
        @[@1.0, AARgbaColor(255, 215, 0, 0.0)]
    ];
    NSDictionary *gradientGoldColorDic =
    [AAGradientColor gradientColorWithDirection:AALinearGradientDirectionToBottom
                                     stopsArray:goldStopsArr];
    
    
    NSArray *greenStopsArr = @[
        @[@0.0, AARgbaColor(50, 205, 50, 1.0)],//颜色字符串设置支持十六进制类型和 rgba 类型
        @[@0.6, AARgbaColor(50, 205, 50, 0.2)],
        @[@1.0, AARgbaColor(50, 205, 50, 0.0)]
    ];
    NSDictionary *gradientGreenColorDic =
    [AAGradientColor gradientColorWithDirection:AALinearGradientDirectionToBottom
                                     stopsArray:greenStopsArr];
    
    return AAChartModel.new
    .chartTypeSet(AAChartTypeArea)
    .yAxisVisibleSet(false)
    .stackingSet(AAChartStackingTypeNormal)
    .colorsThemeSet(@[@"#1e90ff", @"#ef476f", @"#ffd066", @"#04d69f"])
    .markerSymbolSet(AAChartSymbolTypeCircle)
    .markerRadiusSet(@5)
    .dataLabelsEnabledSet(false)
    .markerSymbolStyleSet(AAChartSymbolStyleTypeInnerBlank)
    .seriesSet(@[
        AASeriesElement.new
        .nameSet(@"2017")
        .fillColorSet((id)gradientBlueColorDic)
        .lineWidthSet(@6)
        .stepSet(@(true))
        .dataLabelsSet(AADataLabels.new
                       .styleSet(AAStyleColorSize(@"#1e90ff", 11)))
        .dataSet(@[@2.10, @2.54, @2.78, @3.62, @4.41, @4.09, @3.83, @4.47, @4.20, @3.94, @3.80, @3.58, @3.19, @4.30, @3.69, @3.52, @3.02, @3.30]),
        AASeriesElement.new
        .nameSet(@"2018")
        .fillColorSet((id)gradientRedColorDic)
        .lineWidthSet(@6)
        .stepSet(@(true))
        .dataLabelsSet(AADataLabels.new
                       .styleSet(AAStyleColorSize(@"#ef476f", 11)))
        .dataSet(@[@1.56, @1.91, @2.45, @3.87, @3.24, @4.90, @4.61, @4.10, @4.17, @3.85, @4.17, @3.46, @3.46, @3.55, @3.50, @4.13, @2.58, @2.28]),
        AASeriesElement.new
        .nameSet(@"2019")
        .fillColorSet((id)gradientGoldColorDic)
        .lineWidthSet(@6)
        .stepSet(@(true))
        .dataLabelsSet(AADataLabels.new
                       .styleSet(AAStyleColorSize(@"#ffd066", 11)))
        .dataSet(@[@1.16, @1.67, @2.64, @2.86, @3.00, @3.21, @4.14, @4.07, @3.68, @3.11, @3.41, @3.25, @3.32, @3.07, @3.92, @3.05, @2.18, @3.24]),
        AASeriesElement.new
        .nameSet(@"2020")
        .fillColorSet((id)gradientGreenColorDic)
        .lineWidthSet(@6)
        .stepSet(@(true))
        .dataLabelsSet(AADataLabels.new
                       .styleSet(AAStyleColorSize(@"#ffd066", 11)))
        .dataSet(@[@5.59, @3.09, @4.09, @6.14, @5.33, @6.05, @5.71, @6.22, @6.56, @4.75, @5.27, @6.02, @5.22, @5.77, @6.19, @5.68, @4.33, @5.48]),
               ]);
}

// https://github.com/AAChartModel/AAChartKit/issues/1318
// Refer to https://api.highcharts.com.cn/highcharts#plotOptions.spline.marker.states.hover.enabled
- (AAChartModel *)disableSplineChartMarkerHoverEffect {
    return AAChartModel.new
    .chartTypeSet(AAChartTypeSpline)
    .titleSet(@"Disable Spline Chart Marker Hover Effect")
    .categoriesSet(@[
        @"一月", @"二月", @"三月", @"四月", @"五月", @"六月",
        @"七月", @"八月", @"九月", @"十月", @"十一月", @"十二月"
                   ])
    .markerRadiusSet(@0)//marker点半径为0个像素
    .yAxisLineWidthSet(@0)
    .yAxisGridLineStyleSet([AALineStyle styleWithWidth:@0])
    .legendEnabledSet(false)
    .seriesSet(@[
        AASeriesElement.new
        .nameSet(@"Tokyo Hot")
        .lineWidthSet(@5.0)
        .colorSet(AARgbaColor(220, 20, 60, 1.0))//猩红色, alpha 透明度 1
        .markerSet(AAMarker.new
                   .statesSet(AAMarkerStates.new
                              .hoverSet(AAMarkerHover.new
                                        .enabledSet(false))))
        .dataSet(@[@7.0, @6.9, @2.5, @14.5, @18.2, @21.5, @5.2, @26.5, @23.3, @45.3, @13.9, @9.6]),
               ]);
}

//https://github.com/AAChartModel/AAChartKit/issues/1203
- (AAChartModel *)configureMaxAndMinDataLabelsForChart {
    AADataLabels *aaDataLabels = AADataLabels.new
    .enabledSet(true)
    .formatSet(@"{y} 美元")
    .shapeSet(@"callout")
    .styleSet(AAStyleColorSizeWeight(AAColor.redColor, 15, AAChartFontWeightTypeBold))
    .backgroundColorSet(AAColor.whiteColor)// white color
    .borderColorSet(AAColor.redColor)// red color
    .borderRadiusSet(@1.5)
    .borderWidthSet(@1.3);
    
    AADataElement *minData = AADataElement.new
    .dataLabelsSet(aaDataLabels)
    .ySet(@2.5);
    
    AADataElement *maxData = AADataElement.new
    .dataLabelsSet(aaDataLabels)
    .ySet(@49.5);
    
    return AAChartModel.new
    .chartTypeSet(AAChartTypeSpline)
    .dataLabelsEnabledSet(false)//是否显示值
    .tooltipEnabledSet(false)
    .markerRadiusSet(@0)
    .xAxisVisibleSet(false)
    .yAxisVisibleSet(false)
    .seriesSet(@[
        AASeriesElement.new
        .nameSet(@"Show The Max and Min values Data Labels")
        .lineWidthSet(@7)
        .dataSet(@[@7.0, @6.9, minData, @14.5, @18.2, maxData, @5.2, @26.5, @23.3, @26.5, @13.9, @9.6])
        .colorSet((id)AAGradientColor.oceanBlueColor)
               ]);
}

//https://github.com/AAChartModel/AAChartKit/issues/1201
- (AAChartModel *)customVerticalXAxisCategoriesLabelsByHTMLBreakLineTag {
    return AAChartModel.new
    .chartTypeSet(AAChartTypeArea)
    .categoriesSet(@[
        @"孤<br>岛<br>危<br>机",
        @"使<br>命<br>召<br>唤",
        @"荣<br>誉<br>勋<br>章",
        @"狙<br>击<br>精<br>英",
        @"神<br>秘<br>海<br>域",
        @"最<br>后<br>生<br>还<br>者",
        @"巫<br>师<br>3<br>狂<br>猎",
        @"对<br>马<br>之<br>魂",
        @"蝙<br>蝠<br>侠<br>阿<br>甘<br>骑<br>士<br>",
        @"地<br>狱<br>边<br>境",
        @"闪<br>客",
        @"忍<br>者<br>之<br>印"])
    .tooltipEnabledSet(false)
    .borderRadiusSet(@3)
    .markerSymbolStyleSet(AAChartSymbolStyleTypeInnerBlank)
    .xAxisLabelsStyleSet(AAStyleColorSizeWeight(AAColor.blackColor, 16, AAChartFontWeightTypeBold))
    .seriesSet(@[
        AASeriesElement.new
        .nameSet(@"2017")
        .dataSet(@[@7.0, @6.9, @9.5, @14.5, @18.2, @21.5, @25.2, @26.5, @23.3, @18.3, @13.9, @9.6]),
        AASeriesElement.new
        .nameSet(@"2018")
        .dataSet(@[@0.2, @0.8, @5.7, @11.3, @17.0, @22.0, @24.8, @24.1, @20.1, @14.1, @8.6, @2.5]),
        AASeriesElement.new
        .nameSet(@"2019")
        .dataSet(@[@0.9, @0.6, @3.5, @8.4, @13.5, @17.0, @18.6, @17.9, @14.3, @9.0, @3.9, @1.0]),
        AASeriesElement.new
        .nameSet(@"2020")
        .dataSet(@[@3.9, @4.2, @5.7, @8.5, @11.9, @15.2, @17.0, @16.6, @14.2, @10.3, @6.6, @4.8]),
               ]);
}

//https://github.com/AAChartModel/AAChartKit/issues/1269
- (AAChartModel *)noMoreGroupingAndOverlapEachOtherColumnChart {
    return AAChartModel.new
        .chartTypeSet(AAChartTypeColumn)
        .categoriesSet(@[@"11/23",@"11/24", @"11/25",@"11/26",@"11/27",@"11/28",@"11/29"])
        .yAxisTickPositionsSet(@[@0, @10, @20, @30, @40, @50])
        .yAxisMaxSet(@50)
        .yAxisMinSet(@0)
        .borderRadiusSet(@5)
        .seriesSet(@[
            AAColumn.new
                .nameSet(@"总做题")
                .colorSet(@"#D8D8D8")
                .dataSet(@[@30, @20, @28, @40, @42 ,@48, @50])
                .groupingSet(false)
            ,
            AAColumn.new
                .nameSet(@"正确做题")
                .colorSet(@"#00D9CD")
                .dataSet(@[@28, @18, @26, @40, @40, @46, @39])
        ]);
}

//https://github.com/AAChartModel/AAChartKit/issues/1271
- (AAChartModel *)noMoreGroupingAndNestedColumnChart {
    return AAChartModel.new
        .chartTypeSet(AAChartTypeColumn)
        .categoriesSet(@[@"11/23",@"11/24", @"11/25",@"11/26",@"11/27",@"11/28",@"11/29"])
        .yAxisTickPositionsSet(@[@0, @10, @20, @30, @40, @50])
        .yAxisMaxSet(@50)
        .yAxisMinSet(@0)
        .borderRadiusSet(@5)
        .seriesSet(@[
            AAColumn.new
                .nameSet(@"总目标")
                .colorSet(@"DeepSkyBlue")
                .dataSet(@[@30, @20, @28, @40, @42 ,@48, @50])
                .groupingSet(false)
                .pointPaddingSet(@0.05)
            ,
            AAColumn.new
                .nameSet(@"完成度")
                .colorSet(@"#FF3030") //Firebrick1 color
                .dataSet(@[@28, @18, @26, @40, @40, @46, @39])
                .groupingSet(false)
                .pointPaddingSet(@0.2)
        ]);
}

//https://github.com/AAChartModel/AAChartKit/issues/842
- (AAChartModel *)topRoundedCornersStackingColumnChart {
    return AAChartModel.new
    .chartTypeSet(AAChartTypeColumn)
    .stackingSet(AAChartStackingTypeNormal)
    .titleSet(@"Top Rounded Corners Stacking Column Chart")
    .colorsThemeSet(@[@"#fe117c", @"#ffc069", @"#06caf4",])
    .seriesSet(@[
        AASeriesElement.new
        .nameSet(@"Tokyo Hot")
        .borderRadiusTopLeftSet((id)@"50%")
        .borderRadiusTopRightSet((id)@"50%")
        .dataSet(@[@5.59, @3.09, @4.09, @6.14, @5.33, @6.05, @5.71, @6.22, @6.56, @4.75, @5.27, @6.02, @5.22, @5.77, @6.19, @5.68, @4.33, @5.48]),
        
        AASeriesElement.new
        .nameSet(@"Berlin Hot")
        .dataSet(@[@1.16, @1.67, @2.64, @2.86, @3.00, @3.21, @4.14, @4.07, @3.68, @3.11, @3.41, @3.25, @3.32, @3.07, @3.92, @3.05, @2.18, @3.24]),
        
        AASeriesElement.new
        .nameSet(@"NewYork Hot")
        .dataSet(@[@1.56, @1.91, @2.45, @3.87, @3.24, @4.90, @4.61, @4.10, @4.17, @3.85, @4.17, @3.46, @3.46, @3.55, @3.50, @4.13, @2.58, @2.28]),
               ]);
}


//https://github.com/AAChartModel/AAChartKit-Swift/issues/323
//https://github.com/AAChartModel/AAChartKit-Swift/issues/346
//https://github.com/highcharts/rounded-corners
- (AAChartModel *)freeStyleRoundedCornersStackingColumnChart {
    return AAChartModel.new
        .chartTypeSet(AAChartTypeColumn)
        .stackingSet(AAChartStackingTypePercent)
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
                .borderRadiusTopLeftSet((id)@"50%")
                .borderRadiusTopRightSet((id)@"50%")
                .dataSet(@[@2.10, @2.54, @2.78, @3.62, @4.41, @4.09, @3.83, @4.47, @4.20, @3.94, @3.80, @3.58, @3.19, @4.30, @3.69, @3.52, @3.02, @3.30]),
            
            AASeriesElement.new
                .nameSet(@"Berlin Hot")
                .borderRadiusBottomLeftSet((id)@"50%")
                .borderRadiusBottomRightSet((id)@"50%")
                .dataSet(@[@1.56, @1.91, @2.45, @3.87, @3.24, @4.90, @4.61, @4.10, @4.17, @3.85, @4.17, @3.46, @3.46, @3.55, @3.50, @4.13, @2.58, @2.28]),
            
            AASeriesElement.new
                .nameSet(@"Beijing Hot")
                .borderRadiusTopLeftSet((id)@"50%")
                .borderRadiusBottomRightSet((id)@"50%")
                .dataSet(@[@1.16, @1.67, @2.64, @2.86, @3.00, @3.21, @4.14, @4.07, @3.68, @3.11, @3.41, @3.25, @3.32, @3.07, @3.92, @3.05, @2.18, @3.24]),
            
            AASeriesElement.new
                .nameSet(@"London Hot")
                .borderRadiusTopRightSet((id)@"50%")
                .borderRadiusBottomLeftSet((id)@"50%")
                .dataSet(@[@5.59, @3.09, @4.09, @6.14, @5.33, @6.05, @5.71, @6.22, @6.56, @4.75, @5.27, @6.02, @5.22, @5.77, @6.19, @5.68, @4.33, @5.48]),
            
            AASeriesElement.new
                .nameSet(@"NewYork Hot")
                .borderRadiusSet(@20)
                .dataSet(@[@2.10, @2.54, @2.78, @3.62, @4.41, @4.09, @3.83, @4.47, @4.20, @3.94, @3.80, @3.58, @3.19, @4.30, @3.69, @3.52, @3.02, @3.30]),
        ]);
}


//https://github.com/AAChartModel/AAChartKit-Swift/issues/365
- (AAChartModel *)customColumnChartBorderStyleAndStatesHoverColor {
    return AAChartModel.new
        .chartTypeSet(AAChartTypeColumn)
        .stackingSet(AAChartStackingTypeNormal)
        .colorsThemeSet(@[AAColor.darkGrayColor, AAColor.lightGrayColor])//Colors theme
        .categoriesSet(@[
            @"January", @"February", @"March", @"April", @"May", @"June",
            @"July", @"August", @"September", @"October", @"November", @"December"
        ])
        .seriesSet(@[
            AASeriesElement.new
                .nameSet(@"Berlin Hot")
                .borderColorSet(AAColor.whiteColor)
                .borderWidthSet(@3)
                .borderRadiusSet(@10)
                .statesSet(AAStates.new
                    .hoverSet(AAHover.new
                        .colorSet(AAColor.redColor)))
                .dataSet(@[@7.0, @6.9, @9.5, @14.5, @18.2, @21.5, @25.2, @26.5, @23.3, @18.3, @13.9, @9.6]),
            
            AASeriesElement.new
                .nameSet(@"Beijing Hot")
                .borderColorSet(AAColor.whiteColor)
                .borderWidthSet(@3)
                .borderRadiusSet(@10)
                .statesSet(AAStates.new
                    .hoverSet(AAHover.new
                        .colorSet(@"dodgerblue")))// Dodgerblue／道奇藍／#1e90ff十六进制颜色代码
                .dataSet(@[@0.2, @0.8, @5.7, @11.3, @17.0, @22.0, @24.8, @24.1, @20.1, @14.1, @8.6, @2.5]),
        ]);
}


//https://github.com/AAChartModel/AAChartKit/issues/1291
- (AAChartModel *)customLineChartWithColorfulMarkersAndLines {
    return AAChartModel.new
    .chartTypeSet(AAChartTypeLine)
    .titleSet(@"Custom Line Chart With Colorful Markers And Lines")
    .markerRadiusSet(@18.0)//marker点半径为8个像素
    .yAxisLineWidthSet(@0)
    .yAxisGridLineStyleSet([AALineStyle styleWithWidth:@0])
    .legendEnabledSet(false)
    .seriesSet(@[
        AASeriesElement.new
            .nameSet(@"Tokyo Hot")
            .lineWidthSet(@5.0)
            .markerSet(AAMarker.new
                       .statesSet(AAMarkerStates.new
                                  .hoverSet(AAMarkerHover.new
                                            .radiusSet(@40)
                                            .lineWidthSet(@5))))
            .dataSet(@[
                @2, @4, @8, @16, @32, @64, @128,
                AADataElement.new
                    .ySet(@256.0)
                    .colorSet(AAColor.redColor)
            ])
            .zoneAxisSet(@"x")
            .zonesSet(@[
                AAZonesElement.new
                    .valueSet(@1)
                    .colorSet(AAColor.redColor),
                AAZonesElement.new
                    .valueSet(@2)
                    .colorSet(AAColor.orangeColor),
                AAZonesElement.new
                    .valueSet(@3)
                    .colorSet(AAColor.yellowColor),
                AAZonesElement.new
                    .valueSet(@4)
                    .colorSet(AAColor.greenColor),
                AAZonesElement.new
                    .valueSet(@5)
                    .colorSet(AAColor.cyanColor),
                AAZonesElement.new
                    .valueSet(@6)
                    .colorSet(AAColor.blueColor),
                AAZonesElement.new
                    .valueSet(@7)
                    .colorSet(AAColor.purpleColor),
            ])
        ,
    ]);
}

//https://github.com/AAChartModel/AAChartKit/issues/1291
//https://github.com/AAChartModel/AAChartKit/issues/1293
- (AAChartModel *)customLineChartWithColorfulMarkersAndLines2 {
    return AAChartModel.new
    .chartTypeSet(AAChartTypeLine)
    .titleSet(@"Custom Line Chart With Colorful Markers And Lines")
    .markerRadiusSet(@25.0)//marker点半径为8个像素
    .markerSymbolSet(AAChartSymbolTypeCircle)
    .yAxisLineWidthSet(@0)
    .yAxisGridLineStyleSet([AALineStyle styleWithWidth:@0])
    .legendEnabledSet(true)
    .stackingSet(AAChartStackingTypeNormal)
    .seriesSet(@[
        AASeriesElement.new
            .nameSet(AAColor.blueColor)
            .lineWidthSet(@20.0)
            .dataSet(@[
                @2048, @1024, @1024, @1024, @1024,
                AADataElement.new
                    .ySet(@2048)
                    .colorSet(AARgbaColor(30, 144, 255, 1.0)),
            ])
            .zoneAxisSet(@"x")
            .zonesSet(@[
                AAZonesElement.new
                    .valueSet(@1)
                    .colorSet(AARgbaColor(30, 144, 255, 1.0)),
                AAZonesElement.new
                    .valueSet(@2)
                    .colorSet(AARgbaColor(30, 144, 255, 0.8)),
                AAZonesElement.new
                    .valueSet(@3)
                    .colorSet(AARgbaColor(30, 144, 255, 0.6)),
                AAZonesElement.new
                    .valueSet(@4)
                    .colorSet(AARgbaColor(30, 144, 255, 0.4)),
                AAZonesElement.new
                    .valueSet(@5)
                    .colorSet(AARgbaColor(30, 144, 255, 0.2)),
            ])
        ,
        AASeriesElement.new
            .nameSet(AAColor.redColor)
            .lineWidthSet(@20.0)
            .dataSet(@[
                @2048, @1024, @1024, @1024, @1024,
                AADataElement.new
                    .ySet(@2048)
                    .colorSet(AARgbaColor(255, 0, 0, 1.0)),
            ])
            .zoneAxisSet(@"x")
            .zonesSet(@[
                AAZonesElement.new
                    .valueSet(@1)
                    .colorSet(AARgbaColor(255, 0, 0, 1.0)),
                AAZonesElement.new
                    .valueSet(@2)
                    .colorSet(AARgbaColor(255, 0, 0, 0.8)),
                AAZonesElement.new
                    .valueSet(@3)
                    .colorSet(AARgbaColor(255, 0, 0, 0.6)),
                AAZonesElement.new
                    .valueSet(@4)
                    .colorSet(AARgbaColor(255, 0, 0, 0.4)),
                AAZonesElement.new
                    .valueSet(@5)
                    .colorSet(AARgbaColor(255, 0, 0, 0.2)),
            ])
        ,
        AASeriesElement.new
            .nameSet(AAColor.yellowColor)
            .lineWidthSet(@20.0)
            .dataSet(@[
                @2048, @1024, @1024, @1024, @1024,
                AADataElement.new
                    .ySet(@2048)
                    .colorSet(AARgbaColor(255, 215, 0, 1.0)),
            ])
            .zoneAxisSet(@"x")
            .zonesSet(@[
                AAZonesElement.new
                    .valueSet(@1)
                    .colorSet(AARgbaColor(255, 215, 0, 1.0)),
                AAZonesElement.new
                    .valueSet(@2)
                    .colorSet(AARgbaColor(255, 215, 0, 0.8)),
                AAZonesElement.new
                    .valueSet(@3)
                    .colorSet(AARgbaColor(255, 215, 0, 0.6)),
                AAZonesElement.new
                    .valueSet(@4)
                    .colorSet(AARgbaColor(255, 215, 0, 0.4)),
                AAZonesElement.new
                    .valueSet(@5)
                    .colorSet(AARgbaColor(255, 215, 0, 0.2)),
            ])
        ,
        AASeriesElement.new
            .nameSet(AAColor.greenColor)
            .lineWidthSet(@20.0)
            .dataSet(@[
                @2048, @1024, @1024, @1024, @1024,
                AADataElement.new
                    .ySet(@2048)
                    .colorSet(AARgbaColor(50, 205, 50, 1.0)),
            ])
            .zoneAxisSet(@"x")
            .zonesSet(@[
                AAZonesElement.new
                    .valueSet(@1)
                    .colorSet(AARgbaColor(50, 205, 50, 1.0)),
                AAZonesElement.new
                    .valueSet(@2)
                    .colorSet(AARgbaColor(50, 205, 50, 0.8)),
                AAZonesElement.new
                    .valueSet(@3)
                    .colorSet(AARgbaColor(50, 205, 50, 0.6)),
                AAZonesElement.new
                    .valueSet(@4)
                    .colorSet(AARgbaColor(50, 205, 50, 0.4)),
                AAZonesElement.new
                    .valueSet(@5)
                    .colorSet(AARgbaColor(50, 205, 50, 0.2)),
            ])
        ,
        AASeriesElement.new
            .nameSet(AAColor.purpleColor)
            .lineWidthSet(@20.0)
            .dataSet(@[
                @2048, @1024, @1024, @1024, @1024,
                AADataElement.new
                    .ySet(@2048)
                    .colorSet(AARgbaColor(138, 43, 226, 1.0)),
            ])
            .zoneAxisSet(@"x")
            .zonesSet(@[
                AAZonesElement.new
                    .valueSet(@1)
                    .colorSet(AARgbaColor(138, 43, 226, 1.0)),
                AAZonesElement.new
                    .valueSet(@2)
                    .colorSet(AARgbaColor(138, 43, 226, 0.8)),
                AAZonesElement.new
                    .valueSet(@3)
                    .colorSet(AARgbaColor(138, 43, 226, 0.6)),
                AAZonesElement.new
                    .valueSet(@4)
                    .colorSet(AARgbaColor(138, 43, 226, 0.4)),
                AAZonesElement.new
                    .valueSet(@5)
                    .colorSet(AARgbaColor(138, 43, 226, 0.2)),
            ])
        ,
    ]);
}

//https://github.com/AAChartModel/AAChartKit/issues/1294
- (AAChartModel *)drawLineChartWithPointsCoordinates {
    NSArray *dataArr = @[
        @[@0, @200],
        @[@0, @300],
        @[@0, @400],
        @[@1, @100],
        @[@2, @120],
        @[@3, @130]
    ];
    
    return AAChartModel.new
    .chartTypeSet(AAChartTypeScatter)
    .titleSet(@"Draw Line Chart With Points Coordinates")
    .markerSymbolSet(AAChartSymbolTypeCircle)
    .markerSymbolStyleSet(AAChartSymbolStyleTypeBorderBlank)
    .markerRadiusSet(@8)
    .colorsThemeSet(@[AAColor.redColor])
    .seriesSet(@[
        AASeriesElement.new
            .typeSet(AAChartTypeLine)
            .enableMouseTrackingSet(false)
            .showInLegendSet(false)
            .markerSet(AAMarker.new
                       .enabledSet(false))
            .statesSet(AAStates.new
                       .inactiveSet(AAInactive.new
                                    .enabledSet(false)))
            .dataSet(dataArr),
        AASeriesElement.new
            .nameSet(@"Red Dot")
            .typeSet(AAChartTypeScatter)
            .dataSet(dataArr),
    ]);
}

//https://github.com/AAChartModel/AAChartKit/issues/1351
- (AAChartModel *)configureSpecialStyleColumnForNegativeDataMixedPositiveData {
    NSArray *categoriesArr = @[
        @"立春", @"雨水", @"惊蛰", @"春分", @"清明", @"谷雨", @"立夏", @"小满", @"芒种", @"夏至", @"小暑", @"大暑",
        @"立秋", @"处暑", @"白露", @"秋分", @"寒露", @"霜降", @"立冬", @"小雪", @"大雪", @"冬至", @"小寒", @"大寒"
    ];
    
    NSArray *dataArr = @[
        @-70, @-69, @-25, @-145, @-182, @-215, @-52, @-265, @-233, @-453, @-139, @-96,
        @+70, @+69, @+25, @+145, @+182, @+215, @+52, @+265, @+233, @+453, @+139, @+96,
    ];
    NSMutableArray *newDataArr = [NSMutableArray arrayWithCapacity:dataArr.count];
    
    for (NSNumber *  _Nonnull dataElement in dataArr) {
        AADataLabels *aaDataLabels = AADataLabels.new
            .enabledSet(true)
            .verticalAlignSet(AAChartVerticalAlignTypeMiddle)
            .xSet(@0)
            .ySet(@-10);
        
        NSInteger dataElementValue = dataElement.intValue;
        if (dataElementValue < 0) {
            AADataElement *negativeDataElement = AADataElement.new
            .ySet(@(-dataElementValue))
            .colorSet(AAColor.greenColor)
            .dataLabelsSet(aaDataLabels
                           .formatSet(@"-{y} 美元")
                           .styleSet(AAStyleColorSizeWeight(AAColor.greenColor, 11, AAChartFontWeightTypeThin)));
            [newDataArr addObject:negativeDataElement];
        } else {
            AADataElement *positiveDataElement = AADataElement.new
            .ySet(@(+dataElementValue))
            .colorSet(AAColor.redColor)
            .dataLabelsSet(aaDataLabels
                           .formatSet(@"+{y} 美元")
                           .styleSet(AAStyleColorSizeWeight(AAColor.redColor, 11, AAChartFontWeightTypeThin)));
            [newDataArr addObject:positiveDataElement];
        }
    }
    
    return AAChartModel.new
    .chartTypeSet(AAChartTypeColumn)
    .categoriesSet(categoriesArr)
    .tooltipEnabledSet(false)
    .yAxisVisibleSet(false)
    .seriesSet(@[
        AASeriesElement.new
        .nameSet(@"虚构数据")
        .dataSet(newDataArr)
               ]);
}


//https://github.com/AAChartModel/AAChartKit-Swift/issues/389
- (AAChartModel *)configureMultiLevelStopsArrGradientColorAreasplineMixedLineChart {
    NSMutableArray *randomNumArrA = [NSMutableArray array];
    NSMutableArray *randomNumArrB = [NSMutableArray array];
    double y1 = 0.0;
    double y2 = 0.0;
    int Q = arc4random() % 50;
    int range = 129;
    for (int x = 0; x < range; x++) {
        y1 = sin(Q * (x * M_PI / 180)) + x * 2.0 * 0.01;
        y2 = cos(Q * (x * M_PI / 180)) + x * 3.0 * 0.01;
        [randomNumArrA addObject:@(y1)];
        [randomNumArrB addObject:@(y2)];
    }
    
    NSArray *redStopsArr = @[
        @[@0.0, AARgbaColor(255, 0, 0, 1.0)],//颜色字符串设置支持十六进制类型和 rgba 类型
        @[@0.2, AARgbaColor(255, 0, 0, 0.2)],
        @[@0.4, AARgbaColor(255, 0, 0, 0.1)],
        @[@0.6, AARgbaColor(255, 0, 0, 0.05)],
        @[@0.8, AARgbaColor(255, 0, 0, 0.01)],
        @[@1.0, AAColor.clearColor]
    ];
    
    NSDictionary *gradientRedColorDic = [AAGradientColor gradientColorWithDirection:AALinearGradientDirectionToBottom
                                                                         stopsArray:redStopsArr];
    
    return AAChartModel.new
        .chartTypeSet(AAChartTypeAreaspline)
        .stackingSet(AAChartStackingTypeNormal)
        .backgroundColorSet(AAColor.blackColor)
        .colorsThemeSet(@[@"#1e90ff",@"#04d69f",@"#ef476f",@"#ffd066",])
        .dataLabelsEnabledSet(false)
        .markerSymbolSet(AAChartSymbolTypeCircle)
        .markerRadiusSet(@5)
        .markerSymbolStyleSet(AAChartSymbolStyleTypeInnerBlank)
        .xAxisGridLineStyleSet([AALineStyle styleWithWidth:@0.5])
        .yAxisGridLineStyleSet([AALineStyle styleWithWidth:@0.5])
        .seriesSet(@[
            AASeriesElement.new
                .nameSet(@"2017")
                .typeSet(AAChartTypeSpline)
                .lineWidthSet(@6)
                .dataSet(randomNumArrA),
            AASeriesElement.new
                .nameSet(@"2018")
                .typeSet(AAChartTypeSpline)
                .lineWidthSet(@6)
                .dataSet(randomNumArrB),
            AASeriesElement.new
                .nameSet(@"2020")
                .fillColorSet((id)gradientRedColorDic)
                .lineWidthSet(@6)
                .thresholdSet(@(-4))
                .dataSet(randomNumArrA),
        ]);
}



//https://github.com/AAChartModel/AAChartKit/issues/1401
- (AAChartModel *)connectNullsForSingleAASeriesElement {
    NSArray *dataArr = @[
        @0.45, NSNull.new, NSNull.new,
        @0.55, @0.58, @0.62, NSNull.new, NSNull.new,
        @0.56, @0.67, @0.50, @0.34, @0.50, NSNull.new, NSNull.new, NSNull.new, NSNull.new,
        @0.23, @0.47, @0.46, @0.38, @0.56, @0.48, @0.36, NSNull.new, NSNull.new, NSNull.new, NSNull.new, NSNull.new, NSNull.new, NSNull.new, NSNull.new,
        @0.74, @0.66, @0.65, @0.71, @0.59, @0.65, @0.77, @0.52, @0.53, @0.58, @0.53,
    ];
    
    return AAChartModel.new
        .chartTypeSet(AAChartTypeSpline)
        .subtitleSet(@"虚拟数据")
        .colorsThemeSet(@[@"#1e90ff", @"#ef476f", @"#ffd066", @"#04d69f"])
        .yAxisTitleSet(@"摄氏度")
        .dataLabelsEnabledSet(false)
        .yAxisGridLineStyleSet([AALineStyle styleWithWidth:@0])
        .stackingSet(AAChartStackingTypeNormal)
        .markerRadiusSet(@8)
        .markerSymbolStyleSet(AAChartSymbolStyleTypeBorderBlank)
        .seriesSet(@[
            AASeriesElement.new
                .nameSet(@"Do NOT Connect Nulls")
                .lineWidthSet(@5)
                .connectNullsSet(@false)
                .dataSet(dataArr),
            AASeriesElement.new
                .nameSet(@"Connect Nulls")
                .lineWidthSet(@5)
                .connectNullsSet(@true)
                .dataSet(dataArr),
            AASeriesElement.new
                .nameSet(@"Do NOT Connect Nulls")
                .lineWidthSet(@5)
                .connectNullsSet(@false)
                .dataSet(dataArr),
            AASeriesElement.new
                .nameSet(@"Connect Nulls")
                .lineWidthSet(@5)
                .connectNullsSet(@true)
                .dataSet(dataArr)
        ]);
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


- (NSArray *)generateRandomNumberMixedNullArrayWithLength:(NSUInteger)length
                                              randomRange:(NSUInteger)randomRange
                                                   minNum:(NSUInteger)minNum {
    NSMutableArray *randomNumArrA = [NSMutableArray array];
    for (NSUInteger x = 0; x < length; x++) {
        if ((100 < x && x < 150) || (300 < x && x < 350)) {
            NSUInteger randomNum = arc4random() % randomRange + minNum;
            [randomNumArrA addObject:@(randomNum)];
        } else {
            [randomNumArrA addObject:NSNull.null];
        }
    }
    return randomNumArrA;
}

//https://github.com/AAChartModel/AAChartKit/issues/1419
- (AAChartModel *)lineChartsWithLargeDifferencesInTheNumberOfDataInDifferentSeriesElement {
    return AAChartModel.new
        .chartTypeSet(AAChartTypeLine)
        .backgroundColorSet(AAColor.blackColor)
        .colorsThemeSet(@[@"#1e90ff",@"#04d69f",@"#ef476f",@"#ffd066",])
        .dataLabelsEnabledSet(false)
        .markerRadiusSet(@0)
        .seriesSet(@[
            AASeriesElement.new
                .nameSet(@"2017")
                .lineWidthSet(@6)
                .dataSet([self generateRandomNumberMixedNullArrayWithLength:3550 randomRange:5 minNum:100]),
            AASeriesElement.new
                .nameSet(@"2018")
                .lineWidthSet(@6)
                .dataSet([self generateRandomNumberArrayWithLength:3550 randomRange:100 minNum:200]),
            AASeriesElement.new
                .nameSet(@"2019")
                .lineWidthSet(@6)
                .dataSet([self generateRandomNumberArrayWithLength:3550 randomRange:150 minNum:400]),
            AASeriesElement.new
                .nameSet(@"2020")
                .lineWidthSet(@6)
                .dataSet([self generateRandomNumberArrayWithLength:3550 randomRange:150 minNum:600]),
        ]);
}


//https://github.com/AAChartModel/AAChartCore-Kotlin/issues/149
- (AAChartModel *)customAreasplineChartWithColorfulGradientColorZones {
    NSArray *redStopsArr = @[
        @[@0.0, AARgbaColor(255, 0, 0, 1.0)],//颜色字符串设置支持十六进制类型和 rgba 类型
        @[@1.0, AAColor.clearColor]
    ];
    
    NSArray *greenStopsArr = @[
        @[@0.0, AARgbaColor(0, 255, 0, 1.0)],//颜色字符串设置支持十六进制类型和 rgba 类型
        @[@1.0, AAColor.clearColor]
    ];
    
    NSArray *blueStopsArr = @[
        @[@0.0, AARgbaColor(0, 0, 255, 1.0)],//颜色字符串设置支持十六进制类型和 rgba 类型
        @[@1.0, AAColor.clearColor]
    ];
    
    NSDictionary *redGradientColorDic = [AAGradientColor gradientColorWithDirection:AALinearGradientDirectionToBottom stopsArray:redStopsArr];
    NSDictionary *greenGradientColorDic = [AAGradientColor gradientColorWithDirection:AALinearGradientDirectionToBottom stopsArray:greenStopsArr];
    NSDictionary *blueGradientColorDic = [AAGradientColor gradientColorWithDirection:AALinearGradientDirectionToBottom stopsArray:blueStopsArr];
    
    AADataElement *singleSpecialData = AADataElement.new
        .markerSet(AAMarker.new
                   .radiusSet(@8)//曲线连接点半径
                   .symbolSet(AAChartSymbolTypeCircle)//曲线点类型："circle", "square", "diamond", "triangle","triangle-down"，默认是"circle"
                   .fillColorSet(AAColor.whiteColor)//点的填充色(用来设置折线连接点的填充色)
                   .lineWidthSet(@5)//外沿线的宽度(用来设置折线连接点的轮廓描边的宽度)
                   //外沿线的颜色(用来设置折线连接点的轮廓描边颜色，当值为空字符串时，默认取数据点或数据列的颜色)
                   .lineColorSet(@"#1E90FF")//道奇蓝
                   )
        .dataLabelsSet(AADataLabels.new
                       .enabledSet(true)
                       .allowOverlapSet(true)
                       .useHTMLSet(true)
                       .backgroundColorSet(AARgbaColor(65, 111, 166, 1.0))
                       .borderRadiusSet(@10)
                       .shapeSet(@"callout")
                       .formatSet(@"{point.category}<br>{series.name}: {point.y} %")
                       .styleSet(AAStyleColorSizeWeight(AAColor.whiteColor, 12, AAChartFontWeightTypeBold))
                       .xSet(@-80).ySet(@(5))
                       .alignSet(AAChartAlignTypeCenter)
                       .verticalAlignSet(AAChartVerticalAlignTypeTop)
                       .overflowSet(@"none")
                       .cropSet(false)
                       )
        .ySet(@85.3);
    
    AAStyle *axisLabelsStyle = AAStyleColorSizeWeight(AAColor.whiteColor, 12, AAChartFontWeightTypeBold);
    
    return AAChartModel.new
        .chartTypeSet(AAChartTypeAreaspline)
        .backgroundColorSet(AAColor.blackColor)
        .categoriesSet(@[
            @"Jan", @"Feb", @"Mar", @"Apr", @"May", @"Jun",
            @"Jul", @"Aug", @"Sep", @"Oct", @"Nov", @"Dec"
        ])
        .dataLabelsEnabledSet(false)
        .legendEnabledSet(false)
        .markerRadiusSet(@0)
        .xAxisLabelsStyleSet(axisLabelsStyle)
        .yAxisLabelsStyleSet(axisLabelsStyle)
        .xAxisGridLineStyleSet([AALineStyle styleWithColor:AAColor.whiteColor dashStyle:AAChartLineDashStyleTypeLongDashDotDot width:@0.5])
        .yAxisGridLineStyleSet([AALineStyle styleWithWidth:@0])
        .seriesSet(@[
            AASeriesElement.new
                .nameSet(@"空气湿度")
                .lineWidthSet(@6)
                .zoneAxisSet(@"x")
                .zonesSet(@[
                    AAZonesElement.new
                        .valueSet(@2)
                        .colorSet(AAColor.redColor)
                        .fillColorSet((id)redGradientColorDic ),
                    AAZonesElement.new
                        .valueSet(@5)
                        .colorSet(AAColor.greenColor)
                        .fillColorSet((id)greenGradientColorDic),
                    AAZonesElement.new
                        .colorSet(AAColor.blueColor)
                        .fillColorSet((id)blueGradientColorDic),
                ])
                .dataSet(@[@56.5, @33.3, @85.3, @23.9, @29.6, @34.5, @28.2, @26.5, @15.2, @56.5, @33.3, singleSpecialData]),
        ]);
}


@end

