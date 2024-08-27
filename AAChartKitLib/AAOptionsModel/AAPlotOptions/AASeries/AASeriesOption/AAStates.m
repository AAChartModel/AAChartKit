//
//  AAStates.m
//  AAChartKitDemo
//
//  Created by AnAn on 2020/1/6.
//  Copyright © 2020 An An. All rights reserved.
//

#import "AAStates.h"

@implementation AAStates

AAPropSetFuncImplementation(AAStates, AAHover    *, hover)
AAPropSetFuncImplementation(AAStates, AASelect   *, select)
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

AAPropSetFuncImplementation(AAHover, BOOL,       enabled)
AAPropSetFuncImplementation(AAHover, NSString *, borderColor)
AAPropSetFuncImplementation(AAHover, NSNumber *, brightness)
AAPropSetFuncImplementation(AAHover, NSString *, color)
AAPropSetFuncImplementation(AAHover, AAHalo   *, halo)
AAPropSetFuncImplementation(AAHover, NSNumber *, lineWidth)
AAPropSetFuncImplementation(AAHover, NSNumber *, lineWidthPlus)



@end


@implementation AASelect

- (instancetype)init {
    self = [super init];
    if (self) {
        _enabled = true;
    }
    return self;
}

AAPropSetFuncImplementation(AASelect, BOOL,       enabled)
AAPropSetFuncImplementation(AASelect, NSString *, borderColor)
AAPropSetFuncImplementation(AASelect, NSString *, color)
AAPropSetFuncImplementation(AASelect, AAHalo   *, halo)

@end


@implementation AAHalo

//AAPropSetFuncImplementation(AAHalo, NSDictionary *, attributes)
AAPropSetFuncImplementation(AAHalo, NSNumber *, opacity)
AAPropSetFuncImplementation(AAHalo, NSNumber *, size)

- (AAHalo * (^) (AASVGAttributes *attributes)) attributesSet {
    return ^(AASVGAttributes *attributes) {
        self.attributes = attributes.toDic;
        return self;
    };
}

@end


@implementation AAInactive

- (instancetype)init {
    self = [super init];
    if (self) {
        _enabled = true;
    }
    return self;
}

AAPropSetFuncImplementation(AAInactive, BOOL,       enabled)
AAPropSetFuncImplementation(AAInactive, NSNumber *, opacity)

@end


@implementation AASVGAttributes

AAPropSetFuncImplementation(AASVGAttributes, NSString *, fill)
AAPropSetFuncImplementation(AASVGAttributes, NSString *, stroke)
AAPropSetFuncImplementation(AASVGAttributes, NSNumber *, strokeWidth)

- (NSDictionary *)toDic {
    NSMutableDictionary *dic = [NSMutableDictionary dictionary];
    if (self.fill) {
        dic[@"fill"] = self.fill;
    }
    if (self.stroke) {
        dic[@"stroke"] = self.stroke;
    }
    if (self.strokeWidth) {
        dic[@"stroke-width"] = self.strokeWidth;
    }
    return dic;
}

@end
