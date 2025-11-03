#import "CustomStyleForLineChartComposer.h"
#import "AAChartKit.h"
#import "CustomStyleForScatterChartComposer.h"

@implementation CustomStyleForLineChartComposer

+ (AAChartModel *)mixedLineChart {
    return AAChartModel.new
        .chartTypeSet(AAChartTypeLine)
        .subtitleSet(@"虚拟数据")
        .categoriesSet(@[@"Java", @"Swift", @"Python", @"Ruby", @"PHP", @"Go", @"C", @"C#", @"C++", @"Perl", @"R", @"MATLAB", @"SQL"])
        .yAxisTitleSet(@"摄氏度")
        .dataLabelsEnabledSet(true)
        .seriesSet(@[
            AASeriesElement.new
                .nameSet(@"本专业")
                .dataSet(@[@45, @88, @49, @43, @65, @56, @47, @28, @49, @44, @89, @55])
                .zoneAxisSet(AAChartZoneAxisTypeX)
                .colorSet((id)[AAGradientColor freshPapayaColor])
                .lineWidthSet(@5)
                .zonesSet(@[
                    AAZonesElement.new
                        .valueSet(@8)
                        .dashStyleSet(AAChartLineDashStyleTypeDot)
                ]),
            AASeriesElement.new
                .nameSet(@"所有专业")
                .colorSet((id)[AAGradientColor pixieDustColor])
                .lineWidthSet(@5)
                .dataSet(@[NSNull.null, NSNull.null, @100, @109, @89, NSNull.null, NSNull.null, @120, NSNull.null, NSNull.null, NSNull.null, NSNull.null])
        ])
        ;
}

+ (AAChartModel *)stepLineChart {
    return AAChartModel.new
        .chartTypeSet(AAChartTypeLine)
//        .animationTypeSet(AAChartAnimationTypeBounce)
        .titleSet(@"STEP LINE CHART")
        .subtitleSet(@"2020/08/08")
        .dataLabelsEnabledSet(false)
        .markerSymbolStyleSet(AAChartSymbolStyleTypeBorderBlank)
        .markerRadiusSet(@7)
        .seriesSet(@[
            AASeriesElement.new
                .nameSet(@"Berlin")
                .dataSet(@[@450, @432, @401, @454, @590, @530, @510])
//                .stepSet(AASeriesStepTypeRight)
            ,
            AASeriesElement.new
                .nameSet(@"New York")
                .dataSet(@[@220, @282, @201, @234, @290, @430, @410])
//                .stepSet(AASeriesStepTypeCenter)
            ,
            AASeriesElement.new
                .nameSet(@"Tokyo")
                .dataSet(@[@120, @132, @101, @134, @90, @230, @210])
//                .stepSet(AASeriesStepTypeLeft)
            ,
        ])
        ;
}

+ (AAChartModel *)stepAreaChart {
    return AAChartModel.new
        .chartTypeSet(AAChartTypeArea)
//        .animationTypeSet(AAChartAnimationTypeBounce)
        .titleSet(@"STEP AREA CHART")
        .subtitleSet(@"2020/08/08")
        .dataLabelsEnabledSet(false)
        .markerSymbolStyleSet(AAChartSymbolStyleTypeInnerBlank)
        .markerRadiusSet(@0)
        .seriesSet(@[
            AASeriesElement.new
                .nameSet(@"Berlin")
                .dataSet(@[@450, @432, @401, @454, @590, @530, @510])
                .stepSet(@(true)),
            AASeriesElement.new
                .nameSet(@"New York")
                .dataSet(@[@220, @282, @201, @234, @290, @430, @410])
                .stepSet(@(true)),
            AASeriesElement.new
                .nameSet(@"Tokyo")
                .dataSet(@[@120, @132, @101, @134, @90, @230, @210])
                .stepSet(@(true)),
        ])
        ;
}

