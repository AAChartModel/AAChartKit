//
//  AAChartModel.h
//  AAChartKit
//
//  Created by An An on 17/1/20.
//  Copyright © 2017年 An An. All rights reserved.
//  source code ----*** https://github.com/AAChartModel/AAChartKit ***--- source code
//

#import <Foundation/Foundation.h>
#import "AASeriesElement.h"
#import "AAPlotLinesElement.h"

typedef NSString *AAChartType;
typedef NSString *AAChartSubtitleAlignType;
typedef NSString *AAChartZoomType;
typedef NSString *AAChartStackingType;
typedef NSString *AAChartSymbolType;
typedef NSString *AAChartLegendLayoutType;
typedef NSString *AAChartLegendAlignType;
typedef NSString *AAChartLegendVerticalAlignType;

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

static AAChartSubtitleAlignType const AAChartSubtitleAlignTypeLeft = @"left";
static AAChartSubtitleAlignType const AAChartSubtitleAlignTypeCenter = @"center";
static AAChartSubtitleAlignType const AAChartSubtitleAlignTypeRight = @"right";


static AAChartZoomType const AAChartZoomTypeX   = @"x";
static AAChartZoomType const AAChartZoomTypeY   = @"y";
static AAChartZoomType const AAChartZoomTypeXY  = @"xy";

static AAChartStackingType const AAChartStackingTypeFalse    = @"nil";
static AAChartStackingType const AAChartStackingTypeNormal   = @"normal";
static AAChartStackingType const AAChartStackingTypePercent  = @"percent";

static AAChartSymbolType const AAChartSymbolTypeCircle         = @"circle";
static AAChartSymbolType const AAChartSymbolTypeSquare         = @"square";
static AAChartSymbolType const AAChartSymbolTypeDiamond        = @"diamond";
static AAChartSymbolType const AAChartSymbolTypeTriangle       = @"triangle";
static AAChartSymbolType const AAChartSymbolTypeTriangle_down  = @"triangle-down";

static AAChartLegendLayoutType const AAChartLegendLayoutTypeHorizontal  = @"horizontal";
static AAChartLegendLayoutType const AAChartLegendLayoutTypeVertical    = @"vertical";

static AAChartLegendAlignType const AAChartLegendAlignTypeLeft     = @"left";
static AAChartLegendAlignType const AAChartLegendAlignTypeCenter   = @"center";
static AAChartLegendAlignType const AAChartLegendAlignTypeRight    = @"right";

static AAChartLegendVerticalAlignType const AAChartLegendVerticalAlignTypeTop     = @"top";
static AAChartLegendVerticalAlignType const AAChartLegendVerticalAlignTypeMiddle  = @"middle";
static AAChartLegendVerticalAlignType const AAChartLegendVerticalAlignTypeBottom  = @"bottom";

typedef NS_ENUM(NSInteger,AAChartAnimationType){
    AAChartAnimationTypeLinear =0,
    AAChartAnimationTypeSwing,
    AAChartAnimationTypeEaseInQuad,
    AAChartAnimationTypeEaseOutQuad,
    AAChartAnimationTypeEaseInOutQuad,
    AAChartAnimationTypeEaseInCubic,
    AAChartAnimationTypeEaseOutCubic,
    AAChartAnimationTypeEaseInOutCubic,
    AAChartAnimationTypeEaseInQuart,
    AAChartAnimationTypeEaseOutQuart,
    AAChartAnimationTypeEaseInOutQuart,
    AAChartAnimationTypeEaseInQuint,
    AAChartAnimationTypeEaseOutQuint,
    AAChartAnimationTypeEaseInOutQuint,
    AAChartAnimationTypeEaseInExpo,
    AAChartAnimationTypeEaseOutExpo,
    AAChartAnimationTypeEaseInOutExpo,
    AAChartAnimationTypeEaseInSine,
    AAChartAnimationTypeEaseOutSine,
    AAChartAnimationTypeEaseInOutSine,
    AAChartAnimationTypeEaseInCirc,
    AAChartAnimationTypeEaseOutCirc,
    AAChartAnimationTypeEaseInOutCirc,
    AAChartAnimationTypeEaseInElastic,
    AAChartAnimationTypeEaseOutElastic,
    AAChartAnimationTypeEaseInOutElastic,
    AAChartAnimationTypeEaseInBack,
    AAChartAnimationTypeEaseOutBack,
    AAChartAnimationTypeEaseInOutBack,
    AAChartAnimationTypeEaseInBounce,
    AAChartAnimationTypeEaseOutBounce,
    AAChartAnimationTypeEaseInOutBounce,
};

@interface AAChartModel : NSObject
AAPropStatementAndFuncStatement(copy, AAChartModel, NSString *, title);//标题内容
AAPropStatementAndFuncStatement(copy, AAChartModel, NSString *, subtitle);//副标题内容
AAPropStatementAndFuncStatement(copy, AAChartModel, AAChartSubtitleAlignType, subtitleAlign);//图表副标题文本水平对齐方式。可选的值有 “left”，”center“和“right”。 默认是：center.

