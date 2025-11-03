#import <Foundation/Foundation.h>

@class AAChartModel;

@interface CustomStyleForBarChartComposer : NSObject

+ (AAChartModel *)colorfulBarChart;
+ (AAChartModel *)colorfulGradientColorBarChart;
+ (AAChartModel *)discontinuousDataBarChart;
+ (AAChartModel *)randomColorfulBarChart;
+ (AAChartModel *)noneStackingPolarBarChart;
+ (AAChartModel *)normalStackingPolarBarChart;
+ (AAChartModel *)percentStackingPolarBarChart;
+ (AAChartModel *)specialStyleForTheSingleDataElementOfBarChart;
+ (AAChartModel *)noMoreGroupingAndOverlapEachOtherBarChart;
+ (AAChartModel *)noMoreGroupingAndNestedBarChart;
+ (AAChartModel *)topRoundedCornersStackingBarChart;
+ (AAChartModel *)freeStyleRoundedCornersStackingBarChart;
+ (AAChartModel *)customBorderStyleAndStatesHoverColorBarChart;
+ (AAChartModel *)negativeDataMixedPositiveDataBarChart;
+ (AAChartModel *)customAnimationForBarChart;
+ (AAChartModel *)configureNegativeColorMixedBarChart;
+ (AAChartModel *)customSingleDataElementSpecialStyleForBarChart;
+ (AAChartModel *)customHoverColorAndSelectColorForBarChart;
+ (AAChartModel *)customNormalStackingChartDataLabelsContentAndStyleForBarChart;

@end
