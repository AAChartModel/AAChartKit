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
 * StackOverflow : https://stackoverflow.com/users/12302132/codeforu
 * JianShu       : https://www.jianshu.com/u/f1e6753d4254
 * SegmentFault  : https://segmentfault.com/u/huanghunbieguan
 *
 * -------------------------------------------------------------------------------
 
 */



#import <Foundation/Foundation.h>
#import "AAChartAxisType.h"

@class AAAxisTitle, AALabels, AACrosshair, AAPlotBandsElement, AAPlotLinesElement, AADateTimeLabelFormats;

@interface AAXAxis : NSObject

AAPropStatementAndPropSetFuncStatement(strong, AAXAxis, NSString *, alternateGridColor) //间隔网格背景, 当指定该参数时，相邻刻度线之间会用对应的颜色来绘制颜色分辨带.
AAPropStatementAndPropSetFuncStatement(strong, AAXAxis, AAAxisTitle  *, title)
AAPropStatementAndPropSetFuncStatement(copy,   AAXAxis, AAChartAxisType, type)
AAPropStatementAndPropSetFuncStatement(strong, AAXAxis, AADateTimeLabelFormats  *, dateTimeLabelFormats)
AAPropStatementAndPropSetFuncStatement(strong, AAXAxis, NSArray<AAPlotBandsElement *>*, plotBands)
AAPropStatementAndPropSetFuncStatement(strong, AAXAxis, NSArray<AAPlotLinesElement *>*, plotLines)
AAPropStatementAndPropSetFuncStatement(strong, AAXAxis, NSArray  *, categories) 
AAPropStatementAndPropSetFuncStatement(assign, AAXAxis, BOOL,       reversed) 
AAPropStatementAndPropSetFuncStatement(strong, AAXAxis, NSNumber *, lineWidth) //x轴轴线宽度
AAPropStatementAndPropSetFuncStatement(strong, AAXAxis, NSString *, lineColor) //x轴轴线线颜色
AAPropStatementAndPropSetFuncStatement(strong, AAXAxis, NSNumber *, linkedTo)
AAPropStatementAndPropSetFuncStatement(strong, AAXAxis, NSNumber *, max)  //x轴最大值
AAPropStatementAndPropSetFuncStatement(strong, AAXAxis, NSNumber *, min)  //x轴最小值
AAPropStatementAndPropSetFuncStatement(strong, AAXAxis, NSNumber *, minPadding)
AAPropStatementAndPropSetFuncStatement(strong, AAXAxis, NSNumber *, minRange)
AAPropStatementAndPropSetFuncStatement(strong, AAXAxis, NSNumber *, minTickInterval) //最小间隔
AAPropStatementAndPropSetFuncStatement(strong, AAXAxis, NSNumber /*BOOL*/*, minorTicks) //是否显示次刻度线
AAPropStatementAndPropSetFuncStatement(strong, AAXAxis, NSString *, minorGridLineColor) //次网格线颜色
AAPropStatementAndPropSetFuncStatement(copy,   AAXAxis, NSString *, minorGridLineDashStyle) //次网格线条样式
AAPropStatementAndPropSetFuncStatement(strong, AAXAxis, NSNumber *, minorGridLineWidth) //次网格线宽度
AAPropStatementAndPropSetFuncStatement(strong, AAXAxis, NSString *, minorTickColor) //次刻度线颜色
AAPropStatementAndPropSetFuncStatement(strong, AAXAxis, NSNumber *, minorTickInterval)
AAPropStatementAndPropSetFuncStatement(strong, AAXAxis, NSNumber *, minorTickLength) //次刻度线长度
AAPropStatementAndPropSetFuncStatement(copy,   AAXAxis, NSString *, minorTickPosition) //次刻度线位置
AAPropStatementAndPropSetFuncStatement(strong, AAXAxis, NSNumber *, minorTickWidth) // 次刻度线宽度

AAPropStatementAndPropSetFuncStatement(strong, AAXAxis, NSNumber *, gridLineWidth) //x轴网格线宽度
AAPropStatementAndPropSetFuncStatement(strong, AAXAxis, NSString *, gridLineColor) //x轴网格线颜色
AAPropStatementAndPropSetFuncStatement(copy,   AAXAxis, NSString *, gridLineDashStyle) //x轴网格线样式
AAPropStatementAndPropSetFuncStatement(strong, AAXAxis, NSNumber *, gridZIndex) //网格线的层叠值（zIndex） 默认是：1.
AAPropStatementAndPropSetFuncStatement(strong, AAXAxis, NSNumber *, offset) //x轴垂直偏移
AAPropStatementAndPropSetFuncStatement(strong, AAXAxis, AALabels *, labels) //用于设置 x 轴文字相关的
AAPropStatementAndPropSetFuncStatement(assign, AAXAxis, BOOL ,      visible) //用于设置 x 轴以及 x 轴文字是否显示
AAPropStatementAndPropSetFuncStatement(assign, AAXAxis, BOOL,       opposite) //是否将坐标轴显示在对立面，默认情况下 x 轴是在图表的下方显示，y 轴是在左方，坐标轴显示在对立面后，x 轴是在上方显示，y 轴是在右方显示（即坐标轴会显示在对立面）。该配置一般是用于多坐标轴区分展示，另外在 Highstock 中，y 轴默认是在对立面显示的。 默认是：false.
AAPropStatementAndPropSetFuncStatement(assign, AAXAxis, BOOL ,      startOnTick) //Whether to force the axis to start on a tick. Use this option with the minPadding option to control the axis start. 默认是：false.
AAPropStatementAndPropSetFuncStatement(assign, AAXAxis, BOOL ,      endOnTick) //是否强制将坐标轴结束于刻度线，可以通过本属性及 maxPadding 来控制坐标轴的结束位置。 默认是：false.
AAPropStatementAndPropSetFuncStatement(strong, AAXAxis, AACrosshair *, crosshair)  //准星线样式设置
AAPropStatementAndPropSetFuncStatement(strong, AAXAxis, NSString *, tickColor) //x轴轴线下方刻度线颜色
AAPropStatementAndPropSetFuncStatement(strong, AAXAxis, NSNumber *, tickInterval) //x轴刻度点间隔数(设置每隔几个点显示一个 X轴的内容)
AAPropStatementAndPropSetFuncStatement(copy,   AAXAxis, NSString *, tickmarkPlacement) //本参数只对分类轴有效。 当值为 on 时刻度线将在分类上方显示；当值为 between 时，刻度线将在两个分类中间显示。当 tickInterval 为 1 时，默认是 between，其他情况默认是 on。 默认是：null.
AAPropStatementAndPropSetFuncStatement(strong, AAXAxis, NSNumber *, tickWidth) //坐标轴刻度线的宽度，设置为 0 时则不显示刻度线
AAPropStatementAndPropSetFuncStatement(strong, AAXAxis, NSNumber *, tickLength)//坐标轴刻度线的长度。 默认是：10.
AAPropStatementAndPropSetFuncStatement(copy,   AAXAxis, NSString *, tickPosition) //刻度线相对于轴线的位置，可用的值有 inside 和 outside，分别表示在轴线的内部和外部。 默认是：outside.
AAPropStatementAndPropSetFuncStatement(strong, AAXAxis, NSArray  *, tickPositions) //自定义 x 轴坐标（如：[@(0), @(25), @(50), @(75) , (100)]）


@end
