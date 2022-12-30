//
//  AAYAxis.m
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

#import "AAYAxis.h"

AAChartYAxisGridLineInterpolationType const AAChartYAxisGridLineInterpolationTypeCircle  = @"circle";//圆形
AAChartYAxisGridLineInterpolationType const AAChartYAxisGridLineInterpolationTypePolygon = @"polygon";//多边形

@implementation AAYAxis

- (instancetype)init {
    self = [super init];
    if (self) {
        _visible = true;
    }
    return self;
}

AAPropSetFuncImplementation(AAYAxis, BOOL,       allowDecimals)  //y轴是否允许显示小数
AAPropSetFuncImplementation(AAYAxis, NSString *, alternateGridColor) //间隔网格背景, 当指定该参数时，相邻刻度线之间会用对应的颜色来绘制颜色分辨带.
AAPropSetFuncImplementation(AAYAxis, AAAxisTitle  *, title)
AAPropSetFuncImplementation(AAYAxis, AAChartAxisType, type)
AAPropSetFuncImplementation(AAYAxis, AADateTimeLabelFormats  *, dateTimeLabelFormats)
AAPropSetFuncImplementation(AAYAxis, NSArray<AAPlotBandsElement *>*, plotBands)
AAPropSetFuncImplementation(AAYAxis, NSArray<AAPlotLinesElement *>*, plotLines)
AAPropSetFuncImplementation(AAYAxis, NSArray  *, categories)
AAPropSetFuncImplementation(AAYAxis, BOOL,       reversed) 
AAPropSetFuncImplementation(AAYAxis, NSNumber *, gridLineWidth) 
AAPropSetFuncImplementation(AAYAxis, NSString *, gridLineColor)
AAPropSetFuncImplementation(AAYAxis, NSString *, gridLineDashStyle) //网格线线条样式，所有可用的线条样式参考：Highcharts线条样式
AAPropSetFuncImplementation(AAYAxis, NSNumber *, gridZIndex) //网格线的层叠值（zIndex） 默认是：1.
AAPropSetFuncImplementation(AAYAxis, AAChartYAxisGridLineInterpolationType, gridLineInterpolation)
AAPropSetFuncImplementation(AAYAxis, AALabels *, labels) 
AAPropSetFuncImplementation(AAYAxis, NSNumber *, lineWidth) //y轴线宽度
AAPropSetFuncImplementation(AAYAxis, NSString *, lineColor) // y 轴线颜色
AAPropSetFuncImplementation(AAYAxis, NSNumber *, offset) // y 轴线水平偏移

AAPropSetFuncImplementation(AAYAxis, NSNumber *, max)  //y轴最大值
AAPropSetFuncImplementation(AAYAxis, NSNumber *, min)  //y轴最小值（设置为0就不会有负数）
AAPropSetFuncImplementation(AAYAxis, NSNumber *, minPadding)  //Padding of the min value relative to the length of the axis. A padding of 0.05 will make a 100px axis 5px longer. This is useful when you don't want the lowest data value to appear on the edge of the plot area. 默认是：0.05.
AAPropSetFuncImplementation(AAYAxis, NSNumber *, minRange)
AAPropSetFuncImplementation(AAYAxis, NSNumber *, minTickInterval) //最小间隔
AAPropSetFuncImplementation(AAYAxis, NSString *, minorGridLineColor) //次网格线颜色
AAPropSetFuncImplementation(AAYAxis, NSString *, minorGridLineDashStyle) //次网格线条样式
AAPropSetFuncImplementation(AAYAxis, NSNumber *, minorGridLineWidth) //次网格线宽度
AAPropSetFuncImplementation(AAYAxis, NSString *, minorTickColor) //次刻度线颜色
AAPropSetFuncImplementation(AAYAxis, NSNumber *, minorTickInterval)
AAPropSetFuncImplementation(AAYAxis, NSNumber *, minorTickLength) //次刻度线长度
AAPropSetFuncImplementation(AAYAxis, NSString *, minorTickPosition) //次刻度线位置
AAPropSetFuncImplementation(AAYAxis, NSNumber *, minorTickWidth) // 次刻度线宽度

AAPropSetFuncImplementation(AAYAxis, BOOL,       visible)  //y轴是否允许显示
AAPropSetFuncImplementation(AAYAxis, BOOL,       opposite) //是否将坐标轴显示在对立面，默认情况下 x 轴是在图表的下方显示，y 轴是在左方，坐标轴显示在对立面后，x 轴是在上方显示，y 轴是在右方显示（即坐标轴会显示在对立面）。该配置一般是用于多坐标轴区分展示，另外在 Highstock 中，y 轴默认是在对立面显示的。 默认是：false.
AAPropSetFuncImplementation(AAYAxis, BOOL ,      startOnTick) //Whether to force the axis to start on a tick. Use this option with the minPadding option to control the axis start. 默认是：false.
AAPropSetFuncImplementation(AAYAxis, BOOL ,      endOnTick) //是否强制将坐标轴结束于刻度线，可以通过本属性及 maxPadding 来控制坐标轴的结束位置。 默认是：false.
AAPropSetFuncImplementation(AAYAxis, AACrosshair*, crosshair)  //准星线样式设置
AAPropSetFuncImplementation(AAYAxis, AALabels *, stackLabels)
AAPropSetFuncImplementation(AAYAxis, NSNumber *, tickAmount)//刻度总数
AAPropSetFuncImplementation(AAYAxis, NSString *, tickColor) // 刻度线颜色
AAPropSetFuncImplementation(AAYAxis, NSNumber *, tickInterval)
AAPropSetFuncImplementation(AAYAxis, NSNumber *, tickWidth) //坐标轴刻度线的宽度，设置为 0 时则不显示刻度线
AAPropSetFuncImplementation(AAYAxis, NSNumber *, tickLength)//坐标轴刻度线的长度。 默认是：10.
AAPropSetFuncImplementation(AAYAxis, NSString *, tickPosition) //刻度线相对于轴线的位置，可用的值有 inside 和 outside，分别表示在轴线的内部和外部。 默认是：outside.
AAPropSetFuncImplementation(AAYAxis, NSArray  *, tickPositions) //自定义Y轴坐标（如：[@(0), @(25), @(50), @(75) , (100)]）
AAPropSetFuncImplementation(AAYAxis, id        , top)
AAPropSetFuncImplementation(AAYAxis, id        , height)


@end

@implementation AAAxisTitle

AAPropSetFuncImplementation(AAAxisTitle, NSString *, align)
AAPropSetFuncImplementation(AAAxisTitle, NSString *, margin)
AAPropSetFuncImplementation(AAAxisTitle, NSNumber *, offset)
AAPropSetFuncImplementation(AAAxisTitle, NSNumber *, rotation)
AAPropSetFuncImplementation(AAAxisTitle, AAStyle  *, style)
AAPropSetFuncImplementation(AAAxisTitle, NSString *, text)
AAPropSetFuncImplementation(AAAxisTitle, NSNumber *, x) //标题相对于水平对齐的偏移量，取值范围为：图表左边距到图表右边距，可以是负值，单位px。 默认是：0.
AAPropSetFuncImplementation(AAAxisTitle, NSNumber *, y) //标题相对于垂直对齐的偏移量，取值范围：图表的上边距（chart.spacingTop ）到图表的下边距（chart.spacingBottom），可以是负值，单位是px。默认值和字体大小有关。

@end
