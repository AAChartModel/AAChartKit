//
//  JSFunctionBeforeAndAfterRenderingComposer2.m
//  AAChartKitDemo
//
//  Created by AnAn on 2024/11/19.
//  Copyright © 2024 An An. All rights reserved.
//

#import "JSFunctionBeforeAndAfterRenderingComposer2.h"
#import "AAChartKit.h"

@implementation JSFunctionBeforeAndAfterRenderingComposer2

/**
 Highcharts.chart('container', {
     chart: {
         type: 'gauge',
         plotBorderWidth: 1,
         plotBackgroundColor: {
             linearGradient: { x1: 0, y1: 0, x2: 0, y2: 1 },
             stops: [
                 [0, '#FFF4C6'],
                 [0.3, '#FFFFFF'],
                 [1, '#FFF4C6']
             ]
         },
         plotBackgroundImage: null,
         height: 200
     },

     title: {
         text: 'VU meter'
     },

     pane: [{
         startAngle: -45,
         endAngle: 45,
         background: null,
         center: ['25%', '145%'],
         size: 300
     }, {
         startAngle: -45,
         endAngle: 45,
         background: null,
         center: ['75%', '145%'],
         size: 300
     }],

     exporting: {
         enabled: false
     },

     tooltip: {
         enabled: false
     },

     yAxis: [{
         min: -20,
         max: 6,
         minorTickPosition: 'outside',
         tickPosition: 'outside',
         labels: {
             rotation: 'auto',
             distance: 20
         },
         plotBands: [{
             from: 0,
             to: 6,
             color: '#C02316',
             innerRadius: '100%',
             outerRadius: '105%'
         }],
         pane: 0,
         title: {
             text: 'VU<br/><span style="font-size:8px">Channel A</span>',
             y: -40
         }
     }, {
         min: -20,
         max: 6,
         minorTickPosition: 'outside',
         tickPosition: 'outside',
         labels: {
             rotation: 'auto',
             distance: 20
         },
         plotBands: [{
             from: 0,
             to: 6,
             color: '#C02316',
             innerRadius: '100%',
             outerRadius: '105%'
         }],
         pane: 1,
         title: {
             text: 'VU<br/><span style="font-size:8px">Channel B</span>',
             y: -40
         }
     }],

     plotOptions: {
         gauge: {
             dataLabels: {
                 enabled: false
             },
             dial: {
                 radius: '100%'
             }
         }
     },

     series: [{
         name: 'Channel A',
         data: [-20],
         yAxis: 0
     }, {
         name: 'Channel B',
         data: [-20],
         yAxis: 1
     }]

 },

 // Let the music play
 function (chart) {
     setInterval(function () {
         if (chart.series) { // the chart may be destroyed

             const left = chart.series[0].points[0],
                 right = chart.series[1].points[0],
                 inc = (Math.random() - 0.5) * 3;

             let leftVal,
                 rightVal;

             leftVal = left.y + inc;
             rightVal = leftVal + inc / 3;
             if (leftVal < -20 || leftVal > 6) {
                 leftVal = left.y - inc;
             }
             if (rightVal < -20 || rightVal > 6) {
                 rightVal = leftVal;
             }

             left.update(leftVal, false);
             right.update(rightVal, false);
             chart.redraw();
         }
     }, 500);

 });
 */
