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
 * JianShu       : http://www.jianshu.com/u/f1e6753d4254
 * SegmentFault  : https://segmentfault.com/u/huanghunbieguan
 *
 * -------------------------------------------------------------------------------
 
 */

#import <Foundation/Foundation.h>
#import <UIKit/UIKitDefines.h>
#import "AASeriesElement.h"
#import "AAPlotLinesElement.h"

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
typedef NSString *AALineDashSyleType;

UIKIT_EXTERN AAChartType const AAChartTypeStrange;
UIKIT_EXTERN AAChartType const AAChartTypeColumn;
UIKIT_EXTERN AAChartType const AAChartTypeBar;
UIKIT_EXTERN AAChartType const AAChartTypeArea;
UIKIT_EXTERN AAChartType const AAChartTypeAreaspline;
UIKIT_EXTERN AAChartType const AAChartTypeLine;
UIKIT_EXTERN AAChartType const AAChartTypeSpline;
UIKIT_EXTERN AAChartType const AAChartTypeScatter;
UIKIT_EXTERN AAChartType const AAChartTypePie;
UIKIT_EXTERN AAChartType const AAChartTypeBubble;
UIKIT_EXTERN AAChartType const AAChartTypePyramid;
UIKIT_EXTERN AAChartType const AAChartTypeFunnel;
UIKIT_EXTERN AAChartType const AAChartTypeColumnrange;
UIKIT_EXTERN AAChartType const AAChartTypeArearange;
UIKIT_EXTERN AAChartType const AAChartTypeBoxplot;
UIKIT_EXTERN AAChartType const AAChartTypeWaterfall;

UIKIT_EXTERN AAChartSubtitleAlignType const AAChartSubtitleAlignTypeLeft;
UIKIT_EXTERN AAChartSubtitleAlignType const AAChartSubtitleAlignTypeCenter;
UIKIT_EXTERN AAChartSubtitleAlignType const AAChartSubtitleAlignTypeRight;

UIKIT_EXTERN AAChartZoomType const AAChartZoomTypeNone;
UIKIT_EXTERN AAChartZoomType const AAChartZoomTypeX;
UIKIT_EXTERN AAChartZoomType const AAChartZoomTypeY;
UIKIT_EXTERN AAChartZoomType const AAChartZoomTypeXY;

UIKIT_EXTERN AAChartStackingType const AAChartStackingTypeFalse;
UIKIT_EXTERN AAChartStackingType const AAChartStackingTypeNormal;
UIKIT_EXTERN AAChartStackingType const AAChartStackingTypePercent;

UIKIT_EXTERN AAChartSymbolType const AAChartSymbolTypeCircle;
UIKIT_EXTERN AAChartSymbolType const AAChartSymbolTypeSquare;
UIKIT_EXTERN AAChartSymbolType const AAChartSymbolTypeDiamond;
UIKIT_EXTERN AAChartSymbolType const AAChartSymbolTypeTriangle;
UIKIT_EXTERN AAChartSymbolType const AAChartSymbolTypeTriangle_down;

UIKIT_EXTERN AAChartSymbolStyleType const AAChartSymbolStyleTypeDefault;
UIKIT_EXTERN AAChartSymbolStyleType const AAChartSymbolStyleTypeInnerBlank;
UIKIT_EXTERN AAChartSymbolStyleType const AAChartSymbolStyleTypeBorderBlank;

UIKIT_EXTERN AAChartFontWeightType const AAChartFontWeightTypeThin;
UIKIT_EXTERN AAChartFontWeightType const AAChartFontWeightTypeRegular;
UIKIT_EXTERN AAChartFontWeightType const AAChartFontWeightTypeBold;

UIKIT_EXTERN AALineDashSyleType const AALineDashSyleTypeSolid;
UIKIT_EXTERN AALineDashSyleType const AALineDashSyleTypeShortDash;
UIKIT_EXTERN AALineDashSyleType const AALineDashSyleTypeShortDot;
UIKIT_EXTERN AALineDashSyleType const AALineDashSyleTypeShortDashDot;
UIKIT_EXTERN AALineDashSyleType const AALineDashSyleTypeShortDashDotDot;
UIKIT_EXTERN AALineDashSyleType const AALineDashSyleTypeDot;
UIKIT_EXTERN AALineDashSyleType const AALineDashSyleTypeDash;
UIKIT_EXTERN AALineDashSyleType const AALineDashSyleTypeLongDash;
UIKIT_EXTERN AALineDashSyleType const AALineDashSyleTypeDashDot;
UIKIT_EXTERN AALineDashSyleType const AALineDashSyleTypeLongDashDot;
UIKIT_EXTERN AALineDashSyleType const AALineDashSyleTypeLongDashDotDot;

@interface AAChartModel : NSObject

AAPropStatementAndFuncStatement(copy,   AAChartModel, NSString *, title);//标题内容
AAPropStatementAndFuncStatement(strong, AAChartModel, NSNumber *, titleFontSize);//Title label font size
AAPropStatementAndFuncStatement(copy,   AAChartModel, NSString *, titleFontColor);//Title label font color
AAPropStatementAndFuncStatement(copy,   AAChartModel, NSString *, titleFontWeight);//Title label font weight

