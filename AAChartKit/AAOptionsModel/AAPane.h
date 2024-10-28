//
//  AAPane.h
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

#import <Foundation/Foundation.h>

@class AABackgroundElement;

@interface AAPane : NSObject

AAPropStatementAndPropSetFuncStatement(strong, AAPane, NSArray<AABackgroundElement *> *, background)
AAPropStatementAndPropSetFuncStatement(strong, AAPane, NSArray  *, center)
AAPropStatementAndPropSetFuncStatement(strong, AAPane, NSNumber *, endAngle)
AAPropStatementAndPropSetFuncStatement(strong, AAPane, NSNumber *, size)
AAPropStatementAndPropSetFuncStatement(strong, AAPane, NSNumber *, startAngle)

@end


@interface AABackgroundElement : NSObject

AAPropStatementAndPropSetFuncStatement(copy  , AABackgroundElement, NSString *, backgroundColor)
AAPropStatementAndPropSetFuncStatement(copy  , AABackgroundElement, NSString *, borderColor)
AAPropStatementAndPropSetFuncStatement(strong, AABackgroundElement, NSNumber *, borderWidth)
AAPropStatementAndPropSetFuncStatement(copy  , AABackgroundElement, NSString *, className)
AAPropStatementAndPropSetFuncStatement(strong, AABackgroundElement, NSNumber *, innerRadius)
AAPropStatementAndPropSetFuncStatement(strong, AABackgroundElement, NSNumber *, outerRadius)
AAPropStatementAndPropSetFuncStatement(copy  , AABackgroundElement, NSString *, shape)

@end
