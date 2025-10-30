#import "BarOrColumnChartOptionsComposer.h"
#import "AAChartKit.h"

@implementation BarOrColumnChartOptionsComposer

+ (AAOptions *)basicBarChart {
    return AAOptions.new
        .chartSet(AAChart.new
            .typeSet(AAChartTypeBar))
        .titleSet(AATitle.new
            .textSet(@"各洲不同时间的人口条形图"))
        .subtitleSet(AASubtitle.new
            .textSet(@"数据来源: Wikipedia.org"))
        .tooltipSet(AATooltip.new
            .valueSuffixSet(@" 百万"))
        .plotOptionsSet(AAPlotOptions.new
            .barSet(AABar.new
                .dataLabelsSet(AADataLabels.new
                    .enabledSet(true)
                    .allowOverlapSet(true))))
        .legendSet(AALegend.new
            .layoutSet(AAChartLayoutTypeVertical)
            .alignSet(AAChartAlignTypeRight)
            .verticalAlignSet(AAChartVerticalAlignTypeTop)
            .xSet(@-40)
            .ySet(@100)
            .floatingSet(true)
            .borderWidthSet(@1)
//            .backgroundColorSet(AAColor.whiteColor)
//            .shadowSet(true)
                   )
        .seriesSet(@[
            AASeriesElement.new
                .nameSet(@"1800 年")
                .dataSet(@[@107, @31, @635, @203, @2]),
            AASeriesElement.new
                .nameSet(@"1900 年")
                .dataSet(@[@133, @156, @947, @408, @6]),
            AASeriesElement.new
                .nameSet(@"2008 年")
                .dataSet(@[@973, @914, @4054, @732, @34]),
        ])
        ;
}

+ (AAOptions *)stackingBarChart {
    return AAOptions.new
        .chartSet(AAChart.new
            .typeSet(AAChartTypeBar))
        .titleSet(AATitle.new
            .textSet(@"堆叠条形图"))
        .xAxisSet(AAXAxis.new
            .categoriesSet(@[@"苹果", @"橘子", @"梨", @"葡萄", @"香蕉"]))
        .yAxisSet(AAYAxis.new
            .minSet(@0)
            .titleSet(AATitle.new
                .textSet(@"水果消费总量")))
//        .legendSet(AALegend.new
//            .reversedSet(true))
        .plotOptionsSet(AAPlotOptions.new
            .seriesSet(AASeries.new
                .stackingSet(AAChartStackingTypeNormal)))
        .seriesSet(@[
            AASeriesElement.new
                .nameSet(@"小张")
                .dataSet(@[@5, @3, @4, @7, @2]),
            AASeriesElement.new
                .nameSet(@"小彭")
                .dataSet(@[@2, @2, @3, @2, @1]),
            AASeriesElement.new
                .nameSet(@"小潘")
                .dataSet(@[@3, @4, @4, @2, @5]),
        ])
        ;
}

