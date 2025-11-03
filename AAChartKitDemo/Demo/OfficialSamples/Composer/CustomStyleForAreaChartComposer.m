#import "CustomStyleForAreaChartComposer.h"
#import "AAChartKit.h"

@implementation CustomStyleForAreaChartComposer

+ (AAChartModel *)withMinusNumberAreaChart {
    return AAChartModel.new
        .chartTypeSet(AAChartTypeArea)
        .titleSet(@"带有负数的区域填充图")
        .markerRadiusSet(@0)
        .subtitleSet(@"横屏查看效果更佳")
//        .yAxisGridLineWidthSet(@0)
        .dataLabelsEnabledSet(false)
        .categoriesSet(@[@"Java", @"Swift", @"Python", @"Ruby", @"PHP", @"Go",
                         @"C", @"C#", @"C++", @"Objective-C", @"Kotlin", @"Rust"])
        .colorsThemeSet(@[@"#49C1B6", @"#FDC20A", @"#F78320", @"#068E81", @"#EA007B"])
        .seriesSet(@[
            AASeriesElement.new
                .nameSet(@"2021")
                .dataSet(@[@0, @(-7.5), @(-1.0), @3.7, @0, @(-3), @8, @0, @(-3.6), @4, @(-2), @0]),
            AASeriesElement.new
                .nameSet(@"2022")
                .dataSet(@[@0, @(-2.2), @2, @(-2.2), @0, @(-1.5), @0, @2.4, @(-1), @3, @(-1), @0]),
            AASeriesElement.new
                .nameSet(@"2023")
                .dataSet(@[@0, @2.3, @0, @1.2, @(-1), @3, @0, @(-3.3), @0, @2, @(-0.3), @0]),
            AASeriesElement.new
                .nameSet(@"2024")
                .dataSet(@[@0, @10, @0.13, @2, @0, @2, @0, @3.7, @0, @1, @(-3), @0]),
            AASeriesElement.new
                .nameSet(@"2025")
                .dataSet(@[@0, @(-4.5), @(-0.9), @5.5, @(-1.9), @1.3, @(-2.8), @0, @(-1.7), @0, @3, @0]),
        ])
        ;
}

+ (AAChartModel *)colorfulGradientAreaChart {
                                                            
    
    return AAChartModel.new
        .chartTypeSet(AAChartTypeArea)
        .categoriesSet(@[@"一月", @"二月", @"三月", @"四月", @"五月", @"六月",
                         @"七月", @"八月", @"九月", @"十月", @"十一月", @"十二月"])
        .backgroundColorSet(AAColor.whiteColor)
        .markerRadiusSet(@0)
        .legendEnabledSet(false)
        .dataLabelsEnabledSet(false)
        .seriesSet(@[
            AASeriesElement.new
                .nameSet(@"Tokyo Hot")
                .colorSet([AAGradientColor gradientColorWithDirection:AALinearGradientDirectionToRight
                                                                 stopsArray:@[
                                                                     @[@0.0, @"#febc0f"],
                                                                     @[@0.5, @"#FF14d4"],
                                                                     @[@1.0, @"#0bf8f5"]
                                                                 ]])
                .dataSet(@[@7.0, @6.9, @2.5, @14.5, @18.2, @21.5, @5.2, @26.5, @23.3, @45.3, @13.9, @9.6]),
        ])
        ;
}

