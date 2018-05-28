
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
 * JianShu       : http://www.jianshu.com/u/f1e6753d4254
 * SegmentFault  : https://segmentfault.com/u/huanghunbieguan
 *
 * -------------------------------------------------------------------------------
 
 */

#import "AAChartModel.h"

AAChartType const AAChartTypeColumn      = @"column";
AAChartType const AAChartTypeBar         = @"bar";
AAChartType const AAChartTypeArea        = @"area";
AAChartType const AAChartTypeAreaspline  = @"areaspline";
AAChartType const AAChartTypeLine        = @"line";
AAChartType const AAChartTypeSpline      = @"spline";
AAChartType const AAChartTypeScatter     = @"scatter";
AAChartType const AAChartTypePie         = @"pie";
AAChartType const AAChartTypeBubble      = @"bubble";
AAChartType const AAChartTypePyramid     = @"pyramid";
AAChartType const AAChartTypeFunnel      = @"funnel";
AAChartType const AAChartTypeColumnrange = @"columnrange";
AAChartType const AAChartTypeArearange   = @"arearange";
AAChartType const AAChartTypeBoxplot     = @"boxplot";
AAChartType const AAChartTypeWaterfall   = @"waterfall";

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

AALineDashSyleType const AALineDashSyleTypeSolid           = @"Solid";
AALineDashSyleType const AALineDashSyleTypeShortDash       = @"ShortDash";
AALineDashSyleType const AALineDashSyleTypeShortDot        = @"ShortDot";
AALineDashSyleType const AALineDashSyleTypeShortDashDot    = @"ShortDashDot";
AALineDashSyleType const AALineDashSyleTypeShortDashDotDot = @"ShortDashDotDot";
AALineDashSyleType const AALineDashSyleTypeDot             = @"Dot";
AALineDashSyleType const AALineDashSyleTypeDash            = @"Dash";
AALineDashSyleType const AALineDashSyleTypeLongDash        = @"LongDash";
AALineDashSyleType const AALineDashSyleTypeDashDot         = @"DashDot";
AALineDashSyleType const AALineDashSyleTypeLongDashDot     = @"LongDashDot";
AALineDashSyleType const AALineDashSyleTypeLongDashDotDot  = @"LongDashDotDot";

@implementation AAChartModel

