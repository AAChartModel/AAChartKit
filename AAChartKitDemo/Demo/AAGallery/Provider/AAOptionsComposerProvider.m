//
//  AAOptionsComposerProvider.m
//  AAChartKitDemo
//

#import "AAOptionsComposerProvider.h"
#import "AAChartKit.h"

#import "AreasplineChartOptionsComposer.h"
#import "DataLabelsOptionsComposer.h"
#import "DrawChartWithAAOptionsComposer.h"
#import "LineChartViewController.h"
#import "MultiYAxesChartOptionsComposer.h"
#import "PieChartOptionsComposer.h"
#import "PlotLinesBandsZonesOptionsComposer.h"
#import "PolarChartOptionsComposer.h"
#import "SpecialStyleChartOptionsComposer.h"
#import "TooltipOptionsComposer.h"
#import "XAxisYAxisLabelsOptionsComposer.h"
#import "XAxisYAxisTypeOptionsComposer.h"

@interface LineChartViewController (AAOptionsComposerProviderMethods)
+ (AAOptions *)customconnectNullsWithZonesForLineChart;
+ (AAOptions *)fixedWidthSlotsLineChartWithOnePointAndRightExtension;
+ (AAOptions *)fixedWidthSlotsLineChartWithTwoPoints;
+ (AAOptions *)fixedWidthSlotsLineChartWithThreePoints;
+ (AAOptions *)fixedWidthSlotsLineChartWithTenPoints;
@end

@implementation AAOptionsComposerProvider

+ (NSArray<AAOptions *> *)aaOptionsComposerItems {
    NSMutableArray<AAOptions *> *allItems = [NSMutableArray array];
    [allItems addObjectsFromArray:[self areasplineOptionsItems]];
    [allItems addObjectsFromArray:[self dataLabelsOptionsItems]];
    [allItems addObjectsFromArray:[self drawChartWithAAOptionsItems]];
    [allItems addObjectsFromArray:[self lineChartOptionsItems]];
    [allItems addObjectsFromArray:[self multiYAxesOptionsItems]];
    [allItems addObjectsFromArray:[self pieOptionsItems]];
    [allItems addObjectsFromArray:[self plotLinesBandsZonesOptionsItems]];
    [allItems addObjectsFromArray:[self polarOptionsItems]];
    [allItems addObjectsFromArray:[self specialStyleOptionsItems]];
    [allItems addObjectsFromArray:[self tooltipOptionsItems]];
    [allItems addObjectsFromArray:[self xAxisYAxisLabelsOptionsItems]];
    [allItems addObjectsFromArray:[self xAxisYAxisTypeOptionsItems]];

    return [self processChartOptions:allItems];
}

#pragma mark - Areaspline

+ (NSArray<AAOptions *> *)areasplineOptionsItems {
    return @[
        [AreasplineChartOptionsComposer configureComplicatedCustomAreasplineChart],
        [AreasplineChartOptionsComposer configureComplicatedCustomAreasplineChart2],
        [AreasplineChartOptionsComposer configureComplicatedCustomAreasplineChart3],
        [AreasplineChartOptionsComposer fanChart],
    ];
}

#pragma mark - DataLabels

+ (NSArray<AAOptions *> *)dataLabelsOptionsItems {
    return @[
        [DataLabelsOptionsComposer adjustChartDataLabelsStyle],
        [DataLabelsOptionsComposer customizeEveryDataLabelBySinglely],
        [DataLabelsOptionsComposer configureStackingColumnChartDataLabelsOverflow],
        [DataLabelsOptionsComposer configureReversedBarChartDataLabelsStyle],
        [DataLabelsOptionsComposer configureColumnChartDataLabelsLayout],
    ];
}

#pragma mark - DrawChartWithAAOptions

