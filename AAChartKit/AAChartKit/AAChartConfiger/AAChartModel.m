
//
//  AAChartModel.m
//  AAChartKit
//
//  Created by An An on 17/1/20.
//  Copyright © 2017年 An An. All rights reserved.
//

#import "AAChartModel.h"

@implementation AAChartModel
-(instancetype)init{
    self = [super init];
    if (self) {
        self.chartType = AAChartTypeColumn;
        self.inverted = NO;
        self.stacking = AAChartStackingTypeFalse;
        self.xAxisReversed = NO;
        self.yAxisReversed = NO;
        self.zoomType = AAChartZoomTypeX;
        self.colorsTheme =  @[@"#b5282a",@"#e7a701",@"#50c18d",@"#c37779",@"#f1c6c5"];
        self.gradientColorEnable = NO;
        self.polar = NO;
        self.symbol= AAChartSymbolTypeCircle;
        self.options3dEnable = NO;
        self.crosshairs = YES;
        self.xAxisLabelsEnabled = YES;
        self.xAxisGridLineWidth = @0;
        self.yAxisLabelsEnabled = YES;
        self.yAxisGridLineWidth = @1;
        self.legendEnabled = YES;
        self.legendLayout = AAChartLegendLayoutTypeHorizontal;
        self.legendAlign = AAChartLegendAlignTypeCenter;
        self.legendVerticalAlign = AAChartLegendVerticalAlignTypeBottom;
        
        self.borderRadius = @0;
        self.markerRadius = @6;//折线连接点的半径长度,设置默认值为0,这样就相当于不显示了
        
        
    }
    return self;
}
AAPropSetFuncImplementation(AAChartModel, NSString *, title);//标题内容
AAPropSetFuncImplementation(AAChartModel, NSString *, subtitle);//副标题内容

AAPropSetFuncImplementation(AAChartModel, NSString *, chartType);//图表类型
AAPropSetFuncImplementation(AAChartModel, NSString *, stacking);//堆积类型
AAPropSetFuncImplementation(AAChartModel, NSString *, symbol);//曲线点类型："circle", "square", "diamond", "triangle","triangle-down"，默认是"circle"
AAPropSetFuncImplementation(AAChartModel, NSString *, zoomType);//缩放类型

AAPropSetFuncImplementation(AAChartModel, BOOL , inverted);
AAPropSetFuncImplementation(AAChartModel, BOOL, xAxisReversed);
AAPropSetFuncImplementation(AAChartModel, BOOL, yAxisReversed);
AAPropSetFuncImplementation(AAChartModel, BOOL, crosshairs);
AAPropSetFuncImplementation(AAChartModel, BOOL, dataLabelEnabled);//是否显示数据
AAPropSetFuncImplementation(AAChartModel, BOOL, polar);
AAPropSetFuncImplementation(AAChartModel, BOOL, gradientColorEnable);//是否要为渐变色
AAPropSetFuncImplementation(AAChartModel, BOOL, xAxisLabelsEnabled);//x轴是否显示数据
AAPropSetFuncImplementation(AAChartModel, NSArray *, categories);
AAPropSetFuncImplementation(AAChartModel, NSNumber *, xAxisGridLineWidth);//x轴网格线的宽度
AAPropSetFuncImplementation(AAChartModel, BOOL, yAxisLabelsEnabled);//y轴是否显示数据
AAPropSetFuncImplementation(AAChartModel, NSString *, yAxisTitle);//y轴标题
AAPropSetFuncImplementation(AAChartModel, NSNumber *, yAxisGridLineWidth);//x轴网格线的宽度

AAPropSetFuncImplementation(AAChartModel, NSArray *, colorsTheme);


AAPropSetFuncImplementation(AAChartModel, NSArray *, series);

AAPropSetFuncImplementation(AAChartModel, BOOL, legendEnabled);//是否显示图例
AAPropSetFuncImplementation(AAChartModel, NSString *, legendLayout);
AAPropSetFuncImplementation(AAChartModel, NSString *, legendAlign);
AAPropSetFuncImplementation(AAChartModel, NSString *, legendVerticalAlign);


AAPropSetFuncImplementation(AAChartModel, NSString *, backgroundColor);
AAPropSetFuncImplementation(AAChartModel, BOOL,       options3dEnable);
AAPropSetFuncImplementation(AAChartModel, NSNumber *, options3dAlpha);
AAPropSetFuncImplementation(AAChartModel, NSNumber *, options3dBeta);
AAPropSetFuncImplementation(AAChartModel, NSNumber *, options3dDepth);
AAPropSetFuncImplementation(AAChartModel, NSNumber *, borderRadius);
AAPropSetFuncImplementation(AAChartModel, NSNumber *, markerRadius);//折线连接点的半径长度









@end
