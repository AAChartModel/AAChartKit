#import "PieChartOptionsComposer.h"
#import "AAChartKit.h"

@implementation PieChartOptionsComposer

+ (AAOptions *)basicPieChart {
    return AAOptions.new
        .chartSet(AAChart.new
            .typeSet(AAChartTypePie))
        .titleSet(AATitle.new
            .textSet(@"2018年1月浏览器市场份额"))
        .tooltipSet(AATooltip.new
            .pointFormatSet(@"{series.name}: <b>{point.percentage:.1f}%</b>"))
        .plotOptionsSet(AAPlotOptions.new
            .pieSet(AAPie.new
                .allowPointSelectSet(true)
                .cursorSet(@"pointer")
                .dataLabelsSet(AADataLabels.new
                    .enabledSet(true)
                    .formatSet(@"<b>{point.name}</b>: {point.percentage:.1f} %")
                    .styleSet(AAStyle.new
                        .colorSet(AAColor.blackColor)))))
        .seriesSet(@[
            AASeriesElement.new
                .nameSet(@"Brands")
                .colorByPointSet(@true)
                .dataSet(@[
                    @[@"Chrome", @61.41],
                    @[@"Internet Explorer", @11.84],
                    @[@"Firefox", @10.85],
                    @[@"Edge", @4.67],
                    @[@"Safari", @4.18],
                    @[@"Sogou Explorer", @1.64],
                    @[@"Opera", @1.6],
                    @[@"QQ", @1.2],
                    @[@"Other", @2.61]
                ])
        ]);
}

+ (AAOptions *)basicPieChartWithLegend {
    return AAOptions.new
        .chartSet(AAChart.new
            .typeSet(AAChartTypePie))
        .titleSet(AATitle.new
            .textSet(@"2018年1月浏览器市场份额"))
        .tooltipSet(AATooltip.new
            .pointFormatSet(@"{series.name}: <b>{point.percentage:.1f}%</b>"))
        .plotOptionsSet(AAPlotOptions.new
            .pieSet(AAPie.new
                .allowPointSelectSet(true)
                .cursorSet(@"pointer")
                .dataLabelsSet(AADataLabels.new
                    .enabledSet(false))
                .showInLegendSet(true)))
        .seriesSet(@[
            AASeriesElement.new
                .nameSet(@"Brands")
                .colorByPointSet(@true)
                .dataSet(@[
                    @[@"Chrome", @61.41],
                    @[@"Internet Explorer", @11.84],
                    @[@"Firefox", @10.85],
                    @[@"Edge", @4.67],
                    @[@"Safari", @4.18],
                    @[@"Other", @7.05]
                ])
        ]);
}

+ (AAOptions *)basicPieChartWithGradientColor {
    return AAOptions.new
        .chartSet(AAChart.new
            .typeSet(AAChartTypePie))
        .titleSet(AATitle.new
            .textSet(@"浏览器<br>占比"))
        .tooltipSet(AATooltip.new
            .headerFormatSet(@"{series.name}<br>")
            .pointFormatSet(@"{point.name}: <b>{point.percentage:.1f}%</b>"))
        .plotOptionsSet(AAPlotOptions.new
            .pieSet(AAPie.new
                .dataLabelsSet(AADataLabels.new
                    .enabledSet(true)
                    .distanceSet(@-50)
                    .styleSet(AAStyle.new
                        .fontWeightSet(AAChartFontWeightTypeBold)
                        .colorSet(AAColor.whiteColor)))
                .startAngleSet(@-90)
                .endAngleSet(@90)
                .centerSet(@[@"50%", @"75%"])))
        .seriesSet(@[
            AASeriesElement.new
                .nameSet(@"浏览器占比")
                .innerSizeSet(@"50%")
                .dataSet(@[
                    @[@"Firefox", @45.0],
                    @[@"IE", @26.8],
                    @[@"Chrome", @12.8],
                    @[@"Safari", @8.5],
                    @[@"Opera", @6.2],
                    AADataElement.new
                        .nameSet(@"其他")
                        .ySet(@0.7)
                        .dataLabelsSet(AADataLabels.new
                            .enabledSet(false))
                ])
        ]);
}

