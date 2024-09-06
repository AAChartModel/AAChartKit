//
//  CustomStyleForBubbleChartComposer.m
//  AAChartKitDemo
//
//  Created by AnAn on 2024/9/6.
//  Copyright © 2024 An An. All rights reserved.
//

#import "CustomStyleForBubbleChartComposer.h"
#import "AAChartKit.h"
#import "AAGradientColor+RadialGradient.h"
#import "AAChartModel.h"

@implementation CustomStyleForBubbleChartComposer

+ (AAChartModel *)configureNegativeColorMixedBubbleChart {
    return AAChartModel.new
        .chartTypeSet(AAChartTypeBubble)
        .legendEnabledSet(false)
        .dataLabelsEnabledSet(true)
        .markerRadiusSet(@3)
        .backgroundColorSet(@"#4b2b7f")
        .xAxisVisibleSet(false)
        .yAxisVisibleSet(false)
        .xAxisReversedSet(true)
        .seriesSet(@[
            AASeriesElement.new
                .nameSet(@"Bubble")
                .dataSet(@[
                    @[@0, @0, @5],  @[@0, @1, @1],  @[@0, @2, @0],  @[@0, @3, @0],  @[@0, @4, @0],  @[@0, @5, @0],  @[@0, @6, @0],
                    @[@0, @7, @0],  @[@0, @8, @0],  @[@0, @9, @0],  @[@0, @10, @0],  @[@0, @11, @2],  @[@0, @12, @4],  @[@0, @13, @1],
                    @[@0, @14, @1],  @[@0, @15, @3],  @[@0, @16, @4],  @[@0, @17, @6],  @[@0, @18, @4],  @[@0, @19, @4],  @[@0, @20, @3],
                    @[@0, @21, @3],  @[@0, @22, @2],  @[@0, @23, @5],  @[@1, @0, @7],  @[@1, @1, @0],  @[@1, @2, @0],  @[@1, @3, @0],
                    @[@1, @4, @0],  @[@1, @5, @0],  @[@1, @6, @0],  @[@1, @7, @0],  @[@1, @8, @0],  @[@1, @9, @0],  @[@1, @10, @5],
                    @[@1, @11, @2],  @[@1, @12, @2],  @[@1, @13, @6],  @[@1, @14, @9],  @[@1, @15, @11],  @[@1, @16, @6],  @[@1, @17, @7],
                    @[@1, @18, @8],  @[@1, @19, @12],  @[@1, @20, @5],  @[@1, @21, @5],  @[@1, @22, @7],  @[@1, @23, @2],  @[@2, @0, @1],
                    @[@2, @1, @1],  @[@2, @2, @0],  @[@2, @3, @0],  @[@2, @4, @0],  @[@2, @5, @0],  @[@2, @6, @0],  @[@2, @7, @0],  @[@2, @8, @0],
                    @[@2, @9, @0],  @[@2, @10, @3],  @[@2, @11, @2],  @[@2, @12, @1],  @[@2, @13, @9],  @[@2, @14, @8],  @[@2, @15, @10],
                    @[@2, @16, @6],  @[@2, @17, @5],  @[@2, @18, @5],  @[@2, @19, @5],  @[@2, @20, @7],  @[@2, @21, @4],  @[@2, @22, @2],
                    @[@2, @23, @4],  @[@3, @0, @7],  @[@3, @1, @3],  @[@3, @2, @0],  @[@3, @3, @0],  @[@3, @4, @0],  @[@3, @5, @0],  @[@3, @6, @0],
                    @[@3, @7, @0],  @[@3, @8, @1],  @[@3, @9, @0],  @[@3, @10, @5],  @[@3, @11, @4],  @[@3, @12, @7],  @[@3, @13, @14],  @[@3, @14, @13],
                    @[@3, @15, @12],  @[@3, @16, @9],  @[@3, @17, @5],  @[@3, @18, @5],  @[@3, @19, @10],  @[@3, @20, @6],  @[@3, @21, @4],
                    @[@3, @22, @4],  @[@3, @23, @1],  @[@4, @0, @1],  @[@4, @1, @3],  @[@4, @2, @0],  @[@4, @3, @0],  @[@4, @4, @0],  @[@4, @5, @1],
                    @[@4, @6, @0],  @[@4, @7, @0],  @[@4, @8, @0],  @[@4, @9, @2],  @[@4, @10, @4],  @[@4, @11, @4],  @[@4, @12, @2],  @[@4, @13, @4],
                    @[@4, @14, @4],  @[@4, @15, @14],  @[@4, @16, @12],  @[@4, @17, @1],  @[@4, @18, @8],  @[@4, @19, @5],  @[@4, @20, @3],  @[@4, @21, @7],
                    @[@4, @22, @3],  @[@4, @23, @0],  @[@5, @0, @2],  @[@5, @1, @1],  @[@5, @2, @0],  @[@5, @3, @3],  @[@5, @4, @0],  @[@5, @5, @0],
                    @[@5, @6, @0],  @[@5, @7, @0],  @[@5, @8, @2],  @[@5, @9, @0],  @[@5, @10, @4],  @[@5, @11, @1],  @[@5, @12, @5],  @[@5, @13, @10],
                    @[@5, @14, @5],  @[@5, @15, @7],  @[@5, @16, @11],  @[@5, @17, @6],  @[@5, @18, @0],  @[@5, @19, @5],  @[@5, @20, @3],
                    @[@5, @21, @4],  @[@5, @22, @2],  @[@5, @23, @0],  @[@6, @0, @1],  @[@6, @1, @0],  @[@6, @2, @0],  @[@6, @3, @0],
                    @[@6, @4, @0],  @[@6, @5, @0],  @[@6, @6, @0],  @[@6, @7, @0],  @[@6, @8, @0],  @[@6, @9, @0],  @[@6, @10, @1],
                    @[@6, @11, @0],  @[@6, @12, @2],  @[@6, @13, @1],  @[@6, @14, @3],  @[@6, @15, @4],  @[@6, @16, @0],  @[@6, @17, @0],
                    @[@6, @18, @0],  @[@6, @19, @0],  @[@6, @20, @1],  @[@6, @21, @2],  @[@6, @22, @2],  @[@6, @23, @6]
                ])
                .colorSet((id)[AAGradientColor oceanBlueColor])
                .negativeColorSet((id)[AAGradientColor pinkSugarColor])
                .thresholdSet(@5)//default:0
            ,
        ]);
}

