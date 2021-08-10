
//
//  AAChartModel.m
//  AAChartKit
//
//  Created by An An on 17/1/20.
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

#import "AAChartModel.h"

AAChartType const AAChartTypeColumn          = @"column";
AAChartType const AAChartTypeBar             = @"bar";
AAChartType const AAChartTypeArea            = @"area";
AAChartType const AAChartTypeAreaspline      = @"areaspline";
AAChartType const AAChartTypeLine            = @"line";
AAChartType const AAChartTypeSpline          = @"spline";
AAChartType const AAChartTypeScatter         = @"scatter";
AAChartType const AAChartTypePie             = @"pie";
AAChartType const AAChartTypeBubble          = @"bubble";
AAChartType const AAChartTypePyramid         = @"pyramid";
AAChartType const AAChartTypeFunnel          = @"funnel";
AAChartType const AAChartTypeColumnrange     = @"columnrange";
AAChartType const AAChartTypeArearange       = @"arearange";
AAChartType const AAChartTypeAreasplinerange = @"areasplinerange";
AAChartType const AAChartTypeBoxplot         = @"boxplot";
AAChartType const AAChartTypeWaterfall       = @"waterfall";
AAChartType const AAChartTypePolygon         = @"polygon";
AAChartType const AAChartTypeErrorbar        = @"errorbar";
AAChartType const AAChartTypeGauge           = @"gauge";

AAChartLayoutType const AAChartLayoutTypeHorizontal = @"horizontal";
AAChartLayoutType const AAChartLayoutTypeVertical   = @"vertical";

AAChartAlignType const AAChartAlignTypeLeft   = @"left";
AAChartAlignType const AAChartAlignTypeCenter = @"center";
AAChartAlignType const AAChartAlignTypeRight  = @"right";

AAChartVerticalAlignType const AAChartVerticalAlignTypeTop    = @"top";
AAChartVerticalAlignType const AAChartVerticalAlignTypeMiddle = @"middle";
AAChartVerticalAlignType const AAChartVerticalAlignTypeBottom = @"bottom";

AAChartZoomType const AAChartZoomTypeNone = @"none";
AAChartZoomType const AAChartZoomTypeX    = @"x";
AAChartZoomType const AAChartZoomTypeY    = @"y";
AAChartZoomType const AAChartZoomTypeXY   = @"xy";

AAChartStackingType const AAChartStackingTypeFalse   = @"";
AAChartStackingType const AAChartStackingTypeNormal  = @"normal";
AAChartStackingType const AAChartStackingTypePercent = @"percent";

AAChartSymbolType const AAChartSymbolTypeCircle        = @"circle";
AAChartSymbolType const AAChartSymbolTypeSquare        = @"square";
AAChartSymbolType const AAChartSymbolTypeDiamond       = @"diamond";
AAChartSymbolType const AAChartSymbolTypeTriangle      = @"triangle";
AAChartSymbolType const AAChartSymbolTypeTriangle_down = @"triangle-down";

AAChartSymbolStyleType const AAChartSymbolStyleTypeDefault     = @"default";
AAChartSymbolStyleType const AAChartSymbolStyleTypeInnerBlank  = @"innerBlank";
AAChartSymbolStyleType const AAChartSymbolStyleTypeBorderBlank = @"borderBlank";

AAChartFontWeightType const AAChartFontWeightTypeThin     = @"thin";
AAChartFontWeightType const AAChartFontWeightTypeRegular  = @"regular";
AAChartFontWeightType const AAChartFontWeightTypeBold     = @"bold";

AAChartLineDashStyleType const AAChartLineDashStyleTypeSolid           = @"Solid";
AAChartLineDashStyleType const AAChartLineDashStyleTypeShortDash       = @"ShortDash";
AAChartLineDashStyleType const AAChartLineDashStyleTypeShortDot        = @"ShortDot";
AAChartLineDashStyleType const AAChartLineDashStyleTypeShortDashDot    = @"ShortDashDot";
AAChartLineDashStyleType const AAChartLineDashStyleTypeShortDashDotDot = @"ShortDashDotDot";
AAChartLineDashStyleType const AAChartLineDashStyleTypeDot             = @"Dot";
AAChartLineDashStyleType const AAChartLineDashStyleTypeDash            = @"Dash";
AAChartLineDashStyleType const AAChartLineDashStyleTypeLongDash        = @"LongDash";
AAChartLineDashStyleType const AAChartLineDashStyleTypeDashDot         = @"DashDot";
AAChartLineDashStyleType const AAChartLineDashStyleTypeLongDashDot     = @"LongDashDot";
AAChartLineDashStyleType const AAChartLineDashStyleTypeLongDashDotDot  = @"LongDashDotDot";

