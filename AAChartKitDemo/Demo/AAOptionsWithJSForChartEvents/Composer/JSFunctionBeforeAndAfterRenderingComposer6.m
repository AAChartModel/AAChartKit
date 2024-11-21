//
//  JSFunctionBeforeAndAfterRenderingComposer6.m
//  AAChartKitDemo
//
//  Created by AnAn on 2024/11/21.
//  Copyright © 2024 An An. All rights reserved.
//

#import "JSFunctionBeforeAndAfterRenderingComposer6.h"
#import "AAChartKit.h"

@implementation JSFunctionBeforeAndAfterRenderingComposer6

/**
  // Highcharts plugin for creating individual arrow-head like inverted bars.
  
 (function (H) {
     H.addEvent(
         H.seriesTypes.column,
         'afterColumnTranslate',
         function () {
             const series = this,
                 options = series.options,
                 topMargin = options.topMargin || 0,
                 bottomMargin = options.bottomMargin || 0,
                 idx = series.index;

             if (options.headSize) {

                 series.points.forEach(function (point) {
                     const shapeArgs = point.shapeArgs,
                         w = shapeArgs.width,
                         h = shapeArgs.height,
                         x = shapeArgs.x,
                         y = shapeArgs.y,
                         cutLeft = idx !== 0,
                         cutRight = point.stackY !== point.y || !cutLeft;

                     let len = options.headSize; // in pixels

                     if (point.y < 0) {
                         len *= -1;
                     }

                     // Preserve the box for data labels
                     point.dlBox = point.shapeArgs;

                     point.shapeType = 'path';
                     point.shapeArgs = {
                         d: [
                             ['M', x, y + topMargin],
                             [
                                 'L',
                                 x + w / 2,
                                 y + topMargin + (cutRight ? len : 0)
                             ], // arrow
                             // top side
                             ['L', x + w, y + topMargin],
                             // right side
                             ['L', x + w, y + h],
                             // bottom side
                             [
                                 'L',
                                 x + w / 2,
                                 y + h + bottomMargin + (cutLeft ? len : 0)
                             ],
                             ['L', x, y + h + bottomMargin],
                             // left side
                             ['L', x, y],
                             // close
                             ['Z']
                         ]
                     };

                 });
             }
         }
     );
 }(Highcharts));

 Highcharts.chart('container', {
     chart: {
         type: 'bar',
         height: 170
     },
     title: {
         text: 'Mars EDL forces comparison'
     },
     plotOptions: {
         bar: {
             headSize: 6,
             stacking: 'normal',
             dataLabels: {
                 enabled: true,
                 y: 20,
                 verticalAlign: 'bottom'
             },
             color: 'rgb(255, 7, 77)',
             negativeColor: 'rgb(1, 127, 250)',
             accessibility: {
                 exposeAsGroupOnly: true
             }
         }
     },
     tooltip: {
         format: '<span style="color:{point.color}">\u25CF</span> ' +
             '<b>{series.name}: {point.y}</b>'
     },
     accessibility: {
         typeDescription: 'Stacked bar "force" chart. Positive forces ' +
             'are shown on the right side and negative on the left.',
         series: {
             descriptionFormat: 'Series {add series.index 1} of ' +
             '{chart.series.length}, Name: {series.name}, ' +
             '{#if (gt series.points.0.y 0)}accelerating' +
             '{else}decelerating{/if} value of {series.points.0.y}.'
         }
     },
     yAxis: {
         reversedStacks: false,
         opposite: true,
         labels: {
             enabled: false
         },
         title: '',
         accessibility: {
             description: ''
         },
         stackLabels: {
             enabled: true,
             verticalAlign: 'top',
             style: {
                 fontSize: '1.2em'
             },
             format: '{#if isNegative}Min{else}Max{/if}: {total}'
         },
         startOnTick: false,
         endOnTick: false
     },
     xAxis: {
         visible: false,
         title: '',
         accessibility: {
             description: ''
         }
     },
     legend: {
         enabled: false
     },
     
     //NOTE: These data values are arbitrary, illustrative and does not reflect
     //the strength of actual forces in a Mars EDL sequence. They aim to broadly
     //demonstrate the key dynamics affecting the spacecraft during EDL.
     
     series: [
         // Unwanted/additive forces
         { name: 'Initial Entry Speed', data: [15] },
         { name: 'Martian Gravity', data: [3] },

         // Slowing forces
         { name: 'Atmospheric Drag (Re-entry)', data: [-9] },
         { name: 'Parachute Drag', data: [-7] },
         { name: 'Heat Shield Separation', data: [-0.5] },
         { name: 'Retro Rockets (Powered decent)', data: [-1.5] },
         { name: 'Sky Crane Operation', data: [-1] }
     ]
 });

 */

