//
//  AAYAxis.m
//  AAChartKit
//
//  Created by An An on 17/1/5.
//  Copyright © 2017年 An An. All rights reserved.
//

#import "AAYAxis.h"
#import "AATitle.h"
#import "AALabels.h"
@implementation AAYAxis
AAPropSetFuncImplementation(AAYAxis, BOOL, min);
AAPropSetFuncImplementation(AAYAxis, AATitle *, title);
AAPropSetFuncImplementation(AAYAxis, NSArray *, plotLines);
AAPropSetFuncImplementation(AAYAxis, BOOL, reversed);
AAPropSetFuncImplementation(AAYAxis, NSNumber *, gridLineWidth);
AAPropSetFuncImplementation(AAYAxis, NSString *, gridLineColor);
AAPropSetFuncImplementation(AAYAxis, AALabels *, labels);
AAPropSetFuncImplementation(AAYAxis, NSNumber *, lineWidth);//y轴线宽度
AAPropSetFuncImplementation(AAYAxis, NSString *, lineColor);// y 轴线颜色

@end
