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
 * StackOverflow : https://stackoverflow.com/users/12302132/codeforu
 * JianShu       : https://www.jianshu.com/u/f1e6753d4254
 * SegmentFault  : https://segmentfault.com/u/huanghunbieguan
 *
 * -------------------------------------------------------------------------------
 
 */

#import <Foundation/Foundation.h>
#import "AASeriesElement.h"
#import "AAPlotLinesElement.h"
@class AAStyle, AALineStyle, AACrosshair, AAScrollablePlotArea;

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
typedef NSString *AAChartLayoutType;
typedef NSString *AAChartAlignType;
typedef NSString *AAChartVerticalAlignType;
typedef NSString *AAChartZoomType;
typedef NSString *AAChartStackingType;
typedef NSString *AAChartSymbolType;
typedef NSString *AAChartSymbolStyleType;
typedef NSString *AAChartFontWeightType;
typedef NSString *AAChartLineDashStyleType;

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
AACHARTKIT_EXTERN AAChartType const AAChartTypeErrorbar;
AACHARTKIT_EXTERN AAChartType const AAChartTypeGauge;

AACHARTKIT_EXTERN AAChartLayoutType const AAChartLayoutTypeHorizontal;
AACHARTKIT_EXTERN AAChartLayoutType const AAChartLayoutTypeVertical;

AACHARTKIT_EXTERN AAChartAlignType const AAChartAlignTypeLeft;
AACHARTKIT_EXTERN AAChartAlignType const AAChartAlignTypeCenter;
AACHARTKIT_EXTERN AAChartAlignType const AAChartAlignTypeRight;

AACHARTKIT_EXTERN AAChartVerticalAlignType const AAChartVerticalAlignTypeTop;
AACHARTKIT_EXTERN AAChartVerticalAlignType const AAChartVerticalAlignTypeMiddle;
AACHARTKIT_EXTERN AAChartVerticalAlignType const AAChartVerticalAlignTypeBottom;

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

AACHARTKIT_EXTERN AAChartLineDashStyleType const AAChartLineDashStyleTypeSolid;
AACHARTKIT_EXTERN AAChartLineDashStyleType const AAChartLineDashStyleTypeShortDash;
AACHARTKIT_EXTERN AAChartLineDashStyleType const AAChartLineDashStyleTypeShortDot;
AACHARTKIT_EXTERN AAChartLineDashStyleType const AAChartLineDashStyleTypeShortDashDot;
AACHARTKIT_EXTERN AAChartLineDashStyleType const AAChartLineDashStyleTypeShortDashDotDot;
AACHARTKIT_EXTERN AAChartLineDashStyleType const AAChartLineDashStyleTypeDot;
AACHARTKIT_EXTERN AAChartLineDashStyleType const AAChartLineDashStyleTypeDash;
AACHARTKIT_EXTERN AAChartLineDashStyleType const AAChartLineDashStyleTypeLongDash;
AACHARTKIT_EXTERN AAChartLineDashStyleType const AAChartLineDashStyleTypeDashDot;
AACHARTKIT_EXTERN AAChartLineDashStyleType const AAChartLineDashStyleTypeLongDashDot;
AACHARTKIT_EXTERN AAChartLineDashStyleType const AAChartLineDashStyleTypeLongDashDotDot;

@interface AAChartModel : NSObject

AAPropStatementAndPropSetFuncStatement(copy,   AAChartModel, NSString *, title) //标题内容
AAPropStatementAndPropSetFuncStatement(strong, AAChartModel, AAStyle  *, titleStyle) //标题文字样式

AAPropStatementAndPropSetFuncStatement(copy,   AAChartModel, NSString *, subtitle) //副标题内容
AAPropStatementAndPropSetFuncStatement(strong, AAChartModel, AAStyle  *, subtitleStyle) //副标题文字样式
AAPropStatementAndPropSetFuncStatement(copy,   AAChartModel, AAChartAlignType, subtitleAlign) //图表副标题文本水平对齐方式。可选的值有 “left”，”center“和“right”。 默认是：center.

