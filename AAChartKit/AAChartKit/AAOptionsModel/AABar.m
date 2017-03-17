//
//  AABar.m
//  AAChartKit
//
//  Created by An An on 17/1/19.
//  Copyright © 2017年 An An. All rights reserved.
//

#import "AABar.h"
#import "AADataLabels.h"
@implementation AABar
AAPropSetFuncImplementation(AABar, NSNumber *, pointPadding);
AAPropSetFuncImplementation(AABar, NSNumber *, borderWidth);
AAPropSetFuncImplementation(AABar, BOOL , colorByPoint);
AAPropSetFuncImplementation(AABar, AADataLabels *, dataLabels);

@end
