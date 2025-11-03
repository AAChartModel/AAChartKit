#import <Foundation/Foundation.h>

@class AAChartModel;

@interface CustomStyleForColumnChartComposer : NSObject

+ (AAChartModel *)colorfulColumnChart;
+ (AAChartModel *)colorfulGradientColorColumnChart;
+ (AAChartModel *)discontinuousDataColumnChart;
+ (AAChartModel *)randomColorfulColumnChart;
+ (AAChartModel *)noneStackingPolarColumnChart;
+ (AAChartModel *)normalStackingPolarColumnChart;
+ (AAChartModel *)percentStackingPolarColumnChart;
+ (AAChartModel *)specialStyleForTheSingleDataElementOfColumnChart;
+ (AAChartModel *)noMoreGroupingAndOverlapEachOtherColumnChart;
+ (AAChartModel *)noMoreGroupingAndNestedColumnChart;
+ (AAChartModel *)topRoundedCornersStackingColumnChart;
+ (AAChartModel *)freeStyleRoundedCornersStackingColumnChart;
+ (AAChartModel *)customBorderStyleAndStatesHoverColorColumnChart;
+ (AAChartModel *)negativeDataMixedPositiveDataColumnChart;
+ (AAChartModel *)configureNegativeColorMixedColumnChart;
+ (AAChartModel *)customSingleDataElementSpecialStyleForColumnChart;
+ (AAChartModel *)customHoverColorAndSelectColorForColumnChart;
+ (AAChartModel *)customNormalStackingChartDataLabelsContentAndStyleForColumnChart;
+ (AAChartModel *)customAnimationForColumnChart;

@end
