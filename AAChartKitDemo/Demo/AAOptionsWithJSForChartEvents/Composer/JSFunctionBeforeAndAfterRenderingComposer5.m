//
//  JSFunctionBeforeAndAfterRenderingComposer5.m
//  AAChartKitDemo
//
//  Created by AnAn on 2024/11/21.
//  Copyright © 2024 An An. All rights reserved.
//

#import "JSFunctionBeforeAndAfterRenderingComposer5.h"
#import "AAChartKit.h"

@implementation JSFunctionBeforeAndAfterRenderingComposer5

/**
 // 重写内部属性及方法
 (function(H) {
     var bubbleProto = H.seriesTypes.bubble.prototype;
     bubbleProto.axisTypes = ['xAxis', 'yAxis', 'colorAxis'];
     bubbleProto.optionalAxis = 'colorAxis';
     bubbleProto.colorKey = 'colorValue';
     bubbleProto.pointArrayMap = ['y', 'z', 'colorValue'];
     bubbleProto.parallelArrays = ['x', 'y', 'z', 'colorValue'];
     H.wrap(bubbleProto, 'translate', function(proceed) {
         proceed.apply(this, Array.prototype.slice.call(arguments, 1));
         H.seriesTypes.heatmap.prototype.translateColors.call(this);
     });
 })(Highcharts);
 Highcharts.chart('container', {
     chart: {
         type: 'bubble',
         plotBorderWidth: 1,
         zoomType: 'xy'
     },
     title: {
         text: '包含色轴的气泡图'
     },
     colorAxis: {
         minColor: '#c6e48b',
         maxColor: '#196127',
         min: 0,
         max: 10
     },
     xAxis: {
         gridLineWidth: 1
     },
     yAxis: {
         startOnTick: false,
         endOnTick: false
     },
     series: [{
         //keys: ['x', 'y', 'radius', 'colorValue'],
         data: [
             [9, 81, 63, 3],
             [98, 5, 89, 4],
             [51, 50, 73, 2],
             [41, 22, 14, 1],
             [58, 24, 20, 5],
             [78, 137, 4, 1],
             [55, 56, 53, 1],
             [18, 45, 70, 3],
             [42, 44, 28, 5],
             [3, 52, 59, 6],
             [31, 18, 97, 1],
             [79, 91, 63, 3],
             [93, 23, 23, 2],
             [44, 83, 22, 2]
         ]
     }, {
         //keys: ['x', 'y', 'value', 'colorValue'],
         marker: {
             symbol: 'triangle'
         },
         data: [
             [42, 38, 20, 1],
             [6, 18, 1, 6],
             [1, 93, 55, 2],
             [57, 2, 90, 3],
             [80, 76, 22, 2],
             [11, 74, 96, 1],
             [88, 56, 10, 5],
             [30, 47, 49, 7],
             [57, 62, 98, 2],
             [4, 16, 16, 9],
             [46, 10, 11, 3],
             [22, 87, 89, 2],
             [57, 91, 82, 1],
             [45, 15, 98, 5]
         ]
     }]
 });
 */
//包含色轴的气泡图
+ (AAOptions *)colorAxisBubbleChart {
    NSString *jsStr = @AAJSFunc(// 重写内部属性及方法
                                (function(H) {
                                    var bubbleProto = H.seriesTypes.bubble.prototype;
                                    bubbleProto.axisTypes = ['xAxis', 'yAxis', 'colorAxis'];
                                    bubbleProto.optionalAxis = 'colorAxis';
                                    bubbleProto.colorKey = 'colorValue';
                                    bubbleProto.pointArrayMap = ['y', 'z', 'colorValue'];
                                    bubbleProto.parallelArrays = ['x', 'y', 'z', 'colorValue'];
                                    H.wrap(bubbleProto, 'translate', function(proceed) {
                                        proceed.apply(this, Array.prototype.slice.call(arguments, 1));
                                        H.seriesTypes.heatmap.prototype.translateColors.call(this);
                                    });
                                })(Highcharts););
    
    AAOptions *aaOptions = AAOptions.new
        .chartSet(AAChart.new
                  .typeSet(AAChartTypeBubble)
                  //              .plotBorderWidthSet(@1)
                  //              .zoomTypeSet(AAChartZoomTypeXy)
                  )
        .titleSet(AATitle.new
                  .textSet(@"包含色轴的气泡图"))
    //    .colorAxisSet(AAColorAxis.new
    //                  .minColorSet(@"#c6e48b")
    //                  .maxColorSet(@"#196127")
    //                  .minSet(@0)
    //                  .maxSet(@10)
    //                  )
        .xAxisSet(AAXAxis.new
                  .gridLineWidthSet(@1)
                  )
        .yAxisSet(AAYAxis.new
                  .startOnTickSet(false)
                  .endOnTickSet(false)
                  )
        .seriesSet(@[
            AASeriesElement.new
                .dataSet(@[
                    @[@9, @81, @63, @3],
                    @[@98, @5, @89, @4],
                    @[@51, @50, @73, @2],
                    @[@41, @22, @14, @1],
                    @[@58, @24, @20, @5],
                    @[@78, @137, @4, @1],
                    @[@55, @56, @53, @1],
                    @[@18, @45, @70, @3],
                    @[@42, @44, @28, @5],
                    @[@3, @52, @59, @6],
                    @[@31, @18, @97, @1],
                    @[@79, @91, @63, @3],
                    @[@93, @23, @23, @2],
                    @[@44, @83, @22, @2],
                ]),
            AASeriesElement.new
                .markerSet(AAMarker.new
                .symbolSet(AAChartSymbolTypeTriangle)
            )
                .dataSet(@[
                    @[@42, @38, @20, @1],
                    @[@6, @18, @1, @6],
                    @[@1, @93, @55, @2],
                    @[@57, @2, @90, @3],
                    @[@80, @76, @22, @2],
                    @[@11, @74, @96, @1],
                    @[@88, @56, @10, @5],
                    @[@30, @47, @49, @7],
                    @[@57, @62, @98, @2],
                    @[@4, @16, @16, @9],
                    @[@46, @10, @11, @3],
                    @[@22, @87, @89, @2],
                    @[@57, @91, @82, @1],
                    @[@45, @15, @98, @5],
                ]),
        ]);
    
//    aaOptions.beforeDrawChartJavaScriptSet(jsStr);
    
    return aaOptions;
    
}
    

@end
