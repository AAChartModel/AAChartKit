//
//  AAGauge.m
//  AAChartKitDemo
//
//  Created by AnAn on 2024/11/19.
//  Copyright © 2024 An An. All rights reserved.
//

#import "AAGauge.h"

@implementation AAGauge

AAPropSetFuncImplementation(AAGauge, AADataLabels  *, dataLabels)
AAPropSetFuncImplementation(AAGauge, AADial  *, dial)
AAPropSetFuncImplementation(AAGauge, AAPivot *, pivot)

@end


@implementation AADial

AAPropSetFuncImplementation(AADial, NSString *, backgroundColor)
AAPropSetFuncImplementation(AADial, NSString *, baseLength)
AAPropSetFuncImplementation(AADial, NSNumber *, baseWidth)
AAPropSetFuncImplementation(AADial, NSString *, borderColor)
AAPropSetFuncImplementation(AADial, NSNumber *, borderWidth)
AAPropSetFuncImplementation(AADial, NSString *, path)
AAPropSetFuncImplementation(AADial, NSString *, radius)
AAPropSetFuncImplementation(AADial, NSString *, rearLength)
AAPropSetFuncImplementation(AADial, NSString *, topWidth)

@end


@implementation AAPivot

AAPropSetFuncImplementation(AAPivot, NSString *, backgroundColor)
AAPropSetFuncImplementation(AAPivot, NSString *, borderColor)
AAPropSetFuncImplementation(AAPivot, NSNumber *, borderWidth)
AAPropSetFuncImplementation(AAPivot, NSNumber *, radius)

@end