+ (AAOptions *)populationPyramidChart {
    return AAOptions.new
        .chartSet(AAChart.new
            .typeSet(AAChartTypeBar))
        .titleSet(AATitle.new
            .textSet(@"2015 年德国人口金字塔"))
        .subtitleSet(AASubtitle.new
//            .useHTMLSet(true)
            .textSet(@"数据来源: <a href=\"http://populationpyramid.net/germany/2015/\">1950 ~ 2100 年世界人口金字塔</a>"))
        .xAxisSet(@[
            AAXAxis.new
                .categoriesSet(@[@"0-4", @"5-9", @"10-14", @"15-19",
                                 @"20-24", @"25-29", @"30-34", @"35-39", @"40-44",
                                 @"45-49", @"50-54", @"55-59", @"60-64", @"65-69",
                                 @"70-74", @"75-79", @"80-84", @"85-89", @"90-94",
                                 @"95-99", @"100 + "])
                .reversedSet(false)
                .labelsSet(AALabels.new
                    .stepSet(@1)),
            AAXAxis.new
                .oppositeSet(true)
                .reversedSet(false)
                .categoriesSet(@[@"0-4", @"5-9", @"10-14", @"15-19",
                                 @"20-24", @"25-29", @"30-34", @"35-39", @"40-44",
                                 @"45-49", @"50-54", @"55-59", @"60-64", @"65-69",
                                 @"70-74", @"75-79", @"80-84", @"85-89", @"90-94",
                                 @"95-99", @"100 + "])
                .linkedToSet(@0)
                .labelsSet(AALabels.new
                    .stepSet(@1)),
        ])
        .yAxisSet(AAYAxis.new
            .titleSet(AATitle.new
                .textSet(nil))
            .labelsSet(AALabels.new
                .formatterSet(@"function () {\nreturn (Math.abs(this.value) / 1000000) + 'M';\n}"))
            .minSet(@-4000000)
            .maxSet(@4000000))
        .plotOptionsSet(AAPlotOptions.new
            .seriesSet(AASeries.new
                .stackingSet(AAChartStackingTypeNormal)))
        .tooltipSet(AATooltip.new
            .formatterSet(@"function () {\nreturn '<b>' + this.series.name + ', age ' + this.point.category + '</b><br/>' +\n    '人口: ' + Highcharts.numberFormat(Math.abs(this.point.y), 0);\n}"))
        .seriesSet(@[
            AASeriesElement.new
                .nameSet(@"男")
                .dataSet(@[@-1746181, @-1884428, @-2089758, @-2222362, @-2537431, @-2507081, @-2443179,
                           @-2664537, @-3556505, @-3680231, @-3143062, @-2721122, @-2229181, @-2227768,
                           @-2176300, @-1329968, @-836804, @-354784, @-90569, @-28367, @-3878]),
            AASeriesElement.new
                .nameSet(@"女")
                .dataSet(@[@1656154, @1787564, @1981671, @2108575, @2403438, @2366003, @2301402, @2519874,
                           @3360596, @3493473, @3050775, @2759560, @2304444, @2426504, @2568938, @1785638,
                           @1447162, @1005011, @330870, @130632, @21208]),
        ])
        ;
}

+ (AAOptions *)basicColumnChart {
    return AAOptions.new
        .chartSet(AAChart.new
            .typeSet(AAChartTypeColumn))
        .titleSet(AATitle.new
            .textSet(@"月平均降雨量"))
        .subtitleSet(AASubtitle.new
            .textSet(@"数据来源: WorldClimate.com"))
        .xAxisSet(AAXAxis.new
            .categoriesSet(@[@"一月", @"二月", @"三月", @"四月", @"五月", @"六月", @"七月", @"八月", @"九月", @"十月", @"十一月", @"十二月"]))
        .yAxisSet(AAYAxis.new
            .minSet(@0)
            .titleSet(AATitle.new
                .textSet(@"降雨量 (mm)")))
        .tooltipSet(AATooltip.new
            .headerFormatSet(@"<span style=\"font-size:10px\">{point.key}</span><table>")
            .pointFormatSet(@"<tr><td style=\"color:{series.color};padding:0\">{series.name}: </td><td style=\"padding:0\"><b>{point.y:.1f} mm</b></td></tr>")
            .footerFormatSet(@"</table>")
            .sharedSet(true)
            .useHTMLSet(true))
        .plotOptionsSet(AAPlotOptions.new
            .columnSet(AAColumn.new
                .borderWidthSet(@0)))
        .seriesSet(@[
            AASeriesElement.new
                .nameSet(@"东京")
                .dataSet(@[@49.9, @71.5, @106.4, @129.2, @144.0, @176.0, @135.6, @148.5, @216.4, @194.1, @95.6, @54.4]),
            AASeriesElement.new
                .nameSet(@"纽约")
                .dataSet(@[@83.6, @78.8, @98.5, @93.4, @106.0, @84.5, @105.0, @104.3, @91.2, @83.5, @106.6, @92.3]),
            AASeriesElement.new
                .nameSet(@"伦敦")
                .dataSet(@[@48.9, @38.8, @39.3, @41.4, @47.0, @48.3, @59.0, @59.6, @52.4, @65.2, @59.3, @51.2]),
            AASeriesElement.new
                .nameSet(@"柏林")
                .dataSet(@[@42.4, @33.2, @34.5, @39.7, @52.6, @75.5, @57.4, @60.4, @47.6, @39.1, @46.8, @51.1]),
        ])
        ;
}

