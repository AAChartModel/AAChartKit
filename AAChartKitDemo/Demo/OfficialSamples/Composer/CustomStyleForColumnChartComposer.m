#import "CustomStyleForColumnChartComposer.h"
#import "AAChartKit.h"

@implementation CustomStyleForColumnChartComposer

+ (AAChartModel *)colorfulColumnChart {
    return AAChartModel.new
        .chartTypeSet(AAChartTypeColumn)
        .animationTypeSet(AAChartAnimationBounce)
        .titleSet(@"Colorful Chart")
        .subtitleSet(@"use AAColor to get color string")
        .dataLabelsEnabledSet(false)
        .categoriesSet(@[
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
        ])
        .colorsThemeSet(@[
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
            AAColor.blackColor
        ])
        .stackingSet(AAChartStackingTypePercent)
//        .marginSet(AAMargin.new.leftSet(@68).rightSet(@0))
        .seriesSet(@[
            AASeriesElement.new
                .nameSet(@"Tokyo")
                .dataSet(@[@7.0, @6.9, @9.5, @14.5, @18.2, @21.5, @25.2, @26.5, @23.3, @18.3, @13.9, @9.6, @5.5])
                .colorByPointSet(@true)
        ])
        ;
}

+ (AAChartModel *)colorfulGradientColorColumnChart {
    return AAChartModel.new
        .chartTypeSet(AAChartTypeColumn)
        .titleSet(@"Colorful Gradient Chart")
        .backgroundColorSet(@"#5E5E5E")
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
        .stackingSet(AAChartStackingTypePercent)
//        .xAxisLabelsStyleSet(AAStyle.styleWithColor(AAColor.whiteColor))
        .dataLabelsEnabledSet(false)
//        .marginSet(AAMargin.new.topSet(@60).bottomSet(@60))
        .seriesSet(@[
            AASeriesElement.new
                .nameSet(@"2018")
                .dataSet(@[@7.0, @6.9, @9.5, @14.5, @18.2, @21.5, @25.2, @26.5, @23.3, @18.3, @13.9,
                           @9.6, @7.0, @6.9, @9.5, @14.5, @18.2, @21.5, @25.2, @26.5, @23.3, @18.3])
                .colorByPointSet(@true)
        ])
        ;
}

+ (AAChartModel *)discontinuousDataColumnChart {
    return AAChartModel.new
        .chartTypeSet(AAChartTypeColumn)
        .dataLabelsEnabledSet(true)
        .tooltipEnabledSet(true)
        .seriesSet(@[
            AASeriesElement.new
                .nameSet(@"所有专业")
                .dataSet(@[@7.0, @6.9, @9.5, @14.5, @18.2, NSNull.null, NSNull.null, NSNull.null, NSNull.null, @21.5, @25.2, @26.5, @23.3, @18.3, @13.9, @9.6])
                .colorSet(AAGradientColor.firebrickColor)
        ])
        ;
}

+ (AAChartModel *)randomColorfulColumnChart {
    NSMutableArray *colorStringArr = [NSMutableArray array];
    for (int i = 0; i < 14; i++) {
        uint32_t R = arc4random_uniform(256);
        uint32_t G = arc4random_uniform(256);
        uint32_t B = arc4random_uniform(256);
        NSString *rgbaColorStr = AARgbaColor(R, G, B, 0.9);
        [colorStringArr addObject:rgbaColorStr];
    }
    
    return AAChartModel.new
        .chartTypeSet(AAChartTypeColumn)
        .titleSet(@"Colorful Column Chart")
        .subtitleSet(@"single data array colorful column chart")
        .colorsThemeSet(colorStringArr)
        .seriesSet(@[
            AASeriesElement.new
                .nameSet(@"ElementOne")
                .dataSet(@[@211, @183, @157, @133, @111, @91, @73, @57, @43, @31, @21, @13, @7, @3])
                .colorByPointSet(@true)
        ])
        ;
}

