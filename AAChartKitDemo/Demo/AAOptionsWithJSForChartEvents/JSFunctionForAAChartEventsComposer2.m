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
https://www.highcharts.com/forum/viewtopic.php?t=28267
    $(function () {
    $('#container').highcharts({
        chart: {
            events: {
                load: function (){
                    console.log( );
                    var graphic = this.series[0].data[0].graphic;
                    setTimeout(function() {
                        var prevR = graphic.r;
                        graphic.attr( {
                            r: prevR + 50
                        });
                }, 1001);
                }
            }
        },
        series: [{
            type: 'pie',
            name: 'Browser share',
            data: [
                ['Firefox',   45.0],
                ['IE',       26.8],
                ['Safari',    8.5],
                ['Opera',     6.2],
                ['Others',   0.7]
            ]
        }]
    });
});
*/
//https://github.com/AAChartModel/AAChartKit/issues/1449
//https://www.highcharts.com/forum/viewtopic.php?t=28267
+ (AAOptions *)configureTheSizeOfTheSliceOfDonutAndPieChart {
    return AAOptions.new
            .titleSet(AATitle.new
                    .textSet(@"Configure The Size Of The Slice Of Donut And Pie Chart"))
            .chartSet(AAChart.new
                    .eventsSet(AAChartEvents.new
                            .loadSet(@AAJSFunc(function () {
                                const chart = this;
                                const graphic = chart.series[0].data[0].graphic;
                                setTimeout(function () {
                                    const prevR = graphic.r;
                                    graphic.attr({
                                        r: prevR + 50
                                    });
                                }, 1001);
                            })))
            )
            .seriesSet(@[
                    AASeriesElement.new
                            .typeSet(AAChartTypePie)
                            .nameSet(@"Browser share")
                            .dataSet(@[
                                    @[@"Firefox", @45.0],
                                    @[@"IE", @26.8],
                                    @[@"Safari", @8.5],
                                    @[@"Opera", @6.2],
                                    @[@"Others", @0.7]
                            ])
            ]);
}

/*
Highcharts.chart('container', {
    chart: {
        events: {
            click: function (event) {
                var label = this.renderer.label(
                    'x: ' + Highcharts.numberFormat(event.xAxis[0].value, 2) + ', y: ' + Highcharts.numberFormat(event.yAxis[0].value, 2),
                    event.xAxis[0].axis.toPixels(event.xAxis[0].value),
                    event.yAxis[0].axis.toPixels(event.yAxis[0].value)
                )
                    .attr({
                        fill: Highcharts.getOptions().colors[0],
                        padding: 10,
                        r: 5,
                        zIndex: 8
                    })
                    .css({
                        color: '#FFFFFF'
                    })
                    .add();

                setTimeout(function () {
                    label.fadeOut();
                }, 1000);
            }
        }
    },

    series: [{
        data: [29.9, 71.5, 106.4, 129.2, 144.0, 176.0, 135.6, 148.5, 216.4, 194.1, 95.6, 54.4]
    }]
});
 */
//https://github.com/AAChartModel/AAChartKit/issues/1480
//https://api.highcharts.com/highcharts/chart.events.click
+ (AAOptions *)configurePlotBackgroundClickEvent {
    return AAOptions.new
            .titleSet(AATitle.new
                    .textSet(@"configure Plot Background Click Event"))
            .chartSet(AAChart.new
                    .eventsSet(AAChartEvents.new
                            .clickSet(@AAJSFunc(function () {
                                const label = this.renderer.label(
                                        'x: ' + Highcharts.numberFormat(event.xAxis[0].value, 2) + ', y: ' + Highcharts.numberFormat(event.yAxis[0].value, 2),
                                        event.xAxis[0].axis.toPixels(event.xAxis[0].value),
                                        event.yAxis[0].axis.toPixels(event.yAxis[0].value)
                                )
                                        .attr({
                                            fill: Highcharts.getOptions().colors[0],
                                            padding: 10,
                                            r: 5,
                                            zIndex: 8
                                        })
                                        .css({
                                            color: '#FFFFFF'
                                        })
                                        .add();

                                setTimeout(function () {
                                    label.fadeOut();
                                }, 1000);
                            })))
            )
            .seriesSet(@[
                    AASeriesElement.new
                            .dataSet(@[@29.9, @71.5, @106.4, @129.2, @144.0, @176.0, @135.6, @148.5, @216.4, @194.1, @95.6, @54.4])
            ]);
}

