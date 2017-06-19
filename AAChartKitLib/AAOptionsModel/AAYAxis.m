//
//  AAYAxis.m
//  AAChartKit
//
//  Created by An An on 17/1/5.
//  Copyright © 2017年 An An. All rights reserved.
//  source code ----*** https://github.com/AAChartModel/AAChartKit ***--- source code
//

#import "AAYAxis.h"
#import "AATitle.h"
#import "AALabels.h"
@implementation AAYAxis
//AAPropSetFuncImplementation(AAYAxis, BOOL, min);
AAPropSetFuncImplementation(AAYAxis, AATitle *, title);
AAPropSetFuncImplementation(AAYAxis, NSArray *, plotLines);
AAPropSetFuncImplementation(AAYAxis, BOOL, reversed);
AAPropSetFuncImplementation(AAYAxis, NSNumber *, gridLineWidth);
AAPropSetFuncImplementation(AAYAxis, NSString *, gridLineColor);
AAPropSetFuncImplementation(AAYAxis, AALabels *, labels);
AAPropSetFuncImplementation(AAYAxis, NSNumber *, lineWidth);//y轴线宽度
AAPropSetFuncImplementation(AAYAxis, NSString *, lineColor);// y 轴线颜色

AAPropSetFuncImplementation(AAYAxis, BOOL, allowDecimals); //y轴是否允许显示小数
AAPropSetFuncImplementation(AAYAxis, NSNumber *, max); //y轴最大值
AAPropSetFuncImplementation(AAYAxis, NSNumber *, min); //y轴最小值（设置为0就不会有负数）
AAPropSetFuncImplementation(AAYAxis, NSArray *, tickPositions);//自定义Y轴坐标（如：[@(0), @(25), @(50), @(75) , (100)]）
@end
