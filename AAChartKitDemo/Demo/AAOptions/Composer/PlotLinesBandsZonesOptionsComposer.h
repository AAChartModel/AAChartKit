//
//  PlotLinesBandsZonesOptionsComposer.h
//  AAChartKitDemo
//

#import <Foundation/Foundation.h>
#import "AAChartKit.h"

NS_ASSUME_NONNULL_BEGIN

@interface PlotLinesBandsZonesOptionsComposer : NSObject

+ (AAOptions *)simpleGaugeChart;
+ (AAOptions *)gaugeChartWithPlotBand;
+ (AAOptions *)configureAAPlotBandsForChart;
+ (AAOptions *)configureValueSegmentChartBasicOptions;
+ (AAOptions *)configureAAPlotLinesForChart;
+ (AAOptions *)configureAASeriesElementZones;
+ (AAOptions *)configureAASeriesElementZonesMixedAAPlotLines;
+ (AAOptions *)configureXAxisPlotBandAreaMixedColumnChart;
+ (AAOptions *)configureXAxisPlotLinesForChart;
+ (AAOptions *)configureXAxisPlotLinesForChart2;
+ (AAOptions *)configureGradientPlotBandForChart;

@end

NS_ASSUME_NONNULL_END
