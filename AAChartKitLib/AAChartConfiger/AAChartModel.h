//
//  AAChartModel.h
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

#import <Foundation/Foundation.h>
#import "AASeriesElement.h"
#import "AAPlotLinesElement.h"

#define AACHARTKIT_EXTERN     extern __attribute__((visibility ("default")))

typedef NS_ENUM(NSInteger,AAChartAnimation) {
    AAChartAnimationLinear = 0,
    AAChartAnimationEaseInQuad,
    AAChartAnimationEaseOutQuad,
    AAChartAnimationEaseInOutQuad,
    AAChartAnimationEaseInCubic,
    AAChartAnimationEaseOutCubic,
    AAChartAnimationEaseInOutCubic,
    AAChartAnimationEaseInQuart,
    AAChartAnimationEaseOutQuart,
    AAChartAnimationEaseInOutQuart,
    AAChartAnimationEaseInQuint,
    AAChartAnimationEaseOutQuint,
    AAChartAnimationEaseInOutQuint,
    AAChartAnimationEaseInSine,
    AAChartAnimationEaseOutSine,
    AAChartAnimationEaseInOutSine,
    AAChartAnimationEaseInExpo,
    AAChartAnimationEaseOutExpo,
    AAChartAnimationEaseInOutExpo,
    AAChartAnimationEaseInCirc,
    AAChartAnimationEaseOutCirc,
    AAChartAnimationEaseInOutCirc,
    AAChartAnimationEaseOutBounce,
    AAChartAnimationEaseInBack,
    AAChartAnimationEaseOutBack,
    AAChartAnimationEaseInOutBack,
    AAChartAnimationElastic,
    AAChartAnimationSwingFromTo,
    AAChartAnimationSwingFrom,
    AAChartAnimationSwingTo,
    AAChartAnimationBounce,
    AAChartAnimationBouncePast,
    AAChartAnimationEaseFromTo,
    AAChartAnimationEaseFrom,
    AAChartAnimationEaseTo,
};

typedef NSString *AAChartType;
typedef NSString *AAChartSubtitleAlignType;
typedef NSString *AAChartZoomType;
typedef NSString *AAChartStackingType;
typedef NSString *AAChartSymbolType;
typedef NSString *AAChartSymbolStyleType;
typedef NSString *AAChartFontWeightType;
typedef NSString *AALineDashStyleType;

AACHARTKIT_EXTERN AAChartType const AAChartTypeColumn;
AACHARTKIT_EXTERN AAChartType const AAChartTypeBar;
AACHARTKIT_EXTERN AAChartType const AAChartTypeArea;
AACHARTKIT_EXTERN AAChartType const AAChartTypeAreaspline;
AACHARTKIT_EXTERN AAChartType const AAChartTypeLine;
AACHARTKIT_EXTERN AAChartType const AAChartTypeSpline;
AACHARTKIT_EXTERN AAChartType const AAChartTypeScatter;
AACHARTKIT_EXTERN AAChartType const AAChartTypePie;
AACHARTKIT_EXTERN AAChartType const AAChartTypeBubble;
AACHARTKIT_EXTERN AAChartType const AAChartTypePyramid;
AACHARTKIT_EXTERN AAChartType const AAChartTypeFunnel;
AACHARTKIT_EXTERN AAChartType const AAChartTypeColumnrange;
AACHARTKIT_EXTERN AAChartType const AAChartTypeArearange;
AACHARTKIT_EXTERN AAChartType const AAChartTypeAreasplinerange;
AACHARTKIT_EXTERN AAChartType const AAChartTypeBoxplot;
AACHARTKIT_EXTERN AAChartType const AAChartTypeWaterfall;
AACHARTKIT_EXTERN AAChartType const AAChartTypePolygon;

AACHARTKIT_EXTERN AAChartSubtitleAlignType const AAChartSubtitleAlignTypeLeft;
AACHARTKIT_EXTERN AAChartSubtitleAlignType const AAChartSubtitleAlignTypeCenter;
AACHARTKIT_EXTERN AAChartSubtitleAlignType const AAChartSubtitleAlignTypeRight;

AACHARTKIT_EXTERN AAChartZoomType const AAChartZoomTypeNone;
AACHARTKIT_EXTERN AAChartZoomType const AAChartZoomTypeX;
AACHARTKIT_EXTERN AAChartZoomType const AAChartZoomTypeY;
AACHARTKIT_EXTERN AAChartZoomType const AAChartZoomTypeXY;

