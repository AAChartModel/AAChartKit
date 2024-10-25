//
//  JSFunctionBeforeAndAfterRenderingComposer.m
//  AAChartKitDemo
//
//  Created by AnAn on 2024/10/25.
//  Copyright © 2024 An An. All rights reserved.
//

#import "JSFunctionBeforeAndAfterRenderingComposer.h"
#import "AAChartKit.h"


@implementation JSFunctionBeforeAndAfterRenderingComposer

///**
// * Get the current time
// */
//const getNow = () => {
//    const now = new Date();
//
//    return {
//        date: now,
//        hours: now.getHours() + now.getMinutes() / 60,
//        minutes: now.getMinutes() * 12 / 60 + now.getSeconds() * 12 / 3600,
//        seconds: now.getSeconds() * 12 / 60
//    };
//};
//
//let now = getNow();
//
//// Create the chart
//Highcharts.chart('container', {
//
//    chart: {
//        type: 'gauge',
//   
//        plotShadow: false,
//        height: '80%'
//    },
//
//    credits: {
//        enabled: false
//    },
//
//    title: {
//        text: 'The Highcharts clock'
//    },
//
//    pane: {
//        background: [{
//            // default background
//        }, {
//            // reflex for supported browsers
//            backgroundColor: {
//                radialGradient: {
//                    cx: 0.5,
//                    cy: -0.4,
//                    r: 1.9
//                },
//                stops: [
//                    [0.5, 'rgba(255, 255, 255, 0.2)'],
//                    [0.5, 'rgba(200, 200, 200, 0.2)']
//                ]
//            }
//        }]
//    },
//
//    yAxis: {
//        labels: {
//            distance: -23,
//            style: {
//                fontSize: '18px'
//            }
//        },
//        min: 0,
//        max: 12,
//        lineWidth: 0,
//        showFirstLabel: false,
//
//        minorTickInterval: 'auto',
//        minorTickWidth: 3,
//        minorTickLength: 5,
//        minorTickPosition: 'inside',
//        minorGridLineWidth: 0,
//        minorTickColor: '#666',
//
//        tickInterval: 1,
//        tickWidth: 4,
//        tickPosition: 'inside',
//        tickLength: 10,
//        tickColor: '#666',
//        title: {
//            text: 'Powered by<br/>Highcharts',
//            style: {
//                color: '#BBB',
//                fontWeight: 'normal',
//                fontSize: '10px',
//                lineHeight: '10px'
//            },
//            y: 10
//        }
//    },
//
//    tooltip: {
//        format: '{series.chart.tooltipText}'
//    },
//
//    series: [{
//        data: [{
//            id: 'hour',
//            y: now.hours,
//            dial: {
//                radius: '60%',
//                baseWidth: 4,
//                baseLength: '95%',
//                rearLength: 0
//            }
//        }, {
//            id: 'minute',
//            y: now.minutes,
//            dial: {
//                baseLength: '95%',
//                rearLength: 0
//            }
//        }, {
//            id: 'second',
//            y: now.seconds,
//            dial: {
//                radius: '100%',
//                baseWidth: 1,
//                rearLength: '20%'
//            }
//        }],
//        animation: false,
//        dataLabels: {
//            enabled: false
//        }
//    }]
//},
//
//// Move
//function (chart) {
//    setInterval(function () {
//
//        now = getNow();
//
//        if (chart.axes) { // not destroyed
//            const hour = chart.get('hour'),
//                minute = chart.get('minute'),
//                second = chart.get('second');
//
//            // Cache the tooltip text
//            chart.tooltipText = Highcharts.dateFormat('%H:%M:%S', now.date);
//
//            hour.update(now.hours, true, false);
//            minute.update(now.minutes, true, false);
//
//            // Move to 59 sec without animation ...
//            if (now.seconds === 0) {
//                second.update(-0.2, true, false);
//            }
//            // ... then bounce to next second
//            second.update(now.seconds, true, {
//                easing: 'easeOutBounce'
//            });
//        }
//
//    }, 1000);
//
//});
//
///**
// * Easing function from https://github.com/danro/easing-js/blob/master/easing.js
// */
//Math.easeOutBounce = function (pos) {
//    if ((pos) < (1 / 2.75)) {
//        return (7.5625 * pos * pos);
//    }
//    if (pos < (2 / 2.75)) {
//        return (7.5625 * (pos -= (1.5 / 2.75)) * pos + 0.75);
//    }
//    if (pos < (2.5 / 2.75)) {
//        return (7.5625 * (pos -= (2.25 / 2.75)) * pos + 0.9375);
//    }
//    return (7.5625 * (pos -= (2.625 / 2.75)) * pos + 0.984375);
//};

