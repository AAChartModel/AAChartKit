//
//  AALegend.m
//  AAChartKit
//
//  Created by An An on 17/1/6.
//  Copyright © 2017年 An An. All rights reserved.
//

#import "AALegend.h"
#import "AAItemStyle.h"

@implementation AALegend
AAPropSetFuncImplementation(AALegend, BOOL , enabled);
AAPropSetFuncImplementation(AALegend, NSString *, layout);
AAPropSetFuncImplementation(AALegend, NSString *, align);
AAPropSetFuncImplementation(AALegend, NSString *, verticalAlign);
AAPropSetFuncImplementation(AALegend, NSNumber *, borderWidth);
AAPropSetFuncImplementation(AALegend, AAItemStyle *, itemStyle);


@end
