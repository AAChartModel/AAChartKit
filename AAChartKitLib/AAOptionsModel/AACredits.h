//
//  AACredits.h
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
 * StackOverflow : https://stackoverflow.com/users/7842508/codeforu
 * JianShu       : https://www.jianshu.com/u/f1e6753d4254
 * SegmentFault  : https://segmentfault.com/u/huanghunbieguan
 *
 * -------------------------------------------------------------------------------
 
 */

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@class AAPosition, AAStyle;

@interface AACredits : NSObject

AAPropStatementAndPropSetFuncStatement(assign, AACredits, BOOL,          enabled)
AAPropStatementAndPropSetFuncStatement(copy,   AACredits, NSString    *, href)
AAPropStatementAndPropSetFuncStatement(strong, AACredits, AAPosition  *, position)
AAPropStatementAndPropSetFuncStatement(strong, AACredits, AAStyle     *, style)
AAPropStatementAndPropSetFuncStatement(copy,   AACredits, NSString    *, text)

@end


@interface AAPosition : NSObject

AAPropStatementAndPropSetFuncStatement(copy,   AAPosition, NSString    *, align)
AAPropStatementAndPropSetFuncStatement(copy,   AAPosition, NSString    *, verticalAlign)
AAPropStatementAndPropSetFuncStatement(strong, AAPosition, NSNumber    *, x)
AAPropStatementAndPropSetFuncStatement(strong, AAPosition, NSNumber    *, y)

@end

NS_ASSUME_NONNULL_END