@implementation AAChartModel

- (instancetype)init {
    self = [super init];
    if (self) {
        _title                 = @"";
        _subtitle              = @"";
        _chartType             = AAChartTypeColumn;//默认图表类型为柱状图
        _animationType         = AAChartAnimationLinear;//默认使用非easing.js中的'linear'线性渐变效果
        _animationDuration     = @800;//默认动画时长为800毫秒
        _stacking              = AAChartStackingTypeFalse;//默认不开启图表数据的堆积效果
        _zoomType              = AAChartZoomTypeNone ;//默认禁用图表的手势缩放功能
        _colorsTheme           = @[@"#1e90ff",@"#ef476f",@"#ffd066",@"#04d69f",@"#25547c",];//默认颜色主题
        _tooltipEnabled        = YES;//默认启用浮动提示框
        _tooltipShared         = YES;//默认多组数据共享一个浮动提示框
        _xAxisLabelsEnabled    = YES;//默认显示 X轴坐标点文字
        _xAxisVisible          = YES;//x轴默认可见
        _yAxisTitle            = @"";
        _yAxisVisible          = YES;//y轴默认可见
        _yAxisLabelsEnabled    = YES;
        _yAxisLineWidth        = @0.5; //y轴轴线的宽度
        _legendEnabled         = YES;//默认显示图例(图表下方可点击的带有文字的小圆点)
        _borderRadius          = @0; //柱状图长条图头部圆角半径(可用于设置头部的形状,仅对条形图,柱状图有效,设置为1000时,柱形图或者条形图头部为楔形)
        _markerRadius          = @5; //折线连接点的半径长度,如果值设置为0,这样就相当于不显示了
        _yAxisAllowDecimals    = YES;//默认y轴允许显示小数
    }
    return self;
}

AAPropSetFuncImplementation(AAChartModel, NSString *, title) //标题内容
AAPropSetFuncImplementation(AAChartModel, AAStyle  *, titleStyle) //标题文字样式
AAPropSetFuncImplementation(AAChartModel, NSString *, subtitle) //副标题内容
AAPropSetFuncImplementation(AAChartModel, AAStyle  *, subtitleStyle) //副标题文字样式
AAPropSetFuncImplementation(AAChartModel, AAChartAlignType, subtitleAlign) //图表副标题文本水平对齐方式。可选的值有 “left”，”center“和“right”。 默认是：center.
AAPropSetFuncImplementation(AAChartModel, NSString *, backgroundColor) //图表背景色(必须为十六进制的颜色色值如红色"#FF0000")
AAPropSetFuncImplementation(AAChartModel, NSArray  *, colorsTheme) //图表主题颜色数组
AAPropSetFuncImplementation(AAChartModel, NSArray     <NSString *>*, categories) //x轴坐标每个点对应的名称(注意:这个不是用来设置 X 轴的值,仅仅是用于设置 X 轴文字内容的而已)
AAPropSetFuncImplementation(AAChartModel, NSArray  *, series) //图表的数据列内容

AAPropSetFuncImplementation(AAChartModel, AAChartType,              chartType) //图表类型
AAPropSetFuncImplementation(AAChartModel, AAChartStackingType,      stacking) //堆积样式
AAPropSetFuncImplementation(AAChartModel, AAChartSymbolType,        markerSymbol) //折线曲线连接点的类型："circle", "square", "diamond", "triangle","triangle-down"，默认是"circle"
AAPropSetFuncImplementation(AAChartModel, AAChartSymbolStyleType,   markerSymbolStyle)
AAPropSetFuncImplementation(AAChartModel, AAChartZoomType,          zoomType) //缩放类型 AAChartZoomTypeX 表示可沿着 x 轴进行手势缩放
AAPropSetFuncImplementation(AAChartModel, AAChartAnimation,         animationType) //设置图表的渲染动画类型
AAPropSetFuncImplementation(AAChartModel, NSNumber *, animationDuration) //设置图表的渲染动画时长(动画单位为毫秒)

