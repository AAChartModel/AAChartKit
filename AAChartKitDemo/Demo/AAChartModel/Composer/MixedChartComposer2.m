//
//  MixedChartComposer2.m
//  AAInfographicsDemo
//
//  Created by AnAn on 2024/11/25.
//  Copyright © 2024 An An. All rights reserved.
//

#import "MixedChartComposer2.h"
#import "AAChartKit.h"


@implementation MixedChartComposer2

/**
 const dataset = [
     [1.4, 0.4],
     [2.4, 5.3],
     [2.9, 4.9],
     [5, 2.3],
     [3.6, 1.9],
     [5.1, 6.1],
     [2, 4],
     [2, 5.6],
     [-0.2, 6.3],
     [1.2, 6.3]
 ];

 function getTrendLine(data) {
     const n = data.length;

     let sumX = 0,
         sumY = 0,
         sumXY = 0,
         sumX2 = 0;

     // Calculate the sums needed for linear regression
     for (let i = 0; i < n; i++) {
         const [x, y] = data[i];
         sumX += x;
         sumY += y;
         sumXY += x * y;
         sumX2 += x ** 2;
     }

     // Calculate the slope of the trend line
     const slope = (n * sumXY - sumX * sumY) / (n * sumX2 - sumX ** 2);

     // Calculate the intercept of the trend line
     const intercept = (sumY - slope * sumX) / n;

     const trendline = []; // Array to store the trend line data points

     // Find the minimum and maximum x-values from the scatter plot data
     const minX = Math.min(...data.map(([x]) => x));
     const maxX = Math.max(...data.map(([x]) => x));

     // Calculate the corresponding y-values for the trend line using the slope
     // and intercept
     trendline.push([minX, minX * slope + intercept]);
     trendline.push([maxX, maxX * slope + intercept]);

     return trendline;
 }

 Highcharts.chart('container', {
     title: {
         text: 'Scatter plot with trend line'
     },
     xAxis: {
         min: -0.5,
         max: 5.5
     },
     yAxis: {
         min: 0
     },
     series: [{
         type: 'line',
         name: 'Trend Line',
         data: getTrendLine(dataset),
         marker: {
             enabled: false
         },
         states: {
             hover: {
                 lineWidth: 0
             }
         },
         enableMouseTracking: false
     }, {
         type: 'scatter',
         name: 'Observations',
         data: dataset,
         marker: {
             radius: 4
         }
     }]
 });
 */



//    func scatterPlotWithTrendLine() -> AAOptions {
//        AAOptions()
//            .title(AATitle().text("Scatter plot with trend line"))
//            .xAxis(AAXAxis()
//                    .min(-0.5)
//                    .max(5.5))
//            .yAxis(AAYAxis()
//                    .min(0))
//            .series([
//                AASeriesElement()
//                    .type(.line)
//                    .name("Trend Line")
//                    .data(getTrendLine(data: dataset))
//                    .marker(AAMarker()
//                                .enabled(false))
//                    .states(AAStates()
//                                .hover(AAHover()
//                                        .lineWidth(0))
//                    )
//                    .enableMouseTracking(false),
//                AASeriesElement()
//                    .type(.scatter)
//                    .name("Observations")
//                    .data(dataset)
//                    .marker(AAMarker()
//                                .radius(4))
//            ])
//    }
+ (NSArray<NSArray<NSNumber *> *> *)getTrendLineWithData:(NSArray<NSArray<NSNumber *> *> *)data {
    NSInteger n = data.count;
    
    double sumX = 0.0,
           sumY = 0.0,
           sumXY = 0.0,
           sumX2 = 0.0;
    
    // Calculate the sums needed for linear regression
    for (NSInteger i = 0; i < n; i++) {
        double x = [data[i][0] doubleValue];
        double y = [data[i][1] doubleValue];
        sumX += x;
        sumY += y;
        sumXY += x * y;
        sumX2 += pow(x, 2);
    }
    
    // Calculate the slope of the trend line
    double slope = (n * sumXY - sumX * sumY) / (n * sumX2 - pow(sumX, 2));
    double intercept = (sumY - slope * sumX) / n;
    
    NSMutableArray<NSArray<NSNumber *> *> *trendline = [NSMutableArray array]; // Array to store the trend line data points
    
    // Find the minimum and maximum x-values from the scatter plot data
    double minX = [[data valueForKeyPath:@"@min.firstObject"] doubleValue];
    double maxX = [[data valueForKeyPath:@"@max.firstObject"] doubleValue];
    
    // Calculate the corresponding y-values for the trend line using the slope
    // and intercept
    [trendline addObject:@[@(minX), @(minX * slope + intercept)]];
    [trendline addObject:@[@(maxX), @(maxX * slope + intercept)]];
    
    return trendline;
}

+ (AAChartModel *)scatterPlotWithTrendLine {
    NSArray *dataset = @[
        @[@1.4, @0.4],
        @[@2.4, @5.3],
        @[@2.9, @4.9],
        @[@5, @2.3],
        @[@3.6, @1.9],
        @[@5.1, @6.1],
        @[@2, @4],
        @[@2, @5.6],
        @[@-0.2, @6.3],
        @[@1.2, @6.3]
    ];
    
    return AAChartModel.new
        .titleSet(@"Scatter plot with trend line")
        .yAxisMinSet(@0)
        .seriesSet(@[
            AASeriesElement.new
                .typeSet(AAChartTypeLine)
                .nameSet(@"Trend Line")
                .lineWidthSet(@5)
                .dataSet([self getTrendLineWithData:dataset])
                .markerSet(AAMarker.new
                    .enabledSet(false))
                .statesSet(AAStates.new
                    .hoverSet(AAHover.new
                        .lineWidthSet(@0)))
                .enableMouseTrackingSet(@false),
            AASeriesElement.new
                .typeSet(AAChartTypeScatter)
                .nameSet(@"Observations")
                .dataSet(dataset)
                .markerSet(AAMarker.new
                    .radiusSet(@6)
                    //空心效果的 marker
                    .fillColorSet(AAColor.whiteColor)
                    .lineWidthSet(@3)
                    .lineColorSet(AAColor.redColor))
        ]);
}

