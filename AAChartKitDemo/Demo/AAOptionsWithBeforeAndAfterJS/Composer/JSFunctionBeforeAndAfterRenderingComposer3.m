//
//  JSFunctionBeforeAndAfterRenderingComposer3.m
//  AAChartKitDemo
//
//  Created by AnAn on 2024/11/20.
//  Copyright © 2024 An An. All rights reserved.
//

#import "JSFunctionBeforeAndAfterRenderingComposer3.h"
#import "AAChartKit.h"
#import "NSString+toPureJSString.h"

@implementation JSFunctionBeforeAndAfterRenderingComposer3

+ (id)getJsonDataWithJsonFileName:(NSString *)jsonFileName
{
    NSString *path = [[NSBundle mainBundle] pathForResource:jsonFileName ofType:@"json"];
    NSData *jsonData = [[NSData alloc] initWithContentsOfFile:path];
    NSError *error;
    id jsonObj = [NSJSONSerialization JSONObjectWithData:jsonData options:NSJSONReadingMutableContainers error:&error];
    if (!jsonData || error) {
        NSLog(@"失败❌❌❌ 📃JSON文件%@解码失败",jsonFileName);
        return nil;
    } else {
        NSLog(@"成功🔥🔥🔥 📃JSON文件%@解码成功",jsonFileName);
        return jsonObj;
    }
}

+ (NSArray *)configureSeriesArray {
    // Get the data
    NSDictionary *activityDic = [self getJsonDataWithJsonFileName:@"SynchronizedChartActivityData"];
    NSArray *datasets = activityDic[@"datasets"];
    
    NSMutableArray *finalDatasets = [NSMutableArray array];
    NSArray *colorsArr = @[@"#1e90ff", @"#ef476f", @"#ffd066", @"#04d69f", @"#25547c"];
    //Loop the data sets and create one chart each
    [datasets enumerateObjectsUsingBlock:^(id  _Nonnull obj, NSUInteger idx, BOOL * _Nonnull stop) {
        // Add X values
        NSDictionary *dataset = (NSDictionary *)obj;
        NSArray *data = dataset[@"data"];
        NSMutableArray *newData = [NSMutableArray array];
        for (int i = 0; i < data.count; i++) {
            NSArray *val = data[i];
            NSArray *xData = activityDic[@"xData"];
            newData[i] = @[xData[i], val];
        }
        
        AASeriesElement *seriesElement = AASeriesElement.new
            .dataSet(newData)
            .nameSet(dataset[@"name"])
            .typeSet(AAChartTypeArea)
            .colorSet(colorsArr[idx]);
        
        finalDatasets[idx] = seriesElement;
    }];
    
    return finalDatasets;
}

+ (AAOptions *)synchronizedChart {
    NSString *jsonStr = [AAJsonConverter pureOptionsJsonStringWithOptionsInstance:[self singleChartOptions]];
    
    return AAOptions.new
//    .beforeDrawChartJavaScriptSet(@AAJSFunc((/**
//                                             The purpose of this demo is to demonstrate how multiple charts on the same page
//                                             can be linked through DOM and Highcharts events and API methods. It takes a
//                                             standard Highcharts config with a small variation for each data set, and a
//                                             mouse/touch event handler to bind the charts together.
//                                             */
//
//
//                                             /**
//                                              * In order to synchronize tooltips and crosshairs, override the
//                                              * built-in events with handlers defined on the parent element.
//                                              */
//                                             ['mousemove', 'touchmove', 'touchstart'].forEach(function (eventType) {
//                                                 document.getElementById('container').addEventListener(
//                                                     eventType,
//                                                     function (e) {
//                                                         let chart,
//                                                             point,
//                                                             i,
//                                                             event;
//
//                                                         for (i = 0; i < Highcharts.charts.length; i = i + 1) {
//                                                             chart = Highcharts.charts[i];
//                                                             // Find coordinates within the chart
//                                                             event = chart.pointer.normalize(e);
//                                                             // Get the hovered point
//                                                             point = chart.series[0].searchPoint(event, true);
//
//                                                             if (point) {
//                                                                 point.highlight(e);
//                                                             }
//                                                         }
//                                                     }
//                                                 );
//                                             });
//
//                                             /**
//                                              * Override the reset function, we don't need to hide the tooltips and
//                                              * crosshairs.
//                                              */
//                                             Highcharts.Pointer.prototype.reset = function () {
//                                                 return undefined;
//                                             };
//
//                                             /**
//                                              * Highlight a point by showing tooltip, setting hover state and draw crosshair
//                                              */
//                                             Highcharts.Point.prototype.highlight = function (event) {
//                                                 event = this.series.chart.pointer.normalize(event);
//                                                 this.onMouseOver(); // Show the hover marker
//                                                 this.series.chart.tooltip.refresh(this); // Show the tooltip
//                                                 this.series.chart.xAxis[0].drawCrosshair(event, this); // Show the crosshair
//                                             };
//                                             )))

    .seriesSet([self configureSeriesArray])
    .plotOptionsSet(AAPlotOptions.new
              .seriesSet(AASeries.new
                         .stackingSet(AAChartStackingTypePercent)))
//    .seriesSet(@[
//        AASeriesElement.new
//            .nameSet(@"Tokyo")
//            .dataSet(@[@7.0, @6.9, @9.5, @14.5, @18.2, @21.5, @25.2, @26.5, @23.3, @18.3, @13.9, @9.6])
//            .colorByPointSet(@true)
//    ])
//    .afterDrawChartJavaScriptSet([NSString stringWithFormat:@AAJSFunc(
//        for (var i = 0; i < 3; i++) {
//            var chartDiv = document.createElement('div');
//            chartDiv.className = 'chart';
//            document.getElementById('container').appendChild(chartDiv);
//            
//            Highcharts.chart(chartDiv, %@);
//        }
//    ), jsonStr])
    ;
}


