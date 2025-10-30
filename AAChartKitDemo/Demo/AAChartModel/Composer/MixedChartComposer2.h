//
//  MixedChartComposer2.h
//  AAInfographicsDemo
//
//  Created by AnAn on 2024/11/25.
//  Copyright © 2024 An An. All rights reserved.
//

#import <Foundation/Foundation.h>

@class AAChartModel;

NS_ASSUME_NONNULL_BEGIN

@interface MixedChartComposer2 : NSObject

+ (AAChartModel *)scatterPlotWithTrendLine;
+ (AAChartModel *)scatterPlotWithTrendLine2;
+ (AAChartModel *)pieMixedLineMixedColumnChart;
+ (AAChartModel *)pieMixedLineMixedColumnChart2;
+ (AAChartModel *)scatterWithMultipleLinearRegressionChart;
+ (AAChartModel *)rangeSplineAreaSplineAndMarkerChart;

@end

NS_ASSUME_NONNULL_END
