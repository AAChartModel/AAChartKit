//
//  CustomStyleChartModelProvider.m
//  AAChartKitDemo
//
//  Created by AnAn on 2025/11/3.
//  Copyright © 2025 An An. All rights reserved.
//


#import "CustomStyleChartModelProvider.h"
#import "AAChartKit.h"

// 导入相关的 Composer 类
#import "SpecialChartComposer.h"
#import "MixedChartComposer.h"
#import "MixedChartComposer2.h"
#import "CustomStyleForColumnChartComposer.h"
#import "CustomStyleForLineChartComposer.h"
#import "CustomStyleForAreasplineChartComposer.h"
#import "CustomStyleForPieChartComposer.h"
#import "CustomStyleForLineChartComposer2.h"
#import "CustomStyleForBarChartComposer.h"
#import "CustomStyleForSplineChartComposer.h"
#import "CustomStyleForAreaChartComposer.h"
#import "CustomStyleForScatterChartComposer.h"
#import "CustomStyleForBubbleChartComposer.h"

@implementation CustomStyleChartModelProvider

+ (NSArray<AAOptions *> *)aaChartModelItems {
    NSMutableArray *originalItems = [NSMutableArray array];
    
    // SpecialChartComposer
    [originalItems addObjectsFromArray:[self specialChartItems]];
    
    // MixedChartComposer
    [originalItems addObjectsFromArray:[self mixedChartItems]];
    
    // MixedChartComposer2
    [originalItems addObjectsFromArray:[self mixedChart2Items]];
    
    // CustomStyleForColumnChartComposer
    [originalItems addObjectsFromArray:[self customStyleForColumnChartItems]];
    
    // CustomStyleForLineChartComposer
    [originalItems addObjectsFromArray:[self customStyleForLineChartItems]];
    
    // CustomStyleForAreasplineChartComposer
    [originalItems addObjectsFromArray:[self customStyleForAreasplineChartItems]];
    
    // CustomStyleForPieChartComposer
    [originalItems addObjectsFromArray:[self customStyleForPieChartItems]];
    
    // CustomStyleForLineChartComposer2
    [originalItems addObjectsFromArray:[self customStyleForLineChartItems2]];
    
    //遍历 originalItems 数组,将其中的每个 AAChartModel 实例转化为 AAOptions 实例
    NSMutableArray *finalItems = [NSMutableArray array];
    for (AAChartModel *aaChartModel in originalItems) {
        AAOptions *aaOptions = aaChartModel.aa_toAAOptions;
//        aaOptions.chart.polar = YES;
        [finalItems addObject:aaOptions];
    }
    
    return [finalItems copy];
}

#pragma mark - SpecialChartComposer

+ (NSArray<AAChartModel *> *)specialChartItems {
    return @[
        [SpecialChartComposer polarColumnChart],
        [SpecialChartComposer polarBarChart],
        [SpecialChartComposer polarLineChart],
        [SpecialChartComposer polarAreaChart],
        [SpecialChartComposer stepLineChart],
        [SpecialChartComposer stepAreaChart],
        [SpecialChartComposer pieChart],
        [SpecialChartComposer bubbleChart],
        [SpecialChartComposer packedbubbleChart],
        [SpecialChartComposer scatterChart],
        [SpecialChartComposer arearangeChart],
        [SpecialChartComposer areasplinerangeChart],
        [SpecialChartComposer columnrangeChart],
        [SpecialChartComposer boxplotChart],
        [SpecialChartComposer waterfallChart],
        [SpecialChartComposer pyramidChart],
        [SpecialChartComposer funnelChart],
        [SpecialChartComposer errorbarChart],
        [SpecialChartComposer gaugeChart],
        [SpecialChartComposer polygonChart],
        [SpecialChartComposer columnpyramidChart],
    ];
}

#pragma mark - MixedChartComposer