AAPropStatementAndPropSetFuncStatement(copy,   AAChartModel, NSString *, backgroundColor) //图表背景色(必须为十六进制的颜色色值如红色"#FF0000")
AAPropStatementAndPropSetFuncStatement(strong, AAChartModel, NSArray  *, colorsTheme) //图表主题颜色数组
AAPropStatementAndPropSetFuncStatement(strong, AAChartModel, NSArray     <NSString *>*, categories) //x轴坐标每个点对应的名称(注意:这个不是用来设置 X 轴的值,仅仅是用于设置 X 轴文字内容的而已)
AAPropStatementAndPropSetFuncStatement(strong, AAChartModel, NSArray  *, series) //图表的数据列内容

AAPropStatementAndPropSetFuncStatement(copy,   AAChartModel, AAChartType,              chartType) //图表类型
AAPropStatementAndPropSetFuncStatement(copy,   AAChartModel, AAChartStackingType,      stacking) //堆积样式
AAPropStatementAndPropSetFuncStatement(copy,   AAChartModel, AAChartSymbolType,        markerSymbol) //折线曲线连接点的类型："circle", "square", "diamond", "triangle","triangle-down"，默认是"circle"
AAPropStatementAndPropSetFuncStatement(assign, AAChartModel, AAChartSymbolStyleType,   markerSymbolStyle)
AAPropStatementAndPropSetFuncStatement(copy,   AAChartModel, AAChartZoomType,          zoomType) //缩放类型 AAChartZoomTypeX 表示可沿着 x 轴进行手势缩放
AAPropStatementAndPropSetFuncStatement(assign, AAChartModel, AAChartAnimation,         animationType) //设置图表的渲染动画类型
AAPropStatementAndPropSetFuncStatement(strong, AAChartModel, NSNumber *, animationDuration) //设置图表的渲染动画时长(动画单位为毫秒)
AAPropStatementAndPropSetFuncStatement(assign, AAChartModel, BOOL,       inverted) //x 轴是否垂直,默认为否
AAPropStatementAndPropSetFuncStatement(assign, AAChartModel, BOOL,       polar) //是否极化图形(变为雷达图),默认为否

AAPropStatementAndPropSetFuncStatement(assign, AAChartModel, BOOL,       dataLabelsEnabled) //是否显示数据,默认为否
AAPropStatementAndPropSetFuncStatement(strong, AAChartModel, AAStyle  *, dataLabelsStyle) //dataLabels文字样式

AAPropStatementAndPropSetFuncStatement(assign, AAChartModel, BOOL,       xAxisVisible) //x 轴是否可见(默认可见)
AAPropStatementAndPropSetFuncStatement(assign, AAChartModel, BOOL,       xAxisReversed) // x 轴翻转,默认为否
AAPropStatementAndPropSetFuncStatement(assign, AAChartModel, BOOL,       xAxisLabelsEnabled) //x 轴是否显示文字
AAPropStatementAndPropSetFuncStatement(strong, AAChartModel, AAStyle  *, xAxisLabelsStyle) //x 轴文字样式
AAPropStatementAndPropSetFuncStatement(strong, AAChartModel, NSNumber *, xAxisTickInterval) //x轴刻度点间隔数(设置每隔几个点显示一个 X轴的内容)
AAPropStatementAndPropSetFuncStatement(strong, AAChartModel, AALineStyle *, xAxisGridLineStyle) //x 轴网格线的样式
AAPropStatementAndPropSetFuncStatement(strong, AAChartModel, AACrosshair *, xAxisCrosshair)

