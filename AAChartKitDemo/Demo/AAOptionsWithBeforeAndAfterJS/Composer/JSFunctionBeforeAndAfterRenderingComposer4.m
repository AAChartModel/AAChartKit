//
//  JSFunctionBeforeAndAfterRenderingComposer4.m
//  AAChartKitDemo
//
//  Created by AnAn on 2024/11/21.
//  Copyright © 2024 An An. All rights reserved.
//

#import "JSFunctionBeforeAndAfterRenderingComposer4.h"
#import "AAChartKit.h"

@implementation JSFunctionBeforeAndAfterRenderingComposer4

/**
 let each = Highcharts.each,
     merge = Highcharts.merge,
     pInt = Highcharts.pInt,
     isNumber = Highcharts.isNumber,
     pick = Highcharts.pick;
 Highcharts.seriesTypes.gauge.prototype.translate = function () {
     var series = this,
         yAxis = series.yAxis,
         options = series.options,
         center = yAxis.center;
     series.generatePoints();
     each(series.points, function (point) {
         var dialOptions = merge(options.dial, point.dial),
             radius = (pInt(pick(dialOptions.radius, 80)) * center[2]) /
             200,
             baseLength = (pInt(pick(dialOptions.baseLength, 70)) * radius) /
             100,
             rearLength = (pInt(pick(dialOptions.rearLength, 10)) * radius) /
             100,
             baseWidth = dialOptions.baseWidth || 3,
             overshoot = options.overshoot,
             rotation = yAxis.startAngleRad +
             yAxis.translate(point.y, null, null, null, true);
         // Handle the wrap and overshoot options
         if (isNumber(overshoot)) {
             overshoot = overshoot / 180 * Math.PI;
             rotation = Math.max(
                 yAxis.startAngleRad - overshoot,
                 Math.min(yAxis.endAngleRad + overshoot, rotation)
             );
         } else if (options.wrap === false) {
             rotation = Math.max(
                 yAxis.startAngleRad,
                 Math.min(yAxis.endAngleRad, rotation)
             );
         }
         rotation = rotation * 180 / Math.PI;
         point.shapeType = 'path';
         // 主要修改了这里，自定义指针 path
         point.shapeArgs = {
             d: dialOptions.path || [
                 'M',
                 -rearLength, -baseWidth / 2,
                 'L',
                 baseLength, -baseWidth / 2,
                 radius, 0,
                 //radius, topWidth / 2,
                 baseLength, baseWidth / 2,
                 -rearLength, baseWidth / 2,
                 -rearLength - baseWidth + 2, 0,
                 'z'
             ],
             translateX: center[0],
             translateY: center[1],
             rotation: rotation
         };
         // Positions for data label
         point.plotX = center[0];
         point.plotY = center[1];
     });
 };
 var stops = [
     [0, '#00ff00'],
     [0.5, '#ffff00'],
     [1, '#ff0000']
 ],
     max = 200;
 function getColor(val) {
     let pos = val / max,
         i = stops.length -1,
         startStop,
         endStop;
     for(; i >= 0; i--) {
         if(stops[i][0] <pos) {
             startStop = stops[i];
             endStop = stops[i +1];
             break;
         }
     }
     pos = (pos - startStop[0]) / (endStop[0] - startStop[0]);
     return new Highcharts.Color(startStop[1]).tweenTo(new Highcharts.Color(endStop[1]), pos);
 }
 var chart = Highcharts.chart('container',{
     chart: {
         type: 'gauge',
         plotBackgroundColor: null,
         plotBorderWidth: 0,
         plotShadow: false,
         spacing: 0,
         margin: -20
     },
     title: {
         text: null
     },
     pane: {
         startAngle: -120,
         endAngle: 120,
         background: [{
             backgroundColor: null,
             borderWidth: 0
         }]
     },
     yAxis: {
         lineWidth: 0,
         minorTickInterval: null,
         tickPixelInterval: 400,
         tickWidth: 0,
         title: {
             y: -70
         },
         labels: {
             y: 16
         },
         min: 0,
         max: 200,
         minorTickWidth: 1,
         minorTickLength: 5,
         tickPixelInterval: 30,
         minorTickPosition: 'inside',
         minorTickColor: '#ccc',
         tickWidth: 1,
         tickLegnth: 10,
         offset: -10,
         lineWidth: 0,
         labels: {
             step: 2,
             rotation: 'auto'
         },
         title: {
             text: null
         },
         plotBands: [{
             from: 0,
             to: 200,
             color:  {
                 linearGradient: { x1: 0, x2: 1, y1: 0, y2: 0 },
                 stops: stops
             }
         }]
     },
     tooltip: {
         enabled: false
     },
     series: [{
         name: 'Speed',
         data: [120],
         dataLabels: {
             format: '{y} km/h',
             borderWidth: 0
         },
         dial: {
             backgroundColor: '#00ff00',
             radius: '70%', // 指针半径
             baseLength: '10%', // 指针长度
             baseWidth: 13, // 宽度
             rearLength: 0 // 尾部长度
         },
         pivot: { // 指针中心圆点
             radius: 2, // 半径
             backgroundColor: '#fff' // 背景颜色
         }
     }]
 }, function (chart) {
     if (!chart.renderer.forExport) {
         setInterval(function () {
             var point = chart.series[0].points[0],
                 newVal,
                 inc = Math.round((Math.random() - 0.5) * 50);
             newVal = point.y + inc;
             if (newVal < 0 || newVal > 200) {
                 newVal = point.y - inc;
             }
             let color = getColor(newVal);
             point.update({
                 y: newVal,
                 fill: color
             });
             point.graphic.attr({
                 fill: color
             });
         }, 1000);
     }
 });
 */
