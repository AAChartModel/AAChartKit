//
//  LineChartFixedWidthUniformMarkerSample.m
//  AAChartKitDemo
//
//  Created by Codex on 2026/2/9.
//

#import "LineChartFixedWidthUniformMarkerSample.h"
#import <math.h>

static const NSInteger kAAFixedWidthSlotCount = 10;

@implementation LineChartFixedWidthUniformMarkerSample

+ (NSArray<NSNumber *> *)defaultValues {
    return @[@12, @18, @9, @22, @15, @20, @13, @19, @16, @24];
}

+ (AAOptions *)fixedWidthUniformMarkerLineChartOptionsWithValues:(NSArray<NSNumber *> * _Nullable)values {
    NSArray<NSNumber *> *sourceValues = values.count > 0 ? values : self.defaultValues;
    NSInteger xMax = kAAFixedWidthSlotCount - 1;

    NSArray<AADataElement *> *mainSeriesData = [self mainSeriesDataWithValues:sourceValues slotCount:kAAFixedWidthSlotCount];
    NSArray<NSArray<NSNumber *> *> *extensionSeriesData = [self singlePointExtensionDataWithValues:sourceValues slotCount:kAAFixedWidthSlotCount];

    return AAOptions.new
        .chartSet(AAChart.new
            .typeSet(AAChartTypeLine)
            .spacingSet(@[@20, @18, @20, @18])
//            .scrollablePlotAreaSet(AAScrollablePlotArea.new
//                .minWidthSet(@760))
                  )
        .titleSet(AATitle.new
            .textSet(@"固定宽度排点示例"))
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
                            .lineWidthSet(@3))))
                .statesSet(AAStates.new
                    .hoverSet(AAHover.new
                        .haloSet(AAHalo.new
                            .sizeSet(@14)
                            .opacitySet(@0.4))
                        .lineWidthPlusSet(@1))
                    .inactiveSet(AAInactive.new
                        .opacitySet(@1)))))
        .seriesSet(@[
            AASeriesElement.new
                .nameSet(@"均匀分布线")
                .typeSet(AAChartTypeLine)
                .dataSet(mainSeriesData)
                .lineWidthSet(@2.5)
                .colorSet(@"#1f78ff")
                .clipSet(NO),
            AASeriesElement.new
                .nameSet(@"单点右侧补线")
                .typeSet(AAChartTypeLine)
                .dataSet(extensionSeriesData)
                .lineWidthSet(@2.5)
                .colorSet(@"#1f78ff")
                .clipSet(NO)
                .showInLegendSet(NO)
                .enableMouseTrackingSet(@NO)
                .markerSet(AAMarker.new.enabledSet(NO)),
        ]);
}

+ (NSArray<NSNumber *> *)tickPositionsWithSlotCount:(NSInteger)slotCount {
    NSMutableArray<NSNumber *> *tickPositions = [NSMutableArray arrayWithCapacity:(NSUInteger)slotCount];
    for (NSInteger i = 0; i < slotCount; i++) {
        [tickPositions addObject:@(i)];
    }
    return tickPositions;
}

+ (NSArray<AADataElement *> *)mainSeriesDataWithValues:(NSArray<NSNumber *> *)values
                                             slotCount:(NSInteger)slotCount {
    NSUInteger count = values.count;
    if (count == 0 || slotCount <= 1) {
        return @[];
    }

    NSInteger maxX = slotCount - 1;
    if (count == 1) {
        return @[
            AADataElement.new
                .xSet(@0)
                .ySet(values.firstObject)
                .markerSet(AAMarker.new.enabledSet(YES))
        ];
    }

    double step = (double)maxX / (double)(count - 1);
    NSMutableArray<AADataElement *> *data = [NSMutableArray arrayWithCapacity:count];
    for (NSUInteger i = 0; i < count; i++) {
        double rawX = step * (double)i;
        double xValue = round(rawX * 1000000.0) / 1000000.0;
        [data addObject:AADataElement.new
            .xSet(@(xValue))
            .ySet(values[i])
            .markerSet(AAMarker.new.enabledSet(YES))
        ];
    }

    return data;
}

+ (NSArray<NSArray<NSNumber *> *> *)singlePointExtensionDataWithValues:(NSArray<NSNumber *> *)values
                                                              slotCount:(NSInteger)slotCount {
    if (values.count != 1 || slotCount <= 1) {
        return @[];
    }

    NSNumber *yValue = values.firstObject;
    NSInteger maxX = slotCount - 1;
    return @[
        @[@0, yValue],
        @[@(maxX), yValue],
    ];
}

@end