AAPropStatementAndPropSetFuncStatement(assign, AAChartModel, BOOL,       yAxisVisible) //y 轴是否可见(默认可见)
AAPropStatementAndPropSetFuncStatement(assign, AAChartModel, BOOL,       yAxisReversed) //y 轴翻转,默认为否
AAPropStatementAndPropSetFuncStatement(assign, AAChartModel, BOOL,       yAxisLabelsEnabled) //y 轴是否显示文字
AAPropStatementAndPropSetFuncStatement(strong, AAChartModel, AAStyle  *, yAxisLabelsStyle) // y 轴文字样式
AAPropStatementAndPropSetFuncStatement(copy,   AAChartModel, NSString *, yAxisTitle) //y 轴标题
AAPropStatementAndPropSetFuncStatement(strong, AAChartModel, NSNumber *, yAxisLineWidth) //y y-axis line width
AAPropStatementAndPropSetFuncStatement(assign, AAChartModel, BOOL,       yAxisAllowDecimals) //是否允许 y 轴显示小数
AAPropStatementAndPropSetFuncStatement(strong, AAChartModel, NSArray  *, yAxisPlotLines) //y 轴标示线🧶的配置
AAPropStatementAndPropSetFuncStatement(strong, AAChartModel, NSNumber *, yAxisMax) //y 轴最大值
AAPropStatementAndPropSetFuncStatement(strong, AAChartModel, NSNumber *, yAxisMin) //y 轴最小值（设置为0就不会有负数）
AAPropStatementAndPropSetFuncStatement(strong, AAChartModel, NSNumber *, yAxisTickInterval)
AAPropStatementAndPropSetFuncStatement(strong, AAChartModel, NSArray  *, yAxisTickPositions) //自定义 y 轴坐标（如：[@(0), @(25), @(50), @(75) , (100)]）
AAPropStatementAndPropSetFuncStatement(strong, AAChartModel, AALineStyle *, yAxisGridLineStyle) //y 轴网格线的样式
AAPropStatementAndPropSetFuncStatement(strong, AAChartModel, AACrosshair *, yAxisCrosshair)

AAPropStatementAndPropSetFuncStatement(assign, AAChartModel, BOOL,       tooltipEnabled) //是否显示浮动提示框(默认显示)
AAPropStatementAndPropSetFuncStatement(assign, AAChartModel, BOOL,       tooltipShared)//是否多组数据共享一个浮动提示框
AAPropStatementAndPropSetFuncStatement(copy,   AAChartModel, NSString *, tooltipValueSuffix) //浮动提示框单位后缀

AAPropStatementAndPropSetFuncStatement(assign, AAChartModel, BOOL,       connectNulls) //设置折线是否断点重连(是否连接空值点)
AAPropStatementAndPropSetFuncStatement(assign, AAChartModel, BOOL,       legendEnabled) //是否显示图例 lengend(图表底部可点按的圆点和文字)
AAPropStatementAndPropSetFuncStatement(strong, AAChartModel, NSNumber *, borderRadius) //柱状图长条图头部圆角半径(可用于设置头部的形状,仅对条形图,柱状图有效)
AAPropStatementAndPropSetFuncStatement(strong, AAChartModel, NSNumber *, markerRadius) //折线连接点的半径长度
AAPropStatementAndPropSetFuncStatement(strong, AAChartModel, AAScrollablePlotArea *, scrollablePlotArea)

@end


@interface AAChartModel(Unavailable)

@property (nonatomic, strong) NSNumber * titleFontSize AAChartKitUnavailable("`titleFontSize` was removed, please use titleStyle instead of it");
- (AAChartModel * (^) (NSNumber * titleFontSize))titleFontSizeSet AAChartKitUnavailable("`titleFontSizeSet` was removed, please use titleStyleSet instead of it");

@property (nonatomic, strong) NSString * titleFontColor AAChartKitUnavailable("`titleFontColor` was removed, please use titleStyle instead of it");
- (AAChartModel * (^) (NSString * titleFontColor))titleFontColorSet AAChartKitUnavailable("`titleFontColorSet` was removed, please use titleStyleSet instead of it");

@property (nonatomic, strong) NSString * titleFontWeight AAChartKitUnavailable("`titleFontWeight` was removed, please use titleStyle instead of it");
- (AAChartModel * (^) (NSString * titleFontWeight))titleFontWeightSet AAChartKitUnavailable("`titleFontWeightSet` was removed, please use titleStyleSet instead of it");



@property (nonatomic, strong) NSNumber * subtitleFontSize AAChartKitUnavailable("`subtitleFontSize` was removed, please use subtitleStyle instead of it");
- (AAChartModel * (^) (NSNumber * subtitleFontSize))subtitleFontSizeSet AAChartKitUnavailable("`subtitleFontSizeSet` was removed, please use subtitleStyleSet instead of it");

@property (nonatomic, strong) NSString * subtitleFontColor AAChartKitUnavailable("`subtitleFontColor` was removed, please use subtitleStyle instead of it");
- (AAChartModel * (^) (NSString * subtitleFontColor))subtitleFontColorSet AAChartKitUnavailable("`subtitleFontColorSet` was removed, please use subtitleStyleSet instead of it");

