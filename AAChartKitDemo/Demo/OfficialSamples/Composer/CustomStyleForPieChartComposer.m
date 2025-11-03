#import "CustomStyleForPieChartComposer.h"
#import "AAChartKit.h"

@implementation CustomStyleForPieChartComposer

+ (AAChartModel *)pieChart {
    return AAChartModel.new
        .chartTypeSet(AAChartTypePie)
        .backgroundColorSet(AAColor.whiteColor)
        .titleSet(@"LANGUAGE MARKET SHARES JANUARY,2020 TO MAY")
        .subtitleSet(@"virtual data")
        .dataLabelsEnabledSet(true)
        .yAxisTitleSet(@"℃")
        .seriesSet(@[
            AASeriesElement.new
                .nameSet(@"Language market shares")
                .innerSizeSet(@"40%")
                .allowPointSelectSet(true)
                .statesSet(AAStates.new
                    .hoverSet(AAHover.new
                        .enabledSet(false)))
                .dataSet(@[
                    @[@"Java",   @67],
                    @[@"Swift",  @999],
                    @[@"Python", @83],
                    @[@"OC",     @11],
                    @[@"Go",     @30],
                ])
        ])
        ;
}

+ (AAChartModel *)doubleLayerPieChart {
    return AAChartModel.new
        .chartTypeSet(AAChartTypePie)
        .titleSet(@"浏览器市场占比历史对比")
        .subtitleSet(@"无任何可靠依据的虚拟数据")
        .dataLabelsEnabledSet(true)
        .yAxisTitleSet(@"摄氏度")
        .seriesSet(@[
            AASeriesElement.new
                .nameSet(@"Past")
                .sizeSet(@"40%")
                .innerSizeSet(@"30%")
                .borderWidthSet(@0)
                .allowPointSelectSet(false)
                .dataSet(@[
                    @[@"Firefox Past", @3336.2],
                    @[@"Chrome Past",  @26.8],
                    @[@"Safari Past",  @88.5],
                    @[@"Opera Past",   @46.0],
                    @[@"Others Past",  @223.0],
                ]),
            AASeriesElement.new
                .nameSet(@"Now")
                .sizeSet(@"80%")
                .innerSizeSet(@"70%")
                .borderWidthSet(@0)
                .allowPointSelectSet(false)
                .dataSet(@[
                    @[@"Firefox Now", @336.2],
                    @[@"Chrome Now",  @6926.8],
                    @[@"Safari Now",  @388.5],
                    @[@"Opera Now",   @446.0],
                    @[@"Others Now",  @223.0],
                ])
        ])
        ;
}

+ (AAChartModel *)doubleLayerDoubleColorsPieChart {
    return AAChartModel.new
        .chartTypeSet(AAChartTypePie)
        .titleSet(@"浏览器市场占比历史对比")
        .subtitleSet(@"无任何可靠依据的虚拟数据")
        .dataLabelsEnabledSet(false)
        .yAxisTitleSet(@"摄氏度")
        .legendEnabledSet(true)
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
                .sizeSet(@"25%")
                .innerSizeSet(@"20%")
                .borderWidthSet(@0)
                .allowPointSelectSet(false)
                .dataSet(@[
                    @[@"Firefox Past", @1336.2],
                    @[@"Chrome Past",  @126.8],
                    @[@"Safari Past",  @188.5],
                    @[@"Opera Past",   @146.0],
                    @[@"Others Past",  @223.0],
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
                    .formatSet(@"<b>{point.name}</b> <br> {point.percentage:.1f} %")
                    .alignToSet(@"plotEdges")
                    .connectorShapeSet(@"crookedLine")
                    .crookDistanceSet(@"90%")
                    .styleSet(AAStyleColorSize(AARgbaColor(30, 144, 255, 1.0), 0)))
                .sizeSet(@"40%")
                .innerSizeSet(@"80%")
                .borderWidthSet(@0)
                .allowPointSelectSet(false)
                .dataSet(@[
                    @[@"Firefox Now", @926.8],
                    @[@"Chrome Now",  @336.2],
                    @[@"Safari Now",  @388.5],
                    @[@"Opera Now",   @446.0],
                    @[@"Others Now",  @223.0],
                ])
        ])
        ;
}

+ (AAChartModel *)pieChartWithSoftCorners {
    return [self pieChart]
        .borderRadiusSet(@10);
}

+ (AAChartModel *)doubleLayerPieChartWithSoftCorners {
    return [self doubleLayerPieChart]
        .borderRadiusSet(@10);
}

+ (AAChartModel *)doubleLayerDoubleColorsPieChartWithSoftCorners {
    return [self doubleLayerDoubleColorsPieChart]
        .borderRadiusSet(@6);
}

+ (AAChartModel *)pieChartWithRoundedCorners {
    return [self pieChart]
        .borderRadiusSet(@"50%");
}

+ (AAChartModel *)doubleLayerPieChartWithRoundedCorners {
    return [self doubleLayerPieChart]
        .borderRadiusSet(@"50%");
}

+ (AAChartModel *)doubleLayerDoubleColorsPieChartWithRoundedCorners {
    return [self doubleLayerDoubleColorsPieChart]
        .borderRadiusSet(@"50%");
}

@end
