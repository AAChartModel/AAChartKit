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

//How to add click event to X-axis label and access data ?
//https://www.highcharts.com/forum/viewtopic.php?t=40590
//https://codepen.io/anon/pen/LmObxY?editors=1010
//https://github.com/AAChartModel/AAChartKit/issues/1531
+ (AAOptions *)addClickEventToXAxisLabelAndAccessData {
    AAOptions *options = AAOptions.new
    .chartSet(AAChart.new
              .typeSet(AAChartTypeColumn)
              .eventsSet(AAChartEvents.new
                         .loadSet(@AAJSFunc(function() {
                             var axis = this.xAxis[0];
                             var ticks = axis.ticks;
                             var points = this.series[0].points;
                             var tooltip = this.tooltip;

                             points.forEach(function(point, i) {
                                 if (ticks[i]) {
                                     var label = ticks[i].label.element;

                                     label.onclick = function() {
                                         tooltip.getPosition(null, null, point);
                                         tooltip.refresh(point);
                                     };
                                 }
                             });
                         }))))
    .xAxisSet(AAXAxis.new
              .categoriesSet(@[@"Africa", @"America", @"Asia", @"Europe", @"Oceania"]))
    .yAxisSet(AAYAxis.new
              .minSet(@0))
    .tooltipSet(AATooltip.new
                .valueSuffixSet(@" millions"))
    .plotOptionsSet(AAPlotOptions.new
                    .seriesSet(AASeries.new
                               .dataLabelsSet(AADataLabels.new
                                              .enabledSet(YES))))
    .seriesSet(@[
        AASeriesElement.new
        .nameSet(@"Year 1800")
        .dataSet(@[@107, @31, @635, @203, @2])
    ]);

    return options;
}


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

//https://github.com/AAChartModel/AAChartKit/issues/1531
//https://stackoverflow.com/questions/42062016/in-high-chart-how-to-add-event-for-label-click
+ (AAOptions *)configureBlinkMarkerChart {
    AAOptions *options = AAOptions.new
    .chartSet(AAChart.new
              .typeSet(AAChartTypeAreaspline)
              .eventsSet(AAChartEvents.new
                         .loadSet(@AAJSFunc(function() {
                             const childNodes = this.xAxis[0].labelGroup.element.childNodes;
                             childNodes
                             .forEach(function(label, index) {
                                 label.style.cursor = "pointer";
                                 label.onclick = function() {
                                     alert('You clicked on ' + this.textContent + ', index: ' + index);
                                 }
                             });
                         }))))
    .xAxisSet(AAXAxis.new
              .categoriesSet(@[@"一月", @"二月", @"三月", @"四月", @"五月", @"六月", @"七月", @"八月", @"九月", @"十月", @"十一月", @"十二月"]))
    .seriesSet(@[
        AASeriesElement.new
        .dataSet(@[@7.0, @6.9, @2.5, @14.5, @18.2, @21.5, @5.2, @26.5, @23.3, @45.3, @13.9, @9.6])
        .markerSet(AAMarker.new
                   .lineColorSet(AAColor.redColor)
                   .lineWidthSet(@3)
                   .radiusSet(@10))
    ]);

    return options;
}


@end
