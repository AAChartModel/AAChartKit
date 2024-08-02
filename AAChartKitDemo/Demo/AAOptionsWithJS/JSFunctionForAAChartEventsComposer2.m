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

//https://developer.mozilla.org/zh-CN/docs/Web/API/Touch_events/Using_Touch_Events
//https://developer.mozilla.org/zh-CN/docs/Web/API/MouseEvent
/*
在 JavaScript 中，与触摸事件对应的鼠标事件分别是：

- `touchstart` 对应 `mousedown`
- `touchend` 对应 `mouseup`

因此，将你的代码中的触摸事件改为鼠标事件后，代码可以改写为：

 
 1.
```javascript
// 监听 mousedown 事件
container.addEventListener('mousedown', function() {
  hideDataLabels(chart);
});

// 监听 mouseup 事件
container.addEventListener('mouseup', function() {
  showDataLabels(chart);
});
```

或者也可以改成为:
 
 2.
 ```javascript
 // 监听 mouseenter 事件
 container.addEventListener('mouseenter', function() {
   hideDataLabels(chart);
 });

 // 监听 mouseleave 事件
 container.addEventListener('mouseleave', function() {
   showDataLabels(chart);
 });
 ```
*/
+ (AAOptions *)toggleDataLabelsOnTouch {
    AAOptions *options = AAOptions.new
    .chartSet(AAChart.new
              .typeSet(AAChartTypeAreaspline)
              .eventsSet(AAChartEvents.new
                         .loadSet(@AAJSFunc(function() {
                             const chart = this;
                             const container = document.getElementById('container');

                             // 监听 touchstart 事件
                             container.addEventListener('touchstart', function() {
                               hideDataLabels(chart);
                             });

                             // 监听 touchend 事件
                             container.addEventListener('touchend', function() {
                               showDataLabels(chart);
                             });

                             // 隐藏所有数据标签
                             function hideDataLabels(chart) {
                               chart.series.forEach(function(series) {
                                 series.data.forEach(function(point) {
                                   point.update({ dataLabels: { enabled: false } });
                                 });
                               });
                             }

                             // 显示所有数据标签
                             function showDataLabels(chart) {
                               chart.series.forEach(function(series) {
                                 series.data.forEach(function(point) {
                                   point.update({ dataLabels: { enabled: true } });
                                 });
                               });
                             }
                         }))))
    .xAxisSet(AAXAxis.new
              .categoriesSet(@[@"一月", @"二月", @"三月", @"四月", @"五月", @"六月", @"七月", @"八月", @"九月", @"十月", @"十一月", @"十二月"]))
    .seriesSet(@[
        AASeriesElement.new
        .dataSet(@[@7.0, @6.9, @2.5, @14.5, @18.2, @21.5, @5.2, @26.5, @23.3, @45.3, @13.9, @9.6])
        .dataLabelsSet(AADataLabels.new
            .enabledSet(true))
        .markerSet(AAMarker.new
                   .lineColorSet(AAColor.redColor)
                   .lineWidthSet(@3)
                   .radiusSet(@10))
    ]);

    return options;
}


@end
