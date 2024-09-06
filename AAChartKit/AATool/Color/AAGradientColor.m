//
//  AAGradientColor.m
//  AAChartKitDemo
//
//  Created by AnAn on 2024/9/6.
//  Copyright © 2024 An An. All rights reserved.
//

#import "AAGradientColor.h"

@implementation AAGradientColor

AAPropSetFuncImplementation(AAGradientColor, AALinearGradient *, linearGradient)
AAPropSetFuncImplementation(AAGradientColor, AARadialGradient *, radialGradient)
AAPropSetFuncImplementation(AAGradientColor, NSMutableArray *, stops)

@end


@implementation AALinearGradient

AAPropSetFuncImplementation(AALinearGradient, NSNumber *, x1)
AAPropSetFuncImplementation(AALinearGradient, NSNumber *, y1)
AAPropSetFuncImplementation(AALinearGradient, NSNumber *, x2)
AAPropSetFuncImplementation(AALinearGradient, NSNumber *, y2)

@end


@implementation AARadialGradient

AAPropSetFuncImplementation(AARadialGradient, NSNumber *, cx)
AAPropSetFuncImplementation(AARadialGradient, NSNumber *, cy)
AAPropSetFuncImplementation(AARadialGradient, NSNumber *, r)

@end


