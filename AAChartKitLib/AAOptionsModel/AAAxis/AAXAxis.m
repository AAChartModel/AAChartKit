//
//  AAXAxis.m
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
#import "AAXAxis.h"

@implementation AAXAxis

- (instancetype)init {
    self = [super init];
    if (self) {
        _visible = true;
    }
    return self;
}

AAPropSetFuncImplementation(AAXAxis, NSString *, alternateGridColor) //间隔网格背景, 当指定该参数时，相邻刻度线之间会用对应的颜色来绘制颜色分辨带.
AAPropSetFuncImplementation(AAXAxis, AAAxisTitle  *, title)
AAPropSetFuncImplementation(AAXAxis, AAChartAxisType, type)
AAPropSetFuncImplementation(AAXAxis, AADateTimeLabelFormats  *, dateTimeLabelFormats)
AAPropSetFuncImplementation(AAXAxis, NSArray<AAPlotBandsElement *>*, plotBands)
AAPropSetFuncImplementation(AAXAxis, NSArray<AAPlotLinesElement *>*, plotLines)
AAPropSetFuncImplementation(AAXAxis, NSArray  *, categories) 
AAPropSetFuncImplementation(AAXAxis, BOOL ,      reversed) 
AAPropSetFuncImplementation(AAXAxis, NSNumber *, lineWidth) //x轴轴线宽度
AAPropSetFuncImplementation(AAXAxis, NSString *, lineColor) //x轴轴线线颜色
AAPropSetFuncImplementation(AAXAxis, NSNumber *, linkedTo)
AAPropSetFuncImplementation(AAXAxis, NSNumber *, max)  //x轴最大值
AAPropSetFuncImplementation(AAXAxis, NSNumber *, min)  //x轴最小值（设置为0就不会有负数）
AAPropSetFuncImplementation(AAXAxis, NSNumber *, minPadding)
AAPropSetFuncImplementation(AAXAxis, NSNumber *, minRange)
AAPropSetFuncImplementation(AAXAxis, NSNumber *, minTickInterval) //最小间隔
AAPropSetFuncImplementation(AAXAxis, NSNumber /*BOOL*/*, minorTicks) //是否显示次刻度线
AAPropSetFuncImplementation(AAXAxis, NSString *, minorGridLineColor) //次网格线颜色
AAPropSetFuncImplementation(AAXAxis, NSString *, minorGridLineDashStyle) //次网格线条样式
AAPropSetFuncImplementation(AAXAxis, NSNumber *, minorGridLineWidth) //次网格线宽度
AAPropSetFuncImplementation(AAXAxis, NSString *, minorTickColor) //次刻度线颜色
AAPropSetFuncImplementation(AAXAxis, NSNumber *, minorTickInterval)
AAPropSetFuncImplementation(AAXAxis, NSNumber *, minorTickLength) //次刻度线长度
AAPropSetFuncImplementation(AAXAxis, NSString *, minorTickPosition) //次刻度线位置
AAPropSetFuncImplementation(AAXAxis, NSNumber *, minorTickWidth) // 次刻度线宽度

AAPropSetFuncImplementation(AAXAxis, NSNumber *, gridLineWidth) //x轴网格线宽度
AAPropSetFuncImplementation(AAXAxis, NSString *, gridLineColor) //x轴网格线颜色
AAPropSetFuncImplementation(AAXAxis, NSString *, gridLineDashStyle) //x轴网格线样式
AAPropSetFuncImplementation(AAXAxis, NSNumber *, gridZIndex) //网格线的层叠值（zIndex） 默认是：1.
AAPropSetFuncImplementation(AAXAxis, NSNumber *, offset) //x轴垂直偏移
AAPropSetFuncImplementation(AAXAxis, AALabels *, labels) 
AAPropSetFuncImplementation(AAXAxis, BOOL ,      visible)
AAPropSetFuncImplementation(AAXAxis, BOOL,       opposite) //是否将坐标轴显示在对立面，默认情况下 x 轴是在图表的下方显示，y 轴是在左方，坐标轴显示在对立面后，x 轴是在上方显示，y 轴是在右方显示（即坐标轴会显示在对立面）。该配置一般是用于多坐标轴区分展示，另外在 Highstock 中，y 轴默认是在对立面显示的。 默认是：false.
AAPropSetFuncImplementation(AAXAxis, BOOL ,      startOnTick) //Whether to force the axis to start on a tick. Use this option with the minPadding option to control the axis start. 默认是：false.
AAPropSetFuncImplementation(AAXAxis, BOOL ,      endOnTick) //是否强制将坐标轴结束于刻度线，可以通过本属性及 maxPadding 来控制坐标轴的结束位置。 默认是：false.
AAPropSetFuncImplementation(AAXAxis, AACrosshair*, crosshair)  //准星线样式设置
AAPropSetFuncImplementation(AAXAxis, NSString *, tickColor) //x轴轴线下方刻度线颜色
AAPropSetFuncImplementation(AAXAxis, NSNumber *, tickInterval) //x轴刻度点间隔数(设置每隔几个点显示一个 X轴的内容)
AAPropSetFuncImplementation(AAXAxis, NSString *, tickmarkPlacement) //本参数只对分类轴有效。 当值为 on 时刻度线将在分类上方显示；当值为 between 时，刻度线将在两个分类中间显示。当 tickInterval 为 1 时，默认是 between，其他情况默认是 on。 默认是：null.
AAPropSetFuncImplementation(AAXAxis, NSNumber *, tickWidth) //坐标轴刻度线的宽度，设置为 0 时则不显示刻度线
AAPropSetFuncImplementation(AAXAxis, NSNumber *, tickLength)//坐标轴刻度线的长度。 默认是：10.
AAPropSetFuncImplementation(AAXAxis, NSString *, tickPosition) //刻度线相对于轴线的位置，可用的值有 inside 和 outside，分别表示在轴线的内部和外部。 默认是：outside.
AAPropSetFuncImplementation(AAXAxis, NSArray  *, tickPositions) //自定义 x 轴坐标（如：[@(0), @(25), @(50), @(75) , (100)]）

@end
