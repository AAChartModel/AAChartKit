//
//  AAGradientColor+RadialGradient.m
//  AAChartKitDemo
//
//  Created by AnAn on 2024/9/6.
//  Copyright © 2024 An An. All rights reserved.
//

#import "AAGradientColor+RadialGradient.h"

@implementation AAGradientColor (RadialGradient)

+ (AAGradientColor *)radialGradientWithStartColor:(NSString *)startColor
                                         endColor:(NSString *)endColor {
    return [self radialGradientWithPosition:AARadialGradientPositionMiddleCenter
                                 startColor:startColor
                                   endColor:endColor];
}

+ (AAGradientColor *)radialGradientWithPosition:(AARadialGradientPosition)position
                                     startColor:(NSString *)startColor
                                       endColor:(NSString *)endColor {
    return [self radialGradientWithPosition:position
                                      stops:@[
                                          @[@0, startColor],
                                          @[@1, endColor]
                                      ]];
}

+ (AAGradientColor *)radialGradientWithPosition:(AARadialGradientPosition)position
                                          stops:(NSArray *)stops {
    AAGradientColor *gradientColor = AAGradientColor.new;
    gradientColor.radialGradient = [self radialGradientPositionDictionaryWithPosition:position];
    gradientColor.stops = stops.mutableCopy;
    return gradientColor;
}

/**
     (0,0) ----------- (1,0)
     |                   |
     |                   |
     |                   |
     |                   |
     |                   |
     (0,1) ----------- (1,1)
     */
/**
 ( topLeft ) -----------  ( topCenter ) ----------- (  topRight )
      |                          |                          |
      |                          |                          |
      |                          |                          |
      |                          |                          |
      |                          |                          |
      |                          |                          |
      |                          |                          |
      |                          |                          |
      |                          |                          |
 (middleLeft) ----------- (middleCenter) ----------- (middleRight)
      |                          |                          |
      |                          |                          |
      |                          |                          |
      |                          |                          |
      |                          |                          |
      |                          |                          |
      |                          |                          |
      |                          |                          |
      |                          |                          |
 (bottomLeft) ----------- (bottomCenter) ----------- (bottomRight)
 */
+ (AARadialGradient *)radialGradientPositionDictionaryWithPosition:(AARadialGradientPosition)position {
    switch (position) {
        case AARadialGradientPositionTopLeft: return [AARadialGradient radialGradientWithCx:(id)@"25%" cy:(id)@"25%" r:(id)@"50%"];
        case AARadialGradientPositionTopCenter: return [AARadialGradient radialGradientWithCx:(id)@"50%" cy:(id)@"25%" r:(id)@"50%"];
        case AARadialGradientPositionTopRight: return [AARadialGradient radialGradientWithCx:(id)@"75%" cy:(id)@"25%" r:(id)@"50%"];

        case AARadialGradientPositionMiddleLeft: return [AARadialGradient radialGradientWithCx:(id)@"25%" cy:(id)@"50%" r:(id)@"50%"];
        case AARadialGradientPositionMiddleCenter: return [AARadialGradient radialGradientWithCx:(id)@"50%" cy:(id)@"50%" r:(id)@"50%"];
        case AARadialGradientPositionMiddleRight: return [AARadialGradient radialGradientWithCx:(id)@"75%" cy:(id)@"50%" r:(id)@"50%"];

        case AARadialGradientPositionBottomLeft: return [AARadialGradient radialGradientWithCx:(id)@"25%" cy:(id)@"75%" r:(id)@"50%"];
        case AARadialGradientPositionBottomCenter: return [AARadialGradient radialGradientWithCx:(id)@"50%" cy:(id)@"75%" r:(id)@"50%"];
        case AARadialGradientPositionBottomRight: return [AARadialGradient radialGradientWithCx:(id)@"75%" cy:(id)@"75%" r:(id)@"50%"];
    }
    return nil;
}

@end
