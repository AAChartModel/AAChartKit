//
//  AAPie.m
//  AAChartKit
//
//  Created by An An on 17/1/9.
//  Copyright © 2017年 An An. All rights reserved.
//

#import "AAPie.h"
#import "AADataLabels.h"
@implementation AAPie
AAPropSetFuncImplementation(AAPie, BOOL, allowPointSelect);
AAPropSetFuncImplementation(AAPie, NSString *, cursor);
AAPropSetFuncImplementation(AAPie, AADataLabels *, dataLabels);
AAPropSetFuncImplementation(AAPie, BOOL, showInLegend);
AAPropSetFuncImplementation(AAPie, NSNumber *, startAngle);
AAPropSetFuncImplementation(AAPie, NSNumber *, endAngle);
AAPropSetFuncImplementation(AAPie, NSNumber *, depth);


@end
