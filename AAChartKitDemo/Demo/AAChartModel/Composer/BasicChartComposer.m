//
//  BasicChartComposer.m
//  AAChartKit
//
//  Created by An An on 17/3/13.
//  Copyright © 2017年 An An. All rights reserved.
//

#import "BasicChartComposer.h"

@implementation BasicChartComposer

+ (AAChartModel *)configureChartModelWithChartType:(BasicChartVCChartType)chartType {
    AAChartType aaChartType = [self convertToAAChartType:chartType];
    
    AAChartModel *aaChartModel = AAChartModel.new
    .chartTypeSet(aaChartType)//图表类型
    .colorsThemeSet(@[@"#fe117c",@"#ffc069",@"#06caf4",@"#7dffc0"])//设置主题颜色数组
    .tooltipValueSuffixSet(@"℃")//设置浮动提示框单位后缀
    .yAxisLineWidthSet(@0)//Y轴轴线线宽为0即是隐藏Y轴轴线
    .yAxisGridLineStyleSet([AALineStyle styleWithWidth:@0])//y轴横向分割线宽度为0(即是隐藏分割线)
    .xAxisLabelsStyleSet(AAStyleColor(AAColor.lightGrayColor))
    .yAxisLabelsStyleSet(AAStyleColor(AAColor.lightGrayColor))
    .legendItemStyleSet(AAStyleColorSizeWeight(AAColor.lightGrayColor, 15, AAChartFontWeightTypeBold))
    .seriesSet(@[
        AASeriesElement.new
        .nameSet(@"2017")
        .dataSet(@[@7.0, @6.9, @9.5, @14.5, @18.2, @21.5, @25.2, @26.5, @23.3, @18.3, @13.9, @9.6]),
        AASeriesElement.new
        .nameSet(@"2018")
        .dataSet(@[@0.2, @0.8, @5.7, @11.3, @17.0, @22.0, @24.8, @24.1, @20.1, @14.1, @8.6, @2.5]),
        AASeriesElement.new
        .nameSet(@"2019")
        .dataSet(@[@0.9, @0.6, @3.5, @8.4, @13.5, @17.0, @18.6, @17.9, @14.3, @9.0, @3.9, @1.0]),
        AASeriesElement.new
        .nameSet(@"2020")
        .dataSet(@[@3.9, @4.2, @5.7, @8.5, @11.9, @15.2, @17.0, @16.6, @14.2, @10.3, @6.6, @4.8]),
    ]);
    
    [self configureStyleForChartType:chartType chartModel:aaChartModel];
    [self configureYAxisPlotLineForChartModel:aaChartModel];
    
    return aaChartModel;
}

+ (AAChartType)convertToAAChartType:(BasicChartVCChartType)chartType {
    switch (chartType) {
        case BasicChartVCChartTypeColumn: return AAChartTypeColumn;
        case BasicChartVCChartTypeBar: return AAChartTypeBar;
        case BasicChartVCChartTypeArea: return AAChartTypeArea;
        case BasicChartVCChartTypeAreaspline: return AAChartTypeAreaspline;
        case BasicChartVCChartTypeLine: return AAChartTypeLine;
        case BasicChartVCChartTypeSpline: return AAChartTypeSpline;
        case BasicChartVCChartTypeStepLine: return AAChartTypeLine;
        case BasicChartVCChartTypeStepArea: return AAChartTypeArea;
        case BasicChartVCChartTypeScatter: return AAChartTypeScatter;
    }
    return AAChartTypeColumn;
}

+ (void)configureStyleForChartType:(BasicChartVCChartType)chartType chartModel:(AAChartModel *)aaChartModel {
    if (chartType == BasicChartVCChartTypeColumn || chartType == BasicChartVCChartTypeBar) {
        [self configureColumnChartAndBarChartStyle:aaChartModel];
    } else if (chartType == BasicChartVCChartTypeArea || chartType == BasicChartVCChartTypeAreaspline) {
        [self configureAreaChartAndAreasplineChartStyle:aaChartModel chartType:chartType];
    } else if (chartType == BasicChartVCChartTypeLine || chartType == BasicChartVCChartTypeSpline) {
        [self configureLineChartAndSplineChartStyle:aaChartModel chartType:chartType];
    } else if (chartType == BasicChartVCChartTypeStepLine || chartType == BasicChartVCChartTypeStepArea) {
        [self configureStepLineChartAndStepAreaChartStyle:aaChartModel chartType:chartType];
    }
}

