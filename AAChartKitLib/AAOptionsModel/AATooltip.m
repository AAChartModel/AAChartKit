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
AAPropSetFuncImplementation(AATooltip, BOOL,       enabled);
AAPropSetFuncImplementation(AATooltip, NSString *, headerFormat);
AAPropSetFuncImplementation(AATooltip, NSString *, pointFormat);
AAPropSetFuncImplementation(AATooltip, NSString *, footerFormat);
AAPropSetFuncImplementation(AATooltip, BOOL,       shared);
AAPropSetFuncImplementation(AATooltip, BOOL,       crosshairs);
//AAPropSetFuncImplementation(AATooltip, BOOL , useHTML);
AAPropSetFuncImplementation(AATooltip, NSString *, valueSuffix);
//AAPropSetFuncImplementation(AATooltip, BOOL,       followTouchMove);


@end