+ (AAChartModel *)noneStackingPolarColumnChart {
    return AAChartModel.new
        .chartTypeSet(AAChartTypeColumn)
//        .xAxisLabelsStyleSet(AAStyle.styleWithColor(AAColor.whiteColor))
        .dataLabelsEnabledSet(false)
        .backgroundColorSet(@"#22324c")
        .polarSet(true)
//        .stackingSet(AAChartStackingTypeNone)
        .seriesSet(@[
            AASeriesElement.new
                .nameSet(@"Tokyo")
                .dataSet(@[@7.0, @6.9, @9.5, @14.5, @18.2, @21.5, @25.2, @26.5, @23.3, @18.3, @13.9, @9.6])
            ,
            AASeriesElement.new
                .nameSet(@"New York")
                .dataSet(@[@0.2, @0.8, @5.7, @11.3, @17.0, @22.0, @24.8, @24.1, @20.1, @14.1, @8.6, @2.5])
            ,
            AASeriesElement.new
                .nameSet(@"Berlin")
                .dataSet(@[@0.9, @0.6, @3.5, @8.4, @13.5, @17.0, @18.6, @17.9, @14.3, @9.0, @3.9, @1.0])
            ,
            AASeriesElement.new
                .nameSet(@"London")
                .dataSet(@[@3.9, @4.2, @5.7, @8.5, @11.9, @15.2, @17.0, @16.6, @14.2, @10.3, @6.6, @4.8])
            ,
        ])
        ;
}

+ (AAChartModel *)normalStackingPolarColumnChart {
    return [self noneStackingPolarColumnChart]
        .stackingSet(AAChartStackingTypeNormal);
}

+ (AAChartModel *)percentStackingPolarColumnChart {
    return [self noneStackingPolarColumnChart]
        .stackingSet(AAChartStackingTypePercent);
}

+ (AAChartModel *)specialStyleForTheSingleDataElementOfColumnChart {
    return AAChartModel.new
        .chartTypeSet(AAChartTypeColumn)
        .dataLabelsEnabledSet(false)
        .tooltipEnabledSet(false)
        .markerRadiusSet(@0)
        .xAxisVisibleSet(false)
        .yAxisVisibleSet(false)
        .seriesSet(@[
            AASeriesElement.new
                .nameSet(@"Virtual Data")
                .lineWidthSet(@6)
                .colorSet(AAGradientColor.oceanBlueColor)
                .dataSet(@[
                    @7.0, @6.9, @2.5, @14.5, @18.2,
                    AADataElement.new
                        .colorSet(AAGradientColor.freshPapayaColor)
                        .ySet(@49.5)
                        ,
                    @5.2, @26.5, @23.3, @26.5, @13.9, @9.6
                ])
        ])
        ;
}

+ (AAChartModel *)noMoreGroupingAndOverlapEachOtherColumnChart {
    return AAChartModel.new
        .chartTypeSet(AAChartTypeColumn)
        .categoriesSet(@[@"11/23", @"11/24", @"11/25", @"11/26", @"11/27", @"11/28", @"11/29"])
        .yAxisTickPositionsSet(@[@0, @10, @20, @30, @40, @50])
        .yAxisMaxSet(@50)
        .yAxisMinSet(@0)
        .borderRadiusSet(@5)
        .seriesSet(@[
            AAColumn.new
                .nameSet(@"总做题")
                .colorSet(@"#D8D8D8")
                .dataSet(@[@30, @20, @28, @40, @42, @48, @50])
                .groupingSet(false)
            ,
            AAColumn.new
                .nameSet(@"正确做题")
                .colorSet(@"#00D9CD")
                .dataSet(@[@28, @18, @26, @40, @40, @46, @39])
        ])
        ;
}