AAPropSetFuncImplementation(AAChartModel, BOOL,       inverted) //x 轴是否垂直,默认为否
AAPropSetFuncImplementation(AAChartModel, BOOL,       polar) //是否极化图形(变为雷达图),默认为否

AAPropSetFuncImplementation(AAChartModel, BOOL,       dataLabelsEnabled) //是否显示数据,默认为否
AAPropSetFuncImplementation(AAChartModel, AAStyle  *, dataLabelsStyle)//dataLabels 文字样式

AAPropSetFuncImplementation(AAChartModel, BOOL,       xAxisVisible) //x 轴是否可见(默认可见)
AAPropSetFuncImplementation(AAChartModel, BOOL,       xAxisReversed) // x 轴翻转,默认为否
AAPropSetFuncImplementation(AAChartModel, BOOL,       xAxisLabelsEnabled) //x 轴是否显示文字
AAPropSetFuncImplementation(AAChartModel, AAStyle  *, xAxisLabelsStyle) //x 轴文字样式
AAPropSetFuncImplementation(AAChartModel, NSNumber *, xAxisTickInterval) //x轴刻度点间隔数(设置每隔几个点显示一个 X轴的内容)
AAPropSetFuncImplementation(AAChartModel, AALineStyle *, xAxisGridLineStyle) //x 轴网格线的样式
AAPropSetFuncImplementation(AAChartModel, AACrosshair *, xAxisCrosshair)

AAPropSetFuncImplementation(AAChartModel, BOOL,       yAxisVisible) //y 轴是否可见(默认可见)
AAPropSetFuncImplementation(AAChartModel, BOOL,       yAxisReversed) //y 轴翻转,默认为否
AAPropSetFuncImplementation(AAChartModel, BOOL,       yAxisLabelsEnabled) //y 轴是否显示文字
AAPropSetFuncImplementation(AAChartModel, AAStyle  *, yAxisLabelsStyle)//y 轴文字样式
AAPropSetFuncImplementation(AAChartModel, NSString *, yAxisTitle) //y 轴标题
AAPropSetFuncImplementation(AAChartModel, NSNumber *, yAxisLineWidth) //y y-axis line width
AAPropSetFuncImplementation(AAChartModel, BOOL,       yAxisAllowDecimals) //是否允许 y 轴显示小数
AAPropSetFuncImplementation(AAChartModel, NSArray  *, yAxisPlotLines) //y 轴标示线🧶的配置
AAPropSetFuncImplementation(AAChartModel, NSNumber *, yAxisMax) //y 轴最大值
AAPropSetFuncImplementation(AAChartModel, NSNumber *, yAxisMin) //y 轴最小值（设置为0就不会有负数）
AAPropSetFuncImplementation(AAChartModel, NSNumber *, yAxisTickInterval)
AAPropSetFuncImplementation(AAChartModel, NSArray  *, yAxisTickPositions) //自定义 y 轴坐标（如：[@(0), @(25), @(50), @(75) , (100)]）
AAPropSetFuncImplementation(AAChartModel, AALineStyle *, yAxisGridLineStyle) //y 轴网格线的样式
AAPropSetFuncImplementation(AAChartModel, AACrosshair *, yAxisCrosshair)

AAPropSetFuncImplementation(AAChartModel, BOOL,       tooltipEnabled) //是否显示浮动提示框(默认显示)
AAPropSetFuncImplementation(AAChartModel, BOOL,       tooltipShared)//是否多组数据共享一个浮动提示框
AAPropSetFuncImplementation(AAChartModel, NSString *, tooltipValueSuffix) //浮动提示框单位后缀

AAPropSetFuncImplementation(AAChartModel, BOOL,       connectNulls) //设置折线是否断点重连(是否连接空值点)
AAPropSetFuncImplementation(AAChartModel, BOOL,       legendEnabled) //是否显示图例 lengend(图表底部可点按的圆点和文字)
AAPropSetFuncImplementation(AAChartModel, NSNumber *, borderRadius) //柱状图长条图头部圆角半径(可用于设置头部的形状,仅对条形图,柱状图有效)
AAPropSetFuncImplementation(AAChartModel, NSNumber *, markerRadius) //折线连接点的半径长度
AAPropSetFuncImplementation(AAChartModel, AAScrollablePlotArea *, scrollablePlotArea)

@end
