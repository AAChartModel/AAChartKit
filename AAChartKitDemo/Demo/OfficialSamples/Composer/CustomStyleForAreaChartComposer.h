#import <Foundation/Foundation.h>

@class AAChartModel;

@interface CustomStyleForAreaChartComposer : NSObject

+ (AAChartModel *)withMinusNumberAreaChart;
+ (AAChartModel *)colorfulGradientAreaChart;
+ (AAChartModel *)gradientColorAreaChart;
+ (AAChartModel *)thresholdForAreaChart;
+ (AAChartModel *)customSpecialStyleDataLabelOfSingleDataElementForAreaChart;
+ (AAChartModel *)customMarkerStatesHoverStyleForAreaChart;
+ (AAChartModel *)colorfulGradientColorAndColorfulDataLabelsStepAreaChart;
+ (AAChartModel *)negativeColorMixedAreaChart;
+ (AAChartModel *)customColorfulGradientColorZonesForAreaChart;

@end
