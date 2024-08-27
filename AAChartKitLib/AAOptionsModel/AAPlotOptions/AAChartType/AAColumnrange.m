//
//  AAColumnrange.m
//  AAChartKitDemo
//
//  Created by An An on 2021/7/20.
//  Copyright © 2021 An An. All rights reserved.
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

#import "AAColumnrange.h"

@implementation AAColumnrange

- (instancetype)init {
    self = [super init];
    if (self) {
        _grouping = true;
    }
    return self;
}

AAPropSetFuncImplementation(AAColumnrange, NSNumber *,     borderRadius)
AAPropSetFuncImplementation(AAColumnrange, NSNumber *,     borderWidth)
AAPropSetFuncImplementation(AAColumnrange, AADataLabels *, dataLabels)
AAPropSetFuncImplementation(AAColumnrange, NSNumber *,     groupPadding) //Padding between each value groups, in x axis units. default：0.2.
AAPropSetFuncImplementation(AAColumnrange, BOOL,           grouping) //Whether to group non-stacked columns or to let them render independent of each other. Non-grouped columns will be laid out individually and overlap each other. default：true.
AAPropSetFuncImplementation(AAColumnrange, NSNumber *,     pointPadding) //Padding between each column or bar, in x axis units. default：0.1.
AAPropSetFuncImplementation(AAColumnrange, NSNumber *,     pointPlacement) //Padding between each column or bar, in x axis units. default：0.1.

@end