+ (AAOptions *)basicPieChartWithGradientColor2 {
    return AAOptions.new
        .chartSet(AAChart.new
            .typeSet(AAChartTypePie))
        .titleSet(AATitle.new
            .textSet(@"2014年某网站各浏览器的访问量占比"))
        .tooltipSet(AATooltip.new
            .pointFormatSet(@"{series.name}: <b>{point.percentage:.1f}%</b>"))
        .plotOptionsSet(AAPlotOptions.new
            .pieSet(AAPie.new
                .allowPointSelectSet(true)
                .cursorSet(@"pointer")
                .dataLabelsSet(AADataLabels.new
                    .enabledSet(true)
                    .formatSet(@"<b>{point.name}</b>: {point.percentage:.1f} %")
                    .styleSet(AAStyle.new
                        .colorSet(AAColor.whiteColor))
                    .connectorColorSet(@"silver"))))
        .seriesSet(@[
            AASeriesElement.new
                .nameSet(@"浏览器占比")
                .dataSet(@[
                    @[@"Firefox", @45.0],
                    @[@"IE", @26.8],
                    @{
                        @"name": @"Chrome",
                        @"y": @12.8,
                        @"sliced": @YES,
                        @"selected": @YES
                    },
                    @[@"Safari", @8.5],
                    @[@"Opera", @6.2],
                    @[@"其他", @0.7]
                ])
        ]);
}

+ (AAOptions *)basicPieChartWithMonochromeColor {
    return AAOptions.new
        .chartSet(AAChart.new
            .typeSet(AAChartTypePie))
        .titleSet(AATitle.new
            .textSet(@"2014年某网站各浏览器的访问量占比"))
        .tooltipSet(AATooltip.new
            .pointFormatSet(@"{series.name}: <b>{point.percentage:.1f}%</b>"))
        .plotOptionsSet(AAPlotOptions.new
            .pieSet(AAPie.new
                .allowPointSelectSet(true)
                .cursorSet(@"pointer")
                .dataLabelsSet(AADataLabels.new
                    .enabledSet(true)
                    .formatSet(@"<b>{point.name}</b>: {point.percentage:.1f} %")
                    .styleSet(AAStyle.new
                        .colorSet(AAColor.whiteColor)))))
        .seriesSet(@[
            AASeriesElement.new
                .nameSet(@"浏览器占比")
                .dataSet(@[
                    @[@"Firefox", @45.0],
                    @[@"IE", @26.8],
                    @{
                        @"name": @"Chrome",
                        @"y": @12.8,
                        @"sliced": @YES,
                        @"selected": @YES
                    },
                    @[@"Safari", @8.5],
                    @[@"Opera", @6.2],
                    @[@"其他", @0.7]
                ])
        ]);
}

+ (AAOptions *)customPieChartTitlePosition {
    return AAOptions.new
        .chartSet(AAChart.new
            .spacingSet(@[@40, @0, @40, @0]))
        .titleSet(AATitle.new
//            .floatingSet(true)
            .textSet(@"圆心显示的标题"))
        .tooltipSet(AATooltip.new
            .pointFormatSet(@"{series.name}: <b>{point.percentage:.1f}%</b>"))
        .plotOptionsSet(AAPlotOptions.new
            .pieSet(AAPie.new
                .allowPointSelectSet(true)
                .cursorSet(@"pointer")
                .dataLabelsSet(AADataLabels.new
                    .enabledSet(true)
                    .formatSet(@"<b>{point.name}</b>: {point.percentage:.1f} %")
                    .styleSet(AAStyle.new
                        .colorSet(AAColor.whiteColor)))
//                .pointSet(AAPoint.new
//                    .eventsSet(AAPointEvents.new
//                        .mouseOverSet(@"function(e) { chart.setTitle({ text: e.target.name+ '\\t'+ e.target.y + ' %' }); }")))
                    )
                    )
        .seriesSet(@[
            AASeriesElement.new
                .typeSet(AAChartTypePie)
                .innerSizeSet(@"80%")
                .nameSet(@"市场份额")
                .dataSet(@[
                    @[@"Firefox", @45.0, @"http://bbs.hcharts.cn"],
                    @[@"IE", @26.8],
                    @{
                        @"name": @"Chrome",
                        @"y": @12.8,
                        @"sliced": @YES,
                        @"selected": @YES,
                        @"url": @"http://www.hcharts.cn"
                    },
                    @[@"Safari", @8.5],
                    @[@"Opera", @6.2],
                    @[@"其他", @0.7]
                ])
        ]);
}

@end