+ (AAOptions *)singleChartOptions {
    return AAOptions.new
    .chartSet(AAChart.new
              .marginLeftSet(@40)
              .spacingTopSet(@20)
              .spacingBottomSet(@20)
//              .zoomTypeSet(AAZoomTypeX)
              .eventsSet(AAChartEvents.new
//                         .selectionSet(@AAJSFunc(/**
//                                                  * Resets chart zoom on selection event.
//                                                  */
//                                                 function resetZoom(e) {
//                                                     // Prevent feedback loop
//                                                     if (e.resetSelection) {
//                                                         return;
//                                                     }
//
//                                                     // Zoom out all other charts on selection
//                                                     Highcharts.charts.forEach(chart => {
//                                                         if (chart !== e.target) {
//                                                             chart.zoomOut();
//                                                         }
//                                                     });
//                                                 }))
                         )
              )
    .titleSet(AATitle.new
              .textSet(@"dataset.name")
              .alignSet(AAChartAlignTypeLeft)
//              .marginSet(@0)
              .xSet(@30)
              )
    .creditsSet(AACredits.new
                .enabledSet(false))
    .legendSet(AALegend.new
                .enabledSet(false))
    .xAxisSet(AAXAxis.new
                .crosshairSet(AACrosshair.new
                              .colorSet(AAColor.redColor))
//                .eventsSet(AAEvents.new
//                             .setExtremesSet(@"syncExtremes")
//                             )
                .labelsSet(AALabels.new
                             .formatSet(@"{value} km")
                             )
//                .accessibilitySet(AAAccessibility.new
//                                    .descriptionSet(@"Kilometers")
//                                    .rangeDescriptionSet(@"0km to 6.5km")
//                                    )
                )
    .yAxisSet(AAYAxis.new
                .titleSet(AAAxisTitle.new
                            .textSet(nil)
                            )
                )
    .tooltipSet(AATooltip.new
//                .positionerSet(@"function () {\
//                                return {\
//                                // right aligned\
//                                x: this.chart.chartWidth - this.label.width,\
//                                y: 10 // align to title\
//                                };\
//                                }")
                .borderWidthSet(@0)
                .backgroundColorSet(@"none")
                .pointFormatSet(@"{point.y}")
                .headerFormatSet(@"")
                .shadowSet(false)
                .styleSet(AAStyle.new
                          .fontSizeSet(@"18px")
                          )
                .valueDecimalsSet(@2)
                )
    .seriesSet(@[
        AASeriesElement.new
            .nameSet(@"Tokyo")
            .dataSet(@[@7.0, @6.9, @9.5, @14.5, @18.2, @21.5, @25.2, @26.5, @23.3, @18.3, @13.9, @9.6])
            .colorByPointSet(@true)
    ])
    ;
}

/**
 (async () => {
     // Get the data
     const activity = await fetch(
         'https://www.highcharts.com/samples/data/activity.json'
     ).then(res => res.json());

     // Loop the data sets and create one chart each
     activity.datasets.forEach(function (dataset, i) {
         // Add X values
         dataset.data = dataset.data.map((val, j) => [activity.xData[j], val]);

         const chartDiv = document.createElement('div');
         chartDiv.className = 'chart';
         document.getElementById('container').appendChild(chartDiv);

         Highcharts.chart(chartDiv, {
             chart: {
                 marginLeft: 40, // Keep all charts left aligned
                 spacingTop: 20,
                 spacingBottom: 20,
                 zooming: {
                     type: 'x'
                 },
                 events: {
                     selection: resetZoom
                 }
             },
             title: {
                 text: dataset.name,
                 align: 'left',
                 margin: 0,
                 x: 30
             },
             credits: {
                 enabled: false
             },
             legend: {
                 enabled: false
             },
             xAxis: {
                 crosshair: true,
                 events: {
                     setExtremes: syncExtremes
                 },
                 labels: {
                     format: '{value} km'
                 },
                 accessibility: {
                     description: 'Kilometers',
                     rangeDescription: '0km to 6.5km'
                 }
             },
             yAxis: {
                 title: {
                     text: null
                 }
             },
             tooltip: {
                 positioner: function () {
                     return {
                         // right aligned
                         x: this.chart.chartWidth - this.label.width,
                         y: 10 // align to title
                     };
                 },
                 borderWidth: 0,
                 backgroundColor: 'none',
                 pointFormat: '{point.y}',
                 headerFormat: '',
                 shadow: false,
                 style: {
                     fontSize: '18px'
                 },
                 valueDecimals: dataset.valueDecimals
             },
             series: [{
                 data: dataset.data,
                 name: dataset.name,
                 type: dataset.type,
                 color: Highcharts.getOptions().colors[i],
                 fillOpacity: 0.3,
                 tooltip: {
                     valueSuffix: ' ' + dataset.unit
                 }
             }]
         });
     });
 })();
 */

@end