+ (NSArray<AAOptions *> *)drawChartWithAAOptionsItems {
    return @[
        [DrawChartWithAAOptionsComposer configureTheAAOptionsOfAreaChart],
        [DrawChartWithAAOptionsComposer configureTheAAOptionsOfSpecialNestedColumnChart],
        [DrawChartWithAAOptionsComposer configureTheNoGapColunmChart],
        [DrawChartWithAAOptionsComposer adjustChartLeftAndRightMargin],
        [DrawChartWithAAOptionsComposer configureChartWithBackgroundImage],
        [DrawChartWithAAOptionsComposer adjustChartSeriesDataAccuracy],
        [DrawChartWithAAOptionsComposer customStyleStackedColumnChart],
        [DrawChartWithAAOptionsComposer disableChartAnimation],
        [DrawChartWithAAOptionsComposer customChartLengendItemStyle],
        [DrawChartWithAAOptionsComposer configure_DataLabels_XAXis_YAxis_Legend_Style],
        [DrawChartWithAAOptionsComposer customChartStyleWhenNoData],
        [DrawChartWithAAOptionsComposer customChartStyleWhenEveryDataValueIsZero],
        [DrawChartWithAAOptionsComposer disableSpineChartHoverAnimationEffect],
        [DrawChartWithAAOptionsComposer yAxisOnTheRightSideChart],
        [DrawChartWithAAOptionsComposer configureBoxplotChartWithSpecialStyle],
        [DrawChartWithAAOptionsComposer toFixHighchartsWithAThickLineAt0ValuesTheLineIsHalfHidden],
        [DrawChartWithAAOptionsComposer clipForAASeriesElement],
    ];
}

#pragma mark - LineChart

+ (NSArray<AAOptions *> *)lineChartOptionsItems {
    return @[
        [LineChartViewController customconnectNullsWithZonesForLineChart],
        [LineChartViewController fixedWidthSlotsLineChartWithOnePointAndRightExtension],
        [LineChartViewController fixedWidthSlotsLineChartWithTwoPoints],
        [LineChartViewController fixedWidthSlotsLineChartWithThreePoints],
        [LineChartViewController fixedWidthSlotsLineChartWithTenPoints],
    ];
}

#pragma mark - MultiYAxes

+ (NSArray<AAOptions *> *)multiYAxesOptionsItems {
    return @[
        [MultiYAxesChartOptionsComposer configureDoubleYAxesAreasplineMixedColumnChart],
        [MultiYAxesChartOptionsComposer configureTripleYAxesColumnMixedSplineChart],
        [MultiYAxesChartOptionsComposer configureDoubleYAxesColumnMixedSplineChart],
        [MultiYAxesChartOptionsComposer configureDoubleYAxesMarketDepthChart],
        [MultiYAxesChartOptionsComposer configureTheMirrorColumnChart],
        [MultiYAxesChartOptionsComposer configureTheMirrorColumnChartWithNoAnyGap],
    ];
}

#pragma mark - Pie

+ (NSArray<AAOptions *> *)pieOptionsItems {
    return @[
        [AAPieChartOptionsComposer showPieChartPointNamePointYAndPointPercentForDataLabels],
        [AAPieChartOptionsComposer adjustPieChartTitleAndDataLabelFontStyle],
        [AAPieChartOptionsComposer adjustPieChartTitleAndDataLabelFontStyle2],
        [AAPieChartOptionsComposer configurePieChartFormatProperty],
        [AAPieChartOptionsComposer doubleLayerHalfPieChart],
        [AAPieChartOptionsComposer adjustPieChartDataLabelStyleAndPostion],
        [AAPieChartOptionsComposer showPieChartPointNamePointYAndPointPercentForDataLabels],
    ];
}

#pragma mark - PlotLinesBandsZones

