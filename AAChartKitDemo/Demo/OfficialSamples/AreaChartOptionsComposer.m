#import "AreaChartOptionsComposer.h"
#import "AAChartKit.h"

@implementation AreaChartOptionsComposer

+ (AAOptions *)basicAreaChart {
    return AAOptions.new
        .chartSet(AAChart.new
            .typeSet(AAChartTypeArea))
        .titleSet(AATitle.new
            .textSet(@"美苏核武器库存量"))
        .subtitleSet(AASubtitle.new
            .textSet(@"数据来源: <a href=\"https://thebulletin.metapress.com/content/c4120650912x74k7/fulltext.pdf\">thebulletin.metapress.com</a>".aa_toPureJSString))
//        .xAxisSet(AAXAxis.new
//            .allowDecimalsSet(@false))
        .yAxisSet(AAYAxis.new
            .titleSet(AATitle.new
                .textSet(@"核武库国家"))
            .labelsSet(AALabels.new
                .formatterSet(@"function () { return this.value / 1000 + 'k'; }")))
        .tooltipSet(AATooltip.new
            .pointFormatSet(@"{series.name} 制造 <b>{point.y:,.0f}</b>枚弹头"))
        .plotOptionsSet(AAPlotOptions.new
            .areaSet(AAArea.new
//                .pointStartSet(@1940)
//                .markerSet(AAMarker.new
//                    .enabledSet(@false)
//                    .symbolSet(AAChartSymbolTypeCircle)
//                    .radiusSet(@2)
//                    .statesSet(AAMarkerStates.new
//                        .hoverSet(AAMarkerHover.new
//                            .enabledSet(@true))))
                     ))
        .seriesSet(@[
            AASeriesElement.new
                .nameSet(@"美国")
                .dataSet(@[
                    [NSNull null], [NSNull null], [NSNull null], [NSNull null], [NSNull null], @6, @11, @32, @110, @235, @369, @640,
                    @1005, @1436, @2063, @3057, @4618, @6444, @9822, @15468, @20434, @24126,
                    @27387, @29459, @31056, @31982, @32040, @31233, @29224, @27342, @26662,
                    @26956, @27912, @28999, @28965, @27826, @25579, @25722, @24826, @24605,
                    @24304, @23464, @23708, @24099, @24357, @24237, @24401, @24344, @23586,
                    @22380, @21004, @17287, @14747, @13076, @12555, @12144, @11009, @10950,
                    @10871, @10824, @10577, @10527, @10475, @10421, @10358, @10295, @10104
                ]),
            AASeriesElement.new
                .nameSet(@"苏联/俄罗斯")
                .dataSet(@[
                    [NSNull null], [NSNull null], [NSNull null], [NSNull null], [NSNull null], [NSNull null], [NSNull null], [NSNull null], [NSNull null], [NSNull null],
                    @5, @25, @50, @120, @150, @200, @426, @660, @869, @1060, @1605, @2471, @3322,
                    @4238, @5221, @6129, @7089, @8339, @9399, @10538, @11643, @13092, @14478,
                    @15915, @17385, @19055, @21205, @23044, @25393, @27935, @30062, @32049,
                    @33952, @35804, @37431, @39197, @45000, @43000, @41000, @39000, @37000,
                    @35000, @33000, @31000, @29000, @27000, @25000, @24000, @23000, @22000,
                    @21000, @20000, @19000, @18000, @18000, @17000, @16000
                ])
        ])
        ;
}

+ (AAOptions *)areaWithNegativeValuesChart {
    return AAOptions.new
        .chartSet(AAChart.new
            .typeSet(AAChartTypeArea))
        .titleSet(AATitle.new
            .textSet(@"包含负值的面积图"))
        .xAxisSet(AAXAxis.new
            .categoriesSet(@[@"苹果", @"橘子", @"梨", @"葡萄", @"香蕉"]))
        .seriesSet(@[
            AASeriesElement.new
                .nameSet(@"小张")
                .dataSet(@[@5, @3, @4, @7, @2]),
            AASeriesElement.new
                .nameSet(@"小彭")
                .dataSet(@[@2, @-2, @-3, @2, @1]),
            AASeriesElement.new
                .nameSet(@"小潘")
                .dataSet(@[@3, @4, @4, @-2, @5])
        ])
        ;
}

