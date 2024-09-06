//
//  AAGradientColor+RadialGradient.h
//  AAChartKitDemo
//
//  Created by AnAn on 2024/9/6.
//  Copyright © 2024 An An. All rights reserved.
//

#import "AAGradientColor.h"

NS_ASSUME_NONNULL_BEGIN

//https://api.highcharts.com/class-reference/Highcharts.RadialGradientColorObject
/// - vertical  : top,  middle, bottom
/// - horizontal: left, center, right
/**
 ----------------------------------------------------
    V\H   | left       | center       | right
 ---------|---------------------------|--------------
 top      | topLeft    | topCenter    | topRight
 middle   | middleLeft | middleCenter | middleRight
 bottom   | bottomLeft | bottomCenter | bottomRight
 ----------------------------------------------------
 */
typedef NS_ENUM(NSInteger, AARadialGradientPosition) {
    AARadialGradientPositionTopLeft,
    AARadialGradientPositionTopCenter,
    AARadialGradientPositionTopRight,

    AARadialGradientPositionMiddleLeft,
    AARadialGradientPositionMiddleCenter,
    AARadialGradientPositionMiddleRight,

    AARadialGradientPositionBottomLeft,
    AARadialGradientPositionBottomCenter,
    AARadialGradientPositionBottomRight
};

@interface AAGradientColor (RadialGradient)

+ (AAGradientColor *)radialGradientColorWithStartColor:(NSString *)startColor
                                              endColor:(NSString *)endColor;

+ (AAGradientColor *)radialGradientColorWithPosition:(AARadialGradientPosition)position
                                          startColor:(NSString *)startColor
                                            endColor:(NSString *)endColor;

+ (AAGradientColor *)radialGradientColorWithPosition:(AARadialGradientPosition)position
                                               stops:(NSArray *)stops;

@end

NS_ASSUME_NONNULL_END
