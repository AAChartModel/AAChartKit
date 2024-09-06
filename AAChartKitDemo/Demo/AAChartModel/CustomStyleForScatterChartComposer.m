//
//  CustomStyleForScatterChartComposer.m
//  AAChartKitDemo
//
//  Created by AnAn on 2024/9/6.
//  Copyright © 2024 An An. All rights reserved.
//

#import "CustomStyleForScatterChartComposer.h"
#import "AAChartKit.h"
#import "AAChartSymbolConstant.h"

@implementation CustomStyleForScatterChartComposer

//refer to online sample https://jshare.com.cn/github/highcharts/highcharts/tree/master/samples/highcharts/plotoptions/series-marker-symbol/
//https://github.com/AAChartModel/AAChartKit/issues/703
+ (AAChartModel *)customScatterChartMarkerSymbolContent {
    return AAChartModel.new
        .chartTypeSet(AAChartTypeScatter)
        .yAxisMaxSet(@3.5)
        .yAxisGridLineStyleSet([AALineStyle styleWithWidth:@0])
        .stackingSet(AAChartStackingTypeNormal)
        .markerRadiusSet(@8)
        .seriesSet(({
            AASeriesElement *element1 = AASeriesElement.new
                .nameSet(@"Predefined symbol")
                .dataSet(@[@0.45, @0.43, @0.50, @0.55, @0.58, @0.62, @0.83, @0.39, @0.56, @0.67, @0.50, @0.34, @0.50, @0.67, @0.58, @0.29, @0.46, @0.23, @0.47, @0.46, @0.38, @0.56, @0.48, @0.36])
                .markerSet(AAMarker.new
                    .symbolSet(predefinedSymbol1));

            AASeriesElement *element2 = AASeriesElement.new
                .nameSet(@"Image symbol")
                .dataSet(@[@0.38, @0.31, @0.32, @0.32, @0.64, @0.66, @0.86, @0.47, @0.52, @0.75, @0.52, @0.56, @0.54, @0.60, @0.46, @0.63, @0.54, @0.51, @0.58, @0.64, @0.60, @0.45, @0.36, @0.67])
                .markerSet(AAMarker.new
                    .symbolSet(imageSymbol));

            AASeriesElement *element3 = AASeriesElement.new
                .nameSet(@"Base64 symbol (*)")
                .dataSet(@[@0.46, @0.32, @0.53, @0.58, @0.86, @0.68, @0.85, @0.73, @0.69, @0.71, @0.91, @0.74, @0.60, @0.50, @0.39, @0.67, @0.55, @0.49, @0.65, @0.45, @0.64, @0.47, @0.63, @0.64])
                .markerSet(AAMarker.new
                    .symbolSet(base64Symbol));

            AASeriesElement *element4 = AASeriesElement.new
                .nameSet(@"Custom symbol")
                .dataSet(@[@0.60, @0.51, @0.52, @0.53, @0.64, @0.84, @0.65, @0.68, @0.63, @0.47, @0.72, @0.60, @0.65, @0.74, @0.66, @0.65, @0.71, @0.59, @0.65, @0.77, @0.52, @0.53, @0.58, @0.53])
                .markerSet(AAMarker.new
                    .symbolSet(predefinedSymbol2));

            @[element1, element2, element3, element4];
        }));
}

//https://github.com/AAChartModel/AAChartKit/issues/1294
- (AAChartModel *)drawLineMixedScatterChartWithPointsCoordinates2 {
    return AAChartModel.new
        .chartTypeSet(AAChartTypeScatter)
        .titleSet(@"Draw Line Chart With Points Coordinates")
        .markerSymbolSet(AAChartSymbolTypeCircle)
        .markerSymbolStyleSet(AAChartSymbolStyleTypeBorderBlank)
        .markerRadiusSet(@8)
        .colorsThemeSet(@[AAColor.redColor])
        .seriesSet(({
            NSArray *dataArr = @[
                @[@0, @200],
                @[@0, @300],
                @[@0, @400],
                @[@1, @100],
                @[@2, @120],
                @[@3, @130]
            ];

            @[
                AASeriesElement.new
                    .typeSet(AAChartTypeLine)
                    .enableMouseTrackingSet((id) false)
                    .showInLegendSet(false)
                    .markerSet(AAMarker.new
                        .enabledSet(false))
                    .statesSet(AAStates.new
                        .inactiveSet(AAInactive.new
                            .enabledSet(false)))
                    .dataSet(dataArr),
                AASeriesElement.new
                    .nameSet(@"Red Dot")
                    .typeSet(AAChartTypeScatter)
                    .dataSet(dataArr),
            ];
        }));
}

@end