+ (AAOptions *)stackedAreaChart {
    return AAOptions.new
        .chartSet(AAChart.new
            .typeSet(AAChartTypeArea))
        .titleSet(AATitle.new
            .textSet(@"全球各大洲人口增长历史及预测"))
        .subtitleSet(AASubtitle.new
            .textSet(@"数据来源: Wikipedia.org"))
        .xAxisSet(AAXAxis.new
            .categoriesSet(@[@"1750", @"1800", @"1850", @"1900", @"1950", @"1999", @"2050"])
//            .tickmarkPlacementSet(AAChartAxisTickmarkPlacementOn)
                  )
        .yAxisSet(AAYAxis.new
            .titleSet(AATitle.new
                .textSet(@"十亿"))
            .labelsSet(AALabels.new
                .formatterSet(@"function () { return this.value / 1000; }")))
        .tooltipSet(AATooltip.new
//            .splitSet(@true)
            .valueSuffixSet(@" 百万"))
        .plotOptionsSet(AAPlotOptions.new
            .areaSet(AAArea.new
//                .stackingSet(AAChartStackingTypeNormal)
//                .lineColorSet(@"#666666")
//                .lineWidthSet(@1)
//                .markerSet(AAMarker.new
//                    .lineWidthSet(@1)
//                    .lineColorSet(@"#666666"))
                     ))
        .seriesSet(@[
            AASeriesElement.new
                .nameSet(@"亚洲")
                .dataSet(@[@502, @635, @809, @947, @1402, @3634, @5268]),
            AASeriesElement.new
                .nameSet(@"非洲")
                .dataSet(@[@106, @107, @111, @133, @221, @767, @1766]),
            AASeriesElement.new
                .nameSet(@"欧洲")
                .dataSet(@[@163, @203, @276, @408, @547, @729, @628]),
            AASeriesElement.new
                .nameSet(@"美洲")
                .dataSet(@[@18, @31, @54, @156, @339, @818, @1201]),
            AASeriesElement.new
                .nameSet(@"大洋洲")
                .dataSet(@[@2, @2, @2, @6, @13, @30, @46])
        ])
        ;
}

+ (AAOptions *)percentStackedAreaChart {
    return AAOptions.new
        .chartSet(AAChart.new
            .typeSet(AAChartTypeArea))
        .titleSet(AATitle.new
            .textSet(@"全球各大洲人口占比"))
        .subtitleSet(AASubtitle.new
            .textSet(@"数据来源: Wikipedia.org"))
        .xAxisSet(AAXAxis.new
            .categoriesSet(@[@"1750", @"1800", @"1850", @"1900", @"1950", @"1999", @"2050"])
//            .tickmarkPlacementSet(AAChartAxisTickmarkPlacementOn)
                  )
        .yAxisSet(AAYAxis.new
            .titleSet(AATitle.new
                .textSet(@"百分比")))
        .tooltipSet(AATooltip.new
            .pointFormatSet(@"<span style=\"color:{series.color}\">{series.name}</span>: <b>{point.percentage:.1f}%</b> ({point.y:,.0f} 百万)<br/>".aa_toPureJSString)
            .sharedSet(@true))
//        .plotOptionsSet(AAPlotOptions.new
//            .areaSet(AAArea.new
//                .stackingSet(AAChartStackingTypePercent)
//                .lineColorSet(@"#ffffff")
//                .lineWidthSet(@1)
//                .markerSet(AAMarker.new
//                    .lineWidthSet(@1)
//                    .lineColorSet(@"#ffffff"))))
        .seriesSet(@[
            AASeriesElement.new
                .nameSet(@"亚洲")
                .dataSet(@[@502, @635, @809, @947, @1402, @3634, @5268]),
            AASeriesElement.new
                .nameSet(@"非洲")
                .dataSet(@[@106, @107, @111, @133, @221, @767, @1766]),
            AASeriesElement.new
                .nameSet(@"欧洲")
                .dataSet(@[@163, @203, @276, @408, @547, @729, @628]),
            AASeriesElement.new
                .nameSet(@"美洲")
                .dataSet(@[@18, @31, @54, @156, @339, @818, @1201]),
            AASeriesElement.new
                .nameSet(@"大洋洲")
                .dataSet(@[@2, @2, @2, @6, @13, @30, @46])
        ])
        ;
}

+ (AAOptions *)areaWithMissingPointsChart {
    return AAOptions.new
        .chartSet(AAChart.new
            .typeSet(AAChartTypeArea)
            .spacingBottomSet(@30))
        .titleSet(AATitle.new
            .textSet(@"小张和小潘家水果的消费情况 *"))
        .subtitleSet(AASubtitle.new
            .textSet(@"* 小潘家的香蕉消费未知")
            .alignSet(AAChartAlignTypeRight)
//            .verticalAlignSet(AAChartVerticalAlignTypeBottom)
//            .ySet(@15)
                     )
        .legendSet(AALegend.new
            .layoutSet(AAChartLayoutTypeVertical)
            .alignSet(AAChartAlignTypeLeft)
            .verticalAlignSet(AAChartVerticalAlignTypeTop)
            .xSet(@150)
            .ySet(@100)
            .floatingSet(@true)
            .borderWidthSet(@1)
//            .backgroundColorSet(AAColor.whiteColor)
                   )
        .xAxisSet(AAXAxis.new
            .categoriesSet(@[@"苹果", @"梨", @"橘子", @"香蕉", @"葡萄", @"李子", @"草莓", @"树莓"]))
        .yAxisSet(AAYAxis.new
            .titleSet(AATitle.new
                .textSet(@"Y-Axis"))
            .labelsSet(AALabels.new
                .formatterSet(@"function () {return this.value;}")))
        .tooltipSet(AATooltip.new
            .formatterSet(@"function () {return '<b>' + this.series.name + '</b><br/>' + this.x + ': ' + this.y;}"))
        .plotOptionsSet(AAPlotOptions.new
            .areaSet(AAArea.new
//                .fillOpacitySet(@0.5)
                     ))
        .creditsSet(AACredits.new
            .enabledSet(@false))
        .seriesSet(@[
            AASeriesElement.new
                .nameSet(@"小张")
                .dataSet(@[@0, @1, @4, @4, @5, @2, @3, @7]),
            AASeriesElement.new
                .nameSet(@"小潘")
                .dataSet(@[@1, @0, @3, [NSNull null], @3, @1, @2, @1])
        ])
        ;
}

