//
//  AAMarginConvenience.h
//  AAChartKitDemo
//
//  Created by An An on 2020/7/24.
//  Copyright © 2020 An An. All rights reserved.
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

#ifndef AAMarginConvenience_h
#define AAMarginConvenience_h

AACHARTKIT_STATIC_INLINE
NSArray * AAMargin(float marginTop,
                   float marginRight,
                   float marginBottom,
                   float marginLeft) {
    return @[
        @(marginTop),
        @(marginRight),
        @(marginBottom),
        @(marginLeft)
    ];
}

AACHARTKIT_STATIC_INLINE
NSArray * AAMarginTopBottom(float marginTop,
                            float marginBottom) {
    return @[
        @(marginTop),
        NSNull.null,
        @(marginBottom),
        NSNull.null,
    ];
}

AACHARTKIT_STATIC_INLINE
NSArray * AAMarginLeftRight(float marginLeft,
                            float marginRight) {
    return @[
        NSNull.null,
        @(marginRight),
        NSNull.null,
        @(marginLeft)
    ];
}

#endif /* AAMarginConvenience_h */
