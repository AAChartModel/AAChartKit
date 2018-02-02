//
//  AAYAxis.m
//  AAChartKit
//
//  Created by An An on 17/1/5.
//  Copyright © 2017年 An An. All rights reserved.
//*************** ...... SOURCE CODE ...... ***************
//***...................................................***
//*** https://github.com/AAChartModel/AAChartKit        ***
//*** https://github.com/AAChartModel/AAChartKit-Swift  ***
//***...................................................***
//*************** ...... SOURCE CODE ...... ***************

/*
 
 * -------------------------------------------------------------------------------
 *
 * 🌕 🌖 🌗 🌘  ❀❀❀   WARM TIPS!!!   ❀❀❀ 🌑 🌒 🌓 🌔
 *
 * Please contact me on GitHub,if there are any problems encountered in use.
 * GitHub Issues : https://github.com/AAChartModel/AAChartKit/issues
 * -------------------------------------------------------------------------------
 * And if you want to contribute for this project, please contact me as well
 * GitHub        : https://github.com/AAChartModel
 * StackOverflow : https://stackoverflow.com/users/7842508/codeforu
 * JianShu       : http://www.jianshu.com/u/f1e6753d4254
 * SegmentFault  : https://segmentfault.com/u/huanghunbieguan
 *
 * -------------------------------------------------------------------------------
 
 */

#import "AAYAxis.h"

@implementation AAYAxis

//AAPropSetFuncImplementation(AAYAxis, BOOL,       min);
AAPropSetFuncImplementation(AAYAxis, AATitle  *, title);
AAPropSetFuncImplementation(AAYAxis, NSArray  *, plotLines);
AAPropSetFuncImplementation(AAYAxis, BOOL,       reversed);
AAPropSetFuncImplementation(AAYAxis, NSNumber *, gridLineWidth);
AAPropSetFuncImplementation(AAYAxis, NSString *, gridLineColor);
AAPropSetFuncImplementation(AAYAxis, NSString *, gridLineInterpolation);
AAPropSetFuncImplementation(AAYAxis, AALabels *, labels);
AAPropSetFuncImplementation(AAYAxis, NSNumber *, lineWidth);//y轴线宽度
AAPropSetFuncImplementation(AAYAxis, NSString *, lineColor);// y 轴线颜色

AAPropSetFuncImplementation(AAYAxis, BOOL,       allowDecimals); //y轴是否允许显示小数
AAPropSetFuncImplementation(AAYAxis, NSNumber *, max); //y轴最大值
AAPropSetFuncImplementation(AAYAxis, NSNumber *, min); //y轴最小值（设置为0就不会有负数）
AAPropSetFuncImplementation(AAYAxis, NSArray  *, tickPositions);//自定义Y轴坐标（如：[@(0), @(25), @(50), @(75) , (100)]）
AAPropSetFuncImplementation(AAYAxis, BOOL,       visible); //y轴是否允许显示


@end