AACHARTKIT_EXTERN AAChartStackingType const AAChartStackingTypeFalse;
AACHARTKIT_EXTERN AAChartStackingType const AAChartStackingTypeNormal;
AACHARTKIT_EXTERN AAChartStackingType const AAChartStackingTypePercent;

AACHARTKIT_EXTERN AAChartSymbolType const AAChartSymbolTypeCircle;
AACHARTKIT_EXTERN AAChartSymbolType const AAChartSymbolTypeSquare;
AACHARTKIT_EXTERN AAChartSymbolType const AAChartSymbolTypeDiamond;
AACHARTKIT_EXTERN AAChartSymbolType const AAChartSymbolTypeTriangle;
AACHARTKIT_EXTERN AAChartSymbolType const AAChartSymbolTypeTriangle_down;

AACHARTKIT_EXTERN AAChartSymbolStyleType const AAChartSymbolStyleTypeDefault;
AACHARTKIT_EXTERN AAChartSymbolStyleType const AAChartSymbolStyleTypeInnerBlank;
AACHARTKIT_EXTERN AAChartSymbolStyleType const AAChartSymbolStyleTypeBorderBlank;

AACHARTKIT_EXTERN AAChartFontWeightType const AAChartFontWeightTypeThin;
AACHARTKIT_EXTERN AAChartFontWeightType const AAChartFontWeightTypeRegular;
AACHARTKIT_EXTERN AAChartFontWeightType const AAChartFontWeightTypeBold;

AACHARTKIT_EXTERN AALineDashStyleType const AALineDashStyleTypeSolid;
AACHARTKIT_EXTERN AALineDashStyleType const AALineDashStyleTypeShortDash;
AACHARTKIT_EXTERN AALineDashStyleType const AALineDashStyleTypeShortDot;
AACHARTKIT_EXTERN AALineDashStyleType const AALineDashStyleTypeShortDashDot;
AACHARTKIT_EXTERN AALineDashStyleType const AALineDashStyleTypeShortDashDotDot;
AACHARTKIT_EXTERN AALineDashStyleType const AALineDashStyleTypeDot;
AACHARTKIT_EXTERN AALineDashStyleType const AALineDashStyleTypeDash;
AACHARTKIT_EXTERN AALineDashStyleType const AALineDashStyleTypeLongDash;
AACHARTKIT_EXTERN AALineDashStyleType const AALineDashStyleTypeDashDot;
AACHARTKIT_EXTERN AALineDashStyleType const AALineDashStyleTypeLongDashDot;
AACHARTKIT_EXTERN AALineDashStyleType const AALineDashStyleTypeLongDashDotDot;

@interface AAChartModel : NSObject

AAPropStatementAndPropSetFuncStatement(copy,   AAChartModel, NSString *, title) //标题内容
AAPropStatementAndPropSetFuncStatement(strong, AAChartModel, NSNumber *, titleFontSize) //Title label font size
AAPropStatementAndPropSetFuncStatement(copy,   AAChartModel, NSString *, titleFontColor) //Title label font color
AAPropStatementAndPropSetFuncStatement(copy,   AAChartModel, NSString *, titleFontWeight) //Title label font weight

AAPropStatementAndPropSetFuncStatement(copy,   AAChartModel, NSString *, subtitle) //副标题内容
AAPropStatementAndPropSetFuncStatement(strong, AAChartModel, NSNumber *, subtitleFontSize) //Subtitle label font size
AAPropStatementAndPropSetFuncStatement(copy,   AAChartModel, NSString *, subtitleFontColor) //Subtitle label font color
AAPropStatementAndPropSetFuncStatement(copy,   AAChartModel, NSString *, subtitleFontWeight) //Subtitle label font weight

AAPropStatementAndPropSetFuncStatement(copy,   AAChartModel, NSString *, backgroundColor) //图表背景色(必须为十六进制的颜色色值如红色"#FF0000")
AAPropStatementAndPropSetFuncStatement(strong, AAChartModel, NSArray     <NSString *>*, colorsTheme) //图表主题颜色数组
AAPropStatementAndPropSetFuncStatement(strong, AAChartModel, NSArray     <NSString *>*, categories) //x轴坐标每个点对应的名称(注意:这个不是用来设置 X 轴的值,仅仅是用于设置 X 轴文字内容的而已)
AAPropStatementAndPropSetFuncStatement(strong, AAChartModel, NSArray  *, series) //图表的数据列内容