//自定义指针样式仪表图
+ (AAOptions *)customPointerStyleGaugeChart {
    NSArray *stops = @[@[@0, @"#00ff00"],
                       @[@0.5, @"#ffff00"],
                       @[@1, @"#ff0000"]];
    NSNumber *max = @200;
    NSString *jsStr = @AAJSFunc((let each = Highcharts.each,
                                 merge = Highcharts.merge,
                                 pInt = Highcharts.pInt,
                                 isNumber = Highcharts.isNumber,
                                 pick = Highcharts.pick;
                             Highcharts.seriesTypes.gauge.prototype.translate = function () {
                                 var series = this,
                                     yAxis = series.yAxis,
                                     options = series.options,
                                     center = yAxis.center;
                                 series.generatePoints();
                                 each(series.points, function (point) {
                                     var dialOptions = merge(options.dial, point.dial),
                                         radius = (pInt(pick(dialOptions.radius, 80)) * center[2]) /
                                         200,
                                         baseLength = (pInt(pick(dialOptions.baseLength, 70)) * radius) /
                                         100,
                                         rearLength = (pInt(pick(dialOptions.rearLength, 10)) * radius) /
                                         100,
                                         baseWidth = dialOptions.baseWidth || 3,
                                         overshoot = options.overshoot,
                                         rotation = yAxis.startAngleRad +
                                         yAxis.translate(point.y, null, null, null, true);
                                     // Handle the wrap and overshoot options
                                     if (isNumber(overshoot)) {
                                         overshoot = overshoot / 180 * Math.PI;
                                         rotation = Math.max(
                                             yAxis.startAngleRad - overshoot,
                                             Math.min(yAxis.endAngleRad + overshoot, rotation)
                                         );
                                     } else if (options.wrap === false) {
                                         rotation = Math.max(
                                             yAxis.startAngleRad,
                                             Math.min(yAxis.endAngleRad, rotation)
                                         );
                                     }
                                     rotation = rotation * 180 / Math.PI;
                                     point.shapeType = 'path';
                                     // 主要修改了这里，自定义指针 path
                                     point.shapeArgs = {
                                         d: dialOptions.path || [
                                             'M',
                                             -rearLength, -baseWidth / 2,
                                             'L',
                                             baseLength, -baseWidth / 2,
                                             radius, 0,
                                             //radius, topWidth / 2,
                                             baseLength, baseWidth / 2,
                                             -rearLength, baseWidth / 2,
                                             -rearLength - baseWidth + 2, 0,
                                             'z'
                                         ],
                                         translateX: center[0],
                                         translateY: center[1],
                                         rotation: rotation
                                     };
                                     // Positions for data label
                                     point.plotX = center[0];
                                     point.plotY = center[1];
                                 });
                             };
                             var stops = [
                                 [0, '#00ff00'],
                                 [0.5, '#ffff00'],
                                 [1, '#ff0000']
                             ],
                                 max = 200;
                             function getColor(val) {
                                 let pos = val / max,
                                     i = stops.length -1,
                                     startStop,
                                     endStop;
                                 for(; i >= 0; i--) {
                                     if(stops[i][0] <pos) {
                                         startStop = stops[i];
                                         endStop = stops[i +1];
                                         break;
                                     }
                                 }
                                 pos = (pos - startStop[0]) / (endStop[0] - startStop[0]);
                                 return new Highcharts.Color(startStop[1]).tweenTo(new Highcharts.Color(endStop[1]), pos);
                             }));
    
    AAOptions *aaOptions = AAOptions.new
    .chartSet(AAChart.new
              .typeSet(AAChartTypeGauge)
//              .plotBackgroundColorSet(@"null")
//              .plotBorderWidthSet(@0)
//              .plotShadowSet(@false)
              .spacingSet((id)@0)
              .marginSet((id)@-20)
              .eventsSet(AAChartEvents.new
                         .loadSet(@AAJSFunc(function (chart) {
                             if (!chart.renderer.forExport) {
                                 setInterval(function () {
                                     var point = chart.series[0].points[0],
                                         newVal,
                                         inc = Math.round((Math.random() - 0.5) * 50);
                                     newVal = point.y + inc;
                                     if (newVal < 0 || newVal > 200) {
                                         newVal = point.y - inc;
                                     }
                                     let color = getColor(newVal);
                                     point.update({
                                         y: newVal,
                                         fill: color
                                     });
                                     point.graphic.attr({
                                         fill: color
                                     });
                                 }, 1000);
                             }
                         })))
              )
    .titleSet(AATitle.new
                .textSet(@"null"))
    .paneSet(AAPane.new
                .startAngleSet(@-120)
                .endAngleSet(@120)
//                .backgroundSet(@[AAPaneBackground.new
//                                .backgroundColorSet(@"null")
//                                .borderWidthSet(@0)])
             )
    .yAxisSet(AAYAxis.new
                .lineWidthSet(@0)
                .minorTickIntervalSet(@"null")
//                .tickPixelIntervalSet(@400)
                .tickWidthSet(@0)
                .titleSet(AATitle.new
                          .ySet(@-70))
                .labelsSet(AALabels.new
                           .ySet(@16))
                .minSet(@0)
                .maxSet(@200)
                .minorTickWidthSet(@1)
                .minorTickLengthSet(@5)
//                .tickPixelIntervalSet(@30)
                .minorTickPositionSet(@"inside")
                .minorTickColorSet(@"#ccc")
                .tickWidthSet(@1)
//                .tickLegnthSet(@10)
                .offsetSet(@-10)
                .lineWidthSet(@0)
                .labelsSet(AALabels.new
                           .stepSet(@2)
                           .rotationSet(@"auto"))
                .titleSet(AATitle.new
                          .textSet(@"null"))
//                .plotBandsSet(@[AAPlotBandsElement.new
//                                .fromSet(@0)
//                                .toSet(@200)
//                                .colorSet((id)@{
//                                    @"linearGradient": @{@"x1": @0, @"x2": @1, @"y1": @0, @"y2": @0},
//                                    @"stops": stops
//                                })]))
                .plotBandsSet(@[
                    AAPlotBandsElement.new
                                .fromSet(@0)
                                .toSet(@200)
                                .colorSet((id)AAGradientColor.new
                                          .linearGradientSet(AALinearGradient.new
                                                             .x1Set(@0)
                                                             .x2Set(@1)
                                                             .y1Set(@0)
                                                             .y2Set(@0))
                                          .stopsSet(stops))])
             )
    .tooltipSet(AATooltip.new
                .enabledSet(@false))
    .seriesSet(@[
        AASeriesElement.new
                 .nameSet(@"Speed")
                 .dataSet(@[@120])
                 .dataLabelsSet(AADataLabels.new
                                .formatSet(@"{y} km/h")
                                .borderWidthSet(@0))
//                 .dialSet(AADial.new
//                          .backgroundColorSet(@"#00ff00")
//                          .radiusSet(@"70%")
//                          .baseLengthSet(@"10%")
//                          .baseWidthSet(@13)
//                          .rearLengthSet(@0))
//                 .pivotSet(AAPivot.new
//                           .radiusSet(@2)
//                           .backgroundColorSet(@"#fff"))
    ]);
    
//    aaOptions.beforeDrawChartJavaScriptSet(jsStr);
    
//    aaOptions.afterDrawChartJavaScriptSet(@AAJSFunc(function (chart) {
//        if (!chart.renderer.forExport) {
//            setInterval(function () {
//                var point = chart.series[0].points[0],
//                    newVal,
//                    inc = Math.round((Math.random() - 0.5) * 50);
//                newVal = point.y + inc;
//                if (newVal < 0 || newVal > 200) {
//                    newVal = point.y - inc;
//                }
//                let color = getColor(newVal);
//                point.update({
//                    y: newVal,
//                    fill: color
//                });
//                point.graphic.attr({
//                    fill: color
//                });
//            }, 1000);
//        }
//    }));
    
    return aaOptions;
}

@end
