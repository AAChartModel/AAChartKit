//
//  AALegend.m
//  AAChartKit
//
//  Created by An An on 17/1/6.
//  Copyright © 2017年 An An. All rights reserved.
//
//*************** ...... SOURCE CODE ...... ***************
//***...................................................***
//***    https://github.com/AAChartModel/AAChartKit     ***
//***...................................................***
//*************** ...... SOURCE CODE ...... ***************
//

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

#import "AALegend.h"

@implementation AALegend

AAPropSetFuncImplementation(AALegend, AALegendLayoutType,        layout);
AAPropSetFuncImplementation(AALegend, AALegendAlignType,         align);
AAPropSetFuncImplementation(AALegend, AALegendVerticalAlignType, verticalAlign);
AAPropSetFuncImplementation(AALegend, BOOL,          enabled);
AAPropSetFuncImplementation(AALegend, NSNumber    *, borderWidth);
AAPropSetFuncImplementation(AALegend, NSNumber    *, itemMarginTop);
AAPropSetFuncImplementation(AALegend, AAItemStyle *, itemStyle);

@end