+ (AAChartModel *)customSingleDataLabelForLineChart {
    return AAChartModel.new
        .titleSet(@"单独自定义某个指定数据元素的DataLabel")
        .colorsThemeSet(@[(id)[AAGradientColor mysticMauveColor]])
        .seriesSet(@[
            AASeriesElement.new
                .nameSet(@"货币")
                .dataSet(@[
                    @0.38, @0.31, @0.32, @0.32, @0.64, @0.66, @0.86,
                    AADataElement.new
                        .ySet(@1.25)
                        .dataLabelsSet(AADataLabels.new
                            .enabledSet(true)
                            .formatSet(@"{y} 美元🇺🇸💲")
                            .xSet(@3)
//                            .verticalAlignSet(AAVerticalAlignTypeMiddle)
                            .styleSet(AAStyle.new
                                .colorSet(AAColor.redColor)
                                .fontSizeSet(@20)
//                                .fontWeightSet(AAFontWeightTypeBold)
//                                .outlineSet(@"1px 1px contrast")
                    ))
                        ,
                    @0.52, @0.75, @0.52, @0.56, @0.54, @0.60, @0.46, @0.63, @0.54, @0.51, @0.58, @0.64, @0.60, @0.45, @0.36, @0.67
                ])
        ])
        ;
}

+ (AAChartModel *)shadowStyleLineChart {
    return AAChartModel.new
        .yAxisVisibleSet(false)
        .chartTypeSet(AAChartTypeLine)
        .legendEnabledSet(false)
        .categoriesSet(@[@"一月", @"二月", @"三月", @"四月", @"五月", @"六月", @"七月", @"八月", @"九月", @"十月", @"十一月", @"十二月"])
        .markerSymbolStyleSet(AAChartSymbolStyleTypeInnerBlank)
        .markerRadiusSet(@8)
        .dataLabelsEnabledSet(false)
        .seriesSet(@[
            AASeriesElement.new
                .nameSet(@"Tokyo")
                .lineWidthSet(@8.0)
                .dataSet(@[@7.0, @6.9, @2.5, @14.5, @18.2, @21.5, @5.2, @26.5, @23.3, @45.3, @13.9, @9.6])
                .shadowSet(AAShadow.new
                    .colorSet(AAColor.redColor)
                    .offsetXSet(@15.0)
                    .offsetYSet(@15.0)
                    .opacitySet(@0.2)
                    .widthSet(@8.0))
        ])
        ;
}

+ (AAChartModel *)colorfulGradientLineChart {
    return AAChartModel.new
        .chartTypeSet(AAChartTypeLine)
        .categoriesSet(@[@"一月", @"二月", @"三月", @"四月", @"五月", @"六月",
                         @"七月", @"八月", @"九月", @"十月", @"十一月", @"十二月"])
        .markerRadiusSet(@0)
        .legendEnabledSet(false)
        .dataLabelsEnabledSet(false)
        .seriesSet(@[
            AASeriesElement.new
                .nameSet(@"Tokyo Hot")
                .lineWidthSet(@13)
//                .colorSet((id)[AAGradientColor linearGradientWithDirection:AALinearGradientDirectionToRight
//                                                                     stops:@[
//                                                                         @[@0.00, @"#febc0f"],
//                                                                         @[@0.25, @"#FF14d4"],
//                                                                         @[@0.50, @"#0bf8f5"],
//                                                                         @[@0.75, @"#F33c52"],
//                                                                         @[@1.00, @"#1904dd"],
//                                                                     ]])
                .dataSet(@[@7.0, @6.9, @2.5, @14.5, @18.2, @21.5, @5.2, @26.5, @23.3, @45.3, @13.9, @9.6]),
        ])
        ;
}

+ (AAChartModel *)customMarkerSymbolContentLineChart {
    AAChartModel *aaChartModel = [CustomStyleForScatterChartComposer customScatterChartMarkerSymbolContent];
    aaChartModel.chartType = AAChartTypeLine;
    return aaChartModel;
}

+ (AAChartModel *)drawPointsWithCoordinatesForLineChart {
    return AAChartModel.new
        .chartTypeSet(AAChartTypeLine)
        .titleSet(@"Draw Line Chart With Points Coordinates")
        .markerSymbolStyleSet(AAChartSymbolStyleTypeBorderBlank)
        .markerRadiusSet(@7)
        .seriesSet(@[
            AASeriesElement.new
                .nameSet(@"Blue Dot")
                .dataSet(@[
                    @[@0, @200],
                    @[@0, @300],
                    @[@0, @400],
                    @[@1, @100],
                    @[@2, @120],
                    @[@3, @130]
                ])
        ])
        ;
}

+ (AAChartModel *)customHoverAndSelectHaloStyleForLineChart {
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
                .allowPointSelectSet(true)
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
                                .fillSet(AARgbaColor(138, 43, 226, 1))
                                .strokeSet(AARgbaColor(30, 144, 255, 1))))))
        ])
        ;
}

