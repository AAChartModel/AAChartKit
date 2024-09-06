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
AAPropSetFuncImplementation(AAGradientColor, NSArray *, stops)

@end


@implementation AALinearGradient

AAPropSetFuncImplementation(AALinearGradient, NSNumber *, x1)
AAPropSetFuncImplementation(AALinearGradient, NSNumber *, y1)
AAPropSetFuncImplementation(AALinearGradient, NSNumber *, x2)
AAPropSetFuncImplementation(AALinearGradient, NSNumber *, y2)

+ (AALinearGradient *)linearGradientWithX1:(NSNumber *)x1
                                        y1:(NSNumber *)y1
                                        x2:(NSNumber *)x2
                                        y2:(NSNumber *)y2 {
    AALinearGradient *linearGradient = [[AALinearGradient alloc] init];
    linearGradient.x1 = x1;
    linearGradient.y1 = y1;
    linearGradient.x2 = x2;
    linearGradient.y2 = y2;
    return linearGradient;
}

@end


@implementation AARadialGradient

AAPropSetFuncImplementation(AARadialGradient, NSNumber *, cx)
AAPropSetFuncImplementation(AARadialGradient, NSNumber *, cy)
AAPropSetFuncImplementation(AARadialGradient, NSNumber *, r)

+ (AARadialGradient *)radialGradientWithCx:(NSNumber *)cx
                                        cy:(NSNumber *)cy
                                         r:(NSNumber *)r {
    AARadialGradient *radialGradient = [[AARadialGradient alloc] init];
    radialGradient.cx = cx;
    radialGradient.cy = cy;
    radialGradient.r = r;
    return radialGradient;
}

@end


