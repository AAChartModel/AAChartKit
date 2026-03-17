//
//  XAxisYAxisTypeOptionsComposer.h
//  AAChartKitDemo
//

#import <Foundation/Foundation.h>
#import "AAChartKit.h"

NS_ASSUME_NONNULL_BEGIN

@interface XAxisYAxisTypeOptionsComposer : NSObject

+ (AAOptions *)dateTimeTypeStepLineChart;
+ (AAOptions *)timeDataWithIrregularIntervalsChart;
+ (AAOptions *)logarithmicAxisLineChart;
+ (AAOptions *)logarithmicAxisScatterChart;
+ (AAOptions *)dashedAxisAndCustomAxisTitlePositionLineChart;
+ (AAOptions *)dashedAxisAndCustomAxisTitlePositionLineChart2;

@end

NS_ASSUME_NONNULL_END
