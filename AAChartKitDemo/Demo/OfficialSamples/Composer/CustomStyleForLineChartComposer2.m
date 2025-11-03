#import "CustomStyleForLineChartComposer2.h"
#import "AAChartKit.h"

@implementation CustomStyleForLineChartComposer2

+ (NSArray *)generateWaveDataWithAmplitude:(double)amplitude
                                     phase:(double)phase
                                      step:(double)step
                                     count:(NSInteger)count
                                     noise:(double)noise {
    NSMutableArray *data = [NSMutableArray array];
    for (NSInteger i = 0; i < count; i++) {
        double y = amplitude * sin((i * step) + phase) + 120;
        double noisyY = y + (arc4random_uniform(10000) / 10000.0 - 0.5) * noise;
        [data addObject:@(noisyY)];
    }
    return data;
}

+ (AAChartModel *)colorfulMarkerWithZonesChart {
    NSArray *zones = @[
        AAZonesElement.new
            .valueSet(@80.0)
            .colorSet(@"#25547c"),
        AAZonesElement.new
            .valueSet(@110.0)
            .colorSet(@"#1e90ff"),
        AAZonesElement.new
            .valueSet(@140.0)
            .colorSet(@"#ffd066"),
        AAZonesElement.new
            .valueSet(@170.0)
            .colorSet(@"#04d69f"),
        AAZonesElement.new
            .colorSet(@"#ef476f")
    ];
    
    return AAChartModel.new
        .chartTypeSet(AAChartTypeLine)
        .titleSet(@"⚡️高饱和度波浪图 — 实心与空心 Marker 对比")
        .legendEnabledSet(true)
        .tooltipEnabledSet(true)
        .seriesSet(@[
            AASeriesElement.new
                .nameSet(@"实心数据")
                .dataSet([self generateWaveDataWithAmplitude:85.0 phase:0.0 step:0.25 count:60 noise:4.0])
                .zonesSet(zones)
                .zoneAxisSet(@"y")
                .markerSet(AAMarker.new
                    .symbolSet(AAChartSymbolTypeCircle)
                    .radiusSet(@6)
                    .lineWidthSet(@1)),
            AASeriesElement.new
                .nameSet(@"空心数据")
                .dataSet([self generateWaveDataWithAmplitude:85.0 phase:M_PI / 2 step:0.25 count:60 noise:4.0])
                .zonesSet(zones)
                .zoneAxisSet(@"y")
                .markerSet(AAMarker.new
                    .symbolSet(AAChartSymbolTypeDiamond)
                    .fillColorSet(@"transparent")
                    .lineColorSet(NSNull.null)
                    .radiusSet(@7)
                    .lineWidthSet(@2))
                .dashStyleSet(AAChartLineDashStyleTypeDashDot)
        ])
        ;
}

@end
