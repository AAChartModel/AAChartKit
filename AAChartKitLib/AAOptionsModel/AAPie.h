//
//  AAPie.h
//  AAChartKit
//
//  Created by An An on 17/1/9.
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

#import <Foundation/Foundation.h>

@class AADataLabels;

@interface AAPie : NSObject

AAPropStatementAndPropSetFuncStatement(strong, AAPie, NSNumber     *, size)
AAPropStatementAndPropSetFuncStatement(assign, AAPie, BOOL,           allowPointSelect)
AAPropStatementAndPropSetFuncStatement(copy,   AAPie, NSString     *, cursor)
AAPropStatementAndPropSetFuncStatement(strong, AAPie, AADataLabels *, dataLabels)
AAPropStatementAndPropSetFuncStatement(assign, AAPie, BOOL,           showInLegend)
AAPropStatementAndPropSetFuncStatement(strong, AAPie, NSNumber     *, startAngle)
AAPropStatementAndPropSetFuncStatement(strong, AAPie, NSNumber     *, endAngle)
AAPropStatementAndPropSetFuncStatement(strong, AAPie, NSNumber     *, depth)

@end
