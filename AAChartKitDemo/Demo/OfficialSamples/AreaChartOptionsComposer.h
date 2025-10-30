#import <Foundation/Foundation.h>

@class AAOptions;

@interface AreaChartOptionsComposer : NSObject

+ (AAOptions *)basicAreaChart;
+ (AAOptions *)areaWithNegativeValuesChart;
+ (AAOptions *)stackedAreaChart;
+ (AAOptions *)percentStackedAreaChart;
+ (AAOptions *)areaWithMissingPointsChart;
+ (AAOptions *)invertedAreaChart;
+ (AAOptions *)areasplineChart;
+ (AAOptions *)arearangeChart;
+ (AAOptions *)arearangeAndLineChart;

@end
