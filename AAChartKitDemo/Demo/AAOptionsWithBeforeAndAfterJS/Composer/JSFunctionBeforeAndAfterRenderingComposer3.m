//
//  JSFunctionBeforeAndAfterRenderingComposer3.m
//  AAChartKitDemo
//
//  Created by AnAn on 2024/11/20.
//  Copyright © 2024 An An. All rights reserved.
//

#import "JSFunctionBeforeAndAfterRenderingComposer3.h"
#import "AAChartKit.h"
#import "AAJsonConverter.h"
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
            [newData addObject:@[xData[i], val]];
        }
        
        AASeriesElement *seriesElement = AASeriesElement.new
            .dataSet(newData)
            .nameSet(dataset[@"name"])
            .typeSet(AAChartTypeArea)
            .colorSet(colorsArr[idx]);
        
        [finalDatasets addObject:seriesElement];
    }];
    
    return finalDatasets;
}

+ (NSArray *)configureSeriesDataArray {
    NSMutableArray *randomNumArrA = [NSMutableArray array];
    CGFloat y1 = 0.f;
    int q = arc4random() % 38;
    NSUInteger length = ((AASeriesElement *)[self configureSeriesArray][0]).data.count;
    for (NSUInteger x = 0; x < length; x++) {
        y1 = sin(q * (x * M_PI / 180.0)) + x * 2.0 * 0.01 - 1;
        [randomNumArrA addObject:AADataElement.new.ySet(@(y1))];
    }
    return randomNumArrA;
}

+ (AAOptions *)singleChartOptionsWithChartRank:(NSInteger)chartRank {
    NSArray *seriesArray = [self configureSeriesArray];
    NSInteger safeIndex = MAX(0, MIN(chartRank - 1, (NSInteger)seriesArray.count - 1));
    AASeriesElement *aaSeriesElement = seriesArray[safeIndex];

    AAChartEvents *chartEvents = AAChartEvents.new
    .selectionSet(@AAJSFunc(function (e) {
        if (e.resetSelection) {
            return;
        }

        Highcharts.charts.forEach(chart => {
            if (chart !== e.target) {
                chart.zoomOut();
            }
        });
    }));

    AAOptions *aaOptions = AAOptions.new
    .chartSet(AAChart.new
              .typeSet(AAChartTypeArea)
              .marginLeftSet(@40)
              .spacingTopSet(@20)
              .spacingBottomSet(@20)
              .eventsSet(chartEvents))
    .titleSet(AATitle.new
              .textSet(aaSeriesElement.name)
              .alignSet(AAChartAlignTypeLeft)
              .styleSet(AAStyle.new
                        .colorSet((NSString *)aaSeriesElement.color)
                        .fontWeightSet(AAChartFontWeightTypeBold)
                        .fontSizeSet(@"30px"))
              .xSet(@30))
    .creditsSet(AACredits.new
                .enabledSet(false))
    .legendSet(AALegend.new
               .enabledSet(false))
    .xAxisSet(AAXAxis.new
              .crosshairSet(AACrosshair.new
                            .colorSet(AAColor.greenColor)
                            .widthSet(@2)
                            .dashStyleSet(AAChartLineDashStyleTypeLongDashDot)
                            .zIndexSet(@5))
              .labelsSet(AALabels.new
                         .formatSet(@"{value} km")))
    .yAxisSet(AAYAxis.new
              .titleSet(AAAxisTitle.new
                        .textSet(@"")))
    .tooltipSet(AATooltip.new
                .borderWidthSet(@0)
                .backgroundColorSet(AAColor.blackColor)
                .borderColorSet(AAColor.blackColor)
                .headerFormatSet(@"")
                .styleSet(AAStyle.new
                          .fontSizeSet(@"18px")
                          .colorSet(AAColor.redColor))
                .valueDecimalsSet(@8))
    .seriesSet(@[
        aaSeriesElement
    ]);

    return aaOptions;
}

