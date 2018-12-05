//
//  AAPlotOptions.m
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
 * JianShu       : https://www.jianshu.com/u/f1e6753d4254
 * SegmentFault  : https://segmentfault.com/u/huanghunbieguan
 *
 * -------------------------------------------------------------------------------
 
 */

#import "AAPlotOptions.h"

@implementation AAPlotOptions

AAPropSetFuncImplementation(AAPlotOptions, AAColumn     *, column) 
AAPropSetFuncImplementation(AAPlotOptions, AALine       *, line) 
AAPropSetFuncImplementation(AAPlotOptions, AAPie        *, pie) 
AAPropSetFuncImplementation(AAPlotOptions, AABar        *, bar) 
AAPropSetFuncImplementation(AAPlotOptions, AASpline     *, spline) 
AAPropSetFuncImplementation(AAPlotOptions, AASeries     *, series) 
AAPropSetFuncImplementation(AAPlotOptions, AAArea       *, area) 
AAPropSetFuncImplementation(AAPlotOptions, AAAreaspline *, areaspline) 
AAPropSetFuncImplementation(AAPlotOptions, NSObject     *, columnrange) 
AAPropSetFuncImplementation(AAPlotOptions, NSObject     *, arearange) 

@end
