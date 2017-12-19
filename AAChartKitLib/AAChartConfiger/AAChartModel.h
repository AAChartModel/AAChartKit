//
//  AAChartModel.h
//  AAChartKit
//
//  Created by An An on 17/1/20.
//  Copyright © 2017年 An An. All rights reserved.
//  source code ----*** https://github.com/AAChartModel/AAChartKit ***--- source code
//

/*
 
 * -------------------------------------------------------------------------------
 *
 * ❀❀❀   WARM TIPS!!!   ❀❀❀
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


static AAChartType const AAChartTypeColumn      = @"column";
static AAChartType const AAChartTypeBar         = @"bar";
static AAChartType const AAChartTypeArea        = @"area";
static AAChartType const AAChartTypeAreaspline  = @"areaspline";
static AAChartType const AAChartTypeLine        = @"line";
static AAChartType const AAChartTypeSpline      = @"spline";
static AAChartType const AAChartTypeScatter     = @"scatter";
static AAChartType const AAChartTypePie         = @"pie";
static AAChartType const AAChartTypeBubble      = @"bubble";
static AAChartType const AAChartTypePyramid     = @"pyramid";
static AAChartType const AAChartTypeFunnel      = @"funnel";
static AAChartType const AAChartTypeColumnrange = @"columnrange";
static AAChartType const AAChartTypeArearange   = @"arearange";

static AAChartSubtitleAlignType const AAChartSubtitleAlignTypeLeft   = @"left";
static AAChartSubtitleAlignType const AAChartSubtitleAlignTypeCenter = @"center";
static AAChartSubtitleAlignType const AAChartSubtitleAlignTypeRight  = @"right";

static AAChartZoomType const AAChartZoomTypeNone = @"none";
static AAChartZoomType const AAChartZoomTypeX    = @"x";
static AAChartZoomType const AAChartZoomTypeY    = @"y";
static AAChartZoomType const AAChartZoomTypeXY   = @"xy";

static AAChartStackingType const AAChartStackingTypeFalse   = @"";
static AAChartStackingType const AAChartStackingTypeNormal  = @"normal";
static AAChartStackingType const AAChartStackingTypePercent = @"percent";

static AAChartSymbolType const AAChartSymbolTypeCircle        = @"circle";
static AAChartSymbolType const AAChartSymbolTypeSquare        = @"square";
static AAChartSymbolType const AAChartSymbolTypeDiamond       = @"diamond";
static AAChartSymbolType const AAChartSymbolTypeTriangle      = @"triangle";
static AAChartSymbolType const AAChartSymbolTypeTriangle_down = @"triangle-down";

static AAChartSymbolStyleType const AAChartSymbolStyleTypeDefault     = @"default";
static AAChartSymbolStyleType const AAChartSymbolStyleTypeInnerBlank  = @"innerBlank";
static AAChartSymbolStyleType const AAChartSymbolStyleTypeBorderBlank = @"borderBlank";

@interface AAChartModel : NSObject

AAPropStatementAndFuncStatement(copy,   AAChartModel, NSString *, title);//标题内容
AAPropStatementAndFuncStatement(copy,   AAChartModel, NSString *, subtitle);//副标题内容
AAPropStatementAndFuncStatement(strong, AAChartModel, NSArray  *, series);//图表的数据列内容

AAPropStatementAndFuncStatement(copy,   AAChartModel, AAChartSubtitleAlignType, subtitleAlign);//图表副标题文本水平对齐方式。可选的值有 “left”，”center“和“right”。 默认是：center.
AAPropStatementAndFuncStatement(copy,   AAChartModel, AAChartType,              chartType);//图表类型
AAPropStatementAndFuncStatement(copy,   AAChartModel, AAChartStackingType,      stacking);//堆积样式
AAPropStatementAndFuncStatement(copy,   AAChartModel, AAChartSymbolType,        symbol);//折线曲线连接点的类型："circle", "square", "diamond", "triangle","triangle-down"，默认是"circle"
AAPropStatementAndFuncStatement(assign, AAChartModel, AAChartSymbolStyleType,   symbolStyle);
AAPropStatementAndFuncStatement(copy,   AAChartModel, AAChartZoomType,          zoomType);//缩放类型 AAChartZoomTypeX 表示可沿着 x 轴进行手势缩放
AAPropStatementAndFuncStatement(assign, AAChartModel, AAChartAnimation,         animationType);//设置图表的渲染动画类型

AAPropStatementAndFuncStatement(strong, AAChartModel, NSNumber *, animationDuration);//设置图表的渲染动画时长
AAPropStatementAndFuncStatement(assign, AAChartModel, BOOL,       inverted);//x 轴是否垂直
AAPropStatementAndFuncStatement(assign, AAChartModel, BOOL,       xAxisReversed);// x 轴翻转
AAPropStatementAndFuncStatement(assign, AAChartModel, BOOL,       yAxisReversed);//y 轴翻转
AAPropStatementAndFuncStatement(assign, AAChartModel, BOOL,       gradientColorEnable);//是否要为渐变色
AAPropStatementAndFuncStatement(assign, AAChartModel, BOOL,       polar);//是否极化图形(变为雷达图)
AAPropStatementAndFuncStatement(assign, AAChartModel, BOOL,       dataLabelEnabled);//是否显示数据
AAPropStatementAndFuncStatement(assign, AAChartModel, BOOL,       xAxisLabelsEnabled);//x 轴是否显示数据
AAPropStatementAndFuncStatement(strong, AAChartModel, NSArray  *, categories);//图表横坐标每个点对应的名称
AAPropStatementAndFuncStatement(strong, AAChartModel, NSNumber *, xAxisGridLineWidth);//x 轴网格线的宽度
AAPropStatementAndFuncStatement(assign, AAChartModel, BOOL,       yAxisLabelsEnabled);//y 轴是否显示数据
AAPropStatementAndFuncStatement(copy,   AAChartModel, NSString *, yAxisTitle);//y 轴标题
AAPropStatementAndFuncStatement(strong, AAChartModel, NSNumber *, yAxisGridLineWidth);//y轴网格线的宽度
AAPropStatementAndFuncStatement(strong, AAChartModel, NSArray     <NSString *>*, colorsTheme);//图表主题颜色数组
AAPropStatementAndFuncStatement(copy,   AAChartModel, NSString *, backgroundColor);//图表背景色(必须为十六进制的颜色色值如红色"#FF0000")

AAPropStatementAndFuncStatement(copy,   AAChartModel, NSString *, tooltipValueSuffix);//浮动提示框单位后缀
AAPropStatementAndFuncStatement(assign, AAChartModel, BOOL,       tooltipCrosshairs);//是否显示准星线(默认显示)
AAPropStatementAndFuncStatement(assign, AAChartModel, BOOL,       connectNulls);//设置折线是否断点重连(是否连接空值点)
AAPropStatementAndFuncStatement(assign, AAChartModel, BOOL,       legendEnabled);//是否显示图例 lengend(图表底部可点按的圆点和文字)

AAPropStatementAndFuncStatement(assign, AAChartModel, BOOL,       options3dEnable);//是否 3D 化图形(仅对条形图,柱状图有效)
AAPropStatementAndFuncStatement(strong, AAChartModel, NSNumber *, options3dAlpha);
AAPropStatementAndFuncStatement(strong, AAChartModel, NSNumber *, options3dBeta);
AAPropStatementAndFuncStatement(strong, AAChartModel, NSNumber *, options3dDepth);//3D 图形深度

AAPropStatementAndFuncStatement(strong, AAChartModel, NSNumber *, borderRadius);//柱状图长条图头部圆角半径(可用于设置头部的形状,仅对条形图,柱状图有效)
AAPropStatementAndFuncStatement(strong, AAChartModel, NSNumber *, markerRadius);//折线连接点的半径长度

AAPropStatementAndFuncStatement(assign, AAChartModel, BOOL,       yAllowDecimals);//是否允许 y 轴显示小数
AAPropStatementAndFuncStatement(strong, AAChartModel, NSArray  *, yPlotLines);//y 轴基线的配置
AAPropStatementAndFuncStatement(strong, AAChartModel, NSNumber *, yMax);//y 轴最大值
AAPropStatementAndFuncStatement(strong, AAChartModel, NSNumber *, yMin);//y 轴最小值（设置为0就不会有负数）
AAPropStatementAndFuncStatement(strong, AAChartModel, NSArray  *, yTickPositions);//自定义 y 轴坐标（如：[@(0), @(25), @(50), @(75) , (100)]）

@end
