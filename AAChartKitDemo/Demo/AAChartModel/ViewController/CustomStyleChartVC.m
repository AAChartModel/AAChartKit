//
//  CustomStyleChartVC.m
//  AAChartKitDemo
//
//  Created by AnAn on 2025/6/11.
//  Copyright © 2025 An An. All rights reserved.
//

#import "CustomStyleChartVC.h"
#import "CustomStyleChartComposer.h"

@interface CustomStyleChartVC ()

@end

@implementation CustomStyleChartVC

- (void)viewDidLoad {
    [super viewDidLoad];

}

- (id)chartConfigurationWithSelectedIndex:(NSUInteger)selectedIndex {
    switch (selectedIndex) {
        case 0:  return [CustomStyleChartComposer setUpColorfulBarChart];
        case 1:  return [CustomStyleChartComposer setUpColorfulGradientColorChart];
        case 2:  return [CustomStyleChartComposer setUpDiscontinuousDataChart];
        case 3:  return [CustomStyleChartComposer configureMixedLineChart];
        case 4:  return [CustomStyleChartComposer configureColorfulColumnChart];
        case 5:  return [CustomStyleChartComposer configureGradientColorBarChart];
        case 6:  return [CustomStyleChartComposer configureXAxisHaveAAZonesElementChart];
        case 7:  return [CustomStyleChartComposer configureYAxisHaveAAZonesElementChart];
        case 8:  return [CustomStyleChartComposer configureStepLineChart];
        case 9:  return [CustomStyleChartComposer configureStepAreaChart];
        case 10: return [CustomStyleChartComposer configureNightingaleRoseChart];
        case 11: return [CustomStyleChartComposer configureCustomSingleDataLabelsElementChart];
        case 12: return [CustomStyleChartComposer configureChartWithShadowStyle];
        case 13: return [CustomStyleChartComposer configureColorfulGradientAreaChart];
        case 14: return [CustomStyleChartComposer configureColorfulGradientSplineChart];
        case 15: return [CustomStyleChartComposer configureGradientColorAreasplineChart];
        case 16: return [CustomStyleChartComposer configureSpecialStyleMarkerOfSingleDataElementChart];
        case 17: return [CustomStyleChartComposer configureSpecialStyleColumnOfSingleDataElementChart];
        case 18: return [CustomStyleChartComposer configureAreaChartThreshold];
        case 19: return [CustomStyleChartComposer customScatterChartMarkerSymbolContent];
        case 20: return [CustomStyleChartComposer customLineChartMarkerSymbolContent];
        case 21: return [CustomStyleChartComposer configureWithMinusNumberChart];
        case 22: return [CustomStyleChartComposer splineChartHoverLineWithNoChangeAndCustomMarkerStatesHoverStyle];
        case 23: return [CustomStyleChartComposer configurePentagonRadarChart];
        case 24: return [CustomStyleChartComposer configureHexagonRadarChart];
        case 25: return [CustomStyleChartComposer adjustYAxisMaxAndMinValues];
        case 26: return [CustomStyleChartComposer customSpecialStyleDataLabelOfSingleDataElementChart];
        case 27: return [CustomStyleChartComposer customBarChartHoverColorAndSelectColor];
        case 28: return [CustomStyleChartComposer customChartHoverAndSelectHaloStyle];
        case 29: return [CustomStyleChartComposer customSplineChartMarkerStatesHoverStyle];
        case 30: return [CustomStyleChartComposer customNormalStackingChartDataLabelsContentAndStyle];
        case 31: return [CustomStyleChartComposer upsideDownPyramidChart];
        case 32: return [CustomStyleChartComposer doubleLayerPieChart];
        case 33: return [CustomStyleChartComposer doubleLayerDoubleColorsPieChart];
        case 34: return [CustomStyleChartComposer disableSomeOfLinesMouseTrackingEffect];
        case 35: return [CustomStyleChartComposer configureColorfulShadowSplineChart];
        case 36: return [CustomStyleChartComposer configureColorfulDataLabelsStepLineChart];
        case 37: return [CustomStyleChartComposer configureColorfulGradientColorAndColorfulDataLabelsStepAreaChart];
        case 38: return [CustomStyleChartComposer disableSplineChartMarkerHoverEffect];
        case 39: return [CustomStyleChartComposer configureMaxAndMinDataLabelsForChart];
        case 40: return [CustomStyleChartComposer customVerticalXAxisCategoriesLabelsByHTMLBreakLineTag];
        case 41: return [CustomStyleChartComposer noMoreGroupingAndOverlapEachOtherColumnChart];
        case 42: return [CustomStyleChartComposer noMoreGroupingAndNestedColumnChart];
        case 43: return [CustomStyleChartComposer topRoundedCornersStackingColumnChart];
        case 44: return [CustomStyleChartComposer freeStyleRoundedCornersStackingColumnChart];
        case 45: return [CustomStyleChartComposer customColumnChartBorderStyleAndStatesHoverColor];

        case 46: return [CustomStyleChartComposer customLineChartWithColorfulMarkersAndLines];
        case 47: return [CustomStyleChartComposer customLineChartWithColorfulMarkersAndLines2];
        case 48: return [CustomStyleChartComposer drawLineChartWithPointsCoordinates];
        case 49: return [CustomStyleChartComposer configureSpecialStyleColumnForNegativeDataMixedPositiveData];
        case 50: return [CustomStyleChartComposer configureMultiLevelStopsArrGradientColorAreasplineMixedLineChart];
        case 51: return [CustomStyleChartComposer connectNullsForSingleAASeriesElement];
        case 52: return [CustomStyleChartComposer lineChartsWithLargeDifferencesInTheNumberOfDataInDifferentSeriesElement];
        case 53: return [CustomStyleChartComposer customAreasplineChartWithColorfulGradientColorZones];
        case 54: return [CustomStyleChartComposer noMoreGroupingAndNestedColumnClickedChangeColorChart];


        default:
            return nil;
    }
}

@end
