//
//  LineChartFixedWidthUniformMarkerSample.m
//  AAChartKitDemo
//
//  Created by Codex on 2026/2/9.
//

#import "LineChartFixedWidthUniformMarkerSample.h"
#import <math.h>

// 固定宽度槽位总数：x 轴按 0~9 共 10 个槽位分布。
static const NSInteger kAAFixedWidthSlotCount = 10;

@implementation LineChartFixedWidthUniformMarkerSample

+ (NSArray<NSNumber *> *)defaultValues {
    return @[@12, @18, @9, @22, @15, @20, @13, @19, @16, @24];
}

+ (AAOptions *)fixedWidthUniformMarkerLineChartOptionsWithValues:(NSArray<NSNumber *> * _Nullable)values {
    // 允许调用方传入任意长度数据；为空时回退默认数据。
    NSArray<NSNumber *> *sourceValues = values.count > 0 ? values : self.defaultValues;
    NSInteger xMax = kAAFixedWidthSlotCount - 1;

    // 真实点数据：仅用于 scatter（marker 与交互）。
    NSArray<AADataElement *> *distributedData = [self distributedDataWithValues:sourceValues slotCount:kAAFixedWidthSlotCount];
    // 连线数据：仅用于 line（单点时负责向右补线）。
    NSArray<NSArray<NSNumber *> *> *lineSeriesData = [self lineSeriesDataWithDistributedData:distributedData
                                                                                    slotCount:kAAFixedWidthSlotCount];

    return AAOptions.new
        .chartSet(AAChart.new
            .typeSet(AAChartTypeLine)
            .spacingSet(@[@20, @18, @20, @18])
                  )
        .titleSet(AATitle.new
            .textSet(@"固定宽度排点示例（line + scatter）"))
        .subtitleSet(AASubtitle.new
            .textSet(@"x 轴固定 10 个槽位（0~9）"))
        .legendSet(AALegend.new
            .enabledSet(NO))
        .xAxisSet(AAXAxis.new
            .minSet(@0)
            .maxSet(@(xMax))
            .tickPositionsSet([self tickPositionsWithSlotCount:kAAFixedWidthSlotCount])
            .titleSet(AAAxisTitle.new
                .textSet(@"固定槽位")))
        .yAxisSet(AAYAxis.new
            .titleSet(AAAxisTitle.new
                .textSet(@"值"))
            .gridLineColorSet(@"#eef1f7"))
        .tooltipSet(AATooltip.new
            .sharedSet(NO)
            .pointFormatSet(@"槽位 x: <b>{point.x}</b><br/>值 y: <b>{point.y}</b>"))
        .plotOptionsSet(AAPlotOptions.new
            .seriesSet(AASeries.new
                .animationSet(AAAnimation.new
                    .durationSet(@380))
                .statesSet(AAStates.new
                    .inactiveSet(AAInactive.new
                        .opacitySet(@1))))
            .lineSet(AALine.new
                .lineWidthSet(@2.5)
                .statesSet(AAStates.new
                    .hoverSet(AAHover.new
                        .enabledSet(NO)
                        .lineWidthPlusSet(@0))))
            .scatterSet(AAScatter.new
                .statesSet(AAStates.new
                    .hoverSet(AAHover.new
                        .haloSet(AAHalo.new
                            .sizeSet(@14)
                            .opacitySet(@0.4))))
                .markerSet(AAMarker.new
                    .enabledSet(YES)
                    .radiusSet(@7)
                    .fillColorSet(@"#ff5a36")
                    .lineWidthSet(@2)
                    .lineColorSet(@"#ffffff")
                    .statesSet(AAMarkerStates.new
                        .hoverSet(AAMarkerHover.new
                            .enabledSet(YES)
                            .radiusPlusSet(@4)
                            .fillColorSet(@"#ff2f71")
                            .lineColorSet(@"#ffffff")
                            .lineWidthSet(@3)))))
        )
        .seriesSet(@[
            AASeriesElement.new
                .nameSet(@"均匀分布连线")
                .typeSet(AAChartTypeLine)
                .dataSet(lineSeriesData)
                .lineWidthSet(@2.5)
                .colorSet(@"#1f78ff")
                // line 只负责连线，不参与交互，避免出现“隐藏点 hover”。
                .enableMouseTrackingSet(@NO)
                .markerSet(AAMarker.new.enabledSet(NO))
                .statesSet(AAStates.new
                    .hoverSet(AAHover.new
                        .enabledSet(NO)
                        .lineWidthPlusSet(@0)))
                .zIndexSet(@1)
                .clipSet(NO)
                .showInLegendSet(NO),
            AASeriesElement.new
                .nameSet(@"真实数据点")
                .typeSet(AAChartTypeScatter)
                .dataSet(distributedData)
                .colorSet(@"#1f78ff")
                // scatter 层级更高，确保 marker 始终显示在折线上方。
                .zIndexSet(@4)
                .clipSet(NO)
                .showInLegendSet(NO)
        ]);
}

+ (NSArray<NSNumber *> *)tickPositionsWithSlotCount:(NSInteger)slotCount {
    // 固定刻度：0,1,2...9，对应固定槽位语义。
    NSMutableArray<NSNumber *> *tickPositions = [NSMutableArray arrayWithCapacity:(NSUInteger)slotCount];
    for (NSInteger i = 0; i < slotCount; i++) {
        [tickPositions addObject:@(i)];
    }
    return tickPositions;
}

+ (NSArray<AADataElement *> *)distributedDataWithValues:(NSArray<NSNumber *> *)values
                                               slotCount:(NSInteger)slotCount {
    NSUInteger count = values.count;
    if (count == 0 || slotCount <= 1) {
        return @[];
    }

    NSInteger maxX = slotCount - 1;
    if (count == 1) {
        // 单点场景：主 series 只放真实点（x=0）。
        // 右侧延长线由辅助 series 绘制，避免虚拟点参与 hover。
        return @[
            AADataElement.new
                .xSet(@0)
                .ySet(values.firstObject)
        ];
    }

    double step = (double)maxX / (double)(count - 1);
    NSMutableArray<AADataElement *> *data = [NSMutableArray arrayWithCapacity:count];
    for (NSUInteger i = 0; i < count; i++) {
        double rawX = step * (double)i;
        // 保留 6 位小数，避免浮点误差造成 tooltip/x 轴显示抖动。
        double xValue = round(rawX * 1000000.0) / 1000000.0;
        [data addObject:AADataElement.new
            .xSet(@(xValue))
            .ySet(values[i])
        ];
    }

    return data;
}

+ (NSArray<NSArray<NSNumber *> *> *)lineSeriesDataWithDistributedData:(NSArray<AADataElement *> *)distributedData
                                                              slotCount:(NSInteger)slotCount {
    if (distributedData.count == 0 || slotCount <= 1) {
        return @[];
    }

    if (distributedData.count == 1) {
        // 仅在“1 个点”时生成补线：从 (0, y) 延伸到最右槽位 (maxX, y)。
        NSNumber *yValue = distributedData.firstObject.y;
        NSInteger maxX = slotCount - 1;
        return @[
            @[@0, yValue],
            @[@(maxX), yValue],
        ];
    }

    NSMutableArray<NSArray<NSNumber *> *> *lineData = [NSMutableArray arrayWithCapacity:distributedData.count];
    for (AADataElement *point in distributedData) {
        if (point.x == nil || point.y == nil) {
            continue;
        }
        [lineData addObject:@[point.x, point.y]];
    }

    return lineData;
}

@end
