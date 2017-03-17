//
//  AAXAxis.m
//  AAChartKit
//
//  Created by An An on 17/1/5.
//  Copyright © 2017年 An An. All rights reserved.
//

#import "AAXAxis.h"
#import "AALabels.h"

@implementation AAXAxis
AAPropSetFuncImplementation(AAXAxis,id, categories);
AAPropSetFuncImplementation(AAXAxis, BOOL , reversed);
AAPropSetFuncImplementation(AAXAxis, NSNumber *, gridLineWidth);
AAPropSetFuncImplementation(AAXAxis, NSString *, gridLineColor);
AAPropSetFuncImplementation(AAXAxis, AALabels *, labels);

@end
