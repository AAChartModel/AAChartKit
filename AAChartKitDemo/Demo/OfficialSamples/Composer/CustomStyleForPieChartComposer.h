#import <Foundation/Foundation.h>

@class AAChartModel;

@interface CustomStyleForPieChartComposer : NSObject

+ (AAChartModel *)pieChart;
+ (AAChartModel *)doubleLayerPieChart;
+ (AAChartModel *)doubleLayerDoubleColorsPieChart;
+ (AAChartModel *)pieChartWithSoftCorners;
+ (AAChartModel *)doubleLayerPieChartWithSoftCorners;
+ (AAChartModel *)doubleLayerDoubleColorsPieChartWithSoftCorners;
+ (AAChartModel *)pieChartWithRoundedCorners;
+ (AAChartModel *)doubleLayerPieChartWithRoundedCorners;
+ (AAChartModel *)doubleLayerDoubleColorsPieChartWithRoundedCorners;

@end