+ (AAChartModel *)disableSomeOfLinesMouseTrackingEffectForLineChart {
    return AAChartModel.new
        .chartTypeSet(AAChartTypeLine)
        .tooltipValueSuffixSet(@"万元")
        .yAxisTitleSet(@"万元")
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
                .enableMouseTrackingSet(false)
                .dataSet(@[@0.2, @0.8, @5.7, @11.3, @17.0, @22.0, @24.8, @24.1, @20.1, @14.1, @8.6, @2.5]),
            AASeriesElement.new
                .nameSet(@"2019")
                .enableMouseTrackingSet(false)
                .dataSet(@[@0.9, @0.6, @3.5, @8.4, @13.5, @17.0, @18.6, @17.9, @14.3, @9.0, @3.9, @1.0]),
            AASeriesElement.new
                .nameSet(@"2020")
                .enableMouseTrackingSet(false)
                .dataSet(@[@3.9, @4.2, @5.7, @8.5, @11.9, @15.2, @17.0, @16.6, @14.2, @10.3, @6.6, @4.8]),
        ])
        ;
}

+ (AAChartModel *)colorfulShadowLineChart {
    return AAChartModel.new
        .chartTypeSet(AAChartTypeLine)
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
        ])
        ;
}

+ (AAChartModel *)colorfulDataLabelsStepLineChart {
    return AAChartModel.new
        .chartTypeSet(AAChartTypeLine)
        .yAxisVisibleSet(false)
        .stackingSet(AAChartStackingTypeNormal)
        .colorsThemeSet(@[@"#1e90ff", @"#ef476f", @"#ffd066", @"#04d69f"])
        .markerSymbolSet(AAChartSymbolTypeCircle)
        .markerRadiusSet(@8.0)
        .markerSymbolStyleSet(AAChartSymbolStyleTypeInnerBlank)
        .dataLabelsEnabledSet(true)
        .seriesSet(@[
            AASeriesElement.new
                .nameSet(@"2017")
                .fillOpacitySet(@1.0)
                .stepSet(@(true))
                .dataLabelsSet(AADataLabels.new
                    .styleSet(AAStyle.new
                        .colorSet(@"#1e90ff")
                        .fontSizeSet(@11)))
                .dataSet(@[@2.10, @2.54, @2.78, @3.62, @4.41, @4.09, @3.83, @4.47, @4.20, @3.94, @3.80, @3.58, @3.19, @4.30, @3.69, @3.52, @3.02, @3.30]),
            AASeriesElement.new
                .nameSet(@"2018")
                .fillOpacitySet(@1.0)
                .stepSet(@(true))
                .dataLabelsSet(AADataLabels.new
                    .styleSet(AAStyle.new
                        .colorSet(@"#ef476f")
                        .fontSizeSet(@11)))
                .dataSet(@[@1.56, @1.91, @2.45, @3.87, @3.24, @4.90, @4.61, @4.10, @4.17, @3.85, @4.17, @3.46, @3.46, @3.55, @3.50, @4.13, @2.58, @2.28]),
            AASeriesElement.new
                .nameSet(@"2019")
                .fillOpacitySet(@1.0)
                .stepSet(@(true))
                .dataLabelsSet(AADataLabels.new
                    .styleSet(AAStyle.new
                        .colorSet(@"#ffd066")
                        .fontSizeSet(@11)))
                .dataSet(@[@1.16, @1.67, @2.64, @2.86, @3.00, @3.21, @4.14, @4.07, @3.68, @3.11, @3.41, @3.25, @3.32, @3.07, @3.92, @3.05, @2.18, @3.24]),
            AASeriesElement.new
                .nameSet(@"2020")
                .fillOpacitySet(@1.0)
                .stepSet(@(true))
                .dataLabelsSet(AADataLabels.new
                    .styleSet(AAStyle.new
                        .colorSet(@"#04d69f")
                        .fontSizeSet(@11)))
                .dataSet(@[@5.59, @3.09, @4.09, @6.14, @5.33, @6.05, @5.71, @6.22, @6.56, @4.75, @5.27, @6.02, @5.22, @5.77, @6.19, @5.68, @4.33, @5.48]),
        ])
        ;
}