- (instancetype)init {
    self = [super init];
    if (self) {
        self.chartType              = AAChartTypeColumn;//默认图表类型为柱状图
        self.animationType          = AAChartAnimationLinear;//默认使用非easing.js中的'linear'线性渐变效果
        self.animationDuration      = @800;//默认动画时长为800毫秒
        self.subtitleAlign          = AAChartSubtitleAlignTypeLeft;//默认图表副标题居左显示
        self.stacking               = AAChartStackingTypeFalse;//默认不开启图表数据的堆积效果
        self.zoomType               = AAChartZoomTypeNone ;//默认禁用图表的手势缩放功能
        self.colorsTheme            = @[@"#9b43b4",@"#ef476f",@"#ffd066",@"#04d69f",@"#25547c",];//默认颜色主题
        self.tooltipEnabled         = YES;//默认启用浮动提示框
//        self.tooltipCrosshairs      = YES;//默认启用准星线
        self.xAxisLabelsEnabled     = YES;//默认显示 X轴坐标点文字
        self.xAxisGridLineWidth     = @0; //设置x轴分割线宽度为0个像素,即是隐藏 X轴分割线
        self.xAxisTickInterval      = @1; //x轴坐标点间隔数(默认是1)
        self.xAxisVisible           = YES;//x轴默认可见
        self.yAxisVisible           = YES;//y轴默认可见
        self.yAxisLabelsEnabled     = YES;
        self.yAxisLineWidth         = @0.5; //y轴轴线的宽度为1
        self.yAxisGridLineWidth     = @1; //y轴分割线线宽为一个像素
        self.legendEnabled          = YES;//默认显示图例(图表下方可点击的带有文字的小圆点)
        self.borderRadius           = @0; //柱状图长条图头部圆角半径(可用于设置头部的形状,仅对条形图,柱状图有效,设置为1000时,柱形图或者条形图头部为楔形)
        self.markerRadius           = @5; //折线连接点的半径长度,如果值设置为0,这样就相当于不显示了
        self.yAxisAllowDecimals     = YES;//默认y轴允许显示小数
        self.zoomResetButtonText    = @"恢复缩放";//恢复缩放按钮的标题文字

        self.titleFontColor         = @"#000000";//标题字体颜色为黑色
        self.titleFontWeight        = AAChartFontWeightTypeRegular;//常规字体
        self.titleFontSize          = @11;
        self.subtitleFontColor      = @"#000000";//副标题字体颜色为黑色
        self.subtitleFontWeight     = AAChartFontWeightTypeRegular;//常规字体
        self.subtitleFontSize       = @9;
        self.dataLabelFontColor     = @"#000000";//数据标签默认颜色为黑色
        self.dataLabelFontWeight    = AAChartFontWeightTypeBold;//图表的数据字体为粗体
        self.dataLabelFontSize      = @10;
        self.xAxisLabelsFontSize    = @11;//x轴字体大小
        self.xAxisLabelsFontColor   = @"#778899";//浅石板灰色字体
        self.xAxisLabelsFontWeight  = AAChartFontWeightTypeThin;//细体字
        self.yAxisLabelsFontSize    = @11;
        self.yAxisLabelsFontColor   = @"#778899";//浅石板灰色字体
        self.yAxisLabelsFontWeight  = AAChartFontWeightTypeThin;//细体字
        self.yAxisAlternateGridColor= @"#ffffff";//backcolor of every other grid line area
        
//        self.xAxisCrosshairWidth    = @1;//Zero width to disable crosshair by default
//        self.xAxisCrosshairColor    = @"#778899";//浅石板灰准星线
//        self.xAxisCrosshairDashStyleType = AALineDashSyleTypeLongDashDot;
//        self.yAxisCrosshairWidth    = @0;//Zero width to disable crosshair by default
//        self.yAxisCrosshairColor    = @"#00bfff";
//        self.yAxisCrosshairDashStyleType = AALineDashSyleTypeLongDashDot;
        
        
    }
    return self;
}

AAPropSetFuncImplementation(AAChartModel, NSString *, title);//标题内容
AAPropSetFuncImplementation(AAChartModel, NSNumber *, titleFontSize);//Title label font size
AAPropSetFuncImplementation(AAChartModel, NSString *, titleFontWeight);//Title label font weight
AAPropSetFuncImplementation(AAChartModel, NSString *, titleFontColor);//Title label font color

AAPropSetFuncImplementation(AAChartModel, NSString *, subtitle);//副标题内容
AAPropSetFuncImplementation(AAChartModel, NSNumber *, subtitleFontSize);//Subtitle label font size
AAPropSetFuncImplementation(AAChartModel, NSString *, subtitleFontWeight);//Subtitle label font weight
AAPropSetFuncImplementation(AAChartModel, NSString *, subtitleFontColor);//Subtitle flabel font color

AAPropSetFuncImplementation(AAChartModel, NSArray  *, series);//图表的数据列内容
AAPropSetFuncImplementation(AAChartModel, NSArray  *, keys);//Key support

AAPropSetFuncImplementation(AAChartModel, AAChartSubtitleAlignType, subtitleAlign);//图表副标题文本水平对齐方式。可选的值有 “left”，”center“和“right”。 默认是：center.
AAPropSetFuncImplementation(AAChartModel, AAChartType,              chartType);//图表类型
AAPropSetFuncImplementation(AAChartModel, AAChartStackingType,      stacking);//堆积样式
AAPropSetFuncImplementation(AAChartModel, AAChartSymbolType,        symbol);//折线曲线连接点的类型："circle", "square", "diamond", "triangle","triangle-down"，默认是"circle"
AAPropSetFuncImplementation(AAChartModel, AAChartSymbolStyleType,   symbolStyle);
AAPropSetFuncImplementation(AAChartModel, AAChartZoomType,          zoomType);//缩放类型 AAChartZoomTypeX 表示可沿着 x 轴进行手势缩放
AAPropSetFuncImplementation(AAChartModel, AAChartAnimation,         animationType);//设置图表的渲染动画类型