+ (NSArray<AAOptions *> *)plotLinesBandsZonesOptionsItems {
    return @[
        [PlotLinesBandsZonesOptionsComposer simpleGaugeChart],
        [PlotLinesBandsZonesOptionsComposer gaugeChartWithPlotBand],
        [PlotLinesBandsZonesOptionsComposer configureAAPlotBandsForChart],
        [PlotLinesBandsZonesOptionsComposer configureAAPlotLinesForChart],
        [PlotLinesBandsZonesOptionsComposer configureAASeriesElementZones],
        [PlotLinesBandsZonesOptionsComposer configureAASeriesElementZonesMixedAAPlotLines],
        [PlotLinesBandsZonesOptionsComposer configureXAxisPlotBandAreaMixedColumnChart],
        [PlotLinesBandsZonesOptionsComposer configureXAxisPlotLinesForChart],
        [PlotLinesBandsZonesOptionsComposer configureXAxisPlotLinesForChart2],
        [PlotLinesBandsZonesOptionsComposer configureGradientPlotBandForChart],
    ];
}

#pragma mark - Polar

+ (NSArray<AAOptions *> *)polarOptionsItems {
    return @[
        [PolarChartOptionsComposer configureThePolygonPolarChart],
        [PolarChartOptionsComposer adjustGroupPaddingForPolarChart],
        [PolarChartOptionsComposer configureTriangleRadarChart],
        [PolarChartOptionsComposer configureQuadrangleRadarChart],
        [PolarChartOptionsComposer configurePentagonRadarChart],
        [PolarChartOptionsComposer configureHexagonRadarChart],
        [PolarChartOptionsComposer configureSpiderWebRadarChart],
        [PolarChartOptionsComposer radarChartWithCategories],
    ];
}

#pragma mark - SpecialStyle

+ (NSArray<AAOptions *> *)specialStyleOptionsItems {
    return @[
        [SpecialStyleChartOptionsComposer everySingleColumnHasGrayBackground],
        [SpecialStyleChartOptionsComposer everySingleColumnHasWhiteEmptyBorderLineBackground],
        [SpecialStyleChartOptionsComposer colorfulSpecialStyleColumnChart],
    ];
}

#pragma mark - Tooltip

+ (NSArray<AAOptions *> *)tooltipOptionsItems {
    return @[
        [TooltipOptionsComposer customTooltipStyleByFormatProperties],
        [TooltipOptionsComposer customAreaChartTooltipStyleLikeHTMLTable],
        [TooltipOptionsComposer customAreasplineChartTooltipContentWithHeaderFormat],
        [TooltipOptionsComposer customAreaChartTooltipStyleWithTotalValueHeader],
        [TooltipOptionsComposer customBoxplotTooltipContent],
    ];
}

#pragma mark - XAxis/YAxis Labels

+ (NSArray<AAOptions *> *)xAxisYAxisLabelsOptionsItems {
    return @[
        [XAxisYAxisLabelsOptionsComposer configureXAxisLabelsFontColorWithHTMLString],
        [XAxisYAxisLabelsOptionsComposer configureXAxisLabelsFontColorAndFontSizeWithHTMLString],
        [XAxisYAxisLabelsOptionsComposer customXAxisLabelsBeImages],
        [XAxisYAxisLabelsOptionsComposer configureYAxisLabelsNumericSymbolsMagnitudeOfAerasplineChart],
    ];
}

#pragma mark - XAxis/YAxis Type

+ (NSArray<AAOptions *> *)xAxisYAxisTypeOptionsItems {
    return @[
        [XAxisYAxisTypeOptionsComposer dateTimeTypeStepLineChart],
        [XAxisYAxisTypeOptionsComposer timeDataWithIrregularIntervalsChart],
        [XAxisYAxisTypeOptionsComposer logarithmicAxisLineChart],
        [XAxisYAxisTypeOptionsComposer logarithmicAxisScatterChart],
        [XAxisYAxisTypeOptionsComposer dashedAxisAndCustomAxisTitlePositionLineChart],
        [XAxisYAxisTypeOptionsComposer dashedAxisAndCustomAxisTitlePositionLineChart2],
    ];
}

#pragma mark - Helper

+ (NSArray<AAOptions *> *)processChartOptions:(NSArray<AAOptions *> *)options {
    NSMutableArray<AAOptions *> *finalItems = [NSMutableArray arrayWithCapacity:options.count];
    for (AAOptions *aaOptions in options) {
        [finalItems addObject:aaOptions];
    }
    return [finalItems copy];
}

@end