+ (AAOptions *)basicColumnChartWithNegativeValue {
    return AAOptions.new
        .chartSet(AAChart.new
            .typeSet(AAChartTypeColumn))
        .titleSet(AATitle.new
            .textSet(@"包含负值的柱形图"))
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
                .dataSet(@[@3, @4, @4, @-2, @5]),
        ])
        ;
}

+ (AAOptions *)basicColumnChartWithStackedDataLabels {
    return AAOptions.new
        .chartSet(AAChart.new
            .typeSet(AAChartTypeColumn))
        .titleSet(AATitle.new
            .textSet(@"堆叠柱形图"))
        .xAxisSet(AAXAxis.new
            .categoriesSet(@[@"苹果", @"橘子", @"梨", @"葡萄", @"香蕉"]))
        .yAxisSet(AAYAxis.new
            .minSet(@0)
            .titleSet(AATitle.new
                .textSet(@"水果消费总量"))
            .stackLabelsSet(AALabels.new
                .enabledSet(true)
                .styleSet(AAStyle.new
                    .fontWeightSet(AAChartFontWeightTypeBold)
                    .colorSet(@"#000000"))))
        .legendSet(AALegend.new
            .alignSet(AAChartAlignTypeRight)
            .xSet(@-30)
            .verticalAlignSet(AAChartVerticalAlignTypeTop)
            .ySet(@25)
            .floatingSet(true)
//            .backgroundColorSet(AAColor.whiteColor)
            .borderColorSet(@"#CCC")
            .borderWidthSet(@1)
//            .shadowSet(false)
                   )
        .tooltipSet(AATooltip.new
            .formatterSet(@"function () {\n    return '<b>' + this.x + '</b><br/>' +\n        this.series.name + ': ' + this.y + '<br/>' +\n        '总量: ' + this.point.stackTotal;\n}"))
        .plotOptionsSet(AAPlotOptions.new
            .columnSet(AAColumn.new
                .stackingSet(AAChartStackingTypeNormal)
                .dataLabelsSet(AADataLabels.new
                    .enabledSet(true)
                    .colorSet(AAColor.whiteColor)
                    .styleSet(AAStyle.new
                        .textOutlineSet(@"1px 1px black")))))
        .seriesSet(@[
            AASeriesElement.new
                .nameSet(@"小张")
                .dataSet(@[@5, @3, @4, @7, @2]),
            AASeriesElement.new
                .nameSet(@"小彭")
                .dataSet(@[@2, @2, @3, @2, @1]),
            AASeriesElement.new
                .nameSet(@"小潘")
                .dataSet(@[@3, @4, @4, @2, @5]),
        ])
        ;
}

+ (AAOptions *)basicColumnChartWithStackedDataLabels2 {
    return AAOptions.new
        .chartSet(AAChart.new
            .typeSet(AAChartTypeColumn))
        .titleSet(AATitle.new
            .textSet(@"按性别划分的水果消费总量"))
        .xAxisSet(AAXAxis.new
            .categoriesSet(@[@"苹果", @"橘子", @"梨", @"葡萄", @"香蕉"]))
        .yAxisSet(AAYAxis.new
            .allowDecimalsSet(false)
            .minSet(@0)
            .titleSet(AATitle.new
                .textSet(@"水果数量")))
        .tooltipSet(AATooltip.new
            .formatterSet(@"function () {\n    return '<b>' + this.x + '</b><br/>' +\n        this.series.name + ': ' + this.y + '<br/>' +\n        '总量: ' + this.point.stackTotal;\n}"))
        .plotOptionsSet(AAPlotOptions.new
            .columnSet(AAColumn.new
                .stackingSet(AAChartStackingTypeNormal)))
        .seriesSet(@[
            AASeriesElement.new
                .nameSet(@"小张")
                .dataSet(@[@5, @3, @4, @7, @2])
                .stackSet(@"male"),
            AASeriesElement.new
                .nameSet(@"小潘")
                .dataSet(@[@3, @4, @4, @2, @5])
                .stackSet(@"male"),
            AASeriesElement.new
                .nameSet(@"小彭")
                .dataSet(@[@2, @5, @6, @2, @1])
                .stackSet(@"female"),
            AASeriesElement.new
                .nameSet(@"小王")
                .dataSet(@[@3, @0, @4, @4, @3])
                .stackSet(@"female")
        ])
        ;
}