+ (AAOptions *)invertedAreaChart {
    return AAOptions.new
        .chartSet(AAChart.new
            .typeSet(AAChartTypeArea)
            .invertedSet(@true))
        .titleSet(AATitle.new
            .textSet(@"不同家庭一周水果平均消费面积图"))
        .legendSet(AALegend.new
            .layoutSet(AAChartLayoutTypeVertical)
            .alignSet(AAChartAlignTypeRight)
            .verticalAlignSet(AAChartVerticalAlignTypeTop)
            .xSet(@-150)
            .ySet(@100)
            .floatingSet(@true)
            .borderWidthSet(@1)
//            .backgroundColorSet(AAColor.whiteColor)
                   )
        .xAxisSet(AAXAxis.new
            .categoriesSet(@[@"周一", @"周二", @"周三", @"周四", @"周五", @"周六", @"周日"]))
        .yAxisSet(AAYAxis.new
            .titleSet(AATitle.new
                .textSet(@"单位数量"))
            .minSet(@0))
//        .plotOptionsSet(AAPlotOptions.new
//            .areaSet(AAArea.new
//                .fillOpacitySet(@0.5)))
        .seriesSet(@[
            AASeriesElement.new
                .nameSet(@"小张")
                .dataSet(@[@3, @4, @3, @5, @4, @10, @12]),
            AASeriesElement.new
                .nameSet(@"小潘")
                .dataSet(@[@1, @3, @4, @3, @3, @5, @4])
        ])
        ;
}

+ (AAOptions *)areasplineChart {
    return AAOptions.new
        .chartSet(AAChart.new
            .typeSet(AAChartTypeAreaspline))
        .titleSet(AATitle.new
            .textSet(@"不同家庭一周水果消费情况"))
        .legendSet(AALegend.new
            .layoutSet(AAChartLayoutTypeVertical)
            .alignSet(AAChartAlignTypeLeft)
            .verticalAlignSet(AAChartVerticalAlignTypeTop)
            .xSet(@150)
            .ySet(@100)
            .floatingSet(@true)
            .borderWidthSet(@1)
//            .backgroundColorSet(AAColor.whiteColor)
                   )
        .xAxisSet(AAXAxis.new
            .categoriesSet(@[@"周一", @"周二", @"周三", @"周四", @"周五", @"周六", @"周日"])
            .plotBandsSet(@[
                AAPlotBandsElement.new
                    .fromSet(@4.5)
                    .toSet(@6.5)
//                    .colorSet([AAColor rgbaColorWithRed:68 green:170 blue:213 alpha:0.2])
            ]))
        .yAxisSet(AAYAxis.new
            .titleSet(AATitle.new
                .textSet(@"水果 单位")))
        .tooltipSet(AATooltip.new
            .sharedSet(@true)
            .valueSuffixSet(@" 单位"))
//        .plotOptionsSet(AAPlotOptions.new
//            .areasplineSet(AAAreaspline.new
//                .fillOpacitySet(@0.5)))
        .seriesSet(@[
            AASeriesElement.new
                .nameSet(@"小张")
                .dataSet(@[@3, @4, @3, @5, @4, @10, @12]),
            AASeriesElement.new
                .nameSet(@"小潘")
                .dataSet(@[@1, @3, @4, @3, @3, @5, @4])
        ])
        ;
}