+ (AAChartModel *)scatterPlotWithTrendLine2 {
    NSArray *femaleHeightDataset = @[
        @[@161.2, @51.6], @[@167.5, @59.0], @[@159.5, @49.2], @[@157.0, @63.0], @[@155.8, @53.6],
        @[@170.0, @59.0], @[@159.1, @47.6], @[@166.0, @69.8], @[@176.2, @66.8], @[@160.2, @75.2],
        @[@172.5, @55.2], @[@170.9, @54.2], @[@172.9, @62.5], @[@153.4, @42.0], @[@160.0, @50.0],
        @[@147.2, @49.8], @[@168.2, @49.2], @[@175.0, @73.2], @[@157.0, @47.8], @[@167.6, @68.8],
        @[@159.5, @50.6], @[@175.0, @82.5], @[@166.8, @57.2], @[@176.5, @87.8], @[@170.2, @72.8],
        @[@174.0, @54.5], @[@173.0, @59.8], @[@179.9, @67.3], @[@170.5, @67.8], @[@160.0, @47.0],
        @[@154.4, @46.2], @[@162.0, @55.0], @[@176.5, @83.0], @[@160.0, @54.4], @[@152.0, @45.8],
        @[@162.1, @53.6], @[@170.0, @73.2], @[@160.2, @52.1], @[@161.3, @67.9], @[@166.4, @56.6],
        @[@168.9, @62.3], @[@163.8, @58.5], @[@167.6, @54.5], @[@160.0, @50.2], @[@161.3, @60.3],
        @[@167.6, @58.3], @[@165.1, @56.2], @[@160.0, @50.2], @[@170.0, @72.9], @[@157.5, @59.8],
        @[@167.6, @61.0], @[@160.7, @69.1], @[@163.2, @55.9], @[@152.4, @46.5], @[@157.5, @54.3],
        @[@168.3, @54.8], @[@180.3, @60.7], @[@165.5, @60.0], @[@165.0, @62.0], @[@164.5, @60.3],
        @[@156.0, @52.7], @[@160.0, @74.3], @[@163.0, @62.0], @[@165.7, @73.1], @[@161.0, @80.0],
        @[@162.0, @54.7], @[@166.0, @53.2], @[@174.0, @75.7], @[@172.7, @61.1], @[@167.6, @55.7],
        @[@151.1, @48.7], @[@164.5, @52.3], @[@163.5, @50.0], @[@152.0, @59.3], @[@169.0, @62.5],
        @[@164.0, @55.7], @[@161.2, @54.8], @[@155.0, @45.9], @[@170.0, @70.6], @[@176.2, @67.2],
        @[@170.0, @69.4], @[@162.5, @58.2], @[@170.3, @64.8], @[@164.1, @71.6], @[@169.5, @52.8],
        @[@163.2, @59.8], @[@154.5, @49.0], @[@159.8, @50.0], @[@173.2, @69.2], @[@170.0, @55.9],
        @[@161.4, @63.4], @[@169.0, @58.2], @[@166.2, @58.6], @[@159.4, @45.7], @[@162.5, @52.2],
        @[@159.0, @48.6], @[@162.8, @57.8], @[@159.0, @55.6], @[@179.8, @66.8], @[@162.9, @59.4],
        @[@161.0, @53.6], @[@151.1, @73.2], @[@168.2, @53.4], @[@168.9, @69.0], @[@173.2, @58.4],
        @[@171.8, @56.2], @[@178.0, @70.6], @[@164.3, @59.8], @[@163.0, @72.0], @[@168.5, @65.2],
        @[@166.8, @56.6], @[@172.7, @88.8], @[@163.5, @51.8], @[@169.4, @63.4], @[@167.8, @59.0],
        @[@159.5, @47.6], @[@167.6, @63.0], @[@161.2, @55.2], @[@160.0, @45.0], @[@163.2, @54.0],
        @[@162.2, @50.2], @[@161.3, @60.2], @[@149.5, @44.8], @[@157.5, @58.8], @[@163.2, @56.4],
        @[@172.7, @62.0], @[@155.0, @49.2], @[@156.5, @67.2], @[@164.0, @53.8], @[@160.9, @54.4],
        @[@162.8, @58.0], @[@167.0, @59.8], @[@160.0, @54.8], @[@160.0, @43.2], @[@168.9, @60.5],
        @[@158.2, @46.4], @[@156.0, @64.4], @[@160.0, @48.8], @[@167.1, @62.2], @[@158.0, @55.5],
        @[@167.6, @57.8], @[@156.0, @54.6], @[@162.1, @59.2], @[@173.4, @52.7], @[@159.8, @53.2],
        @[@170.5, @64.5], @[@159.2, @51.8], @[@157.5, @56.0], @[@161.3, @63.6], @[@162.6, @63.2],
        @[@160.0, @59.5], @[@168.9, @56.8], @[@165.1, @64.1], @[@162.6, @50.0], @[@165.1, @72.3],
        @[@166.4, @55.0], @[@160.0, @55.9], @[@152.4, @60.4], @[@170.2, @69.1], @[@162.6, @84.5],
        @[@170.2, @55.9], @[@158.8, @55.5], @[@172.7, @69.5], @[@167.6, @76.4], @[@162.6, @61.4],
        @[@167.6, @65.9], @[@156.2, @58.6], @[@175.2, @66.8], @[@172.1, @56.6], @[@162.6, @58.6],
        @[@160.0, @55.9], @[@165.1, @59.1], @[@182.9, @81.8], @[@166.4, @70.7], @[@165.1, @56.8],
        @[@177.8, @60.0], @[@165.1, @58.2], @[@175.3, @72.7], @[@154.9, @54.1], @[@158.8, @49.1],
        @[@172.7, @75.9], @[@168.9, @55.0], @[@161.3, @57.3], @[@167.6, @55.0], @[@165.1, @65.5],
        @[@175.3, @65.5], @[@157.5, @48.6], @[@163.8, @58.6], @[@167.6, @63.6], @[@165.1, @55.2],
        @[@165.1, @62.7], @[@168.9, @56.6], @[@162.6, @53.9], @[@164.5, @63.2], @[@176.5, @73.6],
        @[@168.9, @62.0], @[@175.3, @63.6], @[@159.4, @53.2], @[@160.0, @53.4], @[@170.2, @55.0],
        @[@162.6, @70.5], @[@167.6, @54.5], @[@162.6, @54.5], @[@160.7, @55.9], @[@160.0, @59.0],
        @[@157.5, @63.6], @[@162.6, @54.5], @[@152.4, @47.3], @[@170.2, @67.7], @[@165.1, @80.9],
        @[@172.7, @70.5], @[@165.1, @60.9], @[@170.2, @63.6], @[@170.2, @54.5], @[@170.2, @59.1],
        @[@161.3, @70.5], @[@167.6, @52.7], @[@167.6, @62.7], @[@165.1, @86.3], @[@162.6, @66.4],
        @[@152.4, @67.3], @[@168.9, @63.0], @[@170.2, @73.6], @[@175.2, @62.3], @[@175.2, @57.7],
        @[@160.0, @55.4], @[@165.1, @77.7], @[@174.0, @55.5], @[@170.2, @77.3], @[@160.0, @80.5],
        @[@167.6, @64.5], @[@167.6, @72.3], @[@167.6, @61.4], @[@154.9, @58.2], @[@162.6, @81.8],
        @[@175.3, @63.6], @[@171.4, @53.4], @[@157.5, @54.5], @[@165.1, @53.6], @[@160.0, @60.0],
        @[@174.0, @73.6], @[@162.6, @61.4], @[@174.0, @55.5], @[@162.6, @63.6], @[@161.3, @60.9],
        @[@156.2, @60.0], @[@149.9, @46.8], @[@169.5, @57.3], @[@160.0, @64.1], @[@175.3, @63.6],
        @[@169.5, @67.3], @[@160.0, @75.5], @[@172.7, @68.2], @[@162.6, @61.4], @[@157.5, @76.8],
        @[@176.5, @71.8], @[@164.4, @55.5], @[@160.7, @48.6], @[@174.0, @66.4], @[@163.8, @67.3]
    ];
    
    NSArray *maleHeightDataset = @[
        @[@174.0, @65.6], @[@175.3, @71.8], @[@193.5, @80.7], @[@186.5, @72.6], @[@187.2, @78.8],
        @[@181.5, @74.8], @[@184.0, @86.4], @[@184.5, @78.4], @[@175.0, @62.0], @[@184.0, @81.6],
        @[@180.0, @76.6], @[@177.8, @83.6], @[@192.0, @90.0], @[@176.0, @74.6], @[@174.0, @71.0],
        @[@184.0, @79.6], @[@192.7, @93.8], @[@171.5, @70.0], @[@173.0, @72.4], @[@176.0, @85.9],
        @[@176.0, @78.8], @[@180.5, @77.8], @[@172.7, @66.2], @[@176.0, @86.4], @[@173.5, @81.8],
        @[@178.0, @89.6], @[@180.3, @82.8], @[@180.3, @76.4], @[@164.5, @63.2], @[@173.0, @60.9],
        @[@183.5, @74.8], @[@175.5, @70.0], @[@188.0, @72.4], @[@189.2, @84.1], @[@172.8, @69.1],
        @[@170.0, @59.5], @[@182.0, @67.2], @[@170.0, @61.3], @[@177.8, @68.6], @[@184.2, @80.1],
        @[@186.7, @87.8], @[@171.4, @84.7], @[@172.7, @73.4], @[@175.3, @72.1], @[@180.3, @82.6],
        @[@182.9, @88.7], @[@188.0, @84.1], @[@177.2, @94.1], @[@172.1, @74.9], @[@167.0, @59.1],
        @[@169.5, @75.6], @[@174.0, @86.2], @[@172.7, @75.3], @[@182.2, @87.1], @[@164.1, @55.2],
        @[@163.0, @57.0], @[@171.5, @61.4], @[@184.2, @76.8], @[@174.0, @86.8], @[@174.0, @72.2],
        @[@177.0, @71.6], @[@186.0, @84.8], @[@167.0, @68.2], @[@171.8, @66.1], @[@182.0, @72.0],
        @[@167.0, @64.6], @[@177.8, @74.8], @[@164.5, @70.0], @[@192.0, @99.9], @[@175.5, @63.2],
        @[@171.2, @79.1], @[@181.6, @78.9], @[@167.4, @67.7], @[@181.1, @66.0], @[@177.0, @68.2],
        @[@174.5, @63.9], @[@177.5, @72.0], @[@170.5, @56.8], @[@182.4, @74.5], @[@197.1, @90.9],
        @[@180.1, @93.0], @[@175.5, @80.9], @[@180.6, @72.7], @[@184.4, @68.0], @[@175.5, @70.9],
        @[@180.6, @72.5], @[@177.0, @72.5], @[@177.1, @83.4], @[@181.6, @75.5], @[@176.5, @73.0],
        @[@175.0, @70.2], @[@174.0, @73.4], @[@165.1, @70.5], @[@177.0, @68.9], @[@192.0, @99.7],
        @[@176.5, @68.4], @[@169.4, @65.9], @[@182.1, @75.7], @[@179.8, @84.5], @[@175.3, @87.7],
        @[@184.9, @86.4], @[@177.3, @73.2], @[@167.4, @53.9], @[@178.1, @72.0], @[@168.9, @55.5],
        @[@157.2, @58.4], @[@180.3, @83.2], @[@170.2, @72.7], @[@177.8, @64.1], @[@172.7, @72.3],
        @[@165.1, @65.0], @[@186.7, @86.4], @[@165.1, @65.0], @[@174.0, @88.6], @[@175.3, @84.1],
        @[@185.4, @66.8], @[@177.8, @75.5], @[@180.3, @93.2], @[@180.3, @82.7], @[@177.8, @58.0],
        @[@177.8, @79.5], @[@177.8, @78.6], @[@177.8, @71.8], @[@177.8, @88.8], @[@163.8, @72.2],
        @[@188.0, @83.6], @[@198.1, @85.5], @[@175.3, @90.9], @[@166.4, @85.9], @[@190.5, @89.1],
        @[@166.4, @75.0], @[@177.8, @77.7], @[@179.7, @86.4], @[@172.7, @90.9], @[@190.5, @73.6],
        @[@185.4, @76.4], @[@168.9, @69.1], @[@167.6, @84.5], @[@175.3, @64.5], @[@170.2, @69.1],
        @[@190.5, @108.6], @[@177.8, @86.4], @[@190.5, @80.9], @[@177.8, @87.7], @[@184.2, @94.5],
        @[@176.5, @80.2], @[@177.8, @72.0], @[@180.3, @71.4], @[@171.4, @72.7], @[@172.7, @84.1],
        @[@172.7, @76.8], @[@177.8, @63.6], @[@177.8, @80.9], @[@182.9, @80.9], @[@170.2, @85.5],
        @[@167.6, @68.6], @[@175.3, @67.7], @[@165.1, @66.4], @[@185.4, @77.7], @[@181.6, @70.5],
        @[@172.7, @95.9], @[@190.5, @84.1], @[@179.1, @87.3], @[@175.3, @71.8], @[@170.2, @65.9],
        @[@193.0, @95.9], @[@171.4, @91.4], @[@177.8, @81.8], @[@177.8, @96.8], @[@167.6, @69.1],
        @[@167.6, @82.7], @[@180.3, @75.5], @[@182.9, @79.5], @[@176.5, @73.6], @[@186.7, @91.8],
        @[@188.0, @84.1], @[@188.0, @85.9], @[@177.8, @81.8], @[@174.0, @82.5], @[@177.8, @80.5],
        @[@171.4, @70.0], @[@185.4, @81.8], @[@185.4, @84.1], @[@188.0, @90.5], @[@188.0, @91.4],
        @[@182.9, @89.1], @[@176.5, @85.0], @[@175.3, @69.1], @[@175.3, @73.6], @[@188.0, @80.5],
        @[@188.0, @82.7], @[@175.3, @86.4], @[@170.5, @67.7], @[@179.1, @92.7], @[@177.8, @93.6],
        @[@175.3, @70.9], @[@182.9, @75.0], @[@170.8, @93.2], @[@188.0, @93.2], @[@180.3, @77.7],
        @[@177.8, @61.4], @[@185.4, @94.1], @[@168.9, @75.0], @[@185.4, @83.6], @[@180.3, @85.5],
        @[@174.0, @73.9], @[@167.6, @66.8], @[@182.9, @87.3], @[@160.0, @72.3], @[@180.3, @88.6],
        @[@167.6, @75.5], @[@186.7, @66.8], @[@175.3, @91.1], @[@175.3, @67.3], @[@175.9, @77.7],
        @[@175.3, @81.8], @[@179.1, @75.5], @[@181.6, @84.5], @[@177.8, @76.6], @[@182.9, @85.0],
        @[@177.8, @81.8], @[@184.2, @77.3], @[@179.1, @71.8], @[@176.5, @87.9], @[@188.0, @94.3],
        @[@174.0, @70.9], @[@167.6, @64.5], @[@170.2, @77.3], @[@167.6, @72.3], @[@188.0, @87.3],
        @[@174.0, @80.0], @[@176.5, @82.3], @[@180.3, @73.6], @[@167.6, @74.1], @[@188.0, @85.9],
        @[@180.3, @73.2], @[@167.6, @76.3], @[@183.0, @65.9], @[@183.0, @90.9], @[@179.1, @89.1],
        @[@170.2, @62.3], @[@177.8, @82.7], @[@179.1, @79.1], @[@190.5, @98.2], @[@177.8, @84.1],
        @[@180.3, @83.2], @[@180.3, @83.2]
    ];
    
    return AAChartModel.new
        .titleSet(@"Scatter plot with trend line")
        .yAxisMinSet(@0)
        .seriesSet(@[
            AASeriesElement.new
                .typeSet(AAChartTypeLine)
                .nameSet(@"Female Trend Line")
                .lineWidthSet(@5)
                .dataSet([self getTrendLineWithData:femaleHeightDataset])
                .markerSet(AAMarker.new
                    .enabledSet(false))
                .statesSet(AAStates.new
                    .hoverSet(AAHover.new
                        .lineWidthSet(@0)))
                .enableMouseTrackingSet(@false),
            AASeriesElement.new
                .typeSet(AAChartTypeScatter)
                .nameSet(@"Female Observations")
                .dataSet(femaleHeightDataset)
                .markerSet(AAMarker.new
                    .radiusSet(@6)
                    //空心效果的 marker
                    .fillColorSet(AAColor.whiteColor)
                    .lineWidthSet(@3)
                    .lineColorSet(AAColor.redColor)),
            
            AASeriesElement.new
                .typeSet(AAChartTypeLine)
                .nameSet(@"Male Trend Line")
                .lineWidthSet(@5)
                .dataSet([self getTrendLineWithData:maleHeightDataset])
                .markerSet(AAMarker.new
                    .enabledSet(false))
                .statesSet(AAStates.new
                    .hoverSet(AAHover.new
                        .lineWidthSet(@0)))
                .enableMouseTrackingSet(@false),
            AASeriesElement.new
                .typeSet(AAChartTypeScatter)
                .nameSet(@"Male Observations")
                .dataSet(maleHeightDataset)
                .markerSet(AAMarker.new
                    .radiusSet(@6)),
        ]);
}

