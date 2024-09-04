//
//  JSFunctionForMixedEventsComposer.m
//  AAChartKitDemo
//
//  Created by AnAn on 2024/9/4.
//  Copyright © 2024 An An. All rights reserved.
//

#import "JSFunctionForMixedEventsComposer.h"
#import "AAChartKit.h"

static const NSString * kTouchMove = @"touchmove";

@implementation JSFunctionForMixedEventsComposer

//https://github.com/AAChartModel/AAChartCore/issues/203
+ (AAOptions *)disableHoverEventTooltipEffect {
    AAOptions *aaOptions = AAOptions.new
        .chartSet(AAChart.new
            .typeSet(AAChartTypeLine)
            .eventsSet(AAChartEvents.new
                .loadSet(@AAJSFunc(function() {
                    const chart = this;
#if TARGET_OS_IOS
                    // iOS 使用 touchmove 事件
                    Highcharts.addEvent(chart.container, 'touchmove', function (e) {
                        e.preventDefault();
                        chart.tooltip.hide(0);
                    });
#elif TARGET_OS_OSX || TARGET_OS_MACCATALYST
                    // macOS 和 macCatalyst 使用 mousemove 事件
                    Highcharts.addEvent(chart.container, 'mousemove', function (e) {
                        e.preventDefault();
                        chart.tooltip.hide(0);
                    });
#endif
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


@end