+ (AAChartModel *)noMoreGroupingAndNestedColumnChart {
    return AAChartModel.new
        .chartTypeSet(AAChartTypeColumn)
        .categoriesSet(@[@"11/23", @"11/24", @"11/25", @"11/26", @"11/27", @"11/28", @"11/29"])
        .yAxisTickPositionsSet(@[@0, @10, @20, @30, @40, @50])
        .yAxisMaxSet(@50)
        .yAxisMinSet(@0)
        .borderRadiusSet(@5)
        .seriesSet(@[
            AAColumn.new
                .nameSet(@"总目标")
                .colorSet(@"DeepSkyBlue")
                .dataSet(@[@30, @20, @28, @40, @42, @48, @50])
                .groupingSet(false)
                .pointPaddingSet(@0.05)
            ,
            AAColumn.new
                .nameSet(@"完成度")
                .colorSet(@"#FF3030")
                .dataSet(@[@28, @18, @26, @40, @40, @46, @39])
                .groupingSet(false)
                .pointPaddingSet(@0.2)
        ])
        ;
}

+ (AAChartModel *)topRoundedCornersStackingColumnChart {
    return AAChartModel.new
        .chartTypeSet(AAChartTypeColumn)
        .stackingSet(AAChartStackingTypeNormal)
        .titleSet(@"Top Rounded Corners Stacking Column Chart")
        .colorsThemeSet(@[@"#fe117c", @"#ffc069", @"#06caf4"])
        .seriesSet(@[
            AASeriesElement.new
                .nameSet(@"Tokyo Hot")
                .borderRadiusSet(@"50%")
                .dataSet(@[@2.10, @2.54, @2.78, @3.62, @4.41, @4.09, @3.83, @4.47, @4.20, @3.94, @3.80, @3.58, @3.19, @4.30, @3.69, @3.52, @3.02, @3.30]),
            
            AASeriesElement.new
                .nameSet(@"Berlin Hot")
                .dataSet(@[@1.56, @1.91, @2.45, @3.87, @3.24, @4.90, @4.61, @4.10, @4.17, @3.85, @4.17, @3.46, @3.46, @3.55, @3.50, @4.13, @2.58, @2.28]),
            
            AASeriesElement.new
                .nameSet(@"Beijing Hot")
                .dataSet(@[@1.16, @1.67, @2.64, @2.86, @3.00, @3.21, @4.14, @4.07, @3.68, @3.11, @3.41, @3.25, @3.32, @3.07, @3.92, @3.05, @2.18, @3.24]),
        ])
        ;
}

+ (AAChartModel *)freeStyleRoundedCornersStackingColumnChart {
    return AAChartModel.new
        .chartTypeSet(AAChartTypeColumn)
        .titleSet(@"Free-Style Rounded Corners Stacking Column Chart")
        .seriesSet(@[
//            AARoundedCornersSeriesElement.new
//                .nameSet(@"Tokyo Hot")
//                .borderRadiusTopLeftSet(@"50%")
//                .borderRadiusTopRightSet(@"50%")
//                .dataSet(@[@2.10, @2.54, @2.78, @3.62, @4.41, @4.09, @3.83, @4.47, @4.20, @3.94, @3.80, @3.58, @3.19, @4.30, @3.69, @3.52, @3.02, @3.30]),
//            
//            AARoundedCornersSeriesElement.new
//                .nameSet(@"Berlin Hot")
//                .borderRadiusBottomLeftSet(@"50%")
//                .borderRadiusBottomRightSet(@"50%")
//                .dataSet(@[@1.56, @1.91, @2.45, @3.87, @3.24, @4.90, @4.61, @4.10, @4.17, @3.85, @4.17, @3.46, @3.46, @3.55, @3.50, @4.13, @2.58, @2.28]),
//            
//            AARoundedCornersSeriesElement.new
//                .nameSet(@"Beijing Hot")
//                .borderRadiusTopLeftSet(@"50%")
//                .borderRadiusBottomRightSet(@"50%")
//                .dataSet(@[@1.16, @1.67, @2.64, @2.86, @3.00, @3.21, @4.14, @4.07, @3.68, @3.11, @3.41, @3.25, @3.32, @3.07, @3.92, @3.05, @2.18, @3.24]),
//            
//            AARoundedCornersSeriesElement.new
//                .nameSet(@"London Hot")
//                .borderRadiusTopRightSet(@"50%")
//                .borderRadiusBottomLeftSet(@"50%")
//                .dataSet(@[@5.59, @3.09, @4.09, @6.14, @5.33, @6.05, @5.71, @6.22, @6.56, @4.75, @5.27, @6.02, @5.22, @5.77, @6.19, @5.68, @4.33, @5.48]),
//            
//            AARoundedCornersSeriesElement.new
//                .nameSet(@"NewYork Hot")
//                .borderRadiusSet(@20)
//                .dataSet(@[@2.10, @2.54, @2.78, @3.62, @4.41, @4.09, @3.83, @4.47, @4.20, @3.94, @3.80, @3.58, @3.19, @4.30, @3.69, @3.52, @3.02, @3.30]),
        ])
        ;
}