+ (AAOptions *)percentStackedColumnChart {
    return AAOptions.new
        .chartSet(AAChart.new
            .typeSet(AAChartTypeColumn))
        .titleSet(AATitle.new
            .textSet(@"百分比堆叠柱形图"))
        .xAxisSet(AAXAxis.new
            .categoriesSet(@[@"苹果", @"橘子", @"梨", @"葡萄", @"香蕉"]))
        .yAxisSet(AAYAxis.new
            .minSet(@0)
            .titleSet(AATitle.new
                .textSet(@"水果消费总量")))
        .tooltipSet(AATooltip.new
            .pointFormatSet(@"<span style=\"color:{series.color}\">{series.name}</span>: <b>{point.y}</b>({point.percentage:.0f}%)<br/>")
            .sharedSet(true))
        .plotOptionsSet(AAPlotOptions.new
            .columnSet(AAColumn.new
                .stackingSet(AAChartStackingTypePercent)))
        .seriesSet(@[
            AASeriesElement.new
                .nameSet(@"小张")
                .dataSet(@[@5, @3, @4, @7, @2]),
            AASeriesElement.new
                .nameSet(@"小彭")
                .dataSet(@[@2, @2, @3, @2, @1]),
            AASeriesElement.new
                .nameSet(@"小潘")
                .dataSet(@[@3, @4, @4, @2, @5]),
        ])
        ;
}

+ (AAOptions *)columnChartWithRotatedLabels {
    return AAOptions.new
        .chartSet(AAChart.new
            .typeSet(AAChartTypeColumn))
        .titleSet(AATitle.new
            .textSet(@"全球各大城市人口排行"))
        .subtitleSet(AASubtitle.new
            .textSet(@"数据截止 2017-03，来源: Wikipedia"))
        .xAxisSet(AAXAxis.new
            .typeSet(AAChartAxisTypeCategory)
            .labelsSet(AALabels.new
                .rotationSet(@-45)))
        .yAxisSet(AAYAxis.new
            .minSet(@0)
            .titleSet(AATitle.new
                .textSet(@"人口 (百万)")))
        .legendSet(AALegend.new
            .enabledSet(false))
        .tooltipSet(AATooltip.new
            .pointFormatSet(@"人口总量: <b>{point.y:.1f} 百万</b>"))
        .seriesSet(@[
            AASeriesElement.new
                .nameSet(@"总人口")
                .dataSet(@[
                    @[@"上海", @24.25],
                    @[@"卡拉奇", @23.50],
                    @[@"北京", @21.51],
                    @[@"德里", @16.78],
                    @[@"拉各斯", @16.06],
                    @[@"天津", @15.20],
                    @[@"伊斯坦布尔", @14.16],
                    @[@"东京", @13.51],
                    @[@"广州", @13.08],
                    @[@"孟买", @12.44],
                    @[@"莫斯科", @12.19],
                    @[@"圣保罗", @12.03],
                    @[@"深圳", @10.46],
                    @[@"雅加达", @10.07],
                    @[@"拉合尔", @10.05],
                    @[@"首尔", @9.99],
                    @[@"武汉", @9.78],
                    @[@"金沙萨", @9.73],
                    @[@"开罗", @9.27],
                    @[@"墨西哥", @8.87],
                ])
                .dataLabelsSet(AADataLabels.new
                    .enabledSet(true)
                    .rotationSet(@-90)
                    .colorSet(@"#FFFFFF")
                    .alignSet(AAChartAlignTypeRight)
                    .formatSet(@"{point.y:.1f}")
                    .ySet(@10)),
        ])
        ;
}