+ (AAChartModel *)pieMixedLineMixedColumnChart {
    return AAChartModel.new
        .stackingSet(AAChartStackingTypeNormal)
        .colorsThemeSet(@[@"#fe117c", @"#ffc069", @"#06caf4", @"#7dffc0"])
        .dataLabelsEnabledSet(false)
        .zoomTypeSet(AAChartZoomTypeX)
        .seriesSet(@[
            AASeriesElement.new
                .nameSet(@"Anna")
                .typeSet(AAChartTypeColumn)
                .dataSet(@[@3, @2, @1, @3, @4]),
            AASeriesElement.new
                .nameSet(@"Babara")
                .typeSet(AAChartTypeColumn)
                .dataSet(@[@2, @3, @5, @7, @6]),
            AASeriesElement.new
                .nameSet(@"Cortana")
                .typeSet(AAChartTypeColumn)
                .dataSet(@[@4, @3, @3, @9, @0]),
            AASeriesElement.new
                .nameSet(@"Average Value")
                .typeSet(AAChartTypeLine)
                .dataSet(@[@3, @2.67, @3, @6.33, @3.33,
                           @3, @2.67, @3, @6.33, @3.33,
                           @3, @2.67, @3, @6.33, @3.33,
                           @3, @2.67, @3, @6.33, @3.33])
                .markerSet(AAMarker.new
                    .fillColorSet(@"#1E90FF")
                    .lineWidthSet(@2.0)
                    .lineColorSet(AAColor.whiteColor))
            ,
            AAPie.new
//                .typeSet(AAChartTypePie)
                .centerSet(@[@100, @80])
                .sizeSet(@150)
                .showInLegendSet(true)
                .dataLabelsSet(
                    AADataLabels.new
                        .enabledSet(false))
//                .dataSet(@[
//                    AADataElement.new
//                        .nameSet(@"Ada")
//                        .ySet(@13.0)
//                        .colorSet([AAGradientColor firebrickColor])
//                    ,
//                    AADataElement.new
//                        .nameSet(@"Bob")
//                        .ySet(@13.0)
//                        .colorSet([AAGradientColor newLeafColor])
//                    ,
//                    AADataElement.new
//                        .nameSet(@"Coco")
//                        .ySet(@13.0)
//                        .colorSet([AAGradientColor freshPapayaColor])
//                ]),
        ]);
}