+ (AAOptions *)synchronizedChart {
    NSString *aaOptions1JsonStr = [AAJsonConverter pureOptionsJsonStringWithOptionsInstance:[self singleChartOptionsWithChartRank:1]];
    NSString *aaOptions2JsonStr = [AAJsonConverter pureOptionsJsonStringWithOptionsInstance:[self singleChartOptionsWithChartRank:2]];
    NSString *aaOptions3JsonStr = [AAJsonConverter pureOptionsJsonStringWithOptionsInstance:[self singleChartOptionsWithChartRank:3]];

    NSString *beforeDrawJS = @AAJSFunc((function() {
        const parentContainer = document.getElementById('container').parentElement;

        ['mousemove', 'touchmove', 'touchstart'].forEach(function (eventType) {
            parentContainer.addEventListener(eventType, function (e) {
                let chart, point, i, event;

                for (i = 0; i < Highcharts.charts.length; i = i + 1) {
                    chart = Highcharts.charts[i];
                    event = chart.pointer.normalize(e);
                    point = chart.series[0].searchPoint(event, true);

                    if (point) {
                        point.highlight(e);
                    }
                }
            });
        });

        Highcharts.Pointer.prototype.reset = function () {
            return undefined;
        };

        Highcharts.Point.prototype.highlight = function (event) {
            event = this.series.chart.pointer.normalize(event);
            this.onMouseOver();
            this.series.chart.tooltip.refresh(this);
            this.series.chart.xAxis[0].drawCrosshair(event, this);
        };

        return "JavaScript execution completed successfully";
    })());

    NSString *afterDrawTemplate = @AAJSFunc((function() {
        const container = document.getElementById('container');
        const parentContainer = container.parentElement;

        function resetZoom(e) {
            if (e.resetSelection) {
                return;
            }

            Highcharts.charts.forEach(chart => {
                if (chart !== e.target) {
                    chart.zoomOut();
                }
            });
        }

        function syncExtremes(e) {
            const thisChart = this.chart;

            if (e.trigger !== 'syncExtremes') {
                Highcharts.charts.forEach(chart => {
                    if (chart !== thisChart) {
                        if (chart.xAxis[0].setExtremes) {
                            chart.xAxis[0].setExtremes(
                                e.min,
                                e.max,
                                undefined,
                                false,
                                { trigger: 'syncExtremes' }
                            );
                        }
                    }
                });
            }
        }

        container.style.position = 'static';

        function setContainerHeight() {
            const parentHeight = parentContainer.clientHeight;
            container.style.height = (parentHeight / 4) + 'px';
        }

        setContainerHeight();
        window.addEventListener('resize', setContainerHeight);

        if (aaGlobalChart) {
            Highcharts.addEvent(aaGlobalChart, 'selection', resetZoom);
            Highcharts.addEvent(aaGlobalChart.xAxis[0], 'setExtremes', syncExtremes);
        }

        for (let i = 0; i < 3; i++) {
            const chartDiv = document.createElement('div');
            chartDiv.className = 'chart';
            chartDiv.style.display = 'block';
            chartDiv.style.width = '100%';
            chartDiv.style.height = (parentContainer.clientHeight / 4) + 'px';
            chartDiv.style.marginBottom = '0';
            chartDiv.style.position = 'static';

            parentContainer.appendChild(chartDiv);

            function setChartHeight() {
                const parentHeight = parentContainer.clientHeight;
                chartDiv.style.height = (parentHeight / 4) + 'px';
            }

            setChartHeight();
            window.addEventListener('resize', setChartHeight);

            let chartOptionsJsonObj;
            if (i == 0) {
                chartOptionsJsonObj = __AA_OPTIONS1__;
            } else if (i == 1) {
                chartOptionsJsonObj = __AA_OPTIONS2__;
            } else {
                chartOptionsJsonObj = __AA_OPTIONS3__;
            }

            let sender = JSON.stringify(chartOptionsJsonObj);
            let aaOptions = JSON.parse(sender, function (key, value) {
                if (typeof(value) == 'string' && value.indexOf('function') !== -1) {
                    return eval(value);
                }
                return value;
            });

            aaOptions.chart = aaOptions.chart || {};
            aaOptions.chart.events = aaOptions.chart.events || {};
            aaOptions.chart.events.selection = resetZoom;

            aaOptions.xAxis = aaOptions.xAxis || {};
            aaOptions.xAxis.events = aaOptions.xAxis.events || {};
            aaOptions.xAxis.events.setExtremes = syncExtremes;

            Highcharts.chart(chartDiv, aaOptions);
        }

        return "JavaScript execution completed successfully";
    })());

    NSString *afterDrawJS = [[[afterDrawTemplate stringByReplacingOccurrencesOfString:@"__AA_OPTIONS1__"
                                                                          withString:aaOptions1JsonStr]
                              stringByReplacingOccurrencesOfString:@"__AA_OPTIONS2__"
                              withString:aaOptions2JsonStr]
                             stringByReplacingOccurrencesOfString:@"__AA_OPTIONS3__"
                             withString:aaOptions3JsonStr];

    return AAOptions.new
    .beforeDrawChartJavaScriptSet(beforeDrawJS)
    .titleSet(AATitle.new
              .textSet(@"Rainfall")
              .alignSet(AAChartAlignTypeLeft)
              .styleSet(AAStyle.new
                        .colorSet(AAColor.greenColor)
                        .fontWeightSet(AAChartFontWeightTypeBold)
                        .fontSizeSet(@"30px"))
              .xSet(@30))
    .xAxisSet(AAXAxis.new
              .crosshairSet(AACrosshair.new
                            .colorSet(AAColor.greenColor)
                            .widthSet(@2)
                            .dashStyleSet(AAChartLineDashStyleTypeLongDashDot)
                            .zIndexSet(@5))
              .labelsSet(AALabels.new
                         .formatSet(@"{value} km")))
    .legendSet(AALegend.new
               .enabledSet(false))
    .seriesSet(@[
        AASeriesElement.new
        .typeSet(AAChartTypeArea)
        .nameSet(@"Berlin Hot")
        .colorSet((id)AAGradientColor.lusciousLimeColor)
        .dataSet([self configureSeriesDataArray])
    ])
    .afterDrawChartJavaScriptSet(afterDrawJS);
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