+ (AAChartModel *)disableMarkerHoverEffectForLineChart {
    return AAChartModel.new
        .chartTypeSet(AAChartTypeLine)
        .titleSet(@"Disable Spline Chart Marker Hover Effect")
        .categoriesSet(@[
            @"一月", @"二月", @"三月", @"四月", @"五月", @"六月",
            @"七月", @"八月", @"九月", @"十月", @"十一月", @"十二月"
        ])
        .markerRadiusSet(@0)
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
                            .enabledSet(false))))
                .dataSet(@[@7.0, @6.9, @2.5, @14.5, @18.2, @21.5, @5.2, @26.5, @23.3, @45.3, @13.9, @9.6])
        ])
        ;
}

+ (AAChartModel *)maxAndMinDataLabelsForLineChart {
    AADataLabels *aaDataLabels = AADataLabels.new
        .enabledSet(true)
        .formatSet(@"{y} 美元")
//        .shapeSet(AADataLabelsShapeTypeCallout)
        .styleSet(AAStyle.new
            .colorSet(AAColor.redColor)
            .fontSizeSet(@15)
//            .fontWeightSet(AAFontWeightTypeBold)
                  )
        .backgroundColorSet(AAColor.whiteColor)
        .borderColorSet(AAColor.redColor)
        .borderRadiusSet(@1.5)
        .borderWidthSet(@1.3);
    
    id minData = AADataElement.new
        .dataLabelsSet(aaDataLabels)
        .ySet(@2.5)
        ;
    
    id maxData = AADataElement.new
        .dataLabelsSet(aaDataLabels)
        .ySet(@49.5)
    ;
    
    return AAChartModel.new
        .chartTypeSet(AAChartTypeLine)
        .dataLabelsEnabledSet(false)
        .tooltipEnabledSet(false)
        .markerRadiusSet(@0)
        .xAxisVisibleSet(false)
        .yAxisVisibleSet(false)
        .seriesSet(@[
            AASeriesElement.new
                .nameSet(@"Show The Max and Min values Data Labels")
                .lineWidthSet(@7)
                .dataSet(@[@7.0, @6.9, minData, @14.5, @18.2, maxData, @5.2, @26.5, @23.3, @26.5, @13.9, @9.6])
                .colorSet((id)[AAGradientColor oceanBlueColor])
        ])
        ;
}

+ (AAChartModel *)dashStyleTypesMixedLineChart {
    NSArray *dataArr = @[@50, @320, @230, @370, @230, @400];
    float lineWidth = 3;
    
    return AAChartModel.new
        .chartTypeSet(AAChartTypeLine)
        .dataLabelsEnabledSet(false)
        .stackingSet(AAChartStackingTypeNormal)
        .markerRadiusSet(@0)
        .seriesSet(@[
            AASeriesElement.new
                .nameSet(@"Solid")
                .lineWidthSet(@(lineWidth))
                .dataSet(dataArr),
            AASeriesElement.new
                .nameSet(@"Dash")
                .lineWidthSet(@(lineWidth))
                .dashStyleSet(AAChartLineDashStyleTypeDash)
                .dataSet(dataArr),
            AASeriesElement.new
                .nameSet(@"DashDot")
                .lineWidthSet(@(lineWidth))
                .dashStyleSet(AAChartLineDashStyleTypeDashDot)
                .dataSet(dataArr),
            AASeriesElement.new
                .nameSet(@"LongDash")
                .lineWidthSet(@(lineWidth))
                .dashStyleSet(AAChartLineDashStyleTypeLongDash)
                .dataSet(dataArr),
            AASeriesElement.new
                .nameSet(@"LongDashDot")
                .lineWidthSet(@(lineWidth))
                .dashStyleSet(AAChartLineDashStyleTypeLongDashDot)
                .dataSet(dataArr),
        ])
        ;
}