//https://github.com/AAChartModel/AAChartCore/issues/203
+ (AAOptions *)disableHoverEventEffect {
    AAOptions *aaOptions = AAOptions.new
        .chartSet(AAChart.new
            .typeSet(AAChartTypeLine)
            .eventsSet(AAChartEvents.new
                .loadSet(@AAJSFunc(function() {
                    const chart = this;
                    Highcharts.addEvent(chart.container, 'touchmove', function (e) {
                        e.preventDefault();
                        chart.tooltip.hide(0);
                    });
                }))
            )
        )
        .titleSet(AATitle.new
            .textSet(@"Disable Hover Event Tooltip Effect"))
        .plotOptionsSet(AAPlotOptions.new
            .seriesSet(AASeries.new
                .statesSet(AAStates.new
                    .hoverSet(AAHover.new
                        .enabledSet(false) // 禁用默认 hover 状态
                    )
                )
                .pointSet(AAPoint.new
                    .eventsSet(AAPointEvents.new
                        .clickSet(@AAJSFunc(function() {
                            const chart = this.series.chart;
                            chart.tooltip.refresh(this); // 在点击时手动显示 tooltip
                        }))
                    )
                )
                .markerSet(AAMarker.new
                    .enabledSet(true)
                    .radiusSet(@10)
                )
            )
        )
        .tooltipSet(AATooltip.new
            .enabledSet(true)
            .hideDelaySet(@0) // 设置 tooltip 立刻隐藏
            .sharedSet(false)
        )
        .seriesSet(@[
            AASeriesElement.new
            .dataSet(@[@1, @3, @2, @4, @5])
        ]);
    
    return aaOptions;
}

