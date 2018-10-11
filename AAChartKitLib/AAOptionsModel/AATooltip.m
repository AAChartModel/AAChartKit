//
//  AATooltip.m
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

#import "AATooltip.h"

@implementation AATooltip

//AAPropSetFuncImplementation(AATooltip, BOOL,       animation) //是否启用动画是否启用动画(设置 animation == false,禁用 tooltip 动画能够在一定程度上节省程序的计算资源,提高运行效率,但是在现如今移动设备的性能如此强劲的时代大背景下,节省的这一点计算资源基本上没有任何意义,所以我注释掉了这个属性)
AAPropSetFuncImplementation(AATooltip, NSString *, backgroundColor) //背景色
AAPropSetFuncImplementation(AATooltip, NSString *, borderColor) //边框颜色
AAPropSetFuncImplementation(AATooltip, NSNumber *, borderRadius) //边框的圆角半径
AAPropSetFuncImplementation(AATooltip, NSNumber *, borderWidth) //边框宽度
AAPropSetFuncImplementation(AATooltip, NSDictionary *, style) //为提示框添加CSS样式。提示框同样能够通过 CSS 类 .highcharts-tooltip 来设定样式。 默认是：@{@"color":@"#ffffff",@"cursor":@"default",@"fontSize":@"12px",@"pointerEvents":@"none",@"whiteSpace":@"nowrap" }

AAPropSetFuncImplementation(AATooltip, BOOL,       enabled) 
AAPropSetFuncImplementation(AATooltip, BOOL,       useHTML) 
AAPropSetFuncImplementation(AATooltip, NSString *, formatter) 
AAPropSetFuncImplementation(AATooltip, NSString *, headerFormat) 
AAPropSetFuncImplementation(AATooltip, NSString *, pointFormat) 
AAPropSetFuncImplementation(AATooltip, NSString *, footerFormat) 
AAPropSetFuncImplementation(AATooltip, NSNumber *, valueDecimals) //设置取值精确到小数点后几位
AAPropSetFuncImplementation(AATooltip, BOOL,       shared) 
AAPropSetFuncImplementation(AATooltip, BOOL,       crosshairs) 
AAPropSetFuncImplementation(AATooltip, NSString *, valueSuffix) 
//AAPropSetFuncImplementation(AATooltip, BOOL,       followTouchMove) 


@end