+ (void)configureColumnChartAndBarChartStyle:(AAChartModel *)aaChartModel {
    aaChartModel
    .categoriesSet(@[@"Java", @"Swift", @"Python", @"Ruby", @"PHP", @"Go",@"C", @"C#", @"C++", @"Perl", @"R", @"MATLAB", @"SQL"])//设置 X 轴坐标文字内容
    .animationTypeSet(AAChartAnimationEaseOutCubic)//图形的渲染动画类型为 EaseOutCubic
    .animationDurationSet(@(1200));//图形渲染动画时长为1200毫秒
}

+ (void)configureAreaChartAndAreasplineChartStyle:(AAChartModel *)aaChartModel chartType:(BasicChartVCChartType)chartType {
    aaChartModel
    .markerSymbolStyleSet(AAChartSymbolStyleTypeInnerBlank)//设置折线连接点样式为:内部白色
    .animationTypeSet(AAChartAnimationEaseOutQuart)//图形的渲染动画为 EaseOutQuart 动画
    .xAxisCrosshairSet([AACrosshair crosshairWithColor:@"#FFE4C4"//(浓汤)乳脂,番茄色准星线
                                              dashStyle:AAChartLineDashStyleTypeLongDashDot
                                                  width:@0.9]);//Zero width to disable crosshair by default
    
    if (chartType == BasicChartVCChartTypeArea) {
        aaChartModel.categoriesSet(@[@"Java", @"Swift", @"Python", @"Ruby", @"PHP", @"Go",@"C", @"C#", @"C++", @"Perl", @"R", @"MATLAB", @"SQL"]);//设置 X 轴坐标文字内容
    } else if (chartType == BasicChartVCChartTypeAreaspline) {
        AASeriesElement *element1 = AASeriesElement.new
        .nameSet(@"Predefined symbol")
        .dataSet(@[@0.45, @0.43, @0.50, @0.55, @0.58, @0.62, @0.83, @0.39, @0.56, @0.67, @0.50, @0.34, @0.50, @0.67, @0.58, @0.29, @0.46, @0.23, @0.47, @0.46, @0.38, @0.56, @0.48, @0.36]);
        AASeriesElement *element2 = AASeriesElement.new
        .nameSet(@"Image symbol")
        .dataSet(@[@0.38, @0.31, @0.32, @0.32, @0.64, @0.66, @0.86, @0.47, @0.52, @0.75, @0.52, @0.56, @0.54, @0.60, @0.46, @0.63, @0.54, @0.51, @0.58, @0.64, @0.60, @0.45, @0.36, @0.67]);
        AASeriesElement *element3 = AASeriesElement.new
        .nameSet(@"Base64 symbol (*)")
        .dataSet(@[@0.46, @0.32, @0.53, @0.58, @0.86, @0.68, @0.85, @0.73, @0.69, @0.71, @0.91, @0.74, @0.60, @0.50, @0.39, @0.67, @0.55, @0.49, @0.65, @0.45, @0.64, @0.47, @0.63, @0.64]);
        AASeriesElement *element4 = AASeriesElement.new
        .nameSet(@"Custom symbol")
        .dataSet(@[@0.60, @0.51, @0.52, @0.53, @0.64, @0.84, @0.65, @0.68, @0.63, @0.47, @0.72, @0.60, @0.65, @0.74, @0.66, @0.65, @0.71, @0.59, @0.65, @0.77, @0.52, @0.53, @0.58, @0.53]);
        
        aaChartModel
        .xAxisTickIntervalSet(@3)//设置 X轴坐标点的间隔数,默认是1(手机端的屏幕较为狭窄, 如果X轴坐标点过多,文字过于密集的时候可以设置此属性值,用户的密集恐惧症将得到有效治疗😝)
        .seriesSet(@[element1,element2,element3,element4]);
    }
}

