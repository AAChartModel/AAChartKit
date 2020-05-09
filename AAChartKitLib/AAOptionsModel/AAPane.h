//
//  AAPane.h
//  AAChartKitDemo
//
//  Created by AnAn on 2020/5/9.
//  Copyright © 2020 An An. All rights reserved.
//
//*************** ...... SOURCE CODE ...... ***************
//***...................................................***
//***    https://github.com/AAChartModel/AAChartKit     ***
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
 * StackOverflow : https://stackoverflow.com/users/7842508/codeforu
 * JianShu       : https://www.jianshu.com/u/f1e6753d4254
 * SegmentFault  : https://segmentfault.com/u/huanghunbieguan
 *
 * -------------------------------------------------------------------------------
 
 */

#import <Foundation/Foundation.h>
@class AABackground;
NS_ASSUME_NONNULL_BEGIN

//background: 背景
//center: 中心
//endAngle: 结束角度
//size: 大小
//startAngle: 开始角度


@interface AAPane : NSObject

AAPropStatementAndPropSetFuncStatement(strong, AAPane, AABackground *, background)
AAPropStatementAndPropSetFuncStatement(strong, AAPane, NSArray  *, center)
AAPropStatementAndPropSetFuncStatement(strong, AAPane, NSNumber *, endAngle)
AAPropStatementAndPropSetFuncStatement(strong, AAPane, NSNumber *, size)
AAPropStatementAndPropSetFuncStatement(strong, AAPane, NSNumber *, startAngle)

@end

//backgroundColor: 背景颜色
//borderColor: 边框颜色
//borderWidth: 边框宽度
//className: 类名
//innerRadius: 内半径
//outerRadius: 外半径
//shape: 形状

@interface AABackground : NSObject

AAPropStatementAndPropSetFuncStatement(copy  , AABackground, NSString *, backgroundColor)
AAPropStatementAndPropSetFuncStatement(copy  , AABackground, NSString *, borderColor)
AAPropStatementAndPropSetFuncStatement(strong, AABackground, NSNumber *, borderWidth)
AAPropStatementAndPropSetFuncStatement(copy  , AABackground, NSNumber *, className)
AAPropStatementAndPropSetFuncStatement(strong, AABackground, NSNumber *, innerRadius)
AAPropStatementAndPropSetFuncStatement(strong, AABackground, NSNumber *, outerRadius)
AAPropStatementAndPropSetFuncStatement(copy  , AABackground, NSString *, shape)

@end

NS_ASSUME_NONNULL_END
