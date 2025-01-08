//
//  AABoxplot.h
//  AAChartKit
//
// Created by AnAn on 2022/8/29.
// Copyright (c) 2022 An An. All rights reserved.
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

#import <Foundation/Foundation.h>

@interface AABoxplot : NSObject

AAPropStatementAndPropSetFuncStatement(copy,   AABoxplot, NSString *, boxDashStyle)
AAPropStatementAndPropSetFuncStatement(strong, AABoxplot, NSString *, fillColor)
AAPropStatementAndPropSetFuncStatement(strong, AABoxplot, NSNumber *, lineWidth)
AAPropStatementAndPropSetFuncStatement(strong, AABoxplot, NSString *, medianColor)
AAPropStatementAndPropSetFuncStatement(copy,   AABoxplot, NSString *, medianDashStyle)
AAPropStatementAndPropSetFuncStatement(strong, AABoxplot, NSNumber *, medianWidth)
AAPropStatementAndPropSetFuncStatement(strong, AABoxplot, NSString *, stemColor)
AAPropStatementAndPropSetFuncStatement(copy,   AABoxplot, NSString *, stemDashStyle)
AAPropStatementAndPropSetFuncStatement(strong, AABoxplot, NSNumber *, stemWidth)
AAPropStatementAndPropSetFuncStatement(strong, AABoxplot, NSString *, whiskerColor)
AAPropStatementAndPropSetFuncStatement(copy,   AABoxplot, NSString *, whiskerDashStyle)
AAPropStatementAndPropSetFuncStatement(copy,   AABoxplot, NSString *, whiskerLength)
AAPropStatementAndPropSetFuncStatement(strong, AABoxplot, NSNumber *, whiskerWidth)

@end