AAPropStatementAndFuncStatement(copy,   AAChartModel, NSString *, subtitle);//副标题内容
AAPropStatementAndFuncStatement(strong, AAChartModel, NSNumber *, subtitleFontSize);//Subtitle label font size
AAPropStatementAndFuncStatement(copy,   AAChartModel, NSString *, subtitleFontColor);//Subtitle label font color
AAPropStatementAndFuncStatement(copy,   AAChartModel, NSString *, subtitleFontWeight);//Subtitle label font weight

AAPropStatementAndFuncStatement(strong, AAChartModel, NSArray  *, series);//图表的数据列内容
AAPropStatementAndFuncStatement(strong, AAChartModel, NSArray *,  keys);//Keys support

AAPropStatementAndFuncStatement(copy,   AAChartModel, AAChartSubtitleAlignType, subtitleAlign);//图表副标题文本水平对齐方式。可选的值有 “left”，”center“和“right”。 默认是：center.
AAPropStatementAndFuncStatement(copy,   AAChartModel, AAChartType,              chartType);//图表类型
AAPropStatementAndFuncStatement(copy,   AAChartModel, AAChartStackingType,      stacking);//堆积样式
AAPropStatementAndFuncStatement(copy,   AAChartModel, AAChartSymbolType,        symbol);//折线曲线连接点的类型："circle", "square", "diamond", "triangle","triangle-down"，默认是"circle"
AAPropStatementAndFuncStatement(assign, AAChartModel, AAChartSymbolStyleType,   symbolStyle);
AAPropStatementAndFuncStatement(copy,   AAChartModel, AAChartZoomType,          zoomType);//缩放类型 AAChartZoomTypeX 表示可沿着 x 轴进行手势缩放
AAPropStatementAndFuncStatement(assign, AAChartModel, AAChartAnimation,         animationType);//设置图表的渲染动画类型

AAPropStatementAndFuncStatement(strong, AAChartModel, NSNumber *, animationDuration);//设置图表的渲染动画时长(动画单位为毫秒)
AAPropStatementAndFuncStatement(assign, AAChartModel, BOOL,       inverted);//x 轴是否垂直,默认为否
AAPropStatementAndFuncStatement(assign, AAChartModel, BOOL,       xAxisReversed);// x 轴翻转,默认为否
AAPropStatementAndFuncStatement(assign, AAChartModel, BOOL,       yAxisReversed);//y 轴翻转,默认为否
AAPropStatementAndFuncStatement(assign, AAChartModel, BOOL,       gradientColorEnabled);//是否要为渐变色,默认为否
AAPropStatementAndFuncStatement(assign, AAChartModel, BOOL,       polar);//是否极化图形(变为雷达图),默认为否
AAPropStatementAndFuncStatement(assign, AAChartModel, BOOL,       dataLabelEnabled);//是否显示数据,默认为否
AAPropStatementAndFuncStatement(copy,   AAChartModel, NSString *, dataLabelFontColor);//Datalabel font color
AAPropStatementAndFuncStatement(strong, AAChartModel, NSNumber *, dataLabelFontSize);//Datalabel font size
AAPropStatementAndFuncStatement(copy,   AAChartModel, NSString *, dataLabelFontWeight);//Datalabel font weight
AAPropStatementAndFuncStatement(copy,   AAChartModel, NSNumber *, dataLabelRotation);//Datalabel rotation in degrees 
AAPropStatementAndFuncStatement(assign, AAChartModel, BOOL,       dataLabelAllowOverlap);//Datalabel allow overlapping
//(Note: if rotation <> 0, 'dataLabelAllowOverlap' will not work - this is a bug in HighCharts (https://github.com/highcharts/highcharts/issues/7362)
//******

AAPropStatementAndFuncStatement(assign, AAChartModel, BOOL,       xAxisLabelsEnabled);//x 轴是否显示数据
AAPropStatementAndFuncStatement(copy,   AAChartModel, NSNumber *, xAxisLabelsFontSize);//xAxis font size
AAPropStatementAndFuncStatement(copy,   AAChartModel, NSString *, xAxisLabelsFontColor);//X-axis label font color
AAPropStatementAndFuncStatement(copy,   AAChartModel, NSString *, xAxisLabelsFontWeight);//X-axis label font weight
AAPropStatementAndFuncStatement(strong, AAChartModel, NSArray  *, categories);//x轴坐标每个点对应的名称(注意:这个不是用来设置 X 轴的值,仅仅是用于设置 X 轴文字内容的而已)
AAPropStatementAndFuncStatement(strong, AAChartModel, NSNumber *, xAxisGridLineWidth);//x 轴网格线的宽度
AAPropStatementAndFuncStatement(strong, AAChartModel, NSNumber *, xAxisTickInterval);//x轴刻度点间隔数(设置每隔几个点显示一个 X轴的内容)