+ (NSArray<AAChartModel *> *)mixedChartItems {
    return @[
//        [MixedChartComposer arearangeMixedLineChart],
//        [MixedChartComposer columnrangeMixedLineChart],
//        [MixedChartComposer stackingColumnMixedLineChart],
//        [MixedChartComposer scatterMixedLineChart],
//        [MixedChartComposer polygonMixedScatterChart],
//        [MixedChartComposer polarChartMixedChart],
//        [MixedChartComposer columnMixedScatterChart],
//        [MixedChartComposer areasplinerangeMixedColumnrangeMixedLineChart],
//        [MixedChartComposer boxplotMixedScatterChartWithJitter],
//        [MixedChartComposer multiLevelStopsArrGradientColorAreasplineMixedLineChart],
//        [MixedChartComposer arearangeMixedLineChart],
    ];
}

#pragma mark - MixedChartComposer2

+ (NSArray<AAChartModel *> *)mixedChart2Items {
    return @[
        [MixedChartComposer2 scatterPlotWithTrendLine],
        [MixedChartComposer2 scatterPlotWithTrendLine2],
        [MixedChartComposer2 pieMixedLineMixedColumnChart],
        [MixedChartComposer2 pieMixedLineMixedColumnChart2],
        [MixedChartComposer2 scatterWithMultipleLinearRegressionChart],
        [MixedChartComposer2 rangeSplineAreaSplineAndMarkerChart],
    ];
}

#pragma mark - CustomStyleForColumnChartComposer

+ (NSArray<AAChartModel *> *)customStyleForColumnChartItems {
    return @[
        [CustomStyleForColumnChartComposer colorfulColumnChart],
        [CustomStyleForColumnChartComposer colorfulGradientColorColumnChart],
        [CustomStyleForColumnChartComposer discontinuousDataColumnChart],
        [CustomStyleForColumnChartComposer randomColorfulColumnChart],
        
        [CustomStyleForColumnChartComposer noneStackingPolarColumnChart],
        [CustomStyleForColumnChartComposer normalStackingPolarColumnChart],
        [CustomStyleForColumnChartComposer percentStackingPolarColumnChart],
        
        [CustomStyleForColumnChartComposer specialStyleForTheSingleDataElementOfColumnChart],
        [CustomStyleForColumnChartComposer noMoreGroupingAndOverlapEachOtherColumnChart],
        [CustomStyleForColumnChartComposer noMoreGroupingAndNestedColumnChart],
        [CustomStyleForColumnChartComposer topRoundedCornersStackingColumnChart],
        [CustomStyleForColumnChartComposer freeStyleRoundedCornersStackingColumnChart],
        
        [CustomStyleForColumnChartComposer customBorderStyleAndStatesHoverColorColumnChart],
        [CustomStyleForColumnChartComposer negativeDataMixedPositiveDataColumnChart],
    ];
}

#pragma mark - CustomStyleForLineChartComposer

+ (NSArray<AAChartModel *> *)customStyleForLineChartItems {
    return @[
        [CustomStyleForLineChartComposer mixedLineChart],
        [CustomStyleForLineChartComposer stepLineChart],
        [CustomStyleForLineChartComposer stepAreaChart],
        [CustomStyleForLineChartComposer customSingleDataLabelForLineChart],
        [CustomStyleForLineChartComposer shadowStyleLineChart],
        [CustomStyleForLineChartComposer colorfulGradientLineChart],
        [CustomStyleForLineChartComposer customMarkerSymbolContentLineChart],
        [CustomStyleForLineChartComposer drawPointsWithCoordinatesForLineChart],
        [CustomStyleForLineChartComposer customHoverAndSelectHaloStyleForLineChart],
        [CustomStyleForLineChartComposer disableSomeOfLinesMouseTrackingEffectForLineChart],
        [CustomStyleForLineChartComposer colorfulShadowLineChart],
        [CustomStyleForLineChartComposer colorfulDataLabelsStepLineChart],
        [CustomStyleForLineChartComposer disableMarkerHoverEffectForLineChart],
        [CustomStyleForLineChartComposer maxAndMinDataLabelsForLineChart],
        [CustomStyleForLineChartComposer dashStyleTypesMixedLineChart],
        [CustomStyleForLineChartComposer allLineDashStyleTypesMixedLineChart],
        [CustomStyleForLineChartComposer shadowLineChart],
        [CustomStyleForLineChartComposer colorfulMarkersAndLinesLineChart],
        [CustomStyleForLineChartComposer colorfulMarkersAndLinesLineChart2],
        [CustomStyleForLineChartComposer connectNullsForSingleAASeriesElementLineChart],
        [CustomStyleForLineChartComposer largeDifferencesInTheNumberOfDataInDifferentSeriesElementLineChart],
        [CustomStyleForLineChartComposer customDifferentDataLabelsShapeForLineChart],
        [CustomStyleForLineChartComposer clipForAASeriesElementLineChart],
    ];
}