/**
 // Data retrieved from https://www.ssb.no/energi-og-industri/olje-og-gass/statistikk/sal-av-petroleumsprodukt/artikler/auka-sal-av-petroleumsprodukt-til-vegtrafikk
 Highcharts.chart('container', {
     title: {
         text: 'Sales of petroleum products March, Norway',
         align: 'left'
     },
     xAxis: {
         categories: [
             'Jet fuel', 'Duty-free diesel', 'Petrol', 'Diesel', 'Gas oil'
         ]
     },
     yAxis: {
         title: {
             text: 'Million liters'
         }
     },
     tooltip: {
         valueSuffix: ' million liters'
     },
     plotOptions: {
         series: {
             borderRadius: '25%'
         }
     },
     series: [{
         type: 'column',
         name: '2020',
         data: [59, 83, 65, 228, 184]
     }, {
         type: 'column',
         name: '2021',
         data: [24, 79, 72, 240, 167]
     }, {
         type: 'column',
         name: '2022',
         data: [58, 88, 75, 250, 176]
     }, {
         type: 'line',
         step: 'center',
         name: 'Average',
         data: [47, 83.33, 70.66, 239.33, 175.66],
         marker: {
             lineWidth: 2,
             lineColor: Highcharts.getOptions().colors[3],
             fillColor: 'white'
         }
     }, {
         type: 'pie',
         name: 'Total',
         data: [{
             name: '2020',
             y: 619,
             color: Highcharts.getOptions().colors[0], // 2020 color
             dataLabels: {
                 enabled: true,
                 distance: -50,
                 format: '{point.total} M',
                 style: {
                     fontSize: '15px'
                 }
             }
         }, {
             name: '2021',
             y: 586,
             color: Highcharts.getOptions().colors[1] // 2021 color
         }, {
             name: '2022',
             y: 647,
             color: Highcharts.getOptions().colors[2] // 2022 color
         }],
         center: [75, 65],
         size: 100,
         innerSize: '70%',
         showInLegend: false,
         dataLabels: {
             enabled: false
         }
     }]
 });
 */
