
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
 * StackOverflow : https://stackoverflow.com/users/7842508/codeforu
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

AAChartSubtitleAlignType const AAChartSubtitleAlignTypeLeft   = @"left";
AAChartSubtitleAlignType const AAChartSubtitleAlignTypeCenter = @"center";
AAChartSubtitleAlignType const AAChartSubtitleAlignTypeRight  = @"right";

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

AALineDashStyleType const AALineDashStyleTypeSolid           = @"Solid";
AALineDashStyleType const AALineDashStyleTypeShortDash       = @"ShortDash";
AALineDashStyleType const AALineDashStyleTypeShortDot        = @"ShortDot";
AALineDashStyleType const AALineDashStyleTypeShortDashDot    = @"ShortDashDot";
AALineDashStyleType const AALineDashStyleTypeShortDashDotDot = @"ShortDashDotDot";
AALineDashStyleType const AALineDashStyleTypeDot             = @"Dot";
AALineDashStyleType const AALineDashStyleTypeDash            = @"Dash";
AALineDashStyleType const AALineDashStyleTypeLongDash        = @"LongDash";
AALineDashStyleType const AALineDashStyleTypeDashDot         = @"DashDot";
AALineDashStyleType const AALineDashStyleTypeLongDashDot     = @"LongDashDot";
AALineDashStyleType const AALineDashStyleTypeLongDashDotDot  = @"LongDashDotDot";

@implementation AAChartModel

- (instancetype)init {
    self = [super init];
    if (self) {
        _chartType             = AAChartTypeColumn;//默认图表类型为柱状图
        _animationType         = AAChartAnimationLinear;//默认使用非easing.js中的'linear'线性渐变效果
        _animationDuration     = @800;//默认动画时长为800毫秒
        _subtitleAlign         = AAChartSubtitleAlignTypeLeft;//默认图表副标题居左显示
        _stacking              = AAChartStackingTypeFalse;//默认不开启图表数据的堆积效果
        _zoomType              = AAChartZoomTypeNone ;//默认禁用图表的手势缩放功能
        _colorsTheme           = @[@"#1e90ff",@"#ef476f",@"#ffd066",@"#04d69f",@"#25547c",];//默认颜色主题
        _tooltipEnabled        = YES;//默认启用浮动提示框
        //        _tooltipCrosshairs     = YES;//默认启用准星线
        _tooltipShared         = YES;//默认多组数据共享一个浮动提示框
        _xAxisLabelsEnabled    = YES;//默认显示 X轴坐标点文字
        _xAxisGridLineWidth    = @0; //设置x轴分割线宽度为0个像素,即是隐藏 X轴分割线
        _xAxisTickInterval     = @1; //x轴坐标点间隔数(默认是1)
        _xAxisVisible          = YES;//x轴默认可见
        _yAxisVisible          = YES;//y轴默认可见
        _yAxisLabelsEnabled    = YES;
        _yAxisLineWidth        = @0.5; //y轴轴线的宽度为1
        _yAxisGridLineWidth    = @1; //y轴分割线线宽为一个像素
        _legendEnabled         = YES;//默认显示图例(图表下方可点击的带有文字的小圆点)
        _borderRadius          = @0; //柱状图长条图头部圆角半径(可用于设置头部的形状,仅对条形图,柱状图有效,设置为1000时,柱形图或者条形图头部为楔形)
        _markerRadius          = @5; //折线连接点的半径长度,如果值设置为0,这样就相当于不显示了
        _yAxisAllowDecimals    = YES;//默认y轴允许显示小数
        _zoomResetButtonText   = @"恢复缩放";//恢复缩放按钮的标题文字
        
        _titleFontColor        = @"#000000";//标题字体颜色为黑色
        _titleFontWeight       = AAChartFontWeightTypeRegular;//常规字体
        _titleFontSize         = @11;
        _subtitleFontColor     = @"#000000";//副标题字体颜色为黑色
        _subtitleFontWeight    = AAChartFontWeightTypeRegular;//常规字体
        _subtitleFontSize      = @9;
        _dataLabelFontColor    = @"#000000";//数据标签默认颜色为黑色
        _dataLabelFontWeight   = AAChartFontWeightTypeBold;//图表的数据字体为粗体
        _dataLabelFontSize     = @10;
        _xAxisLabelsFontSize   = @11;//x轴字体大小
        _xAxisLabelsFontColor  = @"#778899";//浅石板灰色字体
        _xAxisLabelsFontWeight = AAChartFontWeightTypeThin;//细体字
        _yAxisLabelsFontSize   = @11;
        _yAxisLabelsFontColor  = @"#778899";//浅石板灰色字体
        _yAxisLabelsFontWeight = AAChartFontWeightTypeThin;//细体字
    }
    return self;
}