+ (AAChartModel *)gradientColorAreaChart {
    return AAChartModel.new
        .chartTypeSet(AAChartTypeArea)
        .categoriesSet(@[@"一月", @"二月", @"三月", @"四月", @"五月", @"六月",
                         @"七月", @"八月", @"九月", @"十月", @"十一月", @"十二月"])
        .markerRadiusSet(@8)
        .markerSymbolStyleSet(AAChartSymbolStyleTypeInnerBlank)
        .markerSymbolSet(AAChartSymbolTypeCircle)
        .legendEnabledSet(false)
        .dataLabelsEnabledSet(false)
        .seriesSet(@[
            AASeriesElement.new
                .nameSet(@"Tokyo Hot")
                .lineWidthSet(@5.0)
                .colorSet(AARgbaColor(220, 20, 60, 1))
                .fillColorSet([AAGradientColor gradientColorWithDirection:AALinearGradientDirectionToBottom
                                                                startColorString:AARgbaColor(255, 20, 147, 1)
                                                                  endColorString:AARgbaColor(255, 20, 147, 0.3)])
                .dataSet(@[@7.0, @6.9, @2.5, @14.5, @18.2, @21.5, @5.2, @26.5, @23.3, @45.3, @13.9, @9.6]),
        ])
        ;
}

+ (AAChartModel *)thresholdForAreaChart {
    return AAChartModel.new
        .chartTypeSet(AAChartTypeArea)
//        .yAxisGridLineWidthSet(@0)
        .categoriesSet(@[@"Jan", @"Feb", @"Mar", @"Apr", @"May", @"Jun",
                         @"July", @"Aug", @"Spe", @"Oct", @"Nov", @"Dec"])
        .dataLabelsEnabledSet(false)
        .markerRadiusSet(@8)
        .markerSymbolSet(AAChartSymbolTypeCircle)
        .markerSymbolStyleSet(AAChartSymbolStyleTypeInnerBlank)
        .legendEnabledSet(false)
        .seriesSet(@[
            AASeriesElement.new
                .thresholdSet(@(-200))
                .dataSet(@[@106.4, @129.2, @269.9, @(-100.5), @144.0, @176.0, @135.6, @148.5, @216.4, @194.1, @95.6, @54.4])
                .lineWidthSet(@6)
                .colorSet(AARgbaColor(30, 144, 255, 1))
                .fillColorSet([AAGradientColor gradientColorWithDirection:AALinearGradientDirectionToBottom
                                                                startColorString:AARgbaColor(30, 144, 255, 1)
                                                                  endColorString:AARgbaColor(30, 144, 255, 0.1)])
        ])
        ;
}

+ (AAChartModel *)customSpecialStyleDataLabelOfSingleDataElementForAreaChart {
    return AAChartModel.new
        .chartTypeSet(AAChartTypeArea)
        .backgroundColorSet(@"#4b2b7f")
        .dataLabelsEnabledSet(false)
        .tooltipEnabledSet(true)
        .markerRadiusSet(@0)
        .xAxisVisibleSet(false)
        .yAxisVisibleSet(false)
        .seriesSet(@[
            AASeriesElement.new
                .nameSet(@"Virtual Data")
                .lineWidthSet(@6)
                .colorSet(AARgbaColor(255, 215, 0, 1))
                .fillColorSet([AAGradientColor gradientColorWithDirection:AALinearGradientDirectionToBottom
                                                                startColorString:AARgbaColor(255, 215, 0, 0.1)
                                                                  endColorString:AARgbaColor(255, 215, 0, 0.6)])
                .dataSet(@[
                    @7.0, @6.9, @2.5, @14.5, @18.2,
                    AADataElement.new
                        .dataLabelsSet(AADataLabels.new
                            .enabledSet(true)
                            .useHTMLSet(true)
                            .formatSet(@"<img src=https://www.highcharts.com/samples/graphics/sun.png>"
                                       @"<span style=color:#FFFFFF;font-weight:thin;font-size:25px>{y}</span>"
                                       @"<span style=color:#FFFFFF;font-weight:thin;font-size:17px> m</span>")
                            .styleSet(AAStyle.new
                                .fontWeightSet(AAChartFontWeightTypeBold)
                                .colorSet(AAColor.whiteColor)
                                .fontSizeSet(@16))
                            .ySet(@(-35))
                            .alignSet(AAChartAlignTypeCenter)
                            .verticalAlignSet(AAChartVerticalAlignTypeTop)
                            .overflowSet(@"none")
                            .cropSet(false))
                        .ySet(@26.5),
                    @5.2, @26.5, @23.3, @45.3, @13.9, @9.6
                ])
        ])
        ;
}

