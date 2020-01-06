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

@end

@implementation AAHover

AAPropSetFuncImplementation(AAHover, NSString *, borderColor)
AAPropSetFuncImplementation(AAHover, NSNumber *, brightness)
AAPropSetFuncImplementation(AAHover, NSString *, color)

@end

@implementation AASelect

AAPropSetFuncImplementation(AASelect, NSString *, borderColor)
AAPropSetFuncImplementation(AASelect, NSString *, color)

@end
