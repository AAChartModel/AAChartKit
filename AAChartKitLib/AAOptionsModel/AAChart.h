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
 * StackOverflow : https://stackoverflow.com/users/12302132/codeforu
 * JianShu       : https://www.jianshu.com/u/f1e6753d4254
 * SegmentFault  : https://segmentfault.com/u/huanghunbieguan
 *
 * -------------------------------------------------------------------------------
 
 */



#import <Foundation/Foundation.h>
#import "AAGlobalMacro.h"

@class AAAnimation, AAScrollablePlotArea, AAResetZoomButton, AAChartEvents;

@interface AAChart : NSObject

AAPropStatementAndPropSetFuncStatement(copy,   AAChart, NSString    *, type)
AAPropStatementAndPropSetFuncStatement(strong, AAChart, NSString    *, backgroundColor)
AAPropStatementAndPropSetFuncStatement(copy,   AAChart, NSString    *, plotBackgroundImage) //指定绘图区背景图片的地址。如果需要设置整个图表的背景，请通过 CSS 来给容器元素（div）设置背景图。另外如果需要在导出图片中包含这个背景图，要求这个地址是公网可以访问的地址（包含可以访问且是绝对路径）。
AAPropStatementAndPropSetFuncStatement(copy,   AAChart, NSString    *, pinchType) 
AAPropStatementAndPropSetFuncStatement(assign, AAChart, BOOL,          panning) 
AAPropStatementAndPropSetFuncStatement(copy,   AAChart, NSString    *, panKey) //设定平移按键。按住设定的按键时鼠标滑动是对图表进行平移操作。（默认是缩放操作，通过此按键可以实现在缩放和平移之间的切换）
AAPropStatementAndPropSetFuncStatement(assign, AAChart, BOOL,          polar) 
AAPropStatementAndPropSetFuncStatement(strong, AAChart, AAAnimation *, animation) //设置启用动画的时间和类型
AAPropStatementAndPropSetFuncStatement(assign, AAChart, BOOL,          inverted)
AAPropStatementAndPropSetFuncStatement(strong, AAChart, NSArray     *, margin)// 图表外边缘和绘图区域之间的边距。 数组中的数字分别表示顶部，右侧，底部和左侧 ([👆,👉,👇,👈])。 也可以使用 marginTop，marginRight，marginBottom 和 marginLeft 来设置某一个方向的边距。默认值为[null]
AAPropStatementAndPropSetFuncStatement(strong, AAChart, NSNumber    *, marginTop) //👆
AAPropStatementAndPropSetFuncStatement(strong, AAChart, NSNumber    *, marginRight) //👉
AAPropStatementAndPropSetFuncStatement(strong, AAChart, NSNumber    *, marginBottom) //👇
AAPropStatementAndPropSetFuncStatement(strong, AAChart, NSNumber    *, marginLeft) //👈
AAPropStatementAndPropSetFuncStatement(strong, AAChart, NSArray     *, spacing) // 图表的内边距，指图表外边缘和绘图区之间的距离，数组中的数字分别表示顶部，右侧，底部和左侧([👆,👉,👇,👈])。可以使用选项 spacingTop，spacingRight，spacingBottom 和 spacingLeft 来指定某一个内边距。 默认是：[10, 10, 15, 10].
AAPropStatementAndPropSetFuncStatement(strong, AAChart, NSNumber    *, spacingTop) //👆
AAPropStatementAndPropSetFuncStatement(strong, AAChart, NSNumber    *, spacingRight) //👉
AAPropStatementAndPropSetFuncStatement(strong, AAChart, NSNumber    *, spacingBottom) //👇
AAPropStatementAndPropSetFuncStatement(strong, AAChart, NSNumber    *, spacingLeft) //👈
AAPropStatementAndPropSetFuncStatement(strong, AAChart, AAScrollablePlotArea *, scrollablePlotArea)
AAPropStatementAndPropSetFuncStatement(strong, AAChart, AAResetZoomButton *, resetZoomButton)
AAPropStatementAndPropSetFuncStatement(strong, AAChart, AAChartEvents *, events)


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


@interface AAChartEvents : NSObject

AAPropStatementAndPropSetFuncStatement(copy  , AAChartEvents, NSString     *, click)
AAPropStatementAndPropSetFuncStatement(copy  , AAChartEvents, NSString     *, load)
AAPropStatementAndPropSetFuncStatement(copy  , AAChartEvents, NSString     *, redraw)
AAPropStatementAndPropSetFuncStatement(copy  , AAChartEvents, NSString     *, render)
AAPropStatementAndPropSetFuncStatement(copy  , AAChartEvents, NSString     *, selection)

@end