AAPropStatementAndFuncStatement(copy, AAChartModel, AAChartType, chartType);//图表类型
AAPropStatementAndFuncStatement(copy, AAChartModel, AAChartStackingType, stacking);//堆积样式
AAPropStatementAndFuncStatement(copy, AAChartModel, AAChartSymbolType, symbol);//折线曲线连接点的类型："circle", "square", "diamond", "triangle","triangle-down"，默认是"circle"
AAPropStatementAndFuncStatement(copy, AAChartModel, AAChartZoomType, zoomType);//缩放类型 AAChartZoomTypeX表示可沿着 x 轴进行手势缩放
AAPropStatementAndFuncStatement(assign, AAChartModel, AAChartAnimationType, animationType);//设置图表的渲染动画类型
AAPropStatementAndFuncStatement(strong, AAChartModel, NSNumber *, animationDuration);//设置图表的渲染动画时长

AAPropStatementAndFuncStatement(assign, AAChartModel, BOOL, pointHollow);//折线曲线的连接点是否为空心的
AAPropStatementAndFuncStatement(assign, AAChartModel, BOOL, inverted);//x 轴是否垂直
AAPropStatementAndFuncStatement(assign, AAChartModel, BOOL, xAxisReversed);// x 轴翻转
AAPropStatementAndFuncStatement(assign, AAChartModel, BOOL, yAxisReversed);//y 轴翻转
AAPropStatementAndFuncStatement(assign, AAChartModel, BOOL, crosshairs);//是否显示准星线(默认显示)
AAPropStatementAndFuncStatement(assign, AAChartModel, BOOL, gradientColorEnable);//是否要为渐变色
AAPropStatementAndFuncStatement(assign, AAChartModel, BOOL, polar);//是否极化图形(变为雷达图)
AAPropStatementAndFuncStatement(assign, AAChartModel, BOOL, dataLabelEnabled);//是否显示数据
AAPropStatementAndFuncStatement(assign, AAChartModel, BOOL, xAxisLabelsEnabled);//x轴是否显示数据
AAPropStatementAndFuncStatement(strong, AAChartModel, NSArray *, categories);//图表横坐标每个点对应的名称
AAPropStatementAndFuncStatement(strong, AAChartModel, NSNumber *, xAxisGridLineWidth);//x轴网格线的宽度
AAPropStatementAndFuncStatement(assign, AAChartModel, BOOL, yAxisLabelsEnabled);//y轴是否显示数据
AAPropStatementAndFuncStatement(copy,   AAChartModel, NSString *, yAxisTitle);//y轴标题
AAPropStatementAndFuncStatement(strong, AAChartModel, NSNumber *, yAxisGridLineWidth);//y轴网格线的宽度

AAPropStatementAndFuncStatement(strong, AAChartModel, NSArray *, colorsTheme);//图表主题颜色数组
AAPropStatementAndFuncStatement(strong, AAChartModel, NSArray *, series);

AAPropStatementAndFuncStatement(assign, AAChartModel, BOOL, legendEnabled);//是否显示图例
AAPropStatementAndFuncStatement(copy,   AAChartModel ,AAChartLegendLayoutType, legendLayout);//图例数据项的布局。布局类型： "horizontal" 或 "vertical" 即水平布局和垂直布局 默认是：horizontal.
AAPropStatementAndFuncStatement(copy,   AAChartModel ,AAChartLegendAlignType, legendAlign);//设定图例在图表区中的水平对齐方式，合法值有left，center 和 right。
AAPropStatementAndFuncStatement(copy,   AAChartModel ,AAChartLegendVerticalAlignType, legendVerticalAlign);//设定图例在图表区中的垂直对齐方式，合法值有 top，middle 和 bottom。垂直位置可以通过 y 选项做进一步设定。

AAPropStatementAndFuncStatement(copy,   AAChartModel, NSString *, backgroundColor);//图表背景色
AAPropStatementAndFuncStatement(assign, AAChartModel, BOOL, options3dEnable);//是否3D化图形(仅对条形图,柱状图有效)
AAPropStatementAndFuncStatement(strong, AAChartModel, NSNumber *, options3dAlpha);
AAPropStatementAndFuncStatement(strong, AAChartModel, NSNumber *, options3dBeta);
AAPropStatementAndFuncStatement(strong, AAChartModel, NSNumber *, options3dDepth);//3D图形深度

AAPropStatementAndFuncStatement(strong, AAChartModel, NSNumber *, borderRadius);//柱状图长条图头部圆角半径(可用于设置头部的形状,仅对条形图,柱状图有效)
AAPropStatementAndFuncStatement(strong, AAChartModel, NSNumber *, markerRadius);//折线连接点的半径长度

AAPropStatementAndFuncStatement(assign, AAChartModel, BOOL, yAllowDecimals);//是否允许y轴显示小数
AAPropStatementAndFuncStatement(strong, AAChartModel, NSArray *, yPlotLines);//y轴基线的配置
AAPropStatementAndFuncStatement(strong, AAChartModel, NSNumber *, yMax);//y轴最大值
AAPropStatementAndFuncStatement(strong, AAChartModel, NSNumber *, yMin);//y轴最小值（设置为0就不会有负数）
AAPropStatementAndFuncStatement(strong, AAChartModel, NSArray *, yTickPositions);//自定义Y轴坐标（如：[@(0), @(25), @(50), @(75) , (100)]）

@end
