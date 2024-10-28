//
//  AAPane.m
//  AAChartKitDemo
//
//  Created by AnAn on 2020/5/9.
//  Copyright © 2020 An An. All rights reserved.
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

#import "AAPane.h"

@implementation AAPane

AAPropSetFuncImplementation(AAPane, NSArray<AABackgroundElement *> *, background)
AAPropSetFuncImplementation(AAPane, NSArray  *, center)
AAPropSetFuncImplementation(AAPane, NSNumber *, endAngle)
AAPropSetFuncImplementation(AAPane, NSNumber *, size)
AAPropSetFuncImplementation(AAPane, NSNumber *, startAngle)

@end


@implementation AABackgroundElement

AAPropSetFuncImplementation(AABackgroundElement, NSString *, backgroundColor)
AAPropSetFuncImplementation(AABackgroundElement, NSString *, borderColor)
AAPropSetFuncImplementation(AABackgroundElement, NSNumber *, borderWidth)
AAPropSetFuncImplementation(AABackgroundElement, NSString *, className)
AAPropSetFuncImplementation(AABackgroundElement, NSNumber *, innerRadius)
AAPropSetFuncImplementation(AABackgroundElement, NSNumber *, outerRadius)
AAPropSetFuncImplementation(AABackgroundElement, NSString *, shape)

@end