AAPropStatementAndPropSetFuncStatement(copy,   AAChartModel, AAChartSubtitleAlignType, subtitleAlign) //图表副标题文本水平对齐方式。可选的值有 “left”，”center“和“right”。 默认是：center.
AAPropStatementAndPropSetFuncStatement(copy,   AAChartModel, AAChartType,              chartType) //图表类型
AAPropStatementAndPropSetFuncStatement(copy,   AAChartModel, AAChartStackingType,      stacking) //堆积样式
AAPropStatementAndPropSetFuncStatement(copy,   AAChartModel, AAChartSymbolType,        markerSymbol) //折线曲线连接点的类型："circle", "square", "diamond", "triangle","triangle-down"，默认是"circle"
AAPropStatementAndPropSetFuncStatement(assign, AAChartModel, AAChartSymbolStyleType,   markerSymbolStyle) 
AAPropStatementAndPropSetFuncStatement(copy,   AAChartModel, AAChartZoomType,          zoomType) //缩放类型 AAChartZoomTypeX 表示可沿着 x 轴进行手势缩放
AAPropStatementAndPropSetFuncStatement(assign, AAChartModel, AAChartAnimation,         animationType) //设置图表的渲染动画类型
AAPropStatementAndPropSetFuncStatement(strong, AAChartModel, NSNumber *, animationDuration) //设置图表的渲染动画时长(动画单位为毫秒)

AAPropStatementAndPropSetFuncStatement(assign, AAChartModel, BOOL,       inverted) //x 轴是否垂直,默认为否
AAPropStatementAndPropSetFuncStatement(assign, AAChartModel, BOOL,       easyGradientColors) //是否方便快捷地将常规主题颜色数组 colorsTheme 自动转换为半透明渐变效果的颜色数组(设置后就不用自己再手动去写渐变色字典,相当于是设置渐变色的一个快捷方式,当然了,如果需要细致地自定义渐变色效果,还是需要自己手动配置渐变颜色字典内容,具体方法参见图表示例中的`颜色渐变条形图`示例代码),默认为否
AAPropStatementAndPropSetFuncStatement(assign, AAChartModel, BOOL,       polar) //是否极化图形(变为雷达图),默认为否

AAPropStatementAndPropSetFuncStatement(assign, AAChartModel, BOOL,       dataLabelEnabled) //是否显示数据,默认为否
AAPropStatementAndPropSetFuncStatement(copy,   AAChartModel, NSString *, dataLabelFontColor) //Datalabel font color
AAPropStatementAndPropSetFuncStatement(strong, AAChartModel, NSNumber *, dataLabelFontSize) //Datalabel font size
AAPropStatementAndPropSetFuncStatement(copy,   AAChartModel, NSString *, dataLabelFontWeight) //Datalabel font weight


AAPropStatementAndPropSetFuncStatement(assign, AAChartModel, BOOL,       xAxisVisible) //x 轴是否可见(默认可见)
AAPropStatementAndPropSetFuncStatement(assign, AAChartModel, BOOL,       xAxisReversed) // x 轴翻转,默认为否

AAPropStatementAndPropSetFuncStatement(assign, AAChartModel, BOOL,       xAxisLabelsEnabled) //x 轴是否显示文字
AAPropStatementAndPropSetFuncStatement(strong, AAChartModel, NSNumber *, xAxisLabelsFontSize) //x 轴文字字体大小
AAPropStatementAndPropSetFuncStatement(copy,   AAChartModel, NSString *, xAxisLabelsFontColor) //x 轴文字字体颜色
AAPropStatementAndPropSetFuncStatement(copy,   AAChartModel, AAChartFontWeightType, xAxisLabelsFontWeight) //x 轴文字字体粗细

AAPropStatementAndPropSetFuncStatement(strong, AAChartModel, NSNumber *, xAxisGridLineWidth) //x 轴网格线的宽度
AAPropStatementAndPropSetFuncStatement(strong, AAChartModel, NSNumber *, xAxisTickInterval) //x轴刻度点间隔数(设置每隔几个点显示一个 X轴的内容)

