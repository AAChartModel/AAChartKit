//
//  AABar.m
//  AAChartKit
//
//  Created by An An on 17/1/19.
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
 * StackOverflow : https://stackoverflow.com/users/12302132/codeforu
 * JianShu       : https://www.jianshu.com/u/f1e6753d4254
 * SegmentFault  : https://segmentfault.com/u/huanghunbieguan
 *
 * -------------------------------------------------------------------------------
 
 */

#import "AABar.h"

@implementation AABar

- (instancetype)init {
    self = [super init];
    if (self) {
        _grouping = true;
    }
    return self;
}

AAPropSetFuncImplementation(AABar, NSString *,     name)
AAPropSetFuncImplementation(AABar, NSArray  *,     data)
AAPropSetFuncImplementation(AABar, NSString *,     color)
AAPropSetFuncImplementation(AABar, BOOL,           grouping)
AAPropSetFuncImplementation(AABar, NSNumber *,     pointPadding)
AAPropSetFuncImplementation(AABar, NSNumber *,     pointPlacement)
AAPropSetFuncImplementation(AABar, NSNumber *,     groupPadding)
AAPropSetFuncImplementation(AABar, NSNumber *,     borderWidth)
AAPropSetFuncImplementation(AABar, BOOL ,          colorByPoint)
AAPropSetFuncImplementation(AABar, AADataLabels *, dataLabels)
AAPropSetFuncImplementation(AABar, NSString *,     stacking)
AAPropSetFuncImplementation(AABar, NSNumber *,     borderRadius)
AAPropSetFuncImplementation(AABar, NSNumber *,     yAxis)

@end
