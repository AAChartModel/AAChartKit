//
//  AALang.m
//  AAChartKitDemo
//
//  Created by AnAn on 2020/7/17.
//  Copyright © 2020 AnAn. All rights reserved.
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

#import "AALang.h"

@implementation AALang

AAPropSetFuncImplementation(AALang, NSString    *, noData) //没有数据
AAPropSetFuncImplementation(AALang, NSNumber    *, numericSymbolMagnitude) //国际单位符基数
AAPropSetFuncImplementation(AALang, NSArray<NSString *>    *, numericSymbols) //国际单位符
AAPropSetFuncImplementation(AALang, NSString    *, resetZoom) // 重置缩放比例
AAPropSetFuncImplementation(AALang, NSString    *, thousandsSep) //千分号

@end