+ (void)configureLineChartAndSplineChartStyle:(AAChartModel *)aaChartModel chartType:(BasicChartVCChartType)chartType {
    aaChartModel
    .markerSymbolStyleSet(AAChartSymbolStyleTypeBorderBlank)//设置折线连接点样式为:边缘白色
    .xAxisCrosshairSet([AACrosshair crosshairWithColor:@"#778899"//浅石板灰准星线
                                              dashStyle:AAChartLineDashStyleTypeLongDashDotDot
                                                  width:@1.2]);//Zero width to disable crosshair by default
    
    if (chartType == BasicChartVCChartTypeLine) {
        aaChartModel.categories = @[@"Java", @"Swift", @"Python", @"Ruby", @"PHP", @"Go",@"C", @"C#", @"C++", @"Perl", @"R", @"MATLAB", @"SQL"];//设置 X 轴坐标文字内容
    } else if (chartType == BasicChartVCChartTypeSpline) {
        AASeriesElement *element1 = AASeriesElement.new
        .nameSet(@"2017")
        .lineWidthSet(@5.0)
        .dataSet(@[@5.1, @32.2, @23.3, @37.4, @23.5, @40.6,]);
        AASeriesElement *element2 = AASeriesElement.new
        .nameSet(@"2018")
        .lineWidthSet(@5.0)
        .dataSet(@[@8.1, @39.2, @21.3, @34.4, @24.5, @35.6,]);
        AASeriesElement *element3 = AASeriesElement.new
        .nameSet(@"2019")
        .lineWidthSet(@5.0)
        .dataSet(@[@10.1, @37.2, @18.3, @28.4, @26.5, @30.6,]);
        AASeriesElement *element4 = AASeriesElement.new
        .nameSet(@"2020")
        .lineWidthSet(@5.0)
        .dataSet(@[@13.1, @35.2, @16.3, @31.4, @25.5, @26.6,]);
        
        aaChartModel
        .markerRadiusSet(@0)
        .seriesSet(@[element1,element2,element3,element4]);
    }
}

+ (void)configureStepLineChartAndStepAreaChartStyle:(AAChartModel *)aaChartModel chartType:(BasicChartVCChartType)chartType {
    aaChartModel.yAxisVisibleSet(false);
    if (chartType == BasicChartVCChartTypeStepLine) {
        aaChartModel.markerSymbolStyleSet(AAChartSymbolStyleTypeBorderBlank);
    }
    AASeriesElement *element1 = AASeriesElement.new
    .nameSet(@"Berlin")
    .dataSet(@[@149.9, @171.5, @106.4, @129.2, @144.0, @176.0, @135.6, @188.5, @276.4, @214.1, @95.6, @54.4])
    .stepSet(@true);//设置折线样式为直方折线,连接点位置默认靠左👈
    AASeriesElement *element2 = AASeriesElement.new
    .nameSet(@"New York")
    .dataSet(@[@83.6, @78.8, @188.5, @93.4, @106.0, @84.5, @105.0, @104.3, @131.2, @153.5, @226.6, @192.3])
    .stepSet(@true);//设置折线样式为直方折线,连接点位置默认靠左👈
    AASeriesElement *element3 = AASeriesElement.new
    .nameSet(@"Tokyo")
    .dataSet(@[@48.9, @38.8, @19.3, @41.4, @47.0, @28.3, @59.0, @69.6, @52.4, @65.2, @53.3, @72.2])
    .stepSet(@true);//设置折线样式为直方折线,连接点位置默认靠左👈
    
    aaChartModel.seriesSet(@[element1,element2,element3,]);
}

+ (void)configureYAxisPlotLineForChartModel:(AAChartModel *)aaChartModel {
    aaChartModel
    .yAxisPlotLinesSet(@[
        AAPlotLinesElement.new
        .colorSet(@"#F05353")//颜色值(16进制)
        .dashStyleSet(AAChartLineDashStyleTypeLongDashDot)//样式：Dash,Dot,Solid等,默认Solid
        .widthSet(@(1)) //标示线粗细
        .valueSet(@(20)) //所在位置
        .zIndexSet(@(5)) //层叠,标示线在图表中显示的层叠级别，值越大，显示越向前
        .labelSet(AALabel.new
                  .textSet(@"PlotLines Element One")
                  .styleSet(AAStyleColor(@"#F05353")))
        ,
        AAPlotLinesElement.new
        .colorSet(@"#33BDFD")
        .dashStyleSet(AAChartLineDashStyleTypeLongDashDot)
        .widthSet(@(1))
        .valueSet(@(40))
        .zIndexSet(@5)
        .labelSet(AALabel.new
                  .textSet(@"PlotLines Element Two")
                  .styleSet(AAStyleColor(@"#33BDFD")))
        ,
        AAPlotLinesElement.new
        .colorSet(@"#ADFF2F")
        .dashStyleSet(AAChartLineDashStyleTypeLongDashDot)
        .widthSet(@(1))
        .valueSet(@(60))
        .zIndexSet(@5)
        .labelSet(AALabel.new
                  .textSet(@"PlotLines Element Three")
                  .styleSet(AAStyleColor(@"#ADFF2F")))
    ]);
}

@end
