//
//  AAGradientColor+RadialGradient.h
//  AAChartKitDemo
//
//  Created by AnAn on 2024/9/6.
//  Copyright © 2024 An An. All rights reserved.
//

#import "AAGradientColor.h"

NS_ASSUME_NONNULL_BEGIN

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

+ (AAGradientColor *)radialGradientWithStartColor:(NSString *)startColor
                                         endColor:(NSString *)endColor;

+ (AAGradientColor *)radialGradientWithPosition:(AARadialGradientPosition)position
                                     startColor:(NSString *)startColor
                                       endColor:(NSString *)endColor;

+ (AAGradientColor *)radialGradientWithPosition:(AARadialGradientPosition)position
                                          stops:(NSArray *)stops;

@end

NS_ASSUME_NONNULL_END
