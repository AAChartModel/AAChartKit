//
//  JSFunctionForAAPointEventsComposer.m
//  AAChartKitDemo
//
//  Created by AnAn on 2024/8/27.
//  Copyright © 2024 An An. All rights reserved.
//

#import "JSFunctionForAAPointEventsComposer.h"
#import "AAChartKit.h"

@implementation JSFunctionForAAPointEventsComposer


+ (AAOptions *)showTooltipOnlyOnClick {
    // 创建 AAOptions 配置对象
    AAOptions *aaOptions = AAOptions.new
        .chartSet(AAChart.new
                  .typeSet(AAChartTypeLine)) // 设置图表类型为折线图
        .tooltipSet(AATooltip.new
                    .enabledSet(NO)) // 默认禁用提示框
        .xAxisSet(AAXAxis.new
                  .categoriesSet(@[
                    @"孤岛危机",
                    @"使命召唤",
                    @"荣誉勋章",
                    @"狙击精英",
                    @"神秘海域",
                    @"最后生还者",
                    @"巫师3狂猎",
                    @"对马之魂",
                    @"蝙蝠侠阿甘骑士",
                    @"地狱边境",
                    @"闪客",
                    @"忍者之印"
                  ]))
        .plotOptionsSet(AAPlotOptions.new
                        .seriesSet(AASeries.new
                                   .markerSet(AAMarker.new
                                              .radiusSet(@8)//曲线连接点半径
                                              .symbolSet(AAChartSymbolTypeCircle)//曲线点类型："circle", "square", "diamond", "triangle","triangle-down"，默认是"circle"
                                              .fillColorSet(AAColor.whiteColor)//点的填充色(用来设置折线连接点的填充色)
                                              .lineWidthSet(@8)//外沿线的宽度(用来设置折线连接点的轮廓描边的宽度)
                                              //外沿线的颜色(用来设置折线连接点的轮廓描边颜色，当值为空字符串时，默认取数据点或数据列的颜色)
                                              .lineColorSet(AARgbaColor(204, 150, 103, 1.0))
                                              )
                                   .pointSet(AAPoint.new
                                             .eventsSet(AAPointEvents.new
                                                        .clickSet(@AAJSFunc(function() {
                                                            this.series.chart.update({
                                                                tooltip: {
                                                                    enabled: true
                                                                }
                                                            });
                                                        }))
                                                        .mouseOutSet(@AAJSFunc(function() {
                                                            this.series.chart.update({
                                                                tooltip: {
                                                                    enabled: false
                                                                }
                                                            });
                                                        }))
                                                        ))))//设置点击事件
        .seriesSet(@[
            AASeriesElement.new
                .enabledCrosshairsSet(@true)
                .colorByPointSet(@YES) // 每个点的颜色独立
                .dataSet(@[@7.0, @6.9, @9.5, @14.5, @18.2, @21.5, @25.2, @26.5, @23.3, @18.3, @13.9, @9.6]) // 数据数组
        ]);

    
    return aaOptions;
}

+ (AAOptions *)customizeCrosshairsStyle {
    return AAOptions.new
        .plotOptionsSet(AAPlotOptions.new
                        .seriesSet(AASeries.new
                                   .pointSet(AAPoint.new
                                             .eventsSet(AAPointEvents.new
                                                        .mouseOverSet(@AAJSFunc(function() {
                                                            const chart = this.series.chart;
                                                            const pointBox = this.graphic.getBBox();
                                                            const left = pointBox.x + (pointBox.width / 2) + chart.plotLeft;
                                                            const top = pointBox.y + chart.plotTop;
                                                            const height = chart.plotHeight + chart.plotTop;
                                                            
                                                            if (this.series.options.enabledCrosshairs) {
                                                                chart.crosshair = chart.renderer.path(['M', left, top, 'L', left, height])
                                                                    .attr({
                                                                        'stroke-width': 8,
                                                                    stroke: 'red'
                                                                    })
                                                                    .add();
                                                            }
                                                        }
                                                                                ))
                                                        .mouseOutSet(@AAJSFunc(function() {
                                                            const chart = this.series.chart;
                                                            if (chart.crosshair) chart.crosshair.destroy();
                                                        }))
                                                        
                                                        ))))//设置点击事件
        .seriesSet(@[
            AASeriesElement.new
                .enabledCrosshairsSet(@true)
                .dataSet(@[@2, @5, @2, @3, @6, @5]),
        ]);
}

@end
