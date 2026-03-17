//
//  MultiYAxesChartOptionsComposer.h
//  AAChartKitDemo
//

#import <Foundation/Foundation.h>
#import "AAChartKit.h"

NS_ASSUME_NONNULL_BEGIN

@interface MultiYAxesChartOptionsComposer : NSObject

+ (AAOptions *)configureDoubleYAxesAreasplineMixedColumnChart;
+ (AAOptions *)configureTripleYAxesColumnMixedSplineChart;
+ (AAOptions *)configureDoubleYAxesColumnMixedSplineChart;
+ (AAOptions *)configureDoubleYAxesMarketDepthChart;
+ (AAOptions *)configureTheMirrorColumnChart;
+ (AAOptions *)configureTheMirrorColumnChartWithNoAnyGap;

@end

NS_ASSUME_NONNULL_END