AAPropSetFuncImplementation(AAChartModel, NSNumber *, animationDuration);//设置图表的渲染动画时长(动画单位为毫秒)
AAPropSetFuncImplementation(AAChartModel, BOOL,       inverted);//x 轴是否垂直,默认为否
AAPropSetFuncImplementation(AAChartModel, BOOL,       xAxisReversed);// x 轴翻转,默认为否
AAPropSetFuncImplementation(AAChartModel, BOOL,       yAxisReversed);//y 轴翻转,默认为否
AAPropSetFuncImplementation(AAChartModel, BOOL,       gradientColorEnabled);//是否要为渐变色,默认为否
AAPropSetFuncImplementation(AAChartModel, BOOL,       polar);//是否极化图形(变为雷达图),默认为否
AAPropSetFuncImplementation(AAChartModel, BOOL,       dataLabelEnabled);//是否显示数据,默认为否
AAPropSetFuncImplementation(AAChartModel, NSString *, dataLabelFontColor);//Datalabel font color
AAPropSetFuncImplementation(AAChartModel, NSNumber *, dataLabelFontSize);//Datalabel font size
AAPropSetFuncImplementation(AAChartModel, NSString *, dataLabelFontWeight);//Datalabel font weight
AAPropSetFuncImplementation(AAChartModel, NSNumber *, dataLabelRotation);//Datalabel rotation in degrees 
AAPropSetFuncImplementation(AAChartModel, BOOL,       dataLabelAllowOverlap);//Datalabel allow overlapping
//(Note: if rotation <> 0, 'dataLabelAllowOverlap' will not work - this is a bug in HighCharts (https://github.com/highcharts/highcharts/issues/7362)
//******

AAPropSetFuncImplementation(AAChartModel, BOOL,       xAxisLabelsEnabled);//x 轴是否显示数据
AAPropSetFuncImplementation(AAChartModel, NSNumber *, xAxisLabelsFontSize);//x-axis labels font size
AAPropSetFuncImplementation(AAChartModel, NSString *, xAxisLabelsFontWeight);//x-axis fonto weight
AAPropSetFuncImplementation(AAChartModel, NSString *, xAxisLabelsFontColor);//x-axis fonto color
AAPropSetFuncImplementation(AAChartModel, NSArray  *, categories);//图表横坐标每个点对应的名称
AAPropSetFuncImplementation(AAChartModel, NSNumber *, xAxisGridLineWidth);//x 轴网格线的宽度
AAPropSetFuncImplementation(AAChartModel, NSNumber *, xAxisTickInterval);//x轴刻度点间隔数(设置每隔几个点显示一个 X轴的内容)

AAPropSetFuncImplementation(AAChartModel, BOOL,       xAxisVisible);//x 轴是否可见(默认可见)
AAPropSetFuncImplementation(AAChartModel, BOOL,       yAxisVisible);//y 轴是否可见(默认可见)
AAPropSetFuncImplementation(AAChartModel, BOOL,       yAxisLabelsEnabled);//y 轴是否显示数据
AAPropSetFuncImplementation(AAChartModel, NSString *, yAxisTitle);//y 轴标题
AAPropSetFuncImplementation(AAChartModel, NSNumber *, yAxisLineWidth);//y y-axis line width
AAPropSetFuncImplementation(AAChartModel, NSNumber *, yAxisLabelsFontSize);//y-axis labels font size
AAPropSetFuncImplementation(AAChartModel, NSString *, yAxisLabelsFontWeight);//y-axis font weight
AAPropSetFuncImplementation(AAChartModel, NSString *, yAxisLabelsFontColor);//y-axis font color
AAPropSetFuncImplementation(AAChartModel, NSNumber *, yAxisGridLineWidth);//y轴网格线的宽度
AAPropSetFuncImplementation(AAChartModel, NSString *, yAxisAlternateGridColor);//backcolor of every other grid line area
AAPropSetFuncImplementation(AAChartModel, NSNumber *, yAxisTickInterval);

