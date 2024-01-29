//
//  JSFunctionForAAChartEventsComposer2.m
//  AAChartKitDemo
//
//  Created by AnAn on 2024/1/26.
//  Copyright © 2024 An An. All rights reserved.
//

#import "JSFunctionForAAChartEventsComposer2.h"
#import "AAChartKit.h"
#import "AAOptions.h"

@implementation JSFunctionForAAChartEventsComposer2

/*
 Highcharts.chart('container', {
     xAxis: {
         categories: ['Jan', 'Feb', 'Mar', 'Apr', 'May', 'Jun', 'Jul', 'Aug', 'Sep', 'Oct', 'Nov', 'Dec']
     },
     
     plotOptions: {
         series: {
             events: {
                 mouseOver: function () {
                     if(this.hasRun) return;
                     
                     var series = this;
                     var defaultPointIndex = 3;
                     
                     if (series.data.length > defaultPointIndex) {
                         defaultPoint = series.data[defaultPointIndex];
                         // 模拟点击事件来选中默认点
                         defaultPoint.select(false);
                     }
                     console.log("11111111111");
                     this.hasRun = true;
                 }
             },
             allowPointSelect: true,
             // 可以设置选中时的样式，比如边框颜色
             marker: {
                 states: {
                     select: {
                         fillColor: 'red',
                         lineWidth: 10,
                         lineColor: "yellow",
                         radius:20,
                     }
                 }
             },
         }
     },
     series: [{
         data: [29.9, 71.5, 106.4, 129.2, 144.0, 176.0, 135.6, 148.5, 216.4, 194.1, 95.6, 54.4, {
             y: 29.9,
             selected: true
         }]
     }]
 });
 */

//https://api.highcharts.com/highcharts/plotOptions.series.marker.states.hover
//https://api.highcharts.com/highcharts/plotOptions.series.events.mouseOver
//https://api.highcharts.com/class-reference/Highcharts.Point#select
//https://github.com/AAChartModel/AAChartKit/issues/1532
+ (AAOptions *)defaultSelectedAPointForLineChart {
    AADataElement *defaultPointData = AADataElement.new
        .ySet(@29.9)
        .selectedSet(@true);

    NSArray *dataArr = @[@29.9, @71.5, @106.4, @129.2, @144.0, @176.0, @135.6, @148.5, @216.4, @194.1, @95.6, defaultPointData];
    NSInteger defaultPointIndex = dataArr.count - 1;

    AAOptions *options = AAOptions.new
        .xAxisSet(AAXAxis.new
            .categoriesSet(@[@"Jan", @"Feb", @"Mar", @"Apr", @"May", @"Jun", @"Jul", @"Aug", @"Sep", @"Oct", @"Nov", @"Dec"]))
        .plotOptionsSet(AAPlotOptions.new
            .seriesSet(AASeries.new
                .eventsSet(AASeriesEvents.new
                    .mouseOverSet([NSString stringWithFormat:@AAJSFunc(function () {
                        if(this.hasRun) return;

                        var series = this;
                        var defaultPointIndex = %ld;
                        if (series.data.length > defaultPointIndex) {
                            defaultPoint = series.data[defaultPointIndex];
                            defaultPoint.select(false);
                        }

                        this.hasRun = true;
                    }), (long)defaultPointIndex]))
                .allowPointSelectSet(@true)
                .markerSet(AAMarker.new
                    .statesSet(AAMarkerStates.new
                        .selectSet(AAMarkerSelect.new
                            .fillColorSet(@"red")
                            .lineWidthSet(@10)
                            .lineColorSet(@"yellow")
                            .radiusSet(@20))))))
        .seriesSet(@[
            AASeriesElement.new
                .dataSet(dataArr)
        ]);

    return options;
}

@end