AAPropStatementAndPropSetFuncStatement(strong, AAChartModel, NSNumber *, xAxisCrosshairWidth) //设置 x 轴准星线的宽度
AAPropStatementAndPropSetFuncStatement(copy,   AAChartModel, NSString *, xAxisCrosshairColor) //设置 x 轴准星线的颜色
AAPropStatementAndPropSetFuncStatement(assign, AAChartModel, AALineDashStyleType,   xAxisCrosshairDashStyleType) //设置 x 轴准星线的线条样式类型


AAPropStatementAndPropSetFuncStatement(assign, AAChartModel, BOOL,       yAxisVisible) //y 轴是否可见(默认可见)
AAPropStatementAndPropSetFuncStatement(assign, AAChartModel, BOOL,       yAxisReversed) //y 轴翻转,默认为否

AAPropStatementAndPropSetFuncStatement(assign, AAChartModel, BOOL,       yAxisLabelsEnabled) //y 轴是否显示文字
AAPropStatementAndPropSetFuncStatement(strong, AAChartModel, NSNumber *, yAxisLabelsFontSize) //y 轴文字字体大小
AAPropStatementAndPropSetFuncStatement(copy,   AAChartModel, NSString *, yAxisLabelsFontColor) //y 轴文字字体颜色
AAPropStatementAndPropSetFuncStatement(copy,   AAChartModel, AAChartFontWeightType , yAxisLabelsFontWeight) //y 轴文字字体粗细

AAPropStatementAndPropSetFuncStatement(copy,   AAChartModel, NSString *, yAxisTitle) //y 轴标题
AAPropStatementAndPropSetFuncStatement(strong, AAChartModel, NSNumber *, yAxisLineWidth) //y y-axis line width
AAPropStatementAndPropSetFuncStatement(strong, AAChartModel, NSNumber *, yAxisGridLineWidth) //y轴网格线的宽度
AAPropStatementAndPropSetFuncStatement(assign, AAChartModel, BOOL,       yAxisAllowDecimals) //是否允许 y 轴显示小数
AAPropStatementAndPropSetFuncStatement(strong, AAChartModel, NSArray  *, yAxisPlotLines) //y 轴基线的配置
AAPropStatementAndPropSetFuncStatement(strong, AAChartModel, NSNumber *, yAxisMax) //y 轴最大值
AAPropStatementAndPropSetFuncStatement(strong, AAChartModel, NSNumber *, yAxisMin) //y 轴最小值（设置为0就不会有负数）
AAPropStatementAndPropSetFuncStatement(strong, AAChartModel, NSNumber *, yAxisTickInterval) 
AAPropStatementAndPropSetFuncStatement(strong, AAChartModel, NSArray  *, yAxisTickPositions) //自定义 y 轴坐标（如：[@(0), @(25), @(50), @(75) , (100)]）
AAPropStatementAndPropSetFuncStatement(strong, AAChartModel, NSNumber *, yAxisCrosshairWidth) //设置 y 轴准星线的宽度
AAPropStatementAndPropSetFuncStatement(copy,   AAChartModel, NSString *, yAxisCrosshairColor) //设置 y 轴准星线的颜色
AAPropStatementAndPropSetFuncStatement(assign, AAChartModel, AALineDashStyleType,   yAxisCrosshairDashStyleType) //设置 y 轴准星线的线条样式类型


AAPropStatementAndPropSetFuncStatement(assign, AAChartModel, BOOL,       tooltipEnabled) //是否显示浮动提示框(默认显示)
AAPropStatementAndPropSetFuncStatement(assign, AAChartModel, BOOL,       tooltipShared)//是否多组数据共享一个浮动提示框
AAPropStatementAndPropSetFuncStatement(copy,   AAChartModel, NSString *, tooltipValueSuffix) //浮动提示框单位后缀

AAPropStatementAndPropSetFuncStatement(assign, AAChartModel, BOOL,       connectNulls) //设置折线是否断点重连(是否连接空值点)
AAPropStatementAndPropSetFuncStatement(assign, AAChartModel, BOOL,       legendEnabled) //是否显示图例 lengend(图表底部可点按的圆点和文字)
AAPropStatementAndPropSetFuncStatement(strong, AAChartModel, NSNumber *, borderRadius) //柱状图长条图头部圆角半径(可用于设置头部的形状,仅对条形图,柱状图有效)
AAPropStatementAndPropSetFuncStatement(strong, AAChartModel, NSNumber *, markerRadius) //折线连接点的半径长度
AAPropStatementAndPropSetFuncStatement(copy,   AAChartModel, NSString *, zoomResetButtonText)  //String to display in 'zoom reset button"

@end
