//
//  AAXAxis.m
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
#import "AAXAxis.h"

@implementation AAXAxis

AAPropSetFuncImplementation(AAXAxis, NSArray  *, categories);
AAPropSetFuncImplementation(AAXAxis, BOOL ,      reversed);
AAPropSetFuncImplementation(AAXAxis, NSNumber *, gridLineWidth);
AAPropSetFuncImplementation(AAXAxis, NSString *, gridLineColor);
AAPropSetFuncImplementation(AAXAxis, AALabels *, labels);
AAPropSetFuncImplementation(AAXAxis, BOOL ,      visible);
AAPropSetFuncImplementation(AAXAxis, NSNumber *, tickInterval);//x轴刻度点间隔数(设置每隔几个点显示一个 X轴的内容)

@end