+ (AAChartModel *)allLineDashStyleTypesMixedLineChart {
    NSArray *dataArr = @[@50, @620, @230, @370, @130, @720, @230, @570, @230, @400, @100];
    float lineWidth = 3;
    
    return AAChartModel.new
        .chartTypeSet(AAChartTypeLine)
        .yAxisVisibleSet(true)
        .colorsThemeSet(@[@"#eb2100", @"#eb3600", @"#d0570e", @"#d0a00e", @"#34da62", @"#00e9db", @"#00c0e9", @"#0096f3", @"#33CCFF", @"#33FFCC"])
        .tooltipValueSuffixSet(@"℃")
//        .yAxisGridLineWidthSet(@0)
        .stackingSet(AAChartStackingTypeNormal)
        .markerRadiusSet(@0)
        .seriesSet(@[
            AASeriesElement.new
                .nameSet(@"Solid")
                .lineWidthSet(@(lineWidth))
                .dataSet(dataArr),
            AASeriesElement.new
                .nameSet(@"ShortDash")
                .lineWidthSet(@(lineWidth))
                .dashStyleSet(AAChartLineDashStyleTypeShortDash)
                .dataSet(dataArr),
            AASeriesElement.new
                .nameSet(@"ShortDot")
                .lineWidthSet(@(lineWidth))
                .dashStyleSet(AAChartLineDashStyleTypeShortDot)
                .dataSet(dataArr),
            AASeriesElement.new
                .nameSet(@"ShortDashDot")
                .lineWidthSet(@(lineWidth))
                .dashStyleSet(AAChartLineDashStyleTypeShortDashDot)
                .dataSet(dataArr),
            AASeriesElement.new
                .nameSet(@"ShortDashDotDot")
                .lineWidthSet(@(lineWidth))
                .dashStyleSet(AAChartLineDashStyleTypeShortDashDotDot)
                .dataSet(dataArr),
            AASeriesElement.new
                .nameSet(@"Dot")
                .lineWidthSet(@(lineWidth))
                .dashStyleSet(AAChartLineDashStyleTypeDot)
                .dataSet(dataArr),
            AASeriesElement.new
                .nameSet(@"Dash")
                .lineWidthSet(@(lineWidth))
                .dashStyleSet(AAChartLineDashStyleTypeDash)
                .dataSet(dataArr),
            AASeriesElement.new
                .nameSet(@"LongDash")
                .lineWidthSet(@(lineWidth))
                .dashStyleSet(AAChartLineDashStyleTypeLongDash)
                .dataSet(dataArr),
            AASeriesElement.new
                .nameSet(@"DashDot")
                .lineWidthSet(@(lineWidth))
                .dashStyleSet(AAChartLineDashStyleTypeDashDot)
                .dataSet(dataArr),
            AASeriesElement.new
                .nameSet(@"LongDashDot")
                .lineWidthSet(@(lineWidth))
                .dashStyleSet(AAChartLineDashStyleTypeLongDashDot)
                .dataSet(dataArr),
            AASeriesElement.new
                .nameSet(@"LongDashDotDot")
                .lineWidthSet(@(lineWidth))
                .dashStyleSet(AAChartLineDashStyleTypeLongDashDotDot)
                .dataSet(dataArr),
        ])
        ;
}

+ (AAChartModel *)shadowLineChart {
    return AAChartModel.new
        .chartTypeSet(AAChartTypeLine)
        .titleSet(@"Line Chart With Shadow")
        .categoriesSet(@[@"Jan", @"Feb", @"Mar", @"Apr", @"May", @"Jun", @"Jul", @"Aug", @"Sep", @"Oct", @"Nov", @"Dec"])
        .legendEnabledSet(false)
        .dataLabelsEnabledSet(false)
        .markerSymbolStyleSet(AAChartSymbolStyleTypeBorderBlank)
        .seriesSet(@[
            AASeriesElement.new
                .dataSet(@[@7.0, @6.9, @9.5, @9.6, @13.9, @14.5, @18.3, @18.2, @21.5, @25.2, @26.5, @23.3])
                .lineWidthSet(@4)
                .shadowSet(AAShadow.new
                    .offsetXSet(@15.0)
                    .offsetYSet(@15.0)
                    .opacitySet(@0.1)
                    .widthSet(@9.0)
                    .colorSet(AAColor.redColor))
        ])
        ;
}

+ (AAChartModel *)colorfulMarkersAndLinesLineChart {
    return AAChartModel.new
        .chartTypeSet(AAChartTypeLine)
        .titleSet(@"Custom Line Chart With Colorful Markers And Lines")
        .markerRadiusSet(@18.0)
        .yAxisLineWidthSet(@0)
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
                .zoneAxisSet(AAChartZoneAxisTypeX)
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
                ]),
        ])
        ;
}