+ (AAChartModel *)pieMixedLineMixedColumnChart2 {
    return AAChartModel.new
        .titleSet(@"Sales of petroleum products March, Norway")
//        .titleAlignSet(AAChartAlignTypeLeft)
        .categoriesSet(@[@"Jet fuel", @"Duty-free diesel", @"Petrol", @"Diesel", @"Gas oil"])
        .yAxisTitleSet(@"Million liters")
        .tooltipValueSuffixSet(@" million liters")
        .seriesSet(@[
            AASeriesElement.new
                .typeSet(AAChartTypeColumn)
                .nameSet(@"2020")
                .dataSet(@[@59, @83, @65, @228, @184]),
            AASeriesElement.new
                .typeSet(AAChartTypeColumn)
                .nameSet(@"2021")
                .dataSet(@[@24, @79, @72, @240, @167]),
            AASeriesElement.new
                .typeSet(AAChartTypeColumn)
                .nameSet(@"2022")
                .dataSet(@[@58, @88, @75, @250, @176]),
            AASeriesElement.new
                .typeSet(AAChartTypeLine)
//                .stepSet(AAChartLineStepCenter)
                .nameSet(@"Average")
                .dataSet(@[@47, @83.33, @70.66, @239.33, @175.66])
                .markerSet(AAMarker.new
                    .lineWidthSet(@2)
                    .lineColorSet(AAColor.whiteColor)
                    .fillColorSet(AAColor.blackColor)),
            AAPie.new
//                .typeSet(AAChartTypePie)
//                .nameSet(@"Total")
//                .dataSet(@[
//                    @[@"2020", @619],
//                    @[@"2021", @586],
//                    @[@"2022", @647]
//                ])
                .centerSet(@[@75, @65])
                .sizeSet(@100)
//                .innerSizeSet(@"70%")
                .showInLegendSet(false)
                .dataLabelsSet(AADataLabels.new
                    .enabledSet(false))
        ]);
}

// 获取回归曲线数据
// 多项式回归: 返回 [a0, a1, a2, ...] 对应 y = a0 + a1*x + a2*x^2 + ...
+ (NSArray<NSNumber *> *)linearRegressionWithX:(NSArray<NSNumber *> *)x 
                                              y:(NSArray<NSNumber *> *)y 
                                       nDegrees:(NSInteger)nDegrees {
    NSInteger n = x.count;
    NSInteger m = nDegrees + 1; // 系数个数
    
    // 构建范德蒙矩阵 X: 每行是 [1, x_i, x_i^2, ..., x_i^nDegrees]
    double **X = malloc(n * sizeof(double *));
    for (NSInteger i = 0; i < n; i++) {
        X[i] = malloc(m * sizeof(double));
        for (NSInteger j = 0; j < m; j++) {
            X[i][j] = pow([x[i] doubleValue], (double)j);
        }
    }
    
    // 转置 X -> Xt
    double **Xt = malloc(m * sizeof(double *));
    for (NSInteger i = 0; i < m; i++) {
        Xt[i] = malloc(n * sizeof(double));
        for (NSInteger j = 0; j < n; j++) {
            Xt[i][j] = X[j][i];
        }
    }
    
    // Xt * X
    double **XtX = malloc(m * sizeof(double *));
    for (NSInteger i = 0; i < m; i++) {
        XtX[i] = malloc(m * sizeof(double));
        for (NSInteger j = 0; j < m; j++) {
            XtX[i][j] = 0;
            for (NSInteger k = 0; k < n; k++) {
                XtX[i][j] += Xt[i][k] * X[k][j];
            }
        }
    }
    
    // Xt * y
    double *Xty = malloc(m * sizeof(double));
    for (NSInteger i = 0; i < m; i++) {
        Xty[i] = 0;
        for (NSInteger k = 0; k < n; k++) {
            Xty[i] += Xt[i][k] * [y[k] doubleValue];
        }
    }
    
    // 求解线性方程组 XtX * β = Xty （使用高斯消元法求逆或直接求解）
    NSArray<NSNumber *> *coefficients = [self solveLinearSystemWithMatrix:XtX vector:Xty size:m];
    
    // 释放内存
    for (NSInteger i = 0; i < n; i++) {
        free(X[i]);
    }
    free(X);
    
    for (NSInteger i = 0; i < m; i++) {
        free(Xt[i]);
        free(XtX[i]);
    }
    free(Xt);
    free(XtX);
    free(Xty);
    
    return coefficients;
}

