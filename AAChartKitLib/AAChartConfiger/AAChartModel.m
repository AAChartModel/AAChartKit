
//
//  AAChartModel.m
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

#import "AAChartModel.h"

@implementation AAChartModel
-(instancetype)init {
    self = [super init];
    if (self) {
        self.chartType           = AAChartTypeColumn;
        self.animationType       = AAChartAnimationLinear;//默认使用非easing.js中的'linear'线性渐变效果
        self.animationDuration   = @500;//默认动画时长为500毫秒
        self.subtitleAlign       = AAChartSubtitleAlignTypeLeft;
        self.inverted            = NO;
        self.stacking            = AAChartStackingTypeFalse;
        self.xAxisReversed       = NO;
        self.yAxisReversed       = NO;
        self.zoomType            = AAChartZoomTypeX;
        self.colorsTheme         = @[@"#b5282a",@"#e7a701",@"#50c18d",@"#fd4800",@"#f1c6c5"];//默认颜色主题
        self.gradientColorEnable = NO;
        self.polar               = NO;
        self.options3dEnable     = NO;
        self.tooltipCrosshairs   = YES;
        self.xAxisLabelsEnabled  = YES;
        self.xAxisGridLineWidth  = @0;
        self.yAxisLabelsEnabled  = YES;
        self.yAxisGridLineWidth  = @1;
        self.legendEnabled       = YES;
        self.borderRadius        = @0;//柱状图长条图头部圆角半径(可用于设置头部的形状,仅对条形图,柱状图有效,设置为1000时,柱形图或者条形图头部为楔形)
        self.markerRadius        = @5;//折线连接点的半径长度,如果值设置为0,这样就相当于不显示了
        self.yAllowDecimals      = YES; //默认y轴显示小数
    }
    return self;
}

AAPropSetFuncImplementation(AAChartModel, NSString *, title);//标题内容
AAPropSetFuncImplementation(AAChartModel, NSString *, subtitle);//副标题内容
AAPropSetFuncImplementation(AAChartModel, NSArray  *, series);//图表的数据列内容

AAPropSetFuncImplementation(AAChartModel, AAChartSubtitleAlignType, subtitleAlign);//图表副标题文本水平对齐方式。可选的值有 “left”，”center“和“right”。 默认是：center.
AAPropSetFuncImplementation(AAChartModel, AAChartType,              chartType);//图表类型
AAPropSetFuncImplementation(AAChartModel, AAChartStackingType,      stacking);//堆积样式
AAPropSetFuncImplementation(AAChartModel, AAChartSymbolType,        symbol);//折线曲线连接点的类型："circle", "square", "diamond", "triangle","triangle-down"，默认是"circle"
AAPropSetFuncImplementation(AAChartModel, AAChartSymbolStyleType,   symbolStyle);
AAPropSetFuncImplementation(AAChartModel, AAChartZoomType,          zoomType);//缩放类型 AAChartZoomTypeX 表示可沿着 x 轴进行手势缩放
AAPropSetFuncImplementation(AAChartModel, AAChartAnimation,         animationType);//设置图表的渲染动画类型

AAPropSetFuncImplementation(AAChartModel, NSNumber *, animationDuration);//设置图表的渲染动画时长
AAPropSetFuncImplementation(AAChartModel, BOOL,       inverted);//x 轴是否垂直
AAPropSetFuncImplementation(AAChartModel, BOOL,       xAxisReversed);// x 轴翻转
AAPropSetFuncImplementation(AAChartModel, BOOL,       yAxisReversed);//y 轴翻转
AAPropSetFuncImplementation(AAChartModel, BOOL,       gradientColorEnable);//是否要为渐变色
AAPropSetFuncImplementation(AAChartModel, BOOL,       polar);//是否极化图形(变为雷达图)
AAPropSetFuncImplementation(AAChartModel, BOOL,       dataLabelEnabled);//是否显示数据
AAPropSetFuncImplementation(AAChartModel, BOOL,       xAxisLabelsEnabled);//x 轴是否显示数据
AAPropSetFuncImplementation(AAChartModel, NSArray  *, categories);//图表横坐标每个点对应的名称
AAPropSetFuncImplementation(AAChartModel, NSNumber *, xAxisGridLineWidth);//x 轴网格线的宽度
AAPropSetFuncImplementation(AAChartModel, BOOL,       yAxisLabelsEnabled);//y 轴是否显示数据
AAPropSetFuncImplementation(AAChartModel, NSString *, yAxisTitle);//y 轴标题
AAPropSetFuncImplementation(AAChartModel, NSNumber *, yAxisGridLineWidth);//y轴网格线的宽度
AAPropSetFuncImplementation(AAChartModel, NSArray     <NSString *>*, colorsTheme);//图表主题颜色数组
AAPropSetFuncImplementation(AAChartModel, NSString *, backgroundColor);//图表背景色(必须为十六进制的颜色色值如红色"#FF0000")

AAPropSetFuncImplementation(AAChartModel, NSString *, tooltipValueSuffix);//浮动提示框单位后缀
AAPropSetFuncImplementation(AAChartModel, BOOL,       tooltipCrosshairs);//是否显示准星线(默认显示)
AAPropSetFuncImplementation(AAChartModel, BOOL,       connectNulls);//设置折线是否断点重连(是否连接空值点)
AAPropSetFuncImplementation(AAChartModel, BOOL,       legendEnabled);//是否显示图例 lengend(图表底部可点按的圆点和文字)

AAPropSetFuncImplementation(AAChartModel, BOOL,       options3dEnable);//是否 3D 化图形(仅对条形图,柱状图有效)
AAPropSetFuncImplementation(AAChartModel, NSNumber *, options3dAlpha);
AAPropSetFuncImplementation(AAChartModel, NSNumber *, options3dBeta);
AAPropSetFuncImplementation(AAChartModel, NSNumber *, options3dDepth);//3D 图形深度

AAPropSetFuncImplementation(AAChartModel, NSNumber *, borderRadius);//柱状图长条图头部圆角半径(可用于设置头部的形状,仅对条形图,柱状图有效)
AAPropSetFuncImplementation(AAChartModel, NSNumber *, markerRadius);//折线连接点的半径长度

AAPropSetFuncImplementation(AAChartModel, BOOL,       yAllowDecimals);//是否允许 y 轴显示小数
AAPropSetFuncImplementation(AAChartModel, NSArray  *, yPlotLines);//y 轴基线的配置
AAPropSetFuncImplementation(AAChartModel, NSNumber *, yMax);//y 轴最大值
AAPropSetFuncImplementation(AAChartModel, NSNumber *, yMin);//y 轴最小值（设置为0就不会有负数）
AAPropSetFuncImplementation(AAChartModel, NSArray  *, yTickPositions);//自定义 y 轴坐标（如：[@(0), @(25), @(50), @(75) , (100)]）
@end
