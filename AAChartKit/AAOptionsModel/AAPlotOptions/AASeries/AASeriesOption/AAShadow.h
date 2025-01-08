//
//  AAShadow.h
//  AAChartKit-ProDemo
//
//  Created by AnAn on 2020/7/16.
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

#import <Foundation/Foundation.h>

@interface AAShadow : NSObject

AAPropStatementAndPropSetFuncStatement(strong, AAShadow, NSString *, color)
AAPropStatementAndPropSetFuncStatement(strong, AAShadow, NSNumber *, offsetX)
AAPropStatementAndPropSetFuncStatement(strong, AAShadow, NSNumber *, offsetY)
AAPropStatementAndPropSetFuncStatement(strong, AAShadow, NSNumber *, opacity)
AAPropStatementAndPropSetFuncStatement(strong, AAShadow, NSNumber *, width)

@end