+ (AAChartModel *)colorfulMarkersAndLinesLineChart2 {
    return AAChartModel.new
        .chartTypeSet(AAChartTypeLine)
        .titleSet(@"Custom Line Chart With Colorful Markers And Lines")
        .markerRadiusSet(@25.0)
        .markerSymbolSet(AAChartSymbolTypeCircle)
        .yAxisLineWidthSet(@0)
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
                        .colorSet(AARgbaColor(30, 144, 255, 1.0))
                        ,
                ])
                .zoneAxisSet(AAChartZoneAxisTypeX)
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
                ]),
            AASeriesElement.new
                .nameSet(AAColor.redColor)
                .lineWidthSet(@20.0)
                .dataSet(@[
                    @2048, @1024, @1024, @1024, @1024,
                    AADataElement.new
                        .ySet(@2048)
                        .colorSet(AARgbaColor(255, 0, 0, 1.0))
                        ,
                ])
                .zoneAxisSet(AAChartZoneAxisTypeX)
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
                ]),
            AASeriesElement.new
                .nameSet(AAColor.yellowColor)
                .lineWidthSet(@20.0)
                .dataSet(@[
                    @2048, @1024, @1024, @1024, @1024,
                    AADataElement.new
                        .ySet(@2048)
                        .colorSet(AARgbaColor(255, 215, 0, 1.0))
                        ,
                ])
                .zoneAxisSet(AAChartZoneAxisTypeX)
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
                ]),
            AASeriesElement.new
                .nameSet(AAColor.greenColor)
                .lineWidthSet(@20.0)
                .dataSet(@[
                    @2048, @1024, @1024, @1024, @1024,
                    AADataElement.new
                        .ySet(@2048)
                        .colorSet(AARgbaColor(50, 205, 50, 1.0))
                        ,
                ])
                .zoneAxisSet(AAChartZoneAxisTypeX)
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
                ]),
            AASeriesElement.new
                .nameSet(AAColor.purpleColor)
                .lineWidthSet(@20.0)
                .dataSet(@[
                    @2048, @1024, @1024, @1024, @1024,
                    AADataElement.new
                        .ySet(@2048)
                        .colorSet(AARgbaColor(138, 43, 226, 1.0))
                        ,
                ])
                .zoneAxisSet(AAChartZoneAxisTypeX)
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
                ]),
        ])
        ;
}

+ (AAChartModel *)connectNullsForSingleAASeriesElementLineChart {
    NSArray *dataArr = @[
        @0.45, NSNull.null, NSNull.null,
        @0.55, @0.58, @0.62, NSNull.null, NSNull.null,
        @0.56, @0.67, @0.50, @0.34, @0.50, NSNull.null, NSNull.null, NSNull.null, NSNull.null,
        @0.23, @0.47, @0.46, @0.38, @0.56, @0.48, @0.36, NSNull.null, NSNull.null, NSNull.null, NSNull.null, NSNull.null, NSNull.null, NSNull.null, NSNull.null,
        @0.74, @0.66, @0.65, @0.71, @0.59, @0.65, @0.77, @0.52, @0.53, @0.58, @0.53,
    ];
    
    return AAChartModel.new
        .chartTypeSet(AAChartTypeLine)
        .subtitleSet(@"虚拟数据")
        .colorsThemeSet(@[@"#1e90ff", @"#ef476f", @"#ffd066", @"#04d69f"])
        .yAxisTitleSet(@"摄氏度")
        .dataLabelsEnabledSet(false)
//        .yAxisGridLineWidthSet(@0)
        .stackingSet(AAChartStackingTypeNormal)
        .markerRadiusSet(@8)
        .markerSymbolStyleSet(AAChartSymbolStyleTypeBorderBlank)
        .seriesSet(@[
            AASeriesElement.new
                .nameSet(@"Do NOT Connect Nulls")
                .lineWidthSet(@5)
                .connectNullsSet(false)
                .dataSet(dataArr),
            AASeriesElement.new
                .nameSet(@"Connect Nulls")
                .lineWidthSet(@5)
                .connectNullsSet(@true)
                .dataSet(dataArr),
            AASeriesElement.new
                .nameSet(@"Do NOT Connect Nulls")
                .lineWidthSet(@5)
                .connectNullsSet(false)
                .dataSet(dataArr),
            AASeriesElement.new
                .nameSet(@"Connect Nulls")
                .lineWidthSet(@5)
                .connectNullsSet(@true)
                .dataSet(dataArr)
        ])
        ;
}