+ (AAChartModel *)customBorderStyleAndStatesHoverColorColumnChart {
    return AAChartModel.new
        .chartTypeSet(AAChartTypeColumn)
        .stackingSet(AAChartStackingTypeNormal)
        .colorsThemeSet(@[AAColor.darkGrayColor, AAColor.lightGrayColor])
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
                        .colorSet(@"dodgerblue")))
                .dataSet(@[@0.2, @0.8, @5.7, @11.3, @17.0, @22.0, @24.8, @24.1, @20.1, @14.1, @8.6, @2.5]),
        ])
        ;
}

+ (AAChartModel *)negativeDataMixedPositiveDataColumnChart {
    return AAChartModel.new
        .chartTypeSet(AAChartTypeColumn)
        .categoriesSet(@[
            @"立春", @"雨水", @"惊蛰", @"春分", @"清明", @"谷雨", @"立夏", @"小满", @"芒种", @"夏至", @"小暑", @"大暑",
            @"立秋", @"处暑", @"白露", @"秋分", @"寒露", @"霜降", @"立冬", @"小雪", @"大雪", @"冬至", @"小寒", @"大寒"
        ])
        .tooltipEnabledSet(false)
        .yAxisVisibleSet(false)
        .seriesSet(@[
            AASeriesElement.new
                .nameSet(@"虚构数据")
                .dataSet(({
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
                    newDataArr;
                }))
        ]);
}

+ (AAChartModel *)configureNegativeColorMixedColumnChart {
    return AAChartModel.new
        .dataLabelsEnabledSet(false)
        .seriesSet(@[
            AASeriesElement.new
                .nameSet(@"Column")
                .typeSet(AAChartTypeColumn)
                .dataSet(@[
                    @(-6.4), @(-5.2), @(-3.0), @0.2, @2.3, @5.5, @8.4, @8.3, @5.1, @0.9, @(-1.1), @(-4.0),
                    @(-6.4), @(-5.2), @(-3.0), @0.2, @2.3, @5.5, @8.4, @8.3, @5.1, @0.9, @(-1.1), @(-4.0),
                    @(-6.4), @(-5.2), @(-3.0), @0.2, @2.3, @5.5, @8.4, @8.3, @5.1, @0.9, @(-1.1), @(-4.0),
                ])
                .colorSet(@"#0088FF")
                .negativeColorSet(AAColor.redColor)
                .thresholdSet(@4)
        ])
        ;
}

+ (AAChartModel *)customSingleDataElementSpecialStyleForColumnChart {
    return AAChartModel.new
        .chartTypeSet(AAChartTypeColumn)
        .dataLabelsEnabledSet(false)
        .tooltipEnabledSet(false)
        .markerRadiusSet(@0)
        .xAxisVisibleSet(false)
        .yAxisVisibleSet(false)
        .seriesSet(@[
            AASeriesElement.new
                .nameSet(@"Virtual Data")
                .colorSet(AAGradientColor.oceanBlueColor)
                .dataSet(@[
                    @7.0, @6.9, @2.5, @14.5, @18.2,
                    AADataElement.new
                        .colorSet(AAGradientColor.freshPapayaColor)
                        .ySet(@49.5)
                        ,
                    @5.2, @26.5, @23.3, @26.5, @13.9, @9.6
                ])
        ])
        ;
}