AAPropSetFuncImplementation(AAChartModel, NSString *, title) //标题内容
AAPropSetFuncImplementation(AAChartModel, NSNumber *, titleFontSize) //Title label font size
AAPropSetFuncImplementation(AAChartModel, NSString *, titleFontColor) //Title label font color
AAPropSetFuncImplementation(AAChartModel, NSString *, titleFontWeight) //Title label font weight

AAPropSetFuncImplementation(AAChartModel, NSString *, subtitle) //副标题内容
AAPropSetFuncImplementation(AAChartModel, NSNumber *, subtitleFontSize) //Subtitle label font size
AAPropSetFuncImplementation(AAChartModel, NSString *, subtitleFontColor) //Subtitle label font color
AAPropSetFuncImplementation(AAChartModel, NSString *, subtitleFontWeight) //Subtitle label font weight

AAPropSetFuncImplementation(AAChartModel, NSString *, backgroundColor) //图表背景色(必须为十六进制的颜色色值如红色"#FF0000")
AAPropSetFuncImplementation(AAChartModel, NSArray     <NSString *>*, colorsTheme) //图表主题颜色数组
AAPropSetFuncImplementation(AAChartModel, NSArray     <NSString *>*, categories) //x轴坐标每个点对应的名称(注意:这个不是用来设置 X 轴的值,仅仅是用于设置 X 轴文字内容的而已)
AAPropSetFuncImplementation(AAChartModel, NSArray  *, series) //图表的数据列内容

AAPropSetFuncImplementation(AAChartModel, AAChartSubtitleAlignType, subtitleAlign) //图表副标题文本水平对齐方式。可选的值有 “left”，”center“和“right”。 默认是：center.
AAPropSetFuncImplementation(AAChartModel, AAChartType,              chartType) //图表类型
AAPropSetFuncImplementation(AAChartModel, AAChartStackingType,      stacking) //堆积样式
AAPropSetFuncImplementation(AAChartModel, AAChartSymbolType,        markerSymbol) //折线曲线连接点的类型："circle", "square", "diamond", "triangle","triangle-down"，默认是"circle"
AAPropSetFuncImplementation(AAChartModel, AAChartSymbolStyleType,   markerSymbolStyle)
AAPropSetFuncImplementation(AAChartModel, AAChartZoomType,          zoomType) //缩放类型 AAChartZoomTypeX 表示可沿着 x 轴进行手势缩放
AAPropSetFuncImplementation(AAChartModel, AAChartAnimation,         animationType) //设置图表的渲染动画类型
AAPropSetFuncImplementation(AAChartModel, NSNumber *, animationDuration) //设置图表的渲染动画时长(动画单位为毫秒)

AAPropSetFuncImplementation(AAChartModel, BOOL,       inverted) //x 轴是否垂直,默认为否
AAPropSetFuncImplementation(AAChartModel, BOOL,       easyGradientColors) //是否方便快捷地将常规主题颜色数组 colorsTheme 自动转换为半透明渐变效果的颜色数组(设置后就不用自己再手动去写渐变色字典,相当于是设置渐变色的一个快捷方式,当然了,如果需要细致地自定义渐变色效果,还是需要自己手动配置渐变颜色字典内容,具体方法参见图表示例中的`颜色渐变条形图`示例代码),默认为否
AAPropSetFuncImplementation(AAChartModel, BOOL,       polar) //是否极化图形(变为雷达图),默认为否

AAPropSetFuncImplementation(AAChartModel, BOOL,       dataLabelEnabled) //是否显示数据,默认为否
AAPropSetFuncImplementation(AAChartModel, NSString *, dataLabelFontColor) //Datalabel font color
AAPropSetFuncImplementation(AAChartModel, NSNumber *, dataLabelFontSize) //Datalabel font size
AAPropSetFuncImplementation(AAChartModel, NSString *, dataLabelFontWeight) //Datalabel font weight


AAPropSetFuncImplementation(AAChartModel, BOOL,       xAxisVisible) //x 轴是否可见(默认可见)
AAPropSetFuncImplementation(AAChartModel, BOOL,       xAxisReversed) // x 轴翻转,默认为否

