//
//  AAXAxis.h
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
 * JianShu       : http://www.jianshu.com/u/f1e6753d4254
 * SegmentFault  : https://segmentfault.com/u/huanghunbieguan
 *
 * -------------------------------------------------------------------------------
 
 */



#import <Foundation/Foundation.h>

@class AALabels,AACrosshair;

@interface AAXAxis : NSObject


AAPropStatementAndPropSetFuncStatement(strong, AAXAxis, NSArray  *, categories) 
AAPropStatementAndPropSetFuncStatement(assign, AAXAxis, BOOL,       reversed) 
AAPropStatementAndPropSetFuncStatement(strong, AAXAxis, NSNumber *, lineWidth) //x轴轴线宽度
AAPropStatementAndPropSetFuncStatement(copy,   AAXAxis, NSString *, lineColor) //x轴轴线线颜色
AAPropStatementAndPropSetFuncStatement(strong, AAXAxis, NSNumber *, max)  //x轴最大值
AAPropStatementAndPropSetFuncStatement(strong, AAXAxis, NSNumber *, min)  //x轴最小值（设置为0就不会有负数）
AAPropStatementAndPropSetFuncStatement(copy,   AAXAxis, NSString *, tickColor) //x轴轴线下方刻度线颜色
AAPropStatementAndPropSetFuncStatement(strong, AAXAxis, NSNumber *, gridLineWidth) //x轴网格线宽度
AAPropStatementAndPropSetFuncStatement(copy,   AAXAxis, NSString *, gridLineColor) //x轴网格线颜色
AAPropStatementAndPropSetFuncStatement(strong, AAXAxis, AALabels *, labels) //用于设置 x 轴文字相关的
AAPropStatementAndPropSetFuncStatement(assign, AAXAxis, BOOL ,      visible) //用于设置 x 轴以及 x 轴文字是否显示
AAPropStatementAndPropSetFuncStatement(assign, AAXAxis, BOOL ,      startOnTick) //Whether to force the axis to start on a tick. Use this option with the minPadding option to control the axis start. 默认是：false.
AAPropStatementAndPropSetFuncStatement(strong, AAXAxis, NSNumber *, tickInterval) //x轴刻度点间隔数(设置每隔几个点显示一个 X轴的内容)
AAPropStatementAndPropSetFuncStatement(strong, AAXAxis, AACrosshair *, crosshair)  //准星线样式设置
AAPropStatementAndPropSetFuncStatement(copy,   AAXAxis, NSString *, tickmarkPlacement) //本参数只对分类轴有效。 当值为 on 时刻度线将在分类上方显示；当值为 between 时，刻度线将在两个分类中间显示。当 tickInterval 为 1 时，默认是 between，其他情况默认是 on。 默认是：null.



//lineWidth :0,
//tickWidth:0,
//labels:{
//enabled:false 
//}

//个人吐槽日记:(想不到一个简单的属性修饰词使用错误竟然造成了这么严重的后果,因为是复制粘贴,所以一开始我的属性修饰词用的是 assign, 救国造成的诡异的问题就是 crosshair 莫名其妙的 变成了 AAStyle 类型,浪费了我一下午好几个小时时间,真的很心塞啊,为什么要犯这种低级的智障错误呢???(貌似是从 AAYAxis 类中的布尔属性复制粘贴过来的))
@end