//How to add click event to X-axis label and access data ?
//https://github.com/AAChartModel/AAChartKit/issues/1531
//https://www.highcharts.com/forum/viewtopic.php?t=40590
//https://codepen.io/anon/pen/LmObxY?editors=1010
+ (AAOptions *)addClickEventToXAxisLabelAndAccessData {
    AAOptions *options = AAOptions.new
    .chartSet(AAChart.new
              .typeSet(AAChartTypeColumn)
              .eventsSet(AAChartEvents.new
                         .loadSet(@AAJSFunc(function() {
                             const axis = this.xAxis[0];
                             const ticks = axis.ticks;
                             const points = this.series[0].points;
                             const tooltip = this.tooltip;

                             points.forEach(function(point, i) {
                                 if (ticks[i]) {
                                     const label = ticks[i].label.element;

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

//https://github.com/AAChartModel/AAChartKit/issues/1562
//https://blog.jianshukeji.com/highcharts/highlight-label-by-click.html
+ (AAOptions *)addClickEventToHighlightXAxisLabel {
    AAOptions *options = AAOptions.new
    .chartSet(AAChart.new
              .typeSet(AAChartTypeColumn)
              .eventsSet(AAChartEvents.new
                         .loadSet(@AAJSFunc(function() {
                             const style = document.createElement('style');
                             style.innerHTML = `
                                 .highcharts-xaxis-labels text {
                                     cursor: pointer !important;
                                 }
                                 .highcharts-xaxis-labels .active {
                                     fill: red !important;
                                 }
                             `;
                             document.head.appendChild(style);
                             
                             const chart = this;
                             Highcharts.addEvent(chart.xAxis[0].labelGroup.element, 'click', e => {
                                 if (e.target.tagName === 'text') {
                                     let category = e.target.innerHTML;
                                     let texts = e.target.parentNode.childNodes;
                                     for (let i = 0; i < texts.length; i++) {
                                         if (texts[i].classList.contains('active')) {
                                             texts[i].classList.remove('active');
                                             break;
                                         }
                                     }
                                     e.target.classList.add('active')
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

+ (AAOptions *)addClickEventToXAxisLabelAndAccessDataAndHighlightXAxisLabel {
    AAOptions *options = AAOptions.new
    .chartSet(AAChart.new
              .typeSet(AAChartTypeColumn)
              .eventsSet(AAChartEvents.new
                         .loadSet(@AAJSFunc(function() {
                             const axis = this.xAxis[0];
                             const ticks = axis.ticks;
                             const points = this.series[0].points;
                             const tooltip = this.tooltip;

                             points.forEach(function(point, i) {
                                 if (ticks[i]) {
                                     const label = ticks[i].label.element;

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
    ])
    .afterDrawChartJavaScriptSet(@AAJSFunc(
        const style = document.createElement('style');
        style.innerHTML = `
            .highcharts-xaxis-labels text {
                cursor: pointer !important;
            }
            .highcharts-xaxis-labels .active {
                fill: red !important;
            }
        `;
        document.head.appendChild(style);
        
        const chart = aaGlobalChart;
        Highcharts.addEvent(chart.xAxis[0].labelGroup.element, 'click', e => {
            if (e.target.tagName === 'text') {
                let category = e.target.innerHTML;
                let texts = e.target.parentNode.childNodes;
                for (let i = 0; i < texts.length; i++) {
                    if (texts[i].classList.contains('active')) {
                        texts[i].classList.remove('active');
                        break;
                    }
                }
                e.target.classList.add('active')
            }
        });
    ));

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

//https://github.com/AAChartModel/AAChartKit/issues/1532
//https://api.highcharts.com/highcharts/plotOptions.series.marker.states.hover
//https://api.highcharts.com/highcharts/plotOptions.series.events.mouseOver
//https://api.highcharts.com/class-reference/Highcharts.Point#select
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

                        const series = this;
                        const defaultPointIndex = %ld;
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

//https://github.com/AAChartModel/AAChartKit/issues/1557
//https://github.com/AAChartModel/AAChartCore/issues/199
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

    //https://github.com/AAChartModel/AAChartKit/issues/1557
    /*
     🖱鼠标事件
     function () {
         const chart = this;
         let currentIndex = 0;
         let intervalId;
         let isHovered = false;

         function moveTooltip() {
             const pointsToShow = [];
             for (let i = 0; i < chart.series.length; i++) {
                 const point = chart.series[i].points[currentIndex];
                 if (point) {
                     pointsToShow.push(point);
                 }
             }

             if (pointsToShow.length > 0) {
                 chart.tooltip.refresh(pointsToShow);
                 chart.xAxis[0].drawCrosshair(null, pointsToShow[0]);

                 currentIndex = (currentIndex + 1) % chart.series[0].points.length;
             }
         }

         function startInterval() {
             if (intervalId) {
                 clearInterval(intervalId);
             }
             intervalId = setInterval(moveTooltip, 2000); // 每2秒切换一次
         }

         // 立即显示第一个点的 tooltip 和十字线
         moveTooltip();

         // 初始启动 interval
         startInterval();

         // 鼠标进入图表
         chart.container.onmouseenter = function() {
             isHovered = true;
             if (intervalId) {
                 clearInterval(intervalId);
                 intervalId = null;
             }
         };

         // 鼠标在图表上移动
         chart.container.onmousemove = function(e) {
             if (isHovered) {
                 const event = chart.pointer.normalize(e);
                 const point = chart.series[0].searchPoint(event, true); // 可以考虑使用更通用的方法选择点
                 if (point) {
                     currentIndex = chart.series[0].points.indexOf(point);
                     const pointsToShow = [];
                     for (let i = 0; i < chart.series.length; i++) {
                         const pointInSeries = chart.series[i].points[currentIndex];
                         if (pointInSeries) {
                             pointsToShow.push(pointInSeries);
                         }
                     }
                     chart.tooltip.refresh(pointsToShow);
                     chart.xAxis[0].drawCrosshair(event, point);
                 }
             }
         };

         // 鼠标离开图表
         chart.container.onmouseleave = function() {
             isHovered = false;
             if (!intervalId) {
                 // 立即移动到下一个点，然后开始 interval
                 moveTooltip();
                 startInterval();
             }
         };

         // 在图表销毁时清除 interval
         this.callbacks.push(function() {
             if (intervalId) {
                 clearInterval(intervalId);
             }
         });
     }
     */

    /*
     👋手势事件
     function() {
         const chart = this;
         let currentIndex = 0;
         let intervalId;
         let isTouched = false;

         function moveTooltip() {
             const pointsToShow = [];
             for (let i = 0; i < chart.series.length; i++) {
                 const point = chart.series[i].points[currentIndex];
                 if (point) {
                     pointsToShow.push(point);
                 }
             }

             if (pointsToShow.length > 0) {
                 chart.tooltip.refresh(pointsToShow);
                 chart.xAxis[0].drawCrosshair(null, pointsToShow[0]);

                 currentIndex = (currentIndex + 1) % chart.series[0].points.length;
             }
         }

         function startInterval() {
             if (intervalId) {
                 clearInterval(intervalId);
             }
             intervalId = setInterval(moveTooltip, 2000); // 每2秒切换一次
         }

         // 立即显示第一个点的 tooltip 和十字线
         moveTooltip();

         // 初始启动 interval
         startInterval();

         // 触摸开始
         chart.container.ontouchstart = function(e) {
             isTouched = true;
             if (intervalId) {
                 clearInterval(intervalId);
                 intervalId = null;
             }
             handleTouch(e);
         };

         // 触摸移动
         chart.container.ontouchmove = function(e) {
             if (isTouched) {
                 handleTouch(e);
             }
         };

         function handleTouch(e) {
             e.preventDefault(); // 阻止默认的滚动行为
             const touch = e.touches[0];
             const event = chart.pointer.normalize(touch);
             const point = chart.series[0].searchPoint(event, true);
             if (point) {
                 currentIndex = chart.series[0].points.indexOf(point);
                 const pointsToShow = [];
                 for (let i = 0; i < chart.series.length; i++) {
                     const pointInSeries = chart.series[i].points[currentIndex];
                     if (pointInSeries) {
                         pointsToShow.push(pointInSeries);
                     }
                 }
                 chart.tooltip.refresh(pointsToShow);
                 chart.xAxis[0].drawCrosshair(event, point);
             }
         }

         // 触摸结束
         chart.container.ontouchend = function() {
             isTouched = false;
             if (!intervalId) {
                 // 立即移动到下一个点，然后开始 interval
                 moveTooltip();
                 startInterval();
             }
         };

         // 在图表销毁时清除 interval
         this.callbacks.push(function() {
             if (intervalId) {
                 clearInterval(intervalId);
             }
         });
     }
     */
+ (AAOptions *)autoCrosshairAndTooltip {
    return AAOptions.new
        .titleSet(AATitle.new
            .textSet(@"Auto Crosshair And Tooltip"))
        .chartSet(AAChart.new
            .typeSet(AAChartTypeAreaspline)
            .eventsSet(AAChartEvents.new
                .loadSet(@AAJSFunc(function() {
                    const chart = this;
                    let currentIndex = 0;
                    let intervalId;
                    let isTouched = false;

                    function moveTooltip() {
                        const pointsToShow = [];
                        for (let i = 0; i < chart.series.length; i++) {
                            const point = chart.series[i].points[currentIndex];
                            if (point) {
                                pointsToShow.push(point);
                            }
                        }

                        if (pointsToShow.length > 0) {
                            chart.tooltip.refresh(pointsToShow);
                            chart.xAxis[0].drawCrosshair(null, pointsToShow[0]);

                            currentIndex = (currentIndex + 1) % chart.series[0].points.length;
                        }
                    }

                    function startInterval() {
                        if (intervalId) {
                            clearInterval(intervalId);
                        }
                        intervalId = setInterval(moveTooltip, 2000); // 每2秒切换一次
                    }

                    // 立即显示第一个点的 tooltip 和十字线
                    moveTooltip();

                    // 初始启动 interval
                    startInterval();

                    // 触摸开始
                    chart.container.ontouchstart = function(e) {
                        isTouched = true;
                        if (intervalId) {
                            clearInterval(intervalId);
                            intervalId = null;
                        }
                        handleTouch(e);
                    };

                    // 触摸移动
                    chart.container.ontouchmove = function(e) {
                        if (isTouched) {
                            handleTouch(e);
                        }
                    };

                    function handleTouch(e) {
                        e.preventDefault(); // 阻止默认的滚动行为
                        const touch = e.touches[0];
                        const event = chart.pointer.normalize(touch);
                        const point = chart.series[0].searchPoint(event, true);
                        if (point) {
                            currentIndex = chart.series[0].points.indexOf(point);
                            const pointsToShow = [];
                            for (let i = 0; i < chart.series.length; i++) {
                                const pointInSeries = chart.series[i].points[currentIndex];
                                if (pointInSeries) {
                                    pointsToShow.push(pointInSeries);
                                }
                            }
                            chart.tooltip.refresh(pointsToShow);
                            chart.xAxis[0].drawCrosshair(event, point);
                        }
                    }

                    // 触摸结束
                    chart.container.ontouchend = function() {
                        isTouched = false;
                        if (!intervalId) {
                            // 立即移动到下一个点，然后开始 interval
                            moveTooltip();
                            startInterval();
                        }
                    };

                    // 在图表销毁时清除 interval
                    this.callbacks.push(function() {
                        if (intervalId) {
                            clearInterval(intervalId);
                        }
                    });
                }))))
        .colorsSet(@[@"#04d69f", @"#1e90ff", @"#ef476f", @"#ffd066"])
        .plotOptionsSet(AAPlotOptions.new
            .seriesSet(AASeries.new
                .stackingSet(AAChartStackingTypeNormal)
                .markerSet(AAMarker.new
                    .radiusSet(@0))))
        .tooltipSet(AATooltip.new
            .styleSet(AAStyleColor(AAColor.whiteColor))
            .backgroundColorSet(@"#050505")
            .borderColorSet(@"#050505"))
        .xAxisSet(AAXAxis.new
            .crosshairSet(AACrosshair.new
                .colorSet(AAColor.darkGrayColor)
                .dashStyleSet(AAChartLineDashStyleTypeLongDashDotDot)
                .widthSet(@2)))
        .yAxisSet(AAYAxis.new
            .visibleSet(false))
        .seriesSet(@[
            AASeriesElement.new
                .nameSet(@"Tokyo Hot")
                .lineWidthSet(@5.0)
                .fillOpacitySet(@0.4)
                .dataSet(@[@0.45, @0.43, @0.50, @0.55, @0.58, @0.62, @0.83, @0.39, @0.56, @0.67, @0.50, @0.34, @0.50, @0.67, @0.58, @0.29, @0.46, @0.23, @0.47, @0.46, @0.38, @0.56, @0.48, @0.36]),
            AASeriesElement.new
                .nameSet(@"Berlin Hot")
                .lineWidthSet(@5.0)
                .fillOpacitySet(@0.4)
                .dataSet(@[@0.38, @0.31, @0.32, @0.32, @0.64, @0.66, @0.86, @0.47, @0.52, @0.75, @0.52, @0.56, @0.54, @0.60, @0.46, @0.63, @0.54, @0.51, @0.58, @0.64, @0.60, @0.45, @0.36, @0.67]),
            AASeriesElement.new
                .nameSet(@"London Hot")
                .lineWidthSet(@5.0)
                .fillOpacitySet(@0.4)
                .dataSet(@[@0.46, @0.32, @0.53, @0.58, @0.86, @0.68, @0.85, @0.73, @0.69, @0.71, @0.91, @0.74, @0.60, @0.50, @0.39, @0.67, @0.55, @0.49, @0.65, @0.45, @0.64, @0.47, @0.63, @0.64]),
            AASeriesElement.new
                .nameSet(@"NewYork Hot")
                .lineWidthSet(@5.0)
                .fillOpacitySet(@0.4)
                .dataSet(@[@0.60, @0.51, @0.52, @0.53, @0.64, @0.84, @0.65, @0.68, @0.63, @0.47, @0.72, @0.60, @0.65, @0.74, @0.66, @0.65, @0.71, @0.59, @0.65, @0.77, @0.52, @0.53, @0.58, @0.53]),
        ]);
}


@end