+ (AAOptions *)clockChart {
    AAChart *chart = AAChart.new
        .typeSet(AAChartTypeGauge)
    .eventsSet(AAChartEvents.new
               .loadSet(@AAJSFunc(
                                  // Move
                                  function (chart) {
                                      /**
                                        * Easing function from https://github.com/danro/easing-js/blob/master/easing.js
                                        */
                                       Math.easeOutBounce = function (pos) {
                                           if ((pos) < (1 / 2.75)) {
                                               return (7.5625 * pos * pos);
                                           }
                                           if (pos < (2 / 2.75)) {
                                               return (7.5625 * (pos -= (1.5 / 2.75)) * pos + 0.75);
                                           }
                                           if (pos < (2.5 / 2.75)) {
                                               return (7.5625 * (pos -= (2.25 / 2.75)) * pos + 0.9375);
                                           }
                                           return (7.5625 * (pos -= (2.625 / 2.75)) * pos + 0.984375);
                                       };
                                      
                                      function getNow() {
                                          var now = new Date();
                                          var timeInfo = {}; // 创建一个空对象

                                          // 逐步添加属性
                                          timeInfo.date = now;
                                          timeInfo.hours = now.getHours() + now.getMinutes() / 60;
                                          timeInfo.minutes = (now.getMinutes() * 12 / 60) + (now.getSeconds() * 12 / 3600);
                                          timeInfo.seconds = now.getSeconds() * 12 / 60;

                                          return timeInfo;
                                      }
                                      
                                      console.log("✈️-------------------");
                                      
                                      setInterval(function () {

                                          now = getNow();

                                              const hour = chart.get('hour'),
                                                  minute = chart.get('minute'),
                                                  second = chart.get('second');

                                              // Cache the tooltip text
                                              chart.tooltipText = Highcharts.dateFormat('%H:%M:%S', now.date);

                                              hour.update(now.hours, true, false);
                                              minute.update(now.minutes, true, false);

                                              // Move to 59 sec without animation ...
                                              if (now.seconds === 0) {
                                                  second.update(-0.2, true, false);
                                              }
                                              // ... then bounce to next second
                                              second.update(now.seconds, true, {
                                                  easing: 'easeOutBounce'
                                              });
                                              console.log("🕙时钟时间刷新正常-------------------");

                                          
                                          
                                          console.log("⏰定时器工作正常-------------------");


                                      }, 1000);

                                  })))
//        .plotShadowSet(NO)
//        .heightSet(@"80%")
    ;

    AACredits *credits = AACredits.new
        .enabledSet(NO);

    AATitle *title = AATitle.new
        .textSet(@"The Highcharts clock");

    AAGradientColor *backgroundGradient = AAGradientColor.new
        .radialGradientSet(AARadialGradient.new
                           .cxSet(@0.5)
                           .cySet(@-0.4)
                           .rSet(@1.9))
        .stopsSet(@[
            @[@0.5, @"rgba(255, 255, 255, 0.2)"],
            @[@0.5, @"rgba(200, 200, 200, 0.2)"]
        ]);

    AAPane *pane = AAPane.new
        .backgroundSet((id)@[
            AABackground.new,
            AABackground.new
                .backgroundColorSet((id)backgroundGradient)
        ]);

    AAYAxis *yAxis = AAYAxis.new
        .labelsSet(AALabels.new
            .distanceSet(@(-23))
            .styleSet(AAStyle.new
                .fontSizeSet(@"18px")
            )
        )
        .minSet(@0)
        .maxSet(@12)
        .lineWidthSet(@0)
//        .showFirstLabelSet(NO)
        .minorTickIntervalSet((id)@"auto")
        .minorTickWidthSet(@3)
        .minorTickLengthSet(@5)
        .minorTickPositionSet(@"inside")
        .minorGridLineWidthSet(@0)
        .minorTickColorSet(@"#666")
        .tickIntervalSet(@1)
        .tickWidthSet(@4)
        .tickPositionSet(@"inside")
        .tickLengthSet(@10)
        .tickColorSet(@"#666")
        .titleSet(AAAxisTitle.new
            .textSet(@"Powered by<br/>Highcharts")
            .styleSet(AAStyle.new
                .colorSet(@"#BBB")
                .fontWeightSet(AAChartFontWeightTypeRegular)
                .fontSizeSet(@"10px")
//                .lineHeightSet(@"10px")
            )
            .ySet(@10)
        );

    AATooltip *tooltip = AATooltip.new
        .formatSet(@"{series.chart.tooltipText}")
    ;
    
    AASeriesElement *hourSeries = AASeriesElement.new
        .dataSet(({
            // 获取当前时间
            NSDate *now = [NSDate date];
            NSCalendar *calendar = [[NSCalendar alloc] initWithCalendarIdentifier:NSCalendarIdentifierGregorian];
            NSDateComponents *components = [calendar components:(NSCalendarUnitHour | NSCalendarUnitMinute | NSCalendarUnitSecond) fromDate:now];

            // 计算小时、分钟和秒针的位置
            double hours = components.hour + components.minute / 60.0;
            double minutes = components.minute * 12.0 / 60.0 + components.second * 12.0 / 3600.0;
            double seconds = components.second * 12.0 / 60.0;

            // 构造数据字典
            NSArray *dataArr = @[
                @{@"id"  : @"hour",
                  @"y"   : @(hours),
                  @"dial": @{
                      @"radius"    : @"60%",
                      @"baseWidth" : @4,
                      @"baseLength": @"95%",
                      @"rearLength": @0}
                },
                
                @{@"id"  : @"minute",
                  @"y"   : @(minutes),
                  @"dial": @{
                      @"baseLength": @"95%",
                      @"rearLength": @0}
                },
                
                @{@"id"  : @"second",
                  @"y"   : @(seconds),
                  @"dial": @{
                      @"radius"    : @"100%",
                      @"baseWidth" : @1,
                      @"rearLength": @"20%"}
                }
            ];

            // 打印结果
            NSLog(@"Series: %@", dataArr);
            
            dataArr;
        }))
    //        .animationSet(NO)
        .dataLabelsSet(AADataLabels.new
                       .enabledSet(NO));

    AAOptions *aaOptions = AAOptions.new
        .chartSet(chart)
        .creditsSet(credits)
        .titleSet(title)
        .paneSet(pane)
        .yAxisSet(yAxis)
        .tooltipSet(tooltip)
        .seriesSet(@[hourSeries]);
    
//    aaOptions.beforeDrawChartJavaScriptSet(@AAJSFunc(/** Get the current time
//                                                      */
//                                                      function getNow() {
//                                                          var now = new Date();
//                                                          var timeInfo = {}; // 创建一个空对象
//
//                                                          // 逐步添加属性
//                                                          timeInfo.date = now;
//                                                          timeInfo.hours = now.getHours() + now.getMinutes() / 60;
//                                                          timeInfo.minutes = (now.getMinutes() * 12 / 60) + (now.getSeconds() * 12 / 3600);
//                                                          timeInfo.seconds = now.getSeconds() * 12 / 60;
//
//                                                          return timeInfo;
//                                                      }
//
//                                                      alert("😄just test");
//
//                                                      var now = getNow();
//                                                      console.log(now); // 输出现在的日期时间信息
//                                                      )
//                                           );
    
//    aaOptions.afterDrawChartJavaScriptSet(@AAJSFunc(
//                                                    // Easing function from https://github.com/danro/easing-js/blob/master/easing.js
//                                                    Math.easeOutBounce = function (pos) {
//                                                        if (pos < (1 / 2.75)) {
//                                                            return (7.5625 * pos * pos);
//                                                        } else if (pos < (2 / 2.75)) {
//                                                            return (7.5625 * (pos -= (1.5 / 2.75)) * pos + 0.75);
//                                                        } else if (pos < (2.5 / 2.75)) {
//                                                            return (7.5625 * (pos -= (2.25 / 2.75)) * pos + 0.9375);
//                                                        } else {
//                                                            return (7.5625 * (pos -= (2.625 / 2.75)) * pos + 0.984375);
//                                                        }
//                                                    };
//                                                    )
//                                          );

    return aaOptions;
}

@end