@property (nonatomic, strong) NSString * subtitleFontWeight AAChartKitUnavailable("`subtitleFontColor` was removed, please use subtitleStyle instead of it");
- (AAChartModel * (^) (NSString * subtitleFontWeight))subtitleFontWeightSet AAChartKitUnavailable("`subtitleFontWeightSet` was removed, please use subtitleStyleSet instead of it");



@property (nonatomic, strong) NSNumber * dataLabelsFontSize AAChartKitUnavailable("`dataLabelsFontSize` was removed, please use dataLabelsStyle instead of it");
- (AAChartModel * (^) (NSNumber * dataLabelsFontSize))dataLabelsFontSizeSet AAChartKitUnavailable("`dataLabelsFontSizeSet` was removed, please use dataLabelsStyleSet instead of it");

@property (nonatomic, strong) NSString * dataLabelsFontColor AAChartKitUnavailable("`dataLabelsFontColor` was removed, please use dataLabelsStyle instead of it");
- (AAChartModel * (^) (NSString * dataLabelsFontColor))dataLabelsFontColorSet AAChartKitUnavailable("`dataLabelsFontColorSet` was removed, please use dataLabelsStyleSet instead of it");

@property (nonatomic, strong) NSString * dataLabelsFontWeight AAChartKitUnavailable("`dataLabelsFontWeight` was removed, please use dataLabelsStyle instead of it");
- (AAChartModel * (^) (NSString * dataLabelsFontWeight))dataLabelsFontWeightSet AAChartKitUnavailable("`dataLabelsFontWeightSet` was removed, please use dataLabelsStyleSet instead of it");



@property (nonatomic, strong) NSNumber * xAxisLabelsFontSize AAChartKitUnavailable("`xAxisLabelsFontSize` was removed, please use xAxisLabelsStyle instead of it");
- (AAChartModel * (^) (NSNumber * xAxisLabelsFontSize))xAxisLabelsFontSizeSet AAChartKitUnavailable("`xAxisLabelsFontSizeSet` was removed, please use xAxisLabelsStyleSet instead of it");

@property (nonatomic, strong) NSString * xAxisLabelsFontColor AAChartKitUnavailable("`xAxisLabelsFontColor` was removed, please use xAxisLabelsStyle instead of it");
- (AAChartModel * (^) (NSString * xAxisLabelsFontColor))xAxisLabelsFontColorSet AAChartKitUnavailable("`xAxisLabelsFontColorSet` was removed, please use xAxisLabelsStyleSet instead of it");

@property (nonatomic, strong) NSString * xAxisLabelsFontWeight AAChartKitUnavailable("`xAxisLabelsFontWeight` was removed, please use xAxisLabelsStyle instead of it");
- (AAChartModel * (^) (NSString * xAxisLabelsFontWeight))xAxisLabelsFontWeightSet AAChartKitUnavailable("`xAxisLabelsFontWeightSet` was removed, please use xAxisLabelsStyleSet instead of it");



@property (nonatomic, strong) NSNumber * yAxisLabelsFontSize AAChartKitUnavailable("`yAxisLabelsFontSize` was removed, please use yAxisLabelsStyle instead of it");
- (AAChartModel * (^) (NSNumber * yAxisLabelsFontSize))yAxisLabelsFontSizeSet AAChartKitUnavailable("`yAxisLabelsFontSizeSet` was removed, please use yAxisLabelsStyleSet instead of it");

@property (nonatomic, strong) NSString * yAxisLabelsFontColor AAChartKitUnavailable("`yAxisLabelsFontColor` was removed, please use yAxisLabelsStyle instead of it");
- (AAChartModel * (^) (NSString * yAxisLabelsFontColor))yAxisLabelsFontColorSet AAChartKitUnavailable("`yAxisLabelsFontColorSet` was removed, please use yAxisLabelsStyleSet instead of it");

@property (nonatomic, strong) NSString * yAxisLabelsFontWeight AAChartKitUnavailable("`yAxisLabelsFontWeight` was removed, please use yAxisLabelsStyle instead of it");
- (AAChartModel * (^) (NSString * yAxisLabelsFontWeight))yAxisLabelsFontWeightSet AAChartKitUnavailable("`yAxisLabelsFontWeightSet` was removed, please use yAxisLabelsStyleSet instead of it");

@end
