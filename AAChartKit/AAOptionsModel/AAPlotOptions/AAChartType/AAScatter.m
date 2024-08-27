//
//  AAScatter.m
//  AAChartKitDemo
//
//  Created by AnAn on 2022/9/4.
//  Copyright © 2022 An An. All rights reserved.
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
 * StackOverflow : https://stackoverflow.com/users/12302132/codeforu
 * JianShu       : https://www.jianshu.com/u/f1e6753d4254
 * SegmentFault  : https://segmentfault.com/u/huanghunbieguan
 *
 * -------------------------------------------------------------------------------
 
 */

#import "AAScatter.h"

@implementation AAScatter

AAPropSetFuncImplementation(AAScatter, NSNumber *, lineWidth)
AAPropSetFuncImplementation(AAScatter, NSString *, lineColor)
AAPropSetFuncImplementation(AAScatter, NSString *, dashStyle)
AAPropSetFuncImplementation(AAScatter, id        , enableMouseTracking)
AAPropSetFuncImplementation(AAScatter, NSString *, linkedTo)
AAPropSetFuncImplementation(AAScatter, AAStates *, states)
AAPropSetFuncImplementation(AAScatter, AAMarker *, marker)

@end