// 高斯消元法求解线性方程组 Ax = b
+ (NSArray<NSNumber *> *)solveLinearSystemWithMatrix:(double **)matrix 
                                               vector:(double *)vector 
                                                 size:(NSInteger)n {
    // 增广矩阵
    double **aug = malloc(n * sizeof(double *));
    for (NSInteger i = 0; i < n; i++) {
        aug[i] = malloc((n + 1) * sizeof(double));
        for (NSInteger j = 0; j < n; j++) {
            aug[i][j] = matrix[i][j];
        }
        aug[i][n] = vector[i];
    }
    
    // 前向消元
    for (NSInteger col = 0; col < n; col++) {
        // 找主元
        NSInteger maxRow = col;
        for (NSInteger row = col; row < n; row++) {
            if (fabs(aug[row][col]) > fabs(aug[maxRow][col])) {
                maxRow = row;
            }
        }
        
        // 交换行
        double *temp = aug[col];
        aug[col] = aug[maxRow];
        aug[maxRow] = temp;
        
        // 消元
        for (NSInteger row = col + 1; row < n; row++) {
            double factor = aug[row][col] / aug[col][col];
            for (NSInteger j = col; j <= n; j++) {
                aug[row][j] -= factor * aug[col][j];
            }
        }
    }
    
    // 回代
    double *xValues = malloc(n * sizeof(double));
    for (NSInteger i = n - 1; i >= 0; i--) {
        xValues[i] = aug[i][n];
        for (NSInteger j = i + 1; j < n; j++) {
            xValues[i] -= aug[i][j] * xValues[j];
        }
        xValues[i] /= aug[i][i];
    }
    
    NSMutableArray<NSNumber *> *result = [NSMutableArray array];
    for (NSInteger i = 0; i < n; i++) {
        [result addObject:@(xValues[i])];
    }
    
    // 释放内存
    for (NSInteger i = 0; i < n; i++) {
        free(aug[i]);
    }
    free(aug);
    free(xValues);
    
    return result;
}

// 生成回归曲线上的点
+ (NSArray<NSArray<NSNumber *> *> *)generateLineDataWithConstants:(NSArray<NSNumber *> *)constants 
                                                             start:(double)start 
                                                               end:(double)end 
                                                        resolution:(NSInteger)resolution {
    double step = (end - start) / (resolution * 10); // 更细的步长
    NSMutableArray<NSArray<NSNumber *> *> *data = [NSMutableArray array];
    double x = start;
    while (x <= end) {
        double y = 0;
        for (NSInteger i = 0; i < constants.count; i++) {
            y += [constants[i] doubleValue] * pow(x, (double)i);
        }
        [data addObject:@[@(x), @(y)]];
        x += step;
    }
    return data;
}

+ (AAChartModel *)scatterWithMultipleLinearRegressionChart {
    // 数据集
    NSArray *dataset = @[
        @[@4.648, @2.013],
        @[@4.583, @1.354],
        @[@-2.548, @1.066],
        @[@-2.321, @-0.733],
        @[@3.684, @1.013],
        @[@2.888, @-0.539],
        @[@2.358, @1.496],
        @[@-0.535, @1.718],
        @[@1.848, @-0.462],
        @[@1.854, @2.748],
        @[@1.65, @3.253],
        @[@-1.733, @2.058],
        @[@0.445, @2.586],
        @[@0.148, @1.168],
        @[@2.784, @1.399],
        @[@4.959, @4.581],
        @[@4.595, @3.141],
        @[@1.353, @2.451],
        @[@0.559, @2.402],
        @[@-0.854, @0.831],
        @[@-2.713, @0.781],
        @[@-2.78, @-1.127],
        @[@0.719, @0.905],
        @[@-0.452, @3.767],
        @[@0.04, @2.959],
        @[@4.134, @1.68],
        @[@1.206, @1.339],
        @[@1.484, @1.781],
        @[@-1.111, @1.82],
        @[@-2.809, @-0.987],
        @[@-0.399, @2.752],
        @[@-1.906, @0.949],
        @[@1.082, @1.394],
        @[@4.989, @4.606],
        @[@2.396, @0.42],
        @[@-1.545, @1.738],
        @[@4.149, @2.807],
        @[@3.374, @1.321],
        @[@2.875, @0.939],
        @[@4.253, @3.535],
        @[@3.103, @-0.248],
        @[@3.318, @2.644],
        @[@-0.17, @1.078],
        @[@4.848, @3.636],
        @[@4.695, @2.203],
        @[@-1.711, @1.126],
        @[@3.032, @-0.522],
        @[@2.721, @0.315],
        @[@0.691, @2.694],
        @[@1.243, @2.708],
        @[@0.92, @2.536],
        @[@4.399, @2.117],
        @[@1.007, @2.395],
        @[@3.652, @1.265],
        @[@-0.169, @2.138],
        @[@4.063, @1.791],
        @[@4.198, @1.705],
        @[@0.688, @3.712],
        @[@1.542, @1.832],
        @[@4.363, @1.436],
        @[@2.79, @0.954],
        @[@0.893, @1.342],
        @[@-1.226, @3.519],
        @[@-0.403, @2.466],
        @[@2.597, @-0.78],
        @[@-1.671, @0.765],
        @[@4.264, @2.736],
        @[@-0.855, @3.988],
        @[@4.291, @2.888],
        @[@-0.523, @2.865],
        @[@4.659, @3.201],
        @[@2.65, @2.046],
        @[@1.034, @0.55],
        @[@1.142, @1.522],
        @[@2.211, @1.456],
        @[@1.704, @2.286],
        @[@-0.505, @3.947],
        @[@-1.337, @1.281],
        @[@1.095, @1.113],
        @[@4.473, @1.199],
        @[@1.986, @2.308],
        @[@-2.397, @1.838],
        @[@3.563, @1.649],
        @[@2.808, @1.676],
        @[@4.261, @0.631],
        @[@-1.469, @2.266],
        @[@2.958, @0.901],
        @[@-2.53, @0.325],
        @[@2.223, @1.89],
        @[@-0.815, @2.656],
        @[@-1.187, @2.236],
        @[@4.004, @1.712],
        @[@-2.15, @-0.832],
        @[@1.179, @2.359],
        @[@3.832, @2.834],
        @[@-1.041, @3.408],
        @[@-1.316, @1.606],
        @[@4.045, @1.696],
        @[@0.383, @3.496],
        @[@2.736, @0.766]
    ];
    
    // 提取 x, y 数组
    NSMutableArray<NSNumber *> *xData = [NSMutableArray array];
    NSMutableArray<NSNumber *> *yData = [NSMutableArray array];
    for (NSArray *point in dataset) {
        [xData addObject:point[0]];
        [yData addObject:point[1]];
    }
    
    // 生成回归线数据
    NSArray *line1 = [self generateLineDataWithConstants:[self linearRegressionWithX:xData y:yData nDegrees:1] 
                                                    start:-3 
                                                      end:5 
                                               resolution:10];
    NSArray *line2 = [self generateLineDataWithConstants:[self linearRegressionWithX:xData y:yData nDegrees:2] 
                                                    start:-3 
                                                      end:5 
                                               resolution:10];
    NSArray *line3 = [self generateLineDataWithConstants:[self linearRegressionWithX:xData y:yData nDegrees:3] 
                                                    start:-3 
                                                      end:5 
                                               resolution:10];
    
    return AAChartModel.new
        .titleSet(@"Scatter plot with regression lines")
        .xAxisLabelsEnabledSet(true)
        .yAxisTitleSet(@"")
        .yAxisMinSet(@-2)
        .yAxisMaxSet(@6)
        .seriesSet(@[
            AASeriesElement.new
                .nameSet(@"Observations")
                .typeSet(AAChartTypeScatter)
                .dataSet(dataset)
                .markerSet(AAMarker.new
                    .radiusSet(@6)
                    //空心效果的 marker
                    .fillColorSet(AAColor.whiteColor)
                    .lineWidthSet(@3)
                    .lineColorSet(AAColor.redColor)),
            
            AASeriesElement.new
                .nameSet(@"1st degree regression line")
                .typeSet(AAChartTypeSpline)
                .dataSet(line1)
                .lineWidthSet(@5)
                .markerSet(AAMarker.new
                    .enabledSet(false))
                .enableMouseTrackingSet(@false),
            
            AASeriesElement.new
                .nameSet(@"2nd degree regression line")
                .typeSet(AAChartTypeSpline)
                .dataSet(line2)
                .lineWidthSet(@5)
                .markerSet(AAMarker.new
                    .enabledSet(false))
                .enableMouseTrackingSet(@false),
            
            AASeriesElement.new
                .nameSet(@"3rd degree regression line")
                .typeSet(AAChartTypeSpline)
                .dataSet(line3)
                .lineWidthSet(@5)
                .markerSet(AAMarker.new
                    .enabledSet(false))
                .enableMouseTrackingSet(@false)
        ]);
}

