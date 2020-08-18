//
//  AAChart.h
//  AAChartKit
//
//  Created by An An on 17/1/5.
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
 * JianShu       : https://www.jianshu.com/u/f1e6753d4254
 * SegmentFault  : https://segmentfault.com/u/huanghunbieguan
 *
 * -------------------------------------------------------------------------------
 
 */



#import <Foundation/Foundation.h>
#import "AAGlobalMacro.h"

@class AAAnimation, AAScrollablePlotArea, AAResetZoomButton;

@interface AAChart : NSObject

AAPropStatementAndPropSetFuncStatement(copy,   AAChart, NSString    *, type)
AAPropStatementAndPropSetFuncStatement(strong, AAChart, NSString    *, backgroundColor)
AAPropStatementAndPropSetFuncStatement(copy,   AAChart, NSString    *, plotBackgroundImage) //指定绘图区背景图片的地址。如果需要设置整个图表的背景，请通过 CSS 来给容器元素（div）设置背景图。另外如果需要在导出图片中包含这个背景图，要求这个地址是公网可以访问的地址（包含可以访问且是绝对路径）。
AAPropStatementAndPropSetFuncStatement(copy,   AAChart, NSString    *, pinchType) 
AAPropStatementAndPropSetFuncStatement(assign, AAChart, BOOL,          panning) 
//AAPropStatementAndPropSetFuncStatement(copy,   AAChart, NSString    *, panKey) 
AAPropStatementAndPropSetFuncStatement(assign, AAChart, BOOL,          polar) 
AAPropStatementAndPropSetFuncStatement(strong, AAChart, AAAnimation *, animation) //设置启用动画的时间和类型
AAPropStatementAndPropSetFuncStatement(assign, AAChart, BOOL,          inverted)
AAPropStatementAndPropSetFuncStatement(strong, AAChart, NSArray     *, margin)//  图表外边缘和绘图区域之间的边距。 数组中的数字分别表示顶部，右侧，底部和左侧 ([👆,👉,👇,👈])。 也可以使用 marginTop，marginRight，marginBottom 和 marginLeft 来设置某一个方向的边距。
AAPropStatementAndPropSetFuncStatement(strong, AAChart, NSNumber    *, marginTop) //👆
AAPropStatementAndPropSetFuncStatement(strong, AAChart, NSNumber    *, marginRight) //👉
AAPropStatementAndPropSetFuncStatement(strong, AAChart, NSNumber    *, marginBottom) //👇
AAPropStatementAndPropSetFuncStatement(strong, AAChart, NSNumber    *, marginLeft) //👈
AAPropStatementAndPropSetFuncStatement(strong, AAChart, AAScrollablePlotArea *, scrollablePlotArea)
AAPropStatementAndPropSetFuncStatement(strong, AAChart, AAResetZoomButton *, resetZoomButton)

@end


//Refer to online API document: https://api.highcharts.com/highcharts/chart.scrollablePlotArea
@interface AAScrollablePlotArea : NSObject

AAPropStatementAndPropSetFuncStatement(strong, AAScrollablePlotArea, NSNumber *, minHeight)
AAPropStatementAndPropSetFuncStatement(strong, AAScrollablePlotArea, NSNumber *, minWidth)
AAPropStatementAndPropSetFuncStatement(strong, AAScrollablePlotArea, NSNumber *, opacity)
AAPropStatementAndPropSetFuncStatement(strong, AAScrollablePlotArea, NSNumber *, scrollPositionX)
AAPropStatementAndPropSetFuncStatement(strong, AAScrollablePlotArea, NSNumber *, scrollPositionY)

@end


@class AAPosition;

@interface AAResetZoomButton : NSObject

AAPropStatementAndPropSetFuncStatement(strong, AAResetZoomButton, AAPosition   *, position)
AAPropStatementAndPropSetFuncStatement(copy  , AAResetZoomButton, NSString     *, relativeTo)
AAPropStatementAndPropSetFuncStatement(strong, AAResetZoomButton, NSDictionary *, theme)

@end