+ (AAOptions *)columnChartWithNestedColumn {
    NSArray *arr = @[
        AAColumn.new
            .nameSet(@"雇员")
            .colorSet(@"rgba(165,170,217,1)")
            .dataSet(@[@150, @73, @20])
            .pointPaddingSet(@0.3)
            .pointPlacementSet(@-0.2),
        AAColumn.new
            .nameSet(@"优化的员工")
            .colorSet(@"rgba(126,86,134,.9)")
            .dataSet(@[@140, @90, @40])
            .pointPaddingSet(@0.4)
            .pointPlacementSet(@-0.2),
        AAColumn.new
            .nameSet(@"利润")
            .colorSet(@"rgba(248,161,63,1)")
            .dataSet(@[@183.6, @178.8, @198.5])
//            .tooltipSet(AATooltip.new
//                .valuePrefixSet(@"$")
//                .valueSuffixSet(@" M"))
            .pointPaddingSet(@0.3)
            .pointPlacementSet(@0.2)
            .yAxisSet(@1),
        AAColumn.new
            .nameSet(@"优化的利润")
            .colorSet(@"rgba(186,60,61,.9)")
            .dataSet(@[@203.6, @198.8, @208.5])
//            .tooltipSet(AATooltip.new
//                .valuePrefixSet(@"$")
//                .valueSuffixSet(@" M"))
            .pointPaddingSet(@0.4)
            .pointPlacementSet(@0.2)
            .yAxisSet(@1),
    ];
    
    return AAOptions.new
        .chartSet(AAChart.new
            .typeSet(AAChartTypeColumn))
        .titleSet(AATitle.new
            .textSet(@"分公司效率优化嵌套图"))
        .xAxisSet(AAXAxis.new
            .categoriesSet(@[
                @"杭州总部",
                @"上海分部",
                @"北京分部",
            ]))
        .yAxisSet(@[
            AAYAxis.new
                .minSet(@0)
                .titleSet(AATitle.new
                    .textSet(@"雇员")),
            AAYAxis.new
                .titleSet(AATitle.new
                    .textSet(@"利润 (millions)"))
                .oppositeSet(true),
        ])
//        .legendSet(AALegend.new
//            .shadowSet(false))
        .tooltipSet(AATooltip.new
            .sharedSet(true))
        .plotOptionsSet(AAPlotOptions.new
            .columnSet(AAColumn.new
                .groupingSet(false)
                .borderWidthSet(@0)))
        .seriesSet(arr)
        ;
}

+ (AAOptions *)columnRangeChart {
    return AAOptions.new
        .chartSet(AAChart.new
            .typeSet(AAChartTypeColumnrange))
        .titleSet(AATitle.new
            .textSet(@"每月温度变化范围"))
        .subtitleSet(AASubtitle.new
            .textSet(@"2009 挪威某地"))
        .xAxisSet(AAXAxis.new
            .categoriesSet(@[@"一月", @"二月", @"三月", @"四月", @"五月", @"六月", @"七月", @"八月", @"九月", @"十月", @"十一月", @"十二月"]))
        .yAxisSet(AAYAxis.new
            .titleSet(AATitle.new
                .textSet(@"温度 ( °C )")))
        .tooltipSet(AATooltip.new
            .valueSuffixSet(@"°C"))
        .plotOptionsSet(AAPlotOptions.new
            .columnrangeSet(AAColumnrange.new
                .dataLabelsSet(AADataLabels.new
                    .enabledSet(true)
                    .formatterSet(@"function () {\n    return this.y + '°C';\n}"))))
        .legendSet(AALegend.new
            .enabledSet(false))
        .seriesSet(@[
            AASeriesElement.new
                .nameSet(@"温度")
                .dataSet(@[
                    @[@-9.7, @9.4],
                    @[@-8.7, @6.5],
                    @[@-3.5, @9.4],
                    @[@-1.4, @19.9],
                    @[@0.0, @22.6],
                    @[@2.9, @29.5],
                    @[@9.2, @30.7],
                    @[@7.3, @26.5],
                    @[@4.4, @18.0],
                    @[@-3.1, @11.4],
                    @[@-5.2, @10.4],
                    @[@-13.5, @9.8],
                ]),
        ])
        ;
}

@end
