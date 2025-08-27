//
//  CustomStyleChartVC.h
//  AAChartKitDemo
//
//  Created by AnAn on 2018/11/13.
//  Copyright © 2018 An An. All rights reserved.
//*************** ...... SOURCE CODE ...... ***************
//***...................................................***
//*** https://github.com/AAChartModel/AAChartKit        ***
//*** https://github.com/AAChartModel/AAChartKit-Swift  ***
//***...................................................***
//*************** ...... SOURCE CODE ...... ***************

/*
 
 * -------------------------------------------------------------------------------
 *
 * 🌕 🌖 🌗 🌘  ❀❀❀   WARM TIPS!!!   ❀❀❀ 🌑 🌒 🌓 🌔
 *
 * Please contact me on GitHub,if there are any problems encountered in use.
 * GitHub Issues : https://github.com/AAChartModel/AAChartKit/issues
 * -------------------------------------------------------------------------------
 * And if you want to contribute for this project, please contact me as well
 * GitHub        : https://github.com/AAChartModel
 * StackOverflow : https://stackoverflow.com/users/12302132/codeforu
 * JianShu       : https://www.jianshu.com/u/f1e6753d4254
 * SegmentFault  : https://segmentfault.com/u/huanghunbieguan
 *
 * -------------------------------------------------------------------------------
 
 */

#import <Foundation/Foundation.h>

@class AAChartModel;

@interface CustomStyleChartComposer : NSObject

+ (AAChartModel *)setUpColorfulBarChart;
+ (AAChartModel *)setUpColorfulGradientColorChart;
+ (AAChartModel *)setUpDiscontinuousDataChart;
+ (AAChartModel *)configureMixedLineChart;
+ (AAChartModel *)configureColorfulColumnChart;
+ (AAChartModel *)configureGradientColorBarChart;
+ (AAChartModel *)configureXAxisHaveAAZonesElementChart;
+ (AAChartModel *)configureYAxisHaveAAZonesElementChart;
+ (AAChartModel *)configureStepLineChart;
+ (AAChartModel *)configureStepAreaChart;
+ (AAChartModel *)configureNightingaleRoseChart;
+ (AAChartModel *)configureCustomSingleDataLabelsElementChart;
+ (AAChartModel *)configureChartWithShadowStyle;
+ (AAChartModel *)configureColorfulGradientAreaChart;
+ (AAChartModel *)configureColorfulGradientSplineChart;
+ (AAChartModel *)configureGradientColorAreasplineChart;
+ (AAChartModel *)configureSpecialStyleMarkerOfSingleDataElementChart;
+ (AAChartModel *)configureSpecialStyleColumnOfSingleDataElementChart;
+ (AAChartModel *)configureAreaChartThreshold;
+ (AAChartModel *)customScatterChartMarkerSymbolContent;
+ (AAChartModel *)customLineChartMarkerSymbolContent;
+ (AAChartModel *)configureWithMinusNumberChart;
+ (AAChartModel *)splineChartHoverLineWithNoChangeAndCustomMarkerStatesHoverStyle;
+ (AAChartModel *)configurePentagonRadarChart;
+ (AAChartModel *)configureHexagonRadarChart;
+ (AAChartModel *)adjustYAxisMaxAndMinValues;
+ (AAChartModel *)customSpecialStyleDataLabelOfSingleDataElementChart;
+ (AAChartModel *)customBarChartHoverColorAndSelectColor;
+ (AAChartModel *)customChartHoverAndSelectHaloStyle;
+ (AAChartModel *)customSplineChartMarkerStatesHoverStyle;
+ (AAChartModel *)customNormalStackingChartDataLabelsContentAndStyle;
+ (AAChartModel *)upsideDownPyramidChart;
+ (AAChartModel *)doubleLayerPieChart;
+ (AAChartModel *)doubleLayerDoubleColorsPieChart;
+ (AAChartModel *)disableSomeOfLinesMouseTrackingEffect;
+ (AAChartModel *)configureColorfulShadowSplineChart;
+ (AAChartModel *)configureColorfulDataLabelsStepLineChart;
+ (AAChartModel *)configureColorfulGradientColorAndColorfulDataLabelsStepAreaChart;
+ (AAChartModel *)disableSplineChartMarkerHoverEffect;
+ (AAChartModel *)configureMaxAndMinDataLabelsForChart;
+ (AAChartModel *)customVerticalXAxisCategoriesLabelsByHTMLBreakLineTag;
+ (AAChartModel *)noMoreGroupingAndOverlapEachOtherColumnChart;
+ (AAChartModel *)noMoreGroupingAndNestedColumnChart;
+ (AAChartModel *)topRoundedCornersStackingColumnChart;
+ (AAChartModel *)freeStyleRoundedCornersStackingColumnChart;
+ (AAChartModel *)customColumnChartBorderStyleAndStatesHoverColor;

+ (AAChartModel *)customLineChartWithColorfulMarkersAndLines;
+ (AAChartModel *)customLineChartWithColorfulMarkersAndLines2;
+ (AAChartModel *)drawLineChartWithPointsCoordinates;
+ (AAChartModel *)configureSpecialStyleColumnForNegativeDataMixedPositiveData;
+ (AAChartModel *)configureMultiLevelStopsArrGradientColorAreasplineMixedLineChart;
+ (AAChartModel *)connectNullsForSingleAASeriesElement;
+ (AAChartModel *)lineChartsWithLargeDifferencesInTheNumberOfDataInDifferentSeriesElement;
+ (AAChartModel *)customAreasplineChartWithColorfulGradientColorZones;
+ (AAChartModel *)noMoreGroupingAndNestedColumnClickedChangeColorChart;

@end