+ (AAChartModel *)largeDifferencesInTheNumberOfDataInDifferentSeriesElementLineChart {
    NSMutableArray* (^generateRandomNumberArray)(NSInteger, NSInteger, NSInteger) = ^NSMutableArray*(NSInteger length, NSInteger randomRange, NSInteger minNum) {
        NSMutableArray *randomNumArrA = [NSMutableArray array];
        for (NSInteger i = 0; i < length; i++) {
            NSInteger randomNum = arc4random() % randomRange + minNum;
            [randomNumArrA addObject:@(randomNum)];
        }
        return randomNumArrA;
    };
    
    NSMutableArray* (^generateRandomNumberMixedNullArray)(NSInteger, NSInteger, NSInteger) = ^NSMutableArray*(NSInteger length, NSInteger randomRange, NSInteger minNum) {
        NSMutableArray *randomNumArrA = [NSMutableArray array];
        for (NSInteger x = 0; x < length; x++) {
            if ((100 < x && x < 150) || (300 < x && x < 350)) {
                NSInteger randomNum = arc4random() % randomRange + minNum;
                [randomNumArrA addObject:@(randomNum)];
            } else {
                [randomNumArrA addObject:NSNull.null];
            }
        }
        return randomNumArrA;
    };
    
    return AAChartModel.new
        .chartTypeSet(AAChartTypeLine)
        .backgroundColorSet(AAColor.blackColor)
        .colorsThemeSet(@[@"#1e90ff", @"#04d69f", @"#ef476f", @"#ffd066"])
        .dataLabelsEnabledSet(false)
        .markerRadiusSet(@0)
        .seriesSet(@[
            AASeriesElement.new
                .nameSet(@"2017")
                .lineWidthSet(@6)
                .dataSet(generateRandomNumberMixedNullArray(3550, 5, 100)),
            AASeriesElement.new
                .nameSet(@"2018")
                .lineWidthSet(@6)
                .dataSet(generateRandomNumberArray(3550, 100, 200)),
            AASeriesElement.new
                .nameSet(@"2019")
                .lineWidthSet(@6)
                .dataSet(generateRandomNumberArray(3550, 150, 400)),
            AASeriesElement.new
                .nameSet(@"2020")
                .lineWidthSet(@6)
                .dataSet(generateRandomNumberArray(3550, 150, 600)),
        ])
        ;
}

+ (AAChartModel *)customDifferentDataLabelsShapeForLineChart {
    return AAChartModel.new
        .chartTypeSet(AAChartTypeLine)
        .dataLabelsStyleSet(AAStyle.new
            .colorSet(AAColor.whiteColor)
            .fontSizeSet(@50)
            .fontWeightSet(AAChartFontWeightTypeBold))
        .seriesSet(@[
            AASeriesElement.new
                .nameSet(@"Virtual Data")
                .dataSet(@[
                    AADataElement.new
                        .ySet(@2)
                        .dataLabelsSet(AADataLabels.new
                            .backgroundColorSet(AAColor.redColor)
                            .shapeSet(AAChartDataLabelsShapeTypeSquare)),
                    AADataElement.new
                        .ySet(@4)
                        .dataLabelsSet(AADataLabels.new
                            .backgroundColorSet(AAColor.orangeColor)
                            .ySet(@(-30))
                            .shapeSet(AAChartDataLabelsShapeTypeCallout)),
                    AADataElement.new
                        .ySet(@8)
                        .dataLabelsSet(AADataLabels.new
                            .backgroundColorSet(AAColor.yellowColor)
                            .shapeSet(AAChartDataLabelsShapeTypeCircle)),
                    AADataElement.new
                        .ySet(@16)
                        .dataLabelsSet(AADataLabels.new
                            .backgroundColorSet(AAColor.greenColor)
                            .shapeSet(AAChartDataLabelsShapeTypeDiamond)),
                    AADataElement.new
                        .ySet(@32)
                        .dataLabelsSet(AADataLabels.new
                            .backgroundColorSet(AAColor.cyanColor)
                            .shapeSet(AAChartDataLabelsShapeTypeTriangle)),
                ])
        ])
        ;
}

+ (AAChartModel *)clipForAASeriesElementLineChart {
    return AAChartModel.new
        .seriesSet(@[
            AASeriesElement.new
                .lineWidthSet(@15)
                .clipSet(false)
                .typeSet(AAChartTypeArea)
                .nameSet(@"Non clipped series")
                .dataSet(@[@100, @100, @50, @50, @0, @0]),
            AASeriesElement.new
                .lineWidthSet(@26)
                .clipSet(false)
                .typeSet(AAChartTypeLine)
                .nameSet(@"Clipped series")
                .dataSet(@[@0, @0, @50, @50, @100, @100])
        ])
        ;
}

@end