#pragma mark - CustomStyleForAreasplineChartComposer

+ (NSArray<AAChartModel *> *)customStyleForAreasplineChartItems {
    return @[
        [CustomStyleForAreasplineChartComposer withMinusNumberAreasplineChart],
        [CustomStyleForAreasplineChartComposer colorfulGradientAreasplineChart],
        [CustomStyleForAreasplineChartComposer gradientColorAreasplineChart],
        [CustomStyleForAreasplineChartComposer thresholdForAreasplineChart],
        [CustomStyleForAreasplineChartComposer customSpecialStyleDataLabelOfSingleDataElementForAreasplineChart],
        [CustomStyleForAreasplineChartComposer customMarkerStatesHoverStyleForAreasplineChart],
        [CustomStyleForAreasplineChartComposer colorfulGradientColorAndColorfulDataLabelsStepAreasplineChart],
        [CustomStyleForAreasplineChartComposer negativeColorMixedAreasplineChart],
        [CustomStyleForAreasplineChartComposer customColorfulGradientColorZonesForAreasplineChart],
    ];
}

#pragma mark - CustomStyleForPieChartComposer

+ (NSArray<AAChartModel *> *)customStyleForPieChartItems {
    return @[
        [CustomStyleForPieChartComposer pieChart],
        [CustomStyleForPieChartComposer doubleLayerPieChart],
        [CustomStyleForPieChartComposer doubleLayerDoubleColorsPieChart],
        
        [CustomStyleForPieChartComposer pieChartWithSoftCorners],
        [CustomStyleForPieChartComposer doubleLayerPieChartWithSoftCorners],
        [CustomStyleForPieChartComposer doubleLayerDoubleColorsPieChartWithSoftCorners],
        
        [CustomStyleForPieChartComposer pieChartWithRoundedCorners],
        [CustomStyleForPieChartComposer doubleLayerPieChartWithRoundedCorners],
        [CustomStyleForPieChartComposer doubleLayerDoubleColorsPieChartWithRoundedCorners],
    ];
}

#pragma mark - CustomStyleForBarChartComposer

+ (NSArray<AAChartModel *> *)customStyleForBarChartItems {
    return @[
        [CustomStyleForBarChartComposer colorfulBarChart],
        [CustomStyleForBarChartComposer colorfulGradientColorBarChart],
        [CustomStyleForBarChartComposer discontinuousDataBarChart],
        [CustomStyleForBarChartComposer randomColorfulBarChart],
        
        [CustomStyleForBarChartComposer noneStackingPolarBarChart],
        [CustomStyleForBarChartComposer normalStackingPolarBarChart],
        [CustomStyleForBarChartComposer percentStackingPolarBarChart],
        
        [CustomStyleForBarChartComposer specialStyleForTheSingleDataElementOfBarChart],
        [CustomStyleForBarChartComposer noMoreGroupingAndOverlapEachOtherBarChart],
        [CustomStyleForBarChartComposer noMoreGroupingAndNestedBarChart],
        [CustomStyleForBarChartComposer topRoundedCornersStackingBarChart],
        [CustomStyleForBarChartComposer freeStyleRoundedCornersStackingBarChart],
        
        [CustomStyleForBarChartComposer customBorderStyleAndStatesHoverColorBarChart],
        [CustomStyleForBarChartComposer negativeDataMixedPositiveDataBarChart],
    ];
}

#pragma mark - CustomStyleForSplineChartComposer

