//
//  AATooltip.h
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

@class AAStyle, AADateTimeLabelFormats;

@interface AATooltip : NSObject

AAPropStatementAndPropSetFuncStatement(assign, AATooltip, BOOL,       animation) //是否启用动画是否启用动画(设置 animation == false,禁用 tooltip 动画能够在一定程度上节省程序的计算资源,提高运行效率)
AAPropStatementAndPropSetFuncStatement(copy,   AATooltip, NSString *, backgroundColor) //背景色
AAPropStatementAndPropSetFuncStatement(copy,   AATooltip, NSString *, borderColor) //边框颜色
AAPropStatementAndPropSetFuncStatement(strong, AATooltip, NSNumber *, borderRadius) //边框的圆角半径
AAPropStatementAndPropSetFuncStatement(strong, AATooltip, NSNumber *, borderWidth) //边框宽度
AAPropStatementAndPropSetFuncStatement(strong, AATooltip, AAStyle  *, style) //为提示框添加CSS样式。提示框同样能够通过 CSS 类 .highcharts-tooltip 来设定样式。 默认是：@{@"color":@"#333333",@"cursor":@"default",@"fontSize":@"12px",@"pointerEvents":@"none",@"whiteSpace":@"nowrap" }
AAPropStatementAndPropSetFuncStatement(assign, AATooltip, BOOL,       enabled)
AAPropStatementAndPropSetFuncStatement(assign, AATooltip, BOOL,       useHTML) 
AAPropStatementAndPropSetFuncStatement(copy,   AATooltip, NSString *, formatter) 
AAPropStatementAndPropSetFuncStatement(copy,   AATooltip, NSString *, headerFormat) 
AAPropStatementAndPropSetFuncStatement(copy,   AATooltip, NSString *, pointFormat)
AAPropStatementAndPropSetFuncStatement(copy,   AATooltip, NSString *, pointFormatter)
AAPropStatementAndPropSetFuncStatement(copy,   AATooltip, NSString *, footerFormat) 
AAPropStatementAndPropSetFuncStatement(strong, AATooltip, NSNumber *, valueDecimals) //设置取值精确到小数点后几位
AAPropStatementAndPropSetFuncStatement(copy,   AATooltip, NSString *, shape)
AAPropStatementAndPropSetFuncStatement(assign, AATooltip, BOOL,       shared)
AAPropStatementAndPropSetFuncStatement(copy,   AATooltip, NSString *, valuePrefix)
AAPropStatementAndPropSetFuncStatement(copy,   AATooltip, NSString *, valueSuffix)
AAPropStatementAndPropSetFuncStatement(assign, AATooltip, BOOL,       followPointer)
AAPropStatementAndPropSetFuncStatement(assign, AATooltip, BOOL,       followTouchMove) //在触摸设备上，tooltip.followTouchMove选项为true（默认）时，平移需要两根手指。若要允许用一根手指平移，请将followTouchMove设置为false。
AAPropStatementAndPropSetFuncStatement(assign, AATooltip, BOOL,       shadow)
AAPropStatementAndPropSetFuncStatement(strong, AATooltip, NSNumber *, padding) //设置取值精确到小数点后几位
AAPropStatementAndPropSetFuncStatement(copy,   AATooltip, NSString *, positioner)
AAPropStatementAndPropSetFuncStatement(strong, AATooltip, NSNumber *, hideDelay) //提示框隐藏延时: 当鼠标移出数据点或者图表后，数据提示框会在设定的延迟时间后消失 默认是：500.
AAPropStatementAndPropSetFuncStatement(strong, AATooltip, AADateTimeLabelFormats  *, dateTimeLabelFormats)

@end
