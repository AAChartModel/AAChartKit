//
//  JSFunctionForAAChartEventsComposer2.m
//  AAChartKitDemo
//
//  Created by AnAn on 2024/1/26.
//  Copyright © 2024 An An. All rights reserved.
//

#import "JSFunctionForAAChartEventsComposer2.h"
#import "AAChartKit.h"

@implementation JSFunctionForAAChartEventsComposer2
//+ (AAOptions *)defaultSelectedAPointForLineChart {
//    AADataElement *defaultPointData = AADataElement.new.ySet(@29.9).selectedSet(true);
//
//    NSArray *dataArr = @[@29.9, @71.5, @106.4, @129.2, @144.0, @176.0, @135.6, @148.5, @216.4, @194.1, @95.6, defaultPointData];
//    NSInteger defaultPointIndex = dataArr.count - 1;
//
//    AAOptions *options = AAOptions.new
//    .xAxisSet(AAXAxis.new
//            .categoriesSet(@[@"Jan", @"Feb", @"Mar", @"Apr", @"May", @"Jun", @"Jul", @"Aug", @"Sep", @"Oct", @"Nov", @"Dec"]))
//    .plotOptionsSet(AAPlotOptions.new
//                    .seriesSet(AASeries.new
//                               .eventsSet(AASeriesEvents.new
//                                          .mouseOverSet([NSString stringWithFormat:@"function () {\
//                                                        if(this.hasRun) return;\
//                                                        \
//                                                        var series = this;\
//                                                        var defaultPointIndex = %ld;\
//                                                        if (series.data.length > defaultPointIndex) {\
//                                                        defaultPoint = series.data[defaultPointIndex];\
//                                                        defaultPoint.select(false);\
//                                                        }\
//                                                        \
//                                                        this.hasRun = true;\
//                                                        }", (long)defaultPointIndex])
//                                          .allowPointSelectSet(true)
//                                          .markerSet(AAMarker.new
//                                                     .statesSet(AAMarkerStates.new
//                                                                .selectSet(AAMarkerSelect.new
//                                                                           .fillColorSet(@"red")
//                                                                           .lineWidthSet(@10)
//                                                                           .lineColorSet(@"yellow")
//                                                                           .radiusSet(@20)))))))
//    .seriesSet(@[AASeriesElement.new.dataSet(dataArr)]);
//
//    return options;
//}

@end