+ (AAOptions *)arearangeChart {
    return AAOptions.new
        .chartSet(AAChart.new
            .typeSet(AAChartTypeArearange)
//            .zoomTypeSet(AAChartZoomTypeX)
                  )
        .titleSet(AATitle.new
            .textSet(@"某地白天温度变化"))
        .xAxisSet(AAXAxis.new
            .typeSet(AAChartAxisTypeDatetime)
            .crosshairSet(AACrosshair.new
                .widthSet(@1)
                .colorSet(AAColor.redColor)
                .dashStyleSet(AAChartLineDashStyleTypeLongDashDotDot)))
        .yAxisSet(AAYAxis.new
            .titleSet(AATitle.new
                .textSet(@"")))
        .tooltipSet(AATooltip.new
            .sharedSet(@true)
            .valueSuffixSet(@"°C"))
        .legendSet(AALegend.new
            .enabledSet(@false))
        .seriesSet(@[
            AASeriesElement.new
                .nameSet(@"2020")
                .dataSet(@[
                    @[@13885380, @1.1,  @4.7],
                    @[@13886244, @1.8,  @6.4],
                    @[@13887108, @1.7,  @6.9],
                    @[@13887972, @2.6,  @7.4],
                    @[@13888836, @3.3,  @9.3],
                    @[@13889700, @3.0,  @7.9],
                    @[@13890564, @3.9,  @6.0],
                    @[@13891428, @3.9,  @5.5],
                    @[@13892292, @-0.6, @4.5],
                    @[@13893156, @-0.5, @5.3],
                    @[@13894020, @-0.3, @2.4],
                    @[@13894884, @-6.5, @-0.4],
                    @[@13895748, @-7.3, @-3.4],
                    @[@13896612, @-7.3, @-2.3],
                    @[@13897476, @-7.9, @-4.2],
                    @[@13898340, @-4.7, @0.9],
                    @[@13899204, @-1.2, @0.4],
                    @[@13900068, @-2.3, @-0.1],
                    @[@13900932, @-2.0, @0.3],
                    @[@13901796, @-5.1, @-2.0],
                    @[@13902660, @-4.4, @-0.5],
                    @[@13903524, @-6.4, @-2.7],
                    @[@13904388, @-3.2, @-0.5],
                    @[@13905252, @-5.5, @-0.8],
                    @[@13906116, @-4.4, @2.4],
                    @[@13906980, @-4.0, @1.1],
                    @[@13907844, @-3.4, @0.8],
                    @[@13908708, @-1.7, @2.6],
                    @[@13909572, @-3.1, @3.9],
                    @[@13910436, @-8,   @-1.9],
                    @[@13911300, @-7,   @-2.8],
                    @[@13912164, @-2.7, @2.6],
                    @[@13913028, @-1.3, @8.2],
                    @[@13913892, @1.5,  @7.7],
                    @[@13914756, @-0.5, @5.3],
                    @[@13915620, @-0.2, @5.2],
                    @[@13916484, @0.7,  @4.8],
                    @[@13917348, @0.9,  @5.7],
                    @[@13918212, @1.7,  @3.9],
                    @[@13919076, @2.2,  @8.8],
                    @[@13919940, @3.0,  @6.6],
                    @[@13920804, @1.4,  @5.4],
                    @[@13921668, @0.6,  @5.1],
                    @[@13922532, @0.1,  @7.8],
                    @[@13923396, @3.4,  @7.3],
                    @[@13924260, @2.0,  @5.9],
                    @[@13925124, @1.1,  @4.7],
                    @[@13925988, @1.1,  @4.4],
                    @[@13926852, @-2.8, @2.6],
                    @[@13927716, @-5.0, @0.1],
                    @[@13928580, @-5.7, @0.2],
                    @[@13929444, @-0.7, @3.9],
                    @[@13930308, @1.5,  @7.8],
                    @[@13931172, @5.5,  @8.8],
                    @[@13932036, @5.3,  @11.7],
                    @[@13932900, @1.7,  @11.1],
                    @[@13933764, @3.4,  @9.3],
                    @[@13934628, @3.4,  @7.3],
                    @[@13935492, @4.5,  @8.0],
                    @[@13936356, @2.1,  @8.9],
                    @[@13937220, @0.6,  @6.1],
                    @[@13938084, @1.2,  @9.4],
                    @[@13938948, @2.6,  @7.3],
                    @[@13939812, @3.9,  @9.5],
                    @[@13940676, @5.3,  @9.9],
                    @[@13941540, @2.7,  @7.1],
                    @[@13942404, @4.0,  @8.6],
                    @[@13943268, @6.1,  @10.7],
                    @[@13944132, @4.2,  @7.6],
                    @[@13944996, @2.5,  @9.0],
                    @[@13945860, @0.2,  @7.0],
                    @[@13946724, @-1.2, @6.9],
                    @[@13947588, @0.4,  @6.7],
                    @[@13948452, @0.2,  @5.1],
                    @[@13949316, @-0.1, @6.0],
                    @[@13950180, @1.0,  @5.6],
                    @[@13951044, @-1.1, @6.3],
                    @[@13951908, @-1.9, @0.3],
                    @[@13952772, @0.3,  @4.5],
                    @[@13953636, @2.4,  @6.7],
                    @[@13954500, @3.2,  @9.2],
                    @[@13955364, @1.7,  @3.6],
                    @[@13956228, @-0.3, @7.9],
                    @[@13957092, @-2.4, @8.6],
                    @[@13957956, @-1.7, @10.3],
                    @[@13958820, @4.1,  @10.0],
                    @[@13959684, @4.4,  @14.0],
                    @[@13960548, @3.3,  @11.0],
                    @[@13961412, @3.0,  @12.5],
                    @[@13962240, @1.4,  @10.4],
                    @[@13963104, @-1.2, @8.8],
                    @[@13963968, @2.2,  @7.6],
                    @[@13964832, @-1.0, @10.1],
                    @[@13965696, @-1.8, @9.5],
                    @[@13966560, @0.2,  @7.7],
                    @[@13967424, @3.7,  @6.4],
                    @[@13968288, @5.8,  @11.4],
                    @[@13969152, @5.4,  @8.7],
                    @[@13970016, @4.5,  @12.2],
                    @[@13970880, @3.9,  @8.4],
                    @[@13971744, @4.5,  @8.0],
                    @[@13972608, @6.6,  @8.4],
                    @[@13973472, @3.7,  @7.3],
                    @[@13974336, @3.6,  @6.7],
                    @[@13975200, @3.5,  @8.3],
                    @[@13976064, @1.5,  @10.2],
                    @[@13976928, @4.9,  @9.4],
                    @[@13977792, @3.5,  @12.0],
                    @[@13978656, @1.5,  @13.1],
                    @[@13979520, @1.7,  @15.6],
                    @[@13980384, @1.4,  @16.0],
                    @[@13981248, @3.0,  @18.4],
                    @[@13982112, @5.6,  @18.8],
                    @[@13982976, @5.7,  @17.2],
                    @[@13983840, @4.5,  @16.4],
                    @[@13984704, @3.1,  @17.6],
                    @[@13985568, @4.7,  @18.9],
                    @[@13986432, @4.9,  @16.6],
                    @[@13987296, @6.8,  @15.6],
                    @[@13988160, @2.8,  @9.2],
                    @[@13989024, @-2.7, @10.5],
                    @[@13989888, @-1.9, @10.9],
                    @[@13990752, @4.5,  @8.5],
                    @[@13991616, @-0.6, @10.4],
                    @[@13992480, @4.0,  @9.7],
                    @[@13993344, @5.5,  @9.5],
                    @[@13994208, @6.5,  @13.2],
                    @[@13995072, @3.2,  @14.5],
                    @[@13995936, @2.1,  @13.5],
                    @[@13996800, @6.5,  @15.6],
                    @[@13997664, @5.7,  @16.2],
                    @[@13998528, @6.3,  @15.3],
                    @[@13999392, @5.3,  @15.3],
                    @[@14000256, @6.0,  @14.1],
                    @[@14001120, @1.9,  @7.7],
                    @[@14001984, @7.2,  @9.8],
                    @[@14002848, @8.9,  @15.2],
                    @[@14003712, @9.1,  @20.5],
                    @[@14004576, @8.4,  @17.9],
                    @[@14005440, @6.8,  @21.5],
                    @[@14006304, @7.6,  @14.1],
                    @[@14007168, @11.1, @16.5],
                    @[@14008032, @9.3,  @14.3],
                    @[@14008896, @10.4, @19.3],
                    @[@14009760, @5.7,  @19.4],
                    @[@14010624, @7.9,  @17.9],
                    @[@14011488, @5.0,  @22.5],
                    @[@14012352, @7.6,  @22.0],
                    @[@14013216, @5.7,  @21.9],
                    @[@14014080, @4.6,  @20.0],
                    @[@14014944, @7.0,  @22.0],
                    @[@14015808, @5.1,  @20.6],
                    @[@14016672, @6.6,  @24.6],
                    @[@14017536, @9.7,  @22.2],
                    @[@14018400, @9.6,  @21.6],
                    @[@14019264, @13.0, @20.0],
                    @[@14020128, @12.9, @18.2],
                    @[@14020992, @8.5,  @23.2],
                    @[@14021856, @9.2,  @21.4],
                    @[@14022720, @10.5, @22.0],
                    @[@14023584, @7.3,  @23.4],
                    @[@14024448, @12.1, @18.2],
                    @[@14025312, @11.1, @13.3],
                    @[@14026176, @10.0, @20.7],
                    @[@14027040, @5.8,  @23.4],
                    @[@14027904, @7.4,  @20.1],
                    @[@14028768, @10.3, @21.9],
                    @[@14029632, @7.8,  @16.8],
                    @[@14030496, @11.6, @19.7],
                    @[@14031360, @9.8,  @16.0],
                    @[@14032224, @10.7, @14.4],
                    @[@14033088, @9.0,  @15.5],
                    @[@14033952, @5.1,  @13.3],
                    @[@14034816, @10.0, @19.3],
                    @[@14035680, @5.2,  @22.1],
                    @[@14036544, @6.3,  @21.3],
                    @[@14037408, @5.5,  @21.1],
                    @[@14038272, @8.4,  @19.7],
                    @[@14039136, @7.1,  @23.3],
                    @[@14040000, @6.1,  @20.8],
                    @[@14040864, @8.4,  @22.6],
                    @[@14041728, @7.6,  @23.3],
                    @[@14042592, @8.1,  @21.5],
                    @[@14043456, @11.2, @18.1],
                    @[@14044320, @6.4,  @14.9],
                    @[@14045184, @12.7, @23.1],
                    @[@14046048, @15.3, @21.7],
                    @[@14046912, @15.1, @19.4],
                    @[@14047776, @10.8, @22.8],
                    @[@14048640, @15.8, @29.7],
                    @[@14049504, @15.8, @29.0],
                    @[@14050368, @15.2, @30.5],
                    @[@14051232, @14.9, @28.1],
                    @[@14052096, @13.1, @27.4],
                    @[@14052960, @15.5, @23.5],
                    @[@14053824, @14.7, @20.1],
                    @[@14054688, @14.4, @16.8],
                    @[@14055552, @12.6, @18.5],
                    @[@14056416, @13.9, @24.4],
                    @[@14057280, @11.3, @26.9],
                    @[@14058144, @13.3, @27.4],
                    @[@14059008, @13.3, @29.7],
                    @[@14059872, @14.0, @28.8],
                    @[@14060736, @14.1, @29.8],
                    @[@14061600, @15.4, @31.1],
                    @[@14062464, @17.0, @26.5],
                    @[@14063328, @16.6, @27.1],
                    @[@14064192, @13.3, @25.6],
                    @[@14065056, @16.8, @21.9],
                    @[@14065920, @16.0, @22.8],
                    @[@14066784, @14.4, @19.0],
                    @[@14067648, @12.8, @18.1],
                    @[@14068512, @12.6, @18.0],
                    @[@14069376, @11.4, @19.7],
                    @[@14070240, @13.9, @18.9],
                    @[@14071104, @12.5, @19.9],
                    @[@14071968, @12.3, @23.4],
                    @[@14072832, @12.8, @23.3],
                    @[@14073696, @11.0, @20.4],
                    @[@14074560, @14.7, @22.4],
                    @[@14075424, @11.1, @23.6],
                    @[@14076288, @13.5, @20.7],
                    @[@14077152, @13.7, @23.1],
                    @[@14078016, @12.8, @19.6],
                    @[@14078880, @12.1, @18.7],
                    @[@14079744, @8.8,  @22.4],
                    @[@14080608, @8.2,  @20.1],
                    @[@14081472, @10.9, @16.3],
                    @[@14082336, @10.7, @16.1],
                    @[@14083200, @11.0, @18.9],
                    @[@14084064, @12.1, @14.7],
                    @[@14084928, @11.2, @14.4],
                    @[@14085792, @9.9,  @16.6],
                    @[@14086656, @6.9,  @15.7],
                    @[@14087520, @8.9,  @15.3],
                    @[@14088384, @8.2,  @17.6],
                    @[@14089248, @8.4,  @19.5],
                    @[@14090112, @6.6,  @19.9],
                    @[@14090976, @6.4,  @19.7],
                    @[@14091840, [NSNull null], [NSNull null]],
                    @[@14092704, [NSNull null], [NSNull null]],
                    @[@14093568, [NSNull null], [NSNull null]],
                    @[@14094432, [NSNull null], [NSNull null]],
                    @[@14095296, [NSNull null], [NSNull null]],
                    @[@14096160, [NSNull null], [NSNull null]],
                    @[@14097024, [NSNull null], [NSNull null]],
                    @[@14097888, [NSNull null], [NSNull null]],
                    @[@14098752, [NSNull null], [NSNull null]],
                    @[@14099616, @13.4, @13.4],
                    @[@14100480, @13.2, @17.1],
                    @[@14101344, @11.9, @18.9],
                    @[@14102208, @9.0,  @15.9],
                    @[@14103072, @5.9,  @17.5],
                    @[@14103936, @6.8,  @16.2],
                    @[@14104800, @10.3, @19.9],
                    @[@14105664, @8.7,  @17.9],
                    @[@14106528, @7.9,  @19.1],
                    @[@14107392, @6.0,  @20.1],
                    @[@14108256, @4.7,  @19.9],
                    @[@14109120, @4.0,  @18.8],
                    @[@14109984, @4.5,  @17.9],
                    @[@14110848, @3.1,  @16.1],
                    @[@14111712, @8.5,  @12.2],
                    @[@14112576, @7.6,  @13.8],
                    @[@14113440, @1.3,  @12.6],
                    @[@14114304, @2.0,  @10.9],
                    @[@14115168, @5.0,  @10.8],
                    @[@14116032, @6.4,  @10.1],
                    @[@14116896, @8.2,  @13.3],
                    @[@14117760, @8.9,  @11.8],
                    @[@14118624, @9.9,  @15.9],
                    @[@14119488, @5.2,  @12.5],
                    @[@14120352, @4.6,  @11.7],
                    @[@14121216, @8.8,  @12.1],
                    @[@14122080, @3.9,  @12.3],
                    @[@14122944, @2.7,  @18.1],
                    @[@14123808, @10.2, @18.2],
                    @[@14124672, @9.6,  @17.9],
                    @[@14125536, @9.3,  @17.5],
                    @[@14126400, @8.1,  @12.7],
                    @[@14127264, @6.7,  @11.2],
                    @[@14128128, @4.0,  @10.0],
                    @[@14128992, @6.3,  @10.2],
                    @[@14129856, @6.6,  @10.7],
                    @[@14130720, @6.6,  @10.3],
                    @[@14131584, @5.9,  @10.4],
                    @[@14132448, @1.2,  @10.6],
                    @[@14133312, @-0.1, @9.2],
                    @[@14134176, @-1.0, @9.4],
                    @[@14135040, @-1.7, @8.3],
                    @[@14135904, @-0.6, @7.5],
                    @[@14136768, @6.9,  @10.1],
                    @[@14137632, @7.7,  @10.5],
                    @[@14138496, @3.8,  @9.7],
                    @[@14139360, @6.2,  @8.6],
                    @[@14140224, @6.5,  @9.2],
                    @[@14141088, @7.9,  @10.7],
                    @[@14141952, @6.1,  @10.9],
                    @[@14142816, @10.3, @13.1],
                    @[@14143716, @7.1,  @13.3],
                    @[@14144580, @0.0,  @10.1],
                    @[@14145444, @0.0,  @5.7],
                    @[@14146308, @3.9,  @4.6],
                    @[@14147172, @4.0,  @4.8],
                    @[@14148036, @4.8,  @11.2],
                    @[@14148900, @7.0,  @8.5],
                    @[@14149764, @3.0,  @9.8],
                    @[@14150628, @2.8,  @5.9],
                    @[@14151492, @0.8,  @4.8],
                    @[@14152356, @-0.2, @2.9],
                    @[@14153220, @-0.6, @5.5],
                    @[@14154084, @6.6,  @10.3],
                    @[@14154948, @5.4,  @7.3],
                    @[@14155812, @3.0,  @8.4],
                    @[@14156676, @0.4,  @3.2],
                    @[@14157540, @-0.1, @6.8],
                    @[@14158404, @4.8,  @8.8],
                    @[@14159268, @4.6,  @8.5],
                    @[@14160132, @4.3,  @7.7],
                    @[@14160996, @3.3,  @7.5],
                    @[@14161860, @-0.4, @3.2],
                    @[@14162724, @1.9,  @4.7],
                    @[@14163588, @-0.2, @3.7],
                    @[@14164452, @-1.3, @2.1],
                    @[@14165316, @-1.8, @0.9],
                    @[@14166180, @-2.7, @1.3],
                    @[@14167044, @0.3,  @2.5],
                    @[@14167908, @3.4,  @6.5],
                    @[@14168772, @0.8,  @6.1],
                    @[@14169636, @-1.0, @1.3],
                    @[@14170500, @0.4,  @3.1],
                    @[@14171364, @-1.2, @1.9],
                    @[@14172228, @-1.1, @2.8],
                    @[@14173092, @-0.7, @1.8],
                    @[@14173956, @0.5,  @2.5],
                    @[@14174820, @1.4,  @3.2],
                    @[@14175684, @4.5,  @10.2],
                    @[@14176548, @0.4,  @10.0],
                    @[@14177412, @2.5,  @3.7],
                    @[@14178276, @1.1,  @5.0],
                    @[@14179140, @2.0,  @4.4],
                    @[@14180004, @1.4,  @2.2],
                    @[@14180868, @0.7,  @4.6],
                    @[@14181732, @1.9,  @3.9],
                    @[@14182596, @-0.2, @3.7],
                    @[@14183460, @-0.1, @1.7],
                    @[@14184324, @-1.0, @3.8],
                    @[@14185188, @0.5,  @5.4],
                    @[@14186052, @-1.7, @5.6],
                    @[@14186916, @0.3,  @2.8],
                    @[@14187780, @-3.0, @0.4],
                    @[@14188644, @-1.1, @1.5],
                    @[@14189508, @0.8,  @3.4],
                    @[@14190372, @0.9,  @4.4],
                    @[@14191236, @0.3,  @3.9],
                    @[@14192100, @0.6,  @5.3],
                    @[@14192964, @1.5,  @4.4],
                    @[@14193828, [NSNull null], [NSNull null]],
                    @[@14194692, [NSNull null], [NSNull null]],
                    @[@14195556, @10.6, @4],
                    @[@14196420, @10.8, @5],
                    @[@14197284, @8.4,  @4],
                    @[@14198148, @5.2,  @2.4],
                    @[@14199012, @1.3,  @2.5],
                    @[@14199876, @1.6,  @4.2]
                ])
        ])
        ;
}