+ (AAChartModel *)customMarkerStatesHoverStyleForAreaChart {
    return AAChartModel.new
        .chartTypeSet(AAChartTypeArea)
        .titleSet(@"Custom Spline Chart Marker States Hover Style")
        .categoriesSet(@[@"一月", @"二月", @"三月", @"四月", @"五月", @"六月",
                         @"七月", @"八月", @"九月", @"十月", @"十一月", @"十二月"])
        .markerRadiusSet(@8.0)
        .yAxisLineWidthSet(@0)
//        .yAxisGridLineWidthSet(@0)
        .legendEnabledSet(false)
        .seriesSet(@[
            AASeriesElement.new
                .nameSet(@"Tokyo Hot")
                .lineWidthSet(@5.0)
                .colorSet(AARgbaColor(220, 20, 60, 1))
                .markerSet(AAMarker.new
                    .statesSet(AAMarkerStates.new
                        .hoverSet(AAMarkerHover.new
                            .fillColorSet(AAColor.whiteColor)
                            .radiusSet(@40)
                            .lineColorSet(AAColor.greenColor)
                            .lineWidthSet(@20))))
                .dataSet(@[@7.0, @6.9, @2.5, @14.5, @18.2, @21.5, @5.2, @26.5, @23.3, @45.3, @13.9, @9.6]),
        ])
        ;
}

+ (AAChartModel *)colorfulGradientColorAndColorfulDataLabelsStepAreaChart {
    return AAChartModel.new
        .chartTypeSet(AAChartTypeArea)
        .yAxisVisibleSet(false)
        .stackingSet(AAChartStackingTypeNormal)
        .colorsThemeSet(@[@"#1e90ff", @"#ef476f", @"#ffd066", @"#04d69f"])
        .markerSymbolSet(AAChartSymbolTypeCircle)
        .markerRadiusSet(@5)
        .dataLabelsEnabledSet(true)
        .markerSymbolStyleSet(AAChartSymbolStyleTypeInnerBlank)
        .seriesSet(@[
            AASeriesElement.new
                .nameSet(@"2017")
                .fillColorSet([AAGradientColor gradientColorWithDirection:AALinearGradientDirectionToBottom
                                                                     stopsArray:@[
                                                                         @[@0.0, AARgbaColor(30, 144, 255, 1.0)],
                                                                         @[@0.6, AARgbaColor(30, 144, 255, 0.2)],
                                                                         @[@1.0, AARgbaColor(30, 144, 255, 0.0)]
                                                                     ]])
                .lineWidthSet(@6)
                .stepSet(@(true))
                .dataLabelsSet(AADataLabels.new
//                    .styleSet([AAStyle styleWithColor:@"#1e90ff" fontSize:@11])
            )
                .dataSet(@[@2.10, @2.54, @2.78, @3.62, @4.41, @4.09, @3.83, @4.47, @4.20, @3.94, @3.80, @3.58, @3.19, @4.30, @3.69, @3.52, @3.02, @3.30]),
            AASeriesElement.new
                .nameSet(@"2018")
                .fillColorSet([AAGradientColor gradientColorWithDirection:AALinearGradientDirectionToBottom
                                                                     stopsArray:@[
                                                                         @[@0.0, AARgbaColor(255, 0, 0, 1.0)],
                                                                         @[@0.6, AARgbaColor(255, 0, 0, 0.2)],
                                                                         @[@1.0, AARgbaColor(255, 0, 0, 0.0)]
                                                                     ]])
                .lineWidthSet(@6)
                .stepSet(@(true))
                .dataLabelsSet(AADataLabels.new
//                    .styleSet([AAStyle styleWithColor:@"#ef476f" fontSize:@11])
            )
                .dataSet(@[@1.56, @1.91, @2.45, @3.87, @3.24, @4.90, @4.61, @4.10, @4.17, @3.85, @4.17, @3.46, @3.46, @3.55, @3.50, @4.13, @2.58, @2.28]),
            AASeriesElement.new
                .nameSet(@"2019")
                .fillColorSet([AAGradientColor gradientColorWithDirection:AALinearGradientDirectionToBottom
                                                                     stopsArray:@[
                                                                         @[@0.0, AARgbaColor(255, 215, 0, 1.0)],
                                                                         @[@0.6, AARgbaColor(255, 215, 0, 0.2)],
                                                                         @[@1.0, AARgbaColor(255, 215, 0, 0.0)]
                                                                     ]])
                .lineWidthSet(@6)
                .stepSet(@(true))
                .dataLabelsSet(AADataLabels.new
//                    .styleSet([AAStyle styleWithColor:@"#ffd066" fontSize:@11])
            )
                .dataSet(@[@1.16, @1.67, @2.64, @2.86, @3.00, @3.21, @4.14, @4.07, @3.68, @3.11, @3.41, @3.25, @3.32, @3.07, @3.92, @3.05, @2.18, @3.24]),
            AASeriesElement.new
                .nameSet(@"2020")
                .fillColorSet([AAGradientColor gradientColorWithDirection:AALinearGradientDirectionToBottom
                                                                     stopsArray:@[
                                                                         @[@0.0, AARgbaColor(50, 205, 50, 1.0)],
                                                                         @[@0.6, AARgbaColor(50, 205, 50, 0.2)],
                                                                         @[@1.0, AARgbaColor(50, 205, 50, 0.0)]
                                                                     ]])
                .lineWidthSet(@6)
                .stepSet(@(true))
                .dataLabelsSet(AADataLabels.new
//                    .styleSet([AAStyle styleWithColor:@"#04d69f" fontSize:@11])
            )
                .dataSet(@[@5.59, @3.09, @4.09, @6.14, @5.33, @6.05, @5.71, @6.22, @6.56, @4.75, @5.27, @6.02, @5.22, @5.77, @6.19, @5.68, @4.33, @5.48]),
        ])
        ;
}