//Force chart (Stacked bar)
+ (AAOptions *)forceStackedBarChart {
    NSString *jsFunctionStr = @AAJSFunc((function (H) {
        H.addEvent(
            H.seriesTypes.column,
            'afterColumnTranslate',
            function () {
                const series = this,
                    options = series.options,
                    topMargin = options.topMargin || 0,
                    bottomMargin = options.bottomMargin || 0,
                    idx = series.index;

                if (options.headSize) {

                    series.points.forEach(function (point) {
                        const shapeArgs = point.shapeArgs,
                            w = shapeArgs.width,
                            h = shapeArgs.height,
                            x = shapeArgs.x,
                            y = shapeArgs.y,
                            cutLeft = idx !== 0,
                            cutRight = point.stackY !== point.y || !cutLeft;

                        let len = options.headSize; // in pixels

                        if (point.y < 0) {
                            len *= -1;
                        }

                        // Preserve the box for data labels
                        point.dlBox = point.shapeArgs;

                        point.shapeType = 'path';
                        point.shapeArgs = {
                            d: [
                                ['M', x, y + topMargin],
                                [
                                    'L',
                                    x + w / 2,
                                    y + topMargin + (cutRight ? len : 0)
                                ], // arrow
                                // top side
                                ['L', x + w, y + topMargin],
                                // right side
                                ['L', x + w, y + h],
                                // bottom side
                                [
                                    'L',
                                    x + w / 2,
                                    y + h + bottomMargin + (cutLeft ? len : 0)
                                ],
                                ['L', x, y + h + bottomMargin],
                                // left side
                                ['L', x, y],
                                // close
                                ['Z']
                            ]
                        };

                    });
                }
            }
        );
    }(Highcharts)));
    
    AAOptions *aaOptions = AAOptions.new
    .chartSet(AAChart.new
              .typeSet(AAChartTypeBar)
//              .heightSet(@170)
              )
    .titleSet(AATitle.new
                .textSet(@"Mars EDL forces comparison")
                )
    .plotOptionsSet(AAPlotOptions.new
//                    .barSet(AABar.new
////                            .headSizeSet(@6)
//                            .stackingSet(AAChartStackingTypeNormal)
//                            .dataLabelsSet(AADataLabels.new
//                                           .enabledSet(true)
//                                           .ySet(@20)
//                                           .verticalAlignSet(AAChartVerticalAlignTypeBottom)
//                                           )
//                            .colorSet(@"rgb(255, 7, 77)")
////                            .negativeColorSet(@"rgb(1, 127, 250)")
////                            .accessibilitySet(AAAccessibility.new
////                                              .exposeAsGroupOnlySet(true)
////                                              )
//                            )
                    .barSet(@{
                        @"headSize": @6,
                        @"stacking": @"normal",
                        @"dataLabels": @{
                            @"enabled": @true,
                            @"y": @20,
                            @"verticalAlign": @"bottom"
                        },
                        @"color": @"rgb(255, 7, 77)",
                        @"negativeColor": @"rgb(1, 127, 250)",
//                        @"accessibility": @{
//                            @"exposeAsGroupOnly": @true
//                        }
                    })
                    )
    .tooltipSet(AATooltip.new
//                .formatSet(@"<span style=\"color:{point.color}\">\u25CF</span> " +
//                           "<b>{series.name}: {point.y}</b>")
                )
//    .accessibilitySet(AAAccessibility.new
//                      .typeDescriptionSet(@"Stacked bar \"force\" chart. Positive forces " +
//                                          "are shown on the right side and negative on the left.")
//                      .seriesSet(AASeries.new
//                                 .descriptionFormatSet(@"Series {add series.index 1} of " +
//                                                       "{chart.series.length}, Name: {series.name}, " +
//                                                       "{#if (gt series.points.0.y 0)}accelerating" +
//                                                       "{else}decelerating{/if} value of {series.points.0.y}.")
//                                 )
//                      )
    .yAxisSet(AAYAxis.new
//                .reversedStacksSet(false)
                .oppositeSet(true)
                .labelsSet(AALabels.new
                             .enabledSet(false)
                             )
                .titleSet((id)AATitle.new
                            .textSet(@"")
//                            .accessibilitySet(AAAccessibility.new
//                                            .descriptionSet(@"")
//                                            )
                            )
//                .stackLabelsSet(AAStackLabels.new
//                                .enabledSet(true)
//                                .verticalAlignSet(AAChartVerticalAlignTypeTop)
//                                .styleSet(AAStyle.new
//                                            .fontSizeSet(@"1.2em")
//                                            )
//                                .formatSet(@"{#if isNegative}Min{else}Max{/if}: {total}")
//                                )
                .startOnTickSet(false)
                .endOnTickSet(false)
                )
    .xAxisSet(AAXAxis.new
                .visibleSet(false)
                .titleSet(@"")
//                .accessibilitySet(AAAccessibility.new
//                                .descriptionSet(@"")
//                                )
                )
    .legendSet(AALegend.new
                .enabledSet(false)
                )
    .seriesSet(@[
        // Unwanted/additive forces
        AASeriesElement.new
        .nameSet(@"Initial Entry Speed")
        .dataSet(@[@15]),
        AASeriesElement.new
        .nameSet(@"Martian Gravity")
        .dataSet(@[@3]),
        
        // Slowing forces
        AASeriesElement.new
        .nameSet(@"Atmospheric Drag (Re-entry)")
        .dataSet(@[@-9]),
        AASeriesElement.new
        .nameSet(@"Parachute Drag")
        .dataSet(@[@-7]),
        AASeriesElement.new
        .nameSet(@"Heat Shield Separation")
        .dataSet(@[@-0.5]),
        AASeriesElement.new
        .nameSet(@"Retro Rockets (Powered decent)")
        .dataSet(@[@-1.5]),
        AASeriesElement.new
        .nameSet(@"Sky Crane Operation")
        .dataSet(@[@-1]),
    ]);
    
    aaOptions.beforeDrawChartJavaScript = jsFunctionStr;
    
    return aaOptions;

}

@end