+ (AAOptions *)arearangeAndLineChart {
    NSArray *ranges = @[
        @[@1246406400000, @14.3, @27.7],
        @[@1246492800000, @14.5, @27.8],
        @[@1246579200000, @15.5, @29.6],
        @[@1246665600000, @16.7, @30.7],
        @[@1246752000000, @16.5, @25.0],
        @[@1246838400000, @17.8, @25.7],
        @[@1246924800000, @13.5, @24.8],
        @[@1247011200000, @10.5, @21.4],
        @[@1247097600000, @9.2,  @23.8],
        @[@1247184000000, @11.6, @21.8],
        @[@1247270400000, @10.7, @23.7],
        @[@1247356800000, @11.0, @23.3],
        @[@1247443200000, @11.6, @23.7],
        @[@1247529600000, @11.8, @20.7],
        @[@1247616000000, @12.6, @22.4],
        @[@1247702400000, @13.6, @19.6],
        @[@1247788800000, @11.4, @22.6],
        @[@1247875200000, @13.2, @25.0],
        @[@1247961600000, @14.2, @21.6],
        @[@1248048000000, @13.1, @17.1],
        @[@1248134400000, @12.2, @15.5],
        @[@1248220800000, @12.0, @20.8],
        @[@1248307200000, @12.0, @17.1],
        @[@1248393600000, @12.7, @18.3],
        @[@1248480000000, @12.4, @19.4],
        @[@1248566400000, @12.6, @19.9],
        @[@1248652800000, @11.9, @20.2],
        @[@1248739200000, @11.0, @19.3],
        @[@1248825600000, @10.8, @17.8],
        @[@1248912000000, @11.8, @18.5],
        @[@1248998400000, @10.8, @16.1],
    ];
    
    NSArray *averages = @[
        @[@1246406400000, @21.5],
        @[@1246492800000, @22.1],
        @[@1246579200000, @23],
        @[@1246665600000, @23.8],
        @[@1246752000000, @21.4],
        @[@1246838400000, @21.3],
        @[@1246924800000, @18.3],
        @[@1247011200000, @15.4],
        @[@1247097600000, @16.4],
        @[@1247184000000, @17.7],
        @[@1247270400000, @17.5],
        @[@1247356800000, @17.6],
        @[@1247443200000, @17.7],
        @[@1247529600000, @16.8],
        @[@1247616000000, @17.7],
        @[@1247702400000, @16.3],
        @[@1247788800000, @17.8],
        @[@1247875200000, @18.1],
        @[@1247961600000, @17.2],
        @[@1248048000000, @14.4],
        @[@1248134400000, @13.7],
        @[@1248220800000, @15.7],
        @[@1248307200000, @14.6],
        @[@1248393600000, @15.3],
        @[@1248480000000, @15.3],
        @[@1248566400000, @15.8],
        @[@1248652800000, @15.2],
        @[@1248739200000, @14.8],
        @[@1248825600000, @14.4],
        @[@1248912000000, @15.4],
        @[@1248998400000, @14.1],
    ];
    
    return AAOptions.new
        .chartSet(AAChart.new
            .typeSet(AAChartTypeSpline))
        .titleSet(AATitle.new
            .textSet(@"气温变化范围"))
        .subtitleSet(AASubtitle.new
            .textSet(@"数据来源: WorldClimate.com"))
        .xAxisSet(AAXAxis.new
            .typeSet(AAChartAxisTypeDatetime)
            .crosshairSet(AACrosshair.new
                .widthSet(@1)
                .colorSet(@"#1E90FF")
                .dashStyleSet(AAChartLineDashStyleTypeLongDashDotDot)))
        .yAxisSet(AAYAxis.new
            .titleSet(AATitle.new
                .textSet(@"")))
        .tooltipSet(AATooltip.new
            .sharedSet(@true)
            .valueSuffixSet(@"°C"))
        .seriesSet(@[
            AASeriesElement.new
                .nameSet(@"气温")
                .dataSet(averages)
                .zIndexSet(@1)
                .markerSet(AAMarker.new
                    .fillColorSet(@"#ffffff")
                    .lineWidthSet(@2)
                    .lineColorSet([AAGradientColor oceanBlueColor])),
            AASeriesElement.new
                .nameSet(@"范围")
                .dataSet(ranges)
                .typeSet(AAChartTypeArearange)
                .lineWidthSet(@0)
                .colorSet([AAGradientColor oceanBlueColor])
                .fillOpacitySet(@0.3)
                .zIndexSet(@0)
                .markerSet(AAMarker.new
                    .enabledSet(@false)),
        ])
        ;
}

@end