+ (AAChartModel *)negativeColorMixedAreaChart {
    return AAChartModel.new
        .chartTypeSet(AAChartTypeArea)
        .legendEnabledSet(false)
        .dataLabelsEnabledSet(false)
        .markerRadiusSet(@5)
        .markerSymbolStyleSet(AAChartSymbolStyleTypeInnerBlank)
//        .yAxisGridLineWidthSet(@0)
        .seriesSet(@[
            AASeriesElement.new
                .nameSet(@"Column")
                .dataSet(@[
                    @(+7.0), @(+6.9), @(+2.5), @(+14.5), @(+18.2), @(+21.5), @(+5.2), @(+26.5), @(+23.3), @(+45.3), @(+13.9), @(+9.6),
                    @(-7.0), @(-6.9), @(-2.5), @(-14.5), @(-18.2), @(-21.5), @(-5.2), @(-26.5), @(-23.3), @(-45.3), @(-13.9), @(-9.6),
                ])
                .lineWidthSet(@5)
                .colorSet(AARgbaColor(30, 144, 255, 1.0))
                .negativeColorSet(AARgbaColor(255, 0, 0, 1.0))
                .fillColorSet([AAGradientColor gradientColorWithDirection:AALinearGradientDirectionToTop
                                                                     stopsArray:@[
                                                                         @[@0.0, AARgbaColor(30, 144, 255, 0.0)],
                                                                         @[@0.5, AARgbaColor(30, 144, 255, 0.0)],
                                                                         @[@1.0, AARgbaColor(30, 144, 255, 0.6)]
                                                                     ]])
                .negativeFillColorSet([AAGradientColor gradientColorWithDirection:AALinearGradientDirectionToTop
                                                                              stopsArray:@[
                                                                                  @[@0.0, AARgbaColor(255, 0, 0, 0.6)],
                                                                                  @[@0.5, AARgbaColor(255, 0, 0, 0.0)],
                                                                                  @[@1.0, AARgbaColor(255, 0, 0, 0.0)]
                                                                              ]])
                .thresholdSet(@0)
        ])
        ;
}