AAPropStatementAndFuncStatement(assign, AAChartModel, BOOL,       xAxisVisible);//x 轴是否可见(默认可见)
AAPropStatementAndFuncStatement(assign, AAChartModel, BOOL,       yAxisVisible);//y 轴是否可见(默认可见)
AAPropStatementAndFuncStatement(assign, AAChartModel, BOOL,       yAxisLabelsEnabled);//y 轴是否显示数据
AAPropStatementAndFuncStatement(copy,   AAChartModel, NSString *, yAxisTitle);//y 轴标题
AAPropStatementAndFuncStatement(strong, AAChartModel, NSNumber *, yAxisLineWidth);//y y-axis line width
AAPropStatementAndFuncStatement(strong, AAChartModel, NSNumber *, yAxisLabelsFontSize);//y y-axis labels font size
AAPropStatementAndFuncStatement(copy,   AAChartModel, NSString *, yAxisLabelsFontColor);//y-axis label font color
AAPropStatementAndFuncStatement(copy,   AAChartModel, NSString *, yAxisLabelsFontWeight);//y-axis label font weight
AAPropStatementAndFuncStatement(strong, AAChartModel, NSNumber *, yAxisGridLineWidth);//y轴网格线的宽度
AAPropStatementAndFuncStatement(copy,   AAChartModel, NSString *, yAxisAlternateGridColor);//backcolor of every other grid line area
AAPropStatementAndFuncStatement(strong, AAChartModel, NSNumber *, yAxisTickInterval);

AAPropStatementAndFuncStatement(strong, AAChartModel, NSArray     <NSString *>*, colorsTheme);//图表主题颜色数组
AAPropStatementAndFuncStatement(copy,   AAChartModel, NSString *, backgroundColor);//图表背景色(必须为十六进制的颜色色值如红色"#FF0000")

AAPropStatementAndFuncStatement(assign, AAChartModel, BOOL,       tooltipEnabled);//是否显示浮动提示框(默认显示)
AAPropStatementAndFuncStatement(copy,   AAChartModel, NSString *, tooltipValueSuffix);//浮动提示框单位后缀
//AAPropStatementAndFuncStatement(copy,   AAChartModel, NSString *, tooltipValueString);//The tooltip string
//AAPropStatementAndFuncStatement(assign, AAChartModel, BOOL,       tooltipCrosshairs);//是否显示准星线(默认显示)
AAPropStatementAndFuncStatement(assign, AAChartModel, BOOL,       connectNulls);//设置折线是否断点重连(是否连接空值点)
AAPropStatementAndFuncStatement(assign, AAChartModel, BOOL,       legendEnabled);//是否显示图例 lengend(图表底部可点按的圆点和文字)

AAPropStatementAndFuncStatement(assign, AAChartModel, BOOL,       options3dEnabled);//是否 3D 化图形(仅对条形图,柱状图有效)
AAPropStatementAndFuncStatement(strong, AAChartModel, NSNumber *, options3dAlpha);
AAPropStatementAndFuncStatement(strong, AAChartModel, NSNumber *, options3dBeta);
AAPropStatementAndFuncStatement(strong, AAChartModel, NSNumber *, options3dDepth);//3D 图形深度

AAPropStatementAndFuncStatement(strong, AAChartModel, NSNumber *, borderRadius);//柱状图长条图头部圆角半径(可用于设置头部的形状,仅对条形图,柱状图有效)
AAPropStatementAndFuncStatement(strong, AAChartModel, NSNumber *, markerRadius);//折线连接点的半径长度

AAPropStatementAndFuncStatement(assign, AAChartModel, BOOL,       yAxisAllowDecimals);//是否允许 y 轴显示小数
AAPropStatementAndFuncStatement(strong, AAChartModel, NSArray  *, yAxisPlotLines);//y 轴基线的配置
AAPropStatementAndFuncStatement(strong, AAChartModel, NSNumber *, yAxisMax);//y 轴最大值
AAPropStatementAndFuncStatement(strong, AAChartModel, NSNumber *, yAxisMin);//y 轴最小值（设置为0就不会有负数）
AAPropStatementAndFuncStatement(strong, AAChartModel, NSArray  *, yAxisTickPositions);//自定义 y 轴坐标（如：[@(0), @(25), @(50), @(75) , (100)]）
AAPropStatementAndFuncStatement(copy,   AAChartModel, NSString *, zoomResetButtonText); //String to display in 'zoom reset button"

AAPropStatementAndFuncStatement(strong, AAChartModel, NSNumber *, yAxisCrosshairWidth);
AAPropStatementAndFuncStatement(copy,   AAChartModel, NSString *, yAxisCrosshairColor);
AAPropStatementAndFuncStatement(assign, AAChartModel, AALineDashSyleType,   yAxisCrosshairDashStyleType);

AAPropStatementAndFuncStatement(strong, AAChartModel, NSNumber *, xAxisCrosshairWidth);
AAPropStatementAndFuncStatement(copy,   AAChartModel, NSString *, xAxisCrosshairColor);
AAPropStatementAndFuncStatement(assign, AAChartModel, AALineDashSyleType,   xAxisCrosshairDashStyleType);

//Additional options as a dictionary with JavaScript properties - note: if set, equal properties from the chartmodel will be overwritten!
AAPropStatementAndFuncStatement(strong, AAChartModel, NSDictionary  *, additionalOptions);

@end