+ (AAChartModel *)showAARadialGradientPositionAllEnumValuesWithBubbleChart {
    return AAChartModel.new
        .chartTypeSet(AAChartTypeBubble)
        .titleSet(@"AACHARTKIT BUBBLES")
        .subtitleSet(@"JUST FOR SHOW AARadialGradientPosition")
        .yAxisTitleSet(@"℃")
        .yAxisGridLineStyleSet([AALineStyle styleWithWidth:@0])
        .colorsThemeSet(@[
            [AAGradientColor radialGradientWithPosition:AARadialGradientPositionTopLeft startColor:AAColor.redColor endColor:AAColor.yellowColor],
            [AAGradientColor radialGradientWithPosition:AARadialGradientPositionTopCenter startColor:AAColor.redColor endColor:AAColor.yellowColor],
            [AAGradientColor radialGradientWithPosition:AARadialGradientPositionTopRight startColor:AAColor.redColor endColor:AAColor.yellowColor],
            [AAGradientColor radialGradientWithPosition:AARadialGradientPositionMiddleLeft startColor:AAColor.redColor endColor:AAColor.yellowColor],
            [AAGradientColor radialGradientWithPosition:AARadialGradientPositionMiddleCenter startColor:AAColor.redColor endColor:AAColor.yellowColor],
            [AAGradientColor radialGradientWithPosition:AARadialGradientPositionMiddleRight startColor:AAColor.redColor endColor:AAColor.yellowColor],
            [AAGradientColor radialGradientWithPosition:AARadialGradientPositionBottomLeft startColor:AAColor.redColor endColor:AAColor.yellowColor],
            [AAGradientColor radialGradientWithPosition:AARadialGradientPositionBottomCenter startColor:AAColor.redColor endColor:AAColor.yellowColor],
            [AAGradientColor radialGradientWithPosition:AARadialGradientPositionBottomRight startColor:AAColor.redColor endColor:AAColor.yellowColor],
        ])
        .yAxisReversedSet(true)
        .seriesSet(@[
            AASeriesElement.new
                .nameSet(@"BubbleOne")
                .colorByPointSet(@true)
                .markerSet(AAMarker.new
                    .lineColorSet(AAColor.redColor)
                    .lineWidthSet(@3))
                .dataSet(@[
                    @[@25, @25, @250],
                    @[@50, @25, @250],
                    @[@75, @25, @250],

                    @[@25, @50, @250],
                    @[@50, @50, @250],
                    @[@75, @50, @250],

                    @[@25, @75, @250],
                    @[@50, @75, @250],
                    @[@75, @75, @250],
                ])
        ]);
}

@end