AAPropSetFuncImplementation(AAChartModel, NSArray     <NSString *>*, colorsTheme);//图表主题颜色数组
AAPropSetFuncImplementation(AAChartModel, NSString *, backgroundColor);//图表背景色(必须为十六进制的颜色色值如红色"#FF0000")

AAPropSetFuncImplementation(AAChartModel, BOOL,       tooltipEnabled);//是否显示浮动提示框(默认显示)
AAPropSetFuncImplementation(AAChartModel, NSString *, tooltipValueSuffix);//浮动提示框单位后缀
//AAPropSetFuncImplementation(AAChartModel, NSString *, tooltipValueString);//Tooltip string
//AAPropSetFuncImplementation(AAChartModel, BOOL,       tooltipCrosshairs);//是否显示准星线(默认显示)
AAPropSetFuncImplementation(AAChartModel, BOOL,       connectNulls);//设置折线是否断点重连(是否连接空值点)
AAPropSetFuncImplementation(AAChartModel, BOOL,       legendEnabled);//是否显示图例 lengend(图表底部可点按的圆点和文字)

AAPropSetFuncImplementation(AAChartModel, BOOL,       options3dEnabled);//是否 3D 化图形(仅对条形图,柱状图有效)
AAPropSetFuncImplementation(AAChartModel, NSNumber *, options3dAlpha);
AAPropSetFuncImplementation(AAChartModel, NSNumber *, options3dBeta);
AAPropSetFuncImplementation(AAChartModel, NSNumber *, options3dDepth);//3D 图形深度

AAPropSetFuncImplementation(AAChartModel, NSNumber *, borderRadius);//柱状图长条图头部圆角半径(可用于设置头部的形状,仅对条形图,柱状图有效)
AAPropSetFuncImplementation(AAChartModel, NSNumber *, markerRadius);//折线连接点的半径长度

AAPropSetFuncImplementation(AAChartModel, BOOL,       yAxisAllowDecimals);//是否允许 y 轴显示小数
AAPropSetFuncImplementation(AAChartModel, NSArray  *, yAxisPlotLines);//y 轴基线的配置
AAPropSetFuncImplementation(AAChartModel, NSNumber *, yAxisMax);//y 轴最大值
AAPropSetFuncImplementation(AAChartModel, NSNumber *, yAxisMin);//y 轴最小值（设置为0就不会有负数）
AAPropSetFuncImplementation(AAChartModel, NSArray  *, yAxisTickPositions);//自定义 y 轴坐标（如：[@(0), @(25), @(50), @(75) , (100)]）
AAPropSetFuncImplementation(AAChartModel, NSString *, zoomResetButtonText); //String to display in 'zoom reset button"

AAPropSetFuncImplementation(AAChartModel, NSNumber *, yAxisCrosshairWidth);
AAPropSetFuncImplementation(AAChartModel, NSString *, yAxisCrosshairColor);
AAPropSetFuncImplementation(AAChartModel, AALineDashSyleType,   yAxisCrosshairDashStyleType);

AAPropSetFuncImplementation(AAChartModel, NSNumber *, xAxisCrosshairWidth);
AAPropSetFuncImplementation(AAChartModel, NSString *, xAxisCrosshairColor);
AAPropSetFuncImplementation(AAChartModel, AALineDashSyleType,   xAxisCrosshairDashStyleType);

//Additional options as a dictionary with JavaScript properties - note: if set, equal properties from the chartmodel will be overwritten!
AAPropSetFuncImplementation(AAChartModel, NSDictionary  *, additionalOptions);

@end