AAPropSetFuncImplementation(AAChartModel, BOOL,       xAxisLabelsEnabled) //x 轴是否显示文字
AAPropSetFuncImplementation(AAChartModel, NSNumber *, xAxisLabelsFontSize) //x 轴文字字体大小
AAPropSetFuncImplementation(AAChartModel, NSString *, xAxisLabelsFontColor) //x 轴文字字体颜色
AAPropSetFuncImplementation(AAChartModel, AAChartFontWeightType, xAxisLabelsFontWeight) //x 轴文字字体粗细

AAPropSetFuncImplementation(AAChartModel, NSNumber *, xAxisGridLineWidth) //x 轴网格线的宽度
AAPropSetFuncImplementation(AAChartModel, NSNumber *, xAxisTickInterval) //x轴刻度点间隔数(设置每隔几个点显示一个 X轴的内容)

AAPropSetFuncImplementation(AAChartModel, NSNumber *, xAxisCrosshairWidth) 
AAPropSetFuncImplementation(AAChartModel, NSString *, xAxisCrosshairColor) 
AAPropSetFuncImplementation(AAChartModel, AALineDashStyleType,   xAxisCrosshairDashStyleType) 


AAPropSetFuncImplementation(AAChartModel, BOOL,       yAxisVisible) //y 轴是否可见(默认可见)
AAPropSetFuncImplementation(AAChartModel, BOOL,       yAxisReversed) //y 轴翻转,默认为否

AAPropSetFuncImplementation(AAChartModel, BOOL,       yAxisLabelsEnabled) //y 轴是否显示文字
AAPropSetFuncImplementation(AAChartModel, NSNumber *, yAxisLabelsFontSize) //y 轴文字字体大小
AAPropSetFuncImplementation(AAChartModel, NSString *, yAxisLabelsFontColor) //y 轴文字字体颜色
AAPropSetFuncImplementation(AAChartModel, AAChartFontWeightType , yAxisLabelsFontWeight) //y 轴文字字体粗细
AAPropSetFuncImplementation(AAChartModel, NSString *, yAxisTitle) //y 轴标题
AAPropSetFuncImplementation(AAChartModel, NSNumber *, yAxisLineWidth) //y y-axis line width
AAPropSetFuncImplementation(AAChartModel, NSNumber *, yAxisGridLineWidth) //y轴网格线的宽度
AAPropSetFuncImplementation(AAChartModel, BOOL,       yAxisAllowDecimals) //是否允许 y 轴显示小数
AAPropSetFuncImplementation(AAChartModel, NSArray  *, yAxisPlotLines) //y 轴基线的配置
AAPropSetFuncImplementation(AAChartModel, NSNumber *, yAxisMax) //y 轴最大值
AAPropSetFuncImplementation(AAChartModel, NSNumber *, yAxisMin) //y 轴最小值（设置为0就不会有负数）
AAPropSetFuncImplementation(AAChartModel, NSNumber *, yAxisTickInterval) 
AAPropSetFuncImplementation(AAChartModel, NSArray  *, yAxisTickPositions) //自定义 y 轴坐标（如：[@(0), @(25), @(50), @(75) , (100)]）

AAPropSetFuncImplementation(AAChartModel, NSNumber *, yAxisCrosshairWidth) 
AAPropSetFuncImplementation(AAChartModel, NSString *, yAxisCrosshairColor) 
AAPropSetFuncImplementation(AAChartModel, AALineDashStyleType,   yAxisCrosshairDashStyleType) 


AAPropSetFuncImplementation(AAChartModel, BOOL,       tooltipEnabled) //是否显示浮动提示框(默认显示)
AAPropSetFuncImplementation(AAChartModel, BOOL,       tooltipShared)//是否多组数据共享一个浮动提示框
AAPropSetFuncImplementation(AAChartModel, NSString *, tooltipValueSuffix) //浮动提示框单位后缀

AAPropSetFuncImplementation(AAChartModel, BOOL,       connectNulls) //设置折线是否断点重连(是否连接空值点)
AAPropSetFuncImplementation(AAChartModel, BOOL,       legendEnabled) //是否显示图例 lengend(图表底部可点按的圆点和文字)
AAPropSetFuncImplementation(AAChartModel, NSNumber *, borderRadius) //柱状图长条图头部圆角半径(可用于设置头部的形状,仅对条形图,柱状图有效)
AAPropSetFuncImplementation(AAChartModel, NSNumber *, markerRadius) //折线连接点的半径长度
AAPropSetFuncImplementation(AAChartModel, NSString *, zoomResetButtonText)  //String to display in 'zoom reset button"

@end