+ (AAChartModel *)customColorfulGradientColorZonesForAreaChart {
    return AAChartModel.new
        .chartTypeSet(AAChartTypeArea)
        .backgroundColorSet(AAColor.blackColor)
        .categoriesSet(@[
            @"Jan", @"Feb", @"Mar", @"Apr", @"May", @"Jun",
            @"Jul", @"Aug", @"Sep", @"Oct", @"Nov", @"Dec"
        ])
        .dataLabelsEnabledSet(false)
        .legendEnabledSet(false)
        .markerRadiusSet(@0)
//        .xAxisLabelsStyleSet([AAStyle styleWithColor:AAColor.whiteColor fontSize:@12 weight:AAChartFontWeightTypeRegular])
//        .yAxisLabelsStyleSet([AAStyle styleWithColor:AAColor.lightGrayColor fontSize:@15 weight:AAChartFontWeightTypeBold])
        .seriesSet(@[
            AASeriesElement.new
                .nameSet(@"空气湿度")
                .lineWidthSet(@6)
                .zoneAxisSet(@"x")
                .zonesSet(@[
                    AAZonesElement.new
                        .valueSet(@2)
                        .colorSet(AAColor.redColor)
                        .fillColorSet([AAGradientColor gradientColorWithDirection:AALinearGradientDirectionToBottom
                                                                             stopsArray:@[
                                                                                 @[@0.0, AARgbaColor(255, 0, 0, 1.0)],
                                                                                 @[@1.0, AAColor.clearColor]
                                                                             ]]),
                    AAZonesElement.new
                        .valueSet(@5)
                        .colorSet(AAColor.greenColor)
                        .fillColorSet([AAGradientColor gradientColorWithDirection:AALinearGradientDirectionToBottom
                                                                             stopsArray:@[
                                                                                 @[@0.0, AARgbaColor(0, 255, 0, 1.0)],
                                                                                 @[@1.0, AAColor.clearColor]
                                                                             ]]),
                    AAZonesElement.new
                        .colorSet(AAColor.blueColor)
                        .fillColorSet([AAGradientColor gradientColorWithDirection:AALinearGradientDirectionToBottom
                                                                             stopsArray:@[
                                                                                 @[@0.0, AARgbaColor(0, 0, 255, 1.0)],
                                                                                 @[@1.0, AAColor.clearColor]
                                                                             ]]),
                ])
                .dataSet(@[
                    @56.5, @33.3, @85.3, @23.9, @29.6, @34.5, @28.2, @26.5, @15.2, @56.5, @33.3,
                    AADataElement.new
                        .markerSet(AAMarker.new
                            .radiusSet(@8)
                            .symbolSet(AAChartSymbolTypeCircle)
                            .fillColorSet(AAColor.whiteColor)
                            .lineWidthSet(@5)
                            .lineColorSet(@"#1E90FF"))
                        .dataLabelsSet(AADataLabels.new
                            .enabledSet(true)
                            .allowOverlapSet(true)
                            .useHTMLSet(true)
                            .backgroundColorSet(AARgbaColor(65, 111, 166, 1.0))
                            .borderRadiusSet(@10)
                            .shapeSet(@"callout")
                            .formatSet(@"{point.category}<br>{series.name}: {point.y} %")
//                            .styleSet([AAStyle styleWithColor:AAColor.whiteColor fontSize:@12 weight:AAChartFontWeightTypeBold])
                            .xSet(@(-80)).ySet(@5)
                            .alignSet(AAChartAlignTypeCenter)
                            .overflowSet(@"none")
                            .verticalAlignSet(AAChartVerticalAlignTypeTop)
                            .cropSet(false))
                        .ySet(@85.3)
                ]),
        ])
        ;
}

@end
