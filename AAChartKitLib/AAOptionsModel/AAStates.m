//
//  AAStates.m
//  AAChartKitDemo
//
//  Created by AnAn on 2020/1/6.
//  Copyright © 2020 Danny boy. All rights reserved.
//

#import "AAStates.h"

@implementation AAStates

AAPropSetFuncImplementation(AAStates, AAHover *, hover)
AAPropSetFuncImplementation(AAStates, AASelect *, select)
AAPropSetFuncImplementation(AAStates, AAInactive *, inactive)

@end


@implementation AAHover

- (instancetype)init {
    self = [super init];
    if (self) {
        _enabled = true;
    }
    return self;
}

AAPropSetFuncImplementation(AAHover, BOOL , enabled)
AAPropSetFuncImplementation(AAHover, NSString *, borderColor)
AAPropSetFuncImplementation(AAHover, NSNumber *, brightness)
AAPropSetFuncImplementation(AAHover, NSString *, color)
AAPropSetFuncImplementation(AAHover, AAHalo *, halo)
AAPropSetFuncImplementation(AAHover, NSNumber *, lineWidth)
AAPropSetFuncImplementation(AAHover, NSNumber *, lineWidthPlus)



@end


@implementation AASelect

AAPropSetFuncImplementation(AASelect, NSString *, borderColor)
AAPropSetFuncImplementation(AASelect, NSString *, color)
AAPropSetFuncImplementation(AASelect, AAHalo *, halo)

@end


@implementation AAHalo

AAPropSetFuncImplementation(AAHalo, NSDictionary *, attributes)
AAPropSetFuncImplementation(AAHalo, NSNumber *, opacity)
AAPropSetFuncImplementation(AAHalo, NSNumber *, size)

@end


@implementation AAInactive

- (instancetype)init {
    self = [super init];
    if (self) {
        _enabled = true;
    }
    return self;
}

AAPropSetFuncImplementation(AAInactive, BOOL , enabled)
AAPropSetFuncImplementation(AAInactive, NSNumber *, opacity)

@end