+ (NSArray<AAChartModel *> *)customStyleForSplineChartItems {
    return @[
        [CustomStyleForSplineChartComposer mixedSplineChart],
        [CustomStyleForSplineChartComposer stepSplineChart],
        [CustomStyleForSplineChartComposer customSingleDataLabelForSplineChart],
        [CustomStyleForSplineChartComposer shadowStyleSplineChart],
        [CustomStyleForSplineChartComposer colorfulGradientSplineChart],
        [CustomStyleForSplineChartComposer customMarkerSymbolContentSplineChart],
        [CustomStyleForSplineChartComposer drawPointsWithCoordinatesForSplineChart],
        [CustomStyleForSplineChartComposer customHoverAndSelectHaloStyleForSplineChart],
        [CustomStyleForSplineChartComposer disableSomeOfLinesMouseTrackingEffectForSplineChart],
        [CustomStyleForSplineChartComposer colorfulShadowSplineChart],
        [CustomStyleForSplineChartComposer colorfulDataLabelsStepSplineChart],
        [CustomStyleForSplineChartComposer disableMarkerHoverEffectForSplineChart],
        [CustomStyleForSplineChartComposer maxAndMinDataLabelsForSplineChart],
        [CustomStyleForSplineChartComposer dashStyleTypesMixedSplineChart],
        [CustomStyleForSplineChartComposer allLineDashStyleTypesMixedSplineChart],
        [CustomStyleForSplineChartComposer shadowSplineChart],
        [CustomStyleForSplineChartComposer colorfulMarkersAndLinesSplineChart],
        [CustomStyleForSplineChartComposer colorfulMarkersAndLinesSplineChart2],
        [CustomStyleForSplineChartComposer connectNullsForSingleAASeriesElementSplineChart],
        [CustomStyleForSplineChartComposer largeDifferencesInTheNumberOfDataInDifferentSeriesElementSplineChart],
        [CustomStyleForSplineChartComposer customDifferentDataLabelsShapeForSplineChart],
    ];
}

#pragma mark - CustomStyleForAreaChartComposer

+ (NSArray<AAChartModel *> *)customStyleForAreaChartItems {
    return @[
        [CustomStyleForAreaChartComposer withMinusNumberAreaChart],
        [CustomStyleForAreaChartComposer colorfulGradientAreaChart],
        [CustomStyleForAreaChartComposer gradientColorAreaChart],
        [CustomStyleForAreaChartComposer thresholdForAreaChart],
        [CustomStyleForAreaChartComposer customSpecialStyleDataLabelOfSingleDataElementForAreaChart],
        [CustomStyleForAreaChartComposer customMarkerStatesHoverStyleForAreaChart],
        [CustomStyleForAreaChartComposer colorfulGradientColorAndColorfulDataLabelsStepAreaChart],
        [CustomStyleForAreaChartComposer negativeColorMixedAreaChart],
        [CustomStyleForAreaChartComposer customColorfulGradientColorZonesForAreaChart],
    ];
}

#pragma mark - CustomStyleForScatterChartComposer

+ (NSArray<AAChartModel *> *)customStyleForScatterChartItems {
    return @[
        [CustomStyleForScatterChartComposer customScatterChartMarkerSymbolContent],
        [CustomStyleForScatterChartComposer drawLineMixedScatterChartWithPointsCoordinates2],
//        [CustomStyleForScatterChartComposer scatterChartWithScrollablePlotArea],
    ];
}

#pragma mark - CustomStyleForBubbleChartComposer

+ (NSArray<AAChartModel *> *)customStyleForBubbleChartItems {
    return @[
//        [CustomStyleForBubbleChartComposer negativeColorMixedBubbleChart],
        [CustomStyleForBubbleChartComposer showAARadialGradientPositionAllEnumValuesWithBubbleChart],
    ];
}

#pragma mark - CustomStyleForLineChartComposer2

+ (NSArray<AAChartModel *> *)customStyleForLineChartItems2 {
    return @[
        [CustomStyleForLineChartComposer2 colorfulMarkerWithZonesChart],
    ];
}

@end