+ (AAChartModel *)customHoverColorAndSelectColorForColumnChart {
    return AAChartModel.new
        .chartTypeSet(AAChartTypeColumn)
        .titleSet(@"Custom Column Chart select color")
        .yAxisReversedSet(true)
        .xAxisReversedSet(true)
        .seriesSet(@[
            AASeriesElement.new
                .nameSet(@"ElementOne")
                .dataSet(@[@211, @183, @157, @133, @111, @91, @73, @57, @43, @31, @21, @13, @7, @3])
                .allowPointSelectSet(true)
                .statesSet(AAStates.new
                    .hoverSet(AAHover.new
                        .colorSet(AARgbaColor(220, 20, 60, 1)))
                    .selectSet(AASelect.new
                        .colorSet(AAColor.redColor)))
        ])
        ;
}

+ (AAChartModel *)customNormalStackingChartDataLabelsContentAndStyleForColumnChart {
    return AAChartModel.new
        .chartTypeSet(AAChartTypeColumn)
        .stackingSet(AAChartStackingTypeNormal)
//        .yAxisGridLineWidthSet(@0)
        .markerRadiusSet(@0)
        .categoriesSet(@[
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
        ])
        .colorsThemeSet(@[
            @"#fe117c",
            @"#ffc069",
            @"#06caf4",
            @"#7dffc0"
        ])
        .seriesSet(@[
            AASeriesElement.new
                .nameSet(@"2017")
                .dataLabelsSet(AADataLabels.new
                    .enabledSet(true)
                    .ySet(@(-10))
                    .formatSet(@"{total} mm")
                    .colorSet(AAColor.redColor)
//                    .shapeSet(AAChartSymbolTypeCallout)
                    .backgroundColorSet(AAColor.whiteColor)
                    .borderColorSet(AAColor.redColor)
                    .borderRadiusSet(@1)
                    .borderWidthSet(@1))
                .dataSet(@[@7.0, @6.9, @9.5, @14.5, @18.2, @21.5, @25.2, @26.5, @23.3, @18.3, @13.9, @9.6]),
            AASeriesElement.new
                .nameSet(@"2018")
                .dataSet(@[@0.2, @0.8, @5.7, @11.3, @17.0, @22.0, @24.8, @24.1, @20.1, @14.1, @8.6, @2.5]),
            AASeriesElement.new
                .nameSet(@"2019")
                .dataSet(@[@0.9, @0.6, @3.5, @8.4, @13.5, @17.0, @18.6, @17.9, @14.3, @9.0, @3.9, @1.0]),
            AASeriesElement.new
                .nameSet(@"2020")
                .dataSet(@[@3.9, @4.2, @5.7, @8.5, @11.9, @15.2, @17.0, @16.6, @14.2, @10.3, @6.6, @4.8])
        ])
        ;
}

+ (AAChartModel *)customAnimationForColumnChart {
    return AAChartModel.new
        .chartTypeSet(AAChartTypeColumn)
        .categoriesSet(@[@"Monday", @"Tuesday", @"Wednesday", @"Thursday", @"Friday"])
        .seriesSet(@[
//            AASeriesElement.new
//                .dataSet(@[@29.9, @71.5, @106.4, @129.2, @111])
//                .animationSet(AAAnimation.new
//                    .durationSet(@2000)
//                    .easingSet(AAChartAnimationEaseOutBounce))
//            ,
//            AASeriesElement.new
//                .dataSet(@[@29.9, @71.5, @106.4, @129.2, @111])
//                .animationSet(AAAnimation.new
//                    .durationSet(@1500)
//                    .easingSet(AAChartAnimationEaseOutBounce))
        ])
        ;
}

@end