+ (AAChartModel *)rangeSplineAreaSplineAndMarkerChart {
    NSArray *json = @[
        @[@"1", @-0.489863522578899, @0.848138677816903, @0.559142254786167, @1.15073035819645],
        @[@"2", @-0.385774774190865, @0.779071607989758, @0.592110810844279, @0.742753777067528],
        @[@"3", @0.085320462046806, @0.665356275004035, @0.963570246688821, @1.27494822331159],
        @[@"4", @0.661951933364362, @1.48857802967009, @1.21299384683976, @1.37876710872108],
        @[@"5", @0.275939368771361, @1.78112017585948, @1.54658801436731, @1.87892635502492],
        @[@"6", @0.327782217100161, @0.910945756785081, @1.27208083065789, @1.61986408054512],
        @[@"7", @-0.353034448974316, @0.51492272900181, @0.121225112639938, @0.90211963105735],
        @[@"8", @-1.52464778559499, @0.260972126042923, @-0.508864567386389, @0.417885699969663],
        @[@"9", @-0.593361686260142, @0.162759391666744, @0.218089944784571, @0.360869923308897],
        @[@"10", @-0.282102011275525, @0.828140289442679, @0.721611369970074, @0.891552722962365],
        @[@"11", @-1.23059300530264, @0.451152587985225, @-0.140103248944554, @0.834414544127764],
        @[@"12", @-1.24995265027972, @-0.31266194270582, @-0.0300106962816838, @-0.41142281971162],
        @[@"13", @-1.37795240635888, @-0.589722591726911, @-0.191006845650732, @-0.516505539657783],
        @[@"14", @-2.52518734732884, @-0.95184304656081, @-0.814311553870472, @-1.27462030634033],
        @[@"15", @-1.70164913297708, @-1.54184969446708, @-1.08826628121932, @-1.5093101152107],
        @[@"16", @-2.80066758524658, @-1.31031245938982, @-1.96278720556888, @-1.75105038956633],
        @[@"17", @-2.21871327339612, @-0.895693067878342, @-0.950375849823643, @-0.800329750310783],
        @[@"18", @-1.86045028588756, @-1.26512897818588, @-0.92443255447989, @-0.574178518063472],
        @[@"19", @-2.13514441304614, @-1.08943821214579, @-1.30296034566265, @-0.739220801309009],
        @[@"20", @-1.36106428148275, @-0.751109295408758, @-0.866142934125915, @-0.833248083867714],
        @[@"21", @-1.13448325969953, @-0.208866920419441, @-0.358324443622643, @-0.3304939374004],
        @[@"22", @-1.16113158648886, @-0.460193104790614, @-0.0795243445688507, @-0.671877235487046],
        @[@"23", @-0.709834207179879, @0.0739745344379797, @0.0871865696214076, @0.706678090635692],
        @[@"24", @-0.855133081253214, @0.568682381682416, @0.332247453197952, @0.355934290536338],
        @[@"25", @-0.460984145040151, @-0.0533268121319483, @0.1927909935791, @0.520116262690529],
        @[@"26", @-0.274001486727037, @0.790086619458202, @0.372433776442163, @0.503192650078109],
        @[@"27", @-0.0632578758817437, @0.790173258069052, @1.30182293816554, @0.89441218858635],
        @[@"28", @0.533488666887157, @1.09171550073275, @1.23616453434162, @1.07309866451647],
        @[@"29", @0.328739731259988, @1.62978411402078, @1.83852277548915, @1.45231138640967],
        @[@"30", @1.07776428203926, @1.93809648786583, @2.46108589692092, @1.81206626995097],
        @[@"31", @1.1413167338545, @2.07317462613488, @1.79941129279295, @2.01052999279642],
        @[@"32", @2.01265969966196, @2.45369696032894, @3.03709651601366, @2.57524967204869],
        @[@"33", @1.02418266284474, @2.27795353731045, @2.34181116863238, @2.31776394989237],
        @[@"34", @1.45227269430285, @2.74092153168326, @2.76797387808001, @2.4385315669259],
        @[@"35", @1.45852270324646, @2.91238500034082, @2.9853266952491, @2.74537569070796],
        @[@"36", @1.21129207788561, @2.08667480157999, @2.09530458603767, @2.6727308809475],
        @[@"37", @0.462011042266158, @1.98370918491097, @1.53394095461533, @1.54720222137272],
        @[@"38", @0.428062670597836, @1.42756198832186, @1.91677613366245, @1.69525540140237],
        @[@"39", @0.571998651405796, @1.20777016841237, @0.959778428990291, @1.38939401587598],
        @[@"40", @-0.123659449221408, @1.10974150901183, @0.503938262585522, @1.06081365610511],
        @[@"41", @0.220265810946126, @0.889550892119087, @0.625835436920559, @0.778387089467167],
        @[@"42", @-0.574641417979562, @0.8583990372058, @0.654221831427059, @1.37533696416859],
        @[@"43", @0.19221674566726, @0.86959932086505, @1.47852533542482, @0.83455121493955],
        @[@"44", @0.186659862839924, @1.04903473940167, @0.68172447764395, @1.03171445911985],
        @[@"45", @0.218706499887028, @1.23923064220661, @0.853395074770504, @1.50111427755768],
        @[@"46", @-0.27220251796404, @1.3295116016313, @1.19709576605684, @0.990366511352841],
        @[@"47", @0.0909752720459248, @0.930787133486377, @1.13540425926233, @1.01885304957885],
        @[@"48", @0.500678865937832, @1.28945886403763, @1.86872639477659, @1.66757062636358],
        @[@"49", @-0.378876145639865, @1.29116025999708, @0.520386030441329, @1.72399982300463],
        @[@"50", @0.385505543735579, @1.03897914012846, @1.2105370970492, @1.49365049359714],
        @[@"51", @0.135932482376663, @0.92778787386035, @1.16066757224531, @1.25969273609095],
        @[@"52", @0.0126490029565284, @0.941856901134297, @0.617806318969375, @1.14962996968517],
        @[@"53", @0.773063369455311, @1.5541058613705, @1.39784724912506, @2.21431623455804],
        @[@"54", @1.08056863447678, @1.60549846831965, @1.98786092502431, @1.78155744981404],
        @[@"55", @1.06819268645169, @2.21075515924522, @2.5816314847123, @1.897312677728],
        @[@"56", @0.89600108139962, @2.0627506436141, @2.39647499467082, @2.00303588512805],
        @[@"57", @1.60601329459157, @2.69928369983066, @2.9546767824584, @3.13972422952751],
        @[@"58", @2.12052520649532, @3.00114926835576, @2.97818682108921, @3.57049829244482],
        @[@"59", @2.90989593458823, @3.50255848816715, @3.23630685370243, @3.7031428949146],
        @[@"60", @2.54278602988589, @3.70206371820628, @3.62703352404155, @3.65412513259214],
        @[@"61", @3.09657732168984, @3.93689422073629, @4.42818757143253, @4.56240590486167],
        @[@"62", @3.32321329150499, @3.90890881368374, @4.21758475211336, @4.3691811133343],
        @[@"63", @3.14178105822847, @4.27111998864967, @3.80688097575068, @4.44824771836784],
        @[@"64", @2.95886009091458, @4.15810698557557, @3.66153037695285, @4.65229859699136],
        @[@"65", @3.83183059088505, @4.53247535253525, @4.67163846440224, @4.70724246311339],
        @[@"66", @4.40063335904881, @5.20075380392408, @5.47861446159827, @5.12239434498163],
        @[@"67", @4.47478320238869, @5.05301123068342, @5.55733815443578, @5.23378335462593],
        @[@"68", @4.47232398366198, @5.44402577422747, @5.68401509811357, @5.31899376787198],
        @[@"69", @3.98286212328023, @5.01902798238165, @4.92824550854426, @4.85197161798612],
        @[@"70", @3.59183589955411, @4.85673224919323, @5.21664200314164, @5.336122542621],
        @[@"71", @4.10246999007764, @4.80323089976014, @4.84179665234023, @5.44519702784959],
        @[@"72", @4.751210298739, @5.33256459577594, @5.08356909085231, @6.0515889109663],
        @[@"73", @3.95250246625044, @5.47631574490867, @5.12512520171009, @5.54641631954027],
        @[@"74", @3.65861405462893, @4.93258521330197, @4.72926384244545, @5.36960110939244],
        @[@"75", @3.9432032257054, @4.94316527477613, @5.15369204112966, @5.53350321274879]
    ];
    
    NSMutableArray *rangeSplineAreaData = [NSMutableArray array];
    NSMutableArray *markerData = [NSMutableArray array];
    NSMutableArray *splineData = [NSMutableArray array];
    
    for (NSArray *item in json) {
        NSInteger x = [item[0] integerValue];
        [rangeSplineAreaData addObject:@[@(x), item[1], item[2]]];
        [markerData addObject:@[@(x), item[3]]];
        [splineData addObject:@[@(x), item[4]]];
    }
    
    return AAChartModel.new
        .animationTypeSet(AAChartAnimationEaseInQuad)
        .titleSet(@"Combination of Range Spline-Area, Spline and Marker Chart")
        .yAxisMinSet(@-3)
        .yAxisMaxSet(@7)
        .legendEnabledSet(true)
        .seriesSet(@[
            AASeriesElement.new
                .typeSet(AAChartTypeAreasplinerange)
                .nameSet(@"Range Spline Area")
                .dataSet(rangeSplineAreaData)
                .lineWidthSet(@3)
                .markerSet(AAMarker.new
                    .enabledSet(false)),
            
            AASeriesElement.new
                .typeSet(AAChartTypeScatter)
                .nameSet(@"Marker")
                .dataSet(markerData)
                .zIndexSet(@1)
                .markerSet(AAMarker.new
                    .radiusSet(@8)
                        //空心效果的 marker
                    .fillColorSet(AAColor.whiteColor)
                    .lineWidthSet(@3)
                    .lineColorSet(AAColor.redColor)
                    .statesSet(AAMarkerStates.new
                        .hoverSet(AAMarkerHover.new
                            .radiusSet(@6)))),
            
            AASeriesElement.new
                .typeSet(AAChartTypeSpline)
                .nameSet(@"Spline")
                .dataSet(splineData)
                .lineWidthSet(@5)
                .colorSet(AAColor.orangeColor)
                .zIndexSet(@2)
                .markerSet(AAMarker.new
                    .enabledSet(false))
        ]);
}

@end

