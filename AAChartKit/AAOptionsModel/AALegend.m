//
//  AALegend.m
//  AAChartKit
//
//  Created by An An on 17/1/6.
//  Copyright © 2017年 An An. All rights reserved.
//
//*************** ...... SOURCE CODE ...... ***************
//***...................................................***
//*** https://github.com/AAChartModel/AAChartKit        ***
//*** https://github.com/AAChartModel/AAChartKit-Swift  ***
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
 * StackOverflow : https://stackoverflow.com/users/12302132/codeforu
 * JianShu       : https://www.jianshu.com/u/f1e6753d4254
 * SegmentFault  : https://segmentfault.com/u/huanghunbieguan
 *
 * -------------------------------------------------------------------------------
 
 */

#import "AALegend.h"

@implementation AALegend

AAPropSetFuncImplementation(AALegend, AAChartLayoutType,        layout)
AAPropSetFuncImplementation(AALegend, AAChartAlignType,         align)
AAPropSetFuncImplementation(AALegend, AAChartVerticalAlignType, verticalAlign)
AAPropSetFuncImplementation(AALegend, BOOL,          enabled) 
AAPropSetFuncImplementation(AALegend, NSString    *, borderColor) 
AAPropSetFuncImplementation(AALegend, NSNumber    *, borderWidth) 
AAPropSetFuncImplementation(AALegend, NSNumber    *, itemMarginTop)
AAPropSetFuncImplementation(AALegend, NSNumber    *, itemMarginBottom)
AAPropSetFuncImplementation(AALegend, AAStyle     *, itemStyle)
AAPropSetFuncImplementation(AALegend, NSNumber    *, symbolHeight)//标志高度
AAPropSetFuncImplementation(AALegend, NSNumber    *, symbolPadding)//标志后距
AAPropSetFuncImplementation(AALegend, NSNumber    *, symbolRadius)//图标圆角
AAPropSetFuncImplementation(AALegend, NSNumber    *, symbolWidth)//图标宽度
AAPropSetFuncImplementation(AALegend, NSNumber    *, x) 
AAPropSetFuncImplementation(AALegend, NSNumber    *, y)
AAPropSetFuncImplementation(AALegend, BOOL,          floating)
AAPropSetFuncImplementation(AALegend, NSString    *, labelFormat)//图例标签格式化字符串

@end


#pragma clang diagnostic push
#pragma clang diagnostic ignored "-Wdeprecated-implementations"

@implementation AAItemStyle

AAPropSetFuncImplementation(AAItemStyle, NSString *, color)
AAPropSetFuncImplementation(AAItemStyle, NSString *, cursor)
AAPropSetFuncImplementation(AAItemStyle, NSString *, fontSize)
AAPropSetFuncImplementation(AAItemStyle, NSString *, fontWeight)

@end

#pragma clang diagnostic pop

