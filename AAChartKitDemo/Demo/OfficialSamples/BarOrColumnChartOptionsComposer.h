#import <Foundation/Foundation.h>

@class AAOptions;

NS_ASSUME_NONNULL_BEGIN

@interface BarOrColumnChartOptionsComposer : NSObject

+ (AAOptions *)basicBarChart;
+ (AAOptions *)stackingBarChart;
+ (AAOptions *)populationPyramidChart;
+ (AAOptions *)basicColumnChart;
+ (AAOptions *)basicColumnChartWithNegativeValue;
+ (AAOptions *)basicColumnChartWithStackedDataLabels;
+ (AAOptions *)basicColumnChartWithStackedDataLabels2;
+ (AAOptions *)percentStackedColumnChart;
+ (AAOptions *)columnChartWithRotatedLabels;
+ (AAOptions *)columnChartWithNestedColumn;
+ (AAOptions *)columnRangeChart;

@end

NS_ASSUME_NONNULL_END