//将以上的 JavaScript 代码转换为 OC 代码
+ (AAOptions *)speedometerChart {
    AAOptions *aaOptions = AAOptions.new
    .chartSet(
//              AAChart.new
//              .typeSet(AAChartTypeGauge)
//              .plotBorderWidthSet(@1)
//              .plotBackgroundColorSet((id)AAGradientColor.new
//                                      .linearGradientSet(AALinearGradient.new
//                                                         .x1Set(@0)
//                                                         .y1Set(@0)
//                                                         .x2Set(@0)
//                                                         .y2Set(@1)
//                                                         )
//                                      .stopsSet(@[
//                                          @[@0, @"#FFF4C6"],
//                                          @[@0.3, @"#FFFFFF"],
//                                          @[@1, @"#FFF4C6"],
//                                      ])
//                                      )
//              .heightSet(@200)
              @{@"type": @"gauge",
                @"plotBorderWidth": @1,
                @"plotBackgroundColor": @{
                        @"linearGradient": @{@"x1": @0, @"y1": @0, @"x2": @0, @"y2": @1},
                        @"stops": @[@[@0, @"#FFF4C6"],
                                    @[@0.3, @"#FFFFFF"],
                                    @[@1, @"#FFF4C6"]]
                },
                @"height": @200
              }
              )
    .titleSet(AATitle.new
              .textSet(@"VU meter"))
    .paneSet((id)@[
        AAPane.new
        .startAngleSet(@-45)
        .endAngleSet(@45)
        .backgroundSet((id)[NSNull null])
        .centerSet(@[@"25%", @"145%"])
        .sizeSet(@300),
        AAPane.new
        .startAngleSet(@-45)
        .endAngleSet(@45)
        .backgroundSet((id)[NSNull null])
        .centerSet(@[@"75%", @"145%"])
        .sizeSet(@300),
    ])
//    .exportingSet(AAExporting.new.enabledSet(false))
    .tooltipSet(AATooltip.new
                .enabledSet(false))
    .yAxisSet(@[
        AAYAxis.new
        .minSet(@-20)
        .maxSet(@6)
        .minorTickPositionSet(@"outside")
        .tickPositionSet(@"outside")
        .labelsSet(AALabels.new
                   .rotationSet(@"auto")
                   .distanceSet(@20)
                   )
        .plotBandsSet(@[AAPlotBandsElement.new
                        .fromSet(@0)
                        .toSet(@6)
                        .colorSet(@"#C02316")
                        .innerRadiusSet(@"100%")
                        .outerRadiusSet(@"105%")
                        ])
        .paneSet(@0)
        .titleSet(AATitle.new
                  .textSet(@"VU<br/><span style='font-size:8px'>Channel A</span>".aa_toPureJSString)
                  .ySet(@-40)
                    ),
        AAYAxis.new
        .minSet(@-20)
        .maxSet(@6)
        .minorTickPositionSet(@"outside")
        .tickPositionSet(@"outside")
        .labelsSet(AALabels.new
                   .rotationSet(@"auto")
                   .distanceSet(@20)
                   )
        .plotBandsSet(@[AAPlotBandsElement.new
                        .fromSet(@0)
                        .toSet(@6)
                        .colorSet(@"#C02316")
                        .innerRadiusSet(@"100%")
                        .outerRadiusSet(@"105%")
                        ])
        .paneSet(@1)
        .titleSet(AATitle.new
                  .textSet(@"VU<br/><span style='font-size:8px'>Channel B</span>".aa_toPureJSString)
                  .ySet(@-40)
                  ),
    ])
    .plotOptionsSet(AAPlotOptions.new
                    .gaugeSet(AAGauge.new
                              .dataLabelsSet(AADataLabels.new
                                             .enabledSet(false)
                                             )
                              .dialSet(AADial.new
                                       .radiusSet(@"100%")
                                       )
                              )
                    )
    .seriesSet(@[
        AASeriesElement.new
        .nameSet(@"Channel A")
        .dataSet(@[@-20])
        .showInLegendSet(false)
        .yAxisSet(@0),
        AASeriesElement.new
        .nameSet(@"Channel B")
        .dataSet(@[@-20])
        .showInLegendSet(false)
        .yAxisSet(@1),
    ])
    .afterDrawChartJavaScriptSet(@AAJSFunc(
    setInterval(function () {
        const chart = aaGlobalChart;
        if (chart.series) { // the chart may be destroyed

            const left = chart.series[0].points[0],
                right = chart.series[1].points[0],
                inc = (Math.random() - 0.5) * 3;

            let leftVal,
                rightVal;

            leftVal = left.y + inc;
            rightVal = leftVal + inc / 3;
            if (leftVal < -20 || leftVal > 6) {
                leftVal = left.y - inc;
            }
            if (rightVal < -20 || rightVal > 6) {
                rightVal = leftVal;
            }

            left.update(leftVal, false);
            right.update(rightVal, false);
            chart.redraw();
        }
    }, 500)
    ));
    return aaOptions;
}

@end
