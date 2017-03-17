//
//  AAColumnAndBarAndSoOnOptions.m
//  AAChartKit
//
//  Created by An An on 17/1/9.
//  Copyright © 2017年 An An. All rights reserved.
//

#import "AAOptionsConstructor.h"

@implementation AAOptionsConstructor
+(AAOptions *)configColumnAndBarAndSoONChartOptionsWithAAChartModel:(AAChartModel *)chartModel{
    AAChart *chart = AAObject(AAChart)
    .typeSet(chartModel.chartType)//绘图类型
    .invertedSet(chartModel.inverted)//设置是否反转坐标轴，使X轴垂直，Y轴水平。 如果值为 true，则 x 轴默认是 倒置 的。 如果图表中出现条形图系列，则会自动反转
    .backgroundColorSet(chartModel.backgroundColor)
    .animationSet(true)//设置是否启用动画(不过我好像记得这里的动画指的是点击 legend 的时候的动画)
    .zoomTypeSet(chartModel.zoomType)//设置手势缩放方向
    .panningSet(true)//设置手势缩放后是否可平移
    .polarSet(chartModel.polar)
    .options3dSet(AAObject(AAOptions3d)
                  .enabledSet(chartModel.options3dEnable)
                  .alphaSet(@-15)
                  );
    
    
    AATitle *title = AAObject(AATitle)
    .textSet(chartModel.title)//标题文本内容
    .styleSet(AAObject(AAStyle)
              .colorSet(@"#000000")//标题颜色
              .fontSizeSet(@"12px"));//标题字体大小
    
    
    AASubtitle *subtitle = AAObject(AASubtitle)
    .textSet(chartModel.subtitle)//副标题内容
    .styleSet(AAObject(AAStyle)
              .colorSet(@"#000000")
              .fontSizeSet(@"9px"));
    
    AAXAxis *xAxis = AAObject(AAXAxis)
    .labelsSet(AAObject(AALabels)
               .enabledSet(chartModel.xAxisLabelsEnabled)//设置 x 轴是否显示文字
               )
    .reversedSet(chartModel.xAxisReversed)
    .gridLineWidthSet(chartModel.xAxisGridLineWidth)//x轴网格线宽度
    .categoriesSet(chartModel.categories);
    
    AAYAxis *yAxis = AAObject(AAYAxis)
    //            .minSet(@0)//设置 y 轴最小值,最小值等于零就不能显示负值了
    .labelsSet(AAObject(AALabels)
               .enabledSet(chartModel.yAxisLabelsEnabled)//设置 y 轴是否显示数字
               )
    .reversedSet(chartModel.yAxisReversed)
    .gridLineWidthSet(chartModel.yAxisGridLineWidth)//y轴网格线宽度
    .titleSet(AAObject(AATitle)
              .textSet(chartModel.yAxisTitle))//y 轴标题
    .lineWidthSet(@0)
    ;
    
    AATooltip *tooltip = AAObject(AATooltip)
    .sharedSet(true)
    .crosshairsSet(true);
    //        .useHTMLSet(true)
    //    .valueSuffixSet(@"摄氏度");
    
    NSString *chartModelStacking = chartModel.stacking;
    if ([chartModel.stacking isEqualToString:@"nil"]) {
        chartModelStacking = nil;
    }
    
    AAPlotOptions *plotOptions = AAObject(AAPlotOptions)
    .seriesSet(AAObject(AASeries)
               .stackingSet(chartModelStacking)//设置是否百分比堆叠显示图形
               .markerSet(AAObject(AAMarker)
                          .radiusSet(chartModel.markerRadius)//曲线连接点半径，默认是4
                          .symbolSet(chartModel.symbol)//曲线点类型："circle", "square", "diamond", "triangle","triangle-down"，默认是"circle"
                          )
               );
    
    if ([chartModel.chartType isEqualToString:AAChartTypeColumn]) {
        plotOptions.columnSet(AAObject(AAColumn)
                              .pointPaddingSet(@0.2)
                              .borderWidthSet(@0)
                              .dataLabelsSet(AAObject(AADataLabels)
                                             .enabledSet(chartModel.dataLabelEnabled)
                                             )
                              );
    }else if ([chartModel.chartType isEqualToString:AAChartTypeBar]){
        plotOptions.barSet(AAObject(AABar)
                           .pointPaddingSet(@0.2)
                           .borderWidthSet(@0)
                           .colorByPointSet(false)
                           .dataLabelsSet(AAObject(AADataLabels)
                                          .enabledSet(chartModel.dataLabelEnabled)
                                          )
                           );
    }else if ([chartModel.chartType isEqualToString:AAChartTypeArea]){
        plotOptions.areaSet(AAObject(AAArea)
                            .dataLabelsSet(AAObject(AADataLabels)
                                           .enabledSet(chartModel.dataLabelEnabled)
                                           )
                            );
    }else if ([chartModel.chartType isEqualToString:AAChartTypeAreaspline]){
        plotOptions.areasplineSet(AAObject(AAAreaspline)
                                  .dataLabelsSet(AAObject(AADataLabels)
                                                 .enabledSet(chartModel.dataLabelEnabled)
                                                 )
                                  );
        
        
    }else if ([chartModel.chartType isEqualToString:AAChartTypeLine]){
        plotOptions.lineSet(AAObject(AALine)
                            .dataLabelsSet(AAObject(AADataLabels)
                                           .enabledSet(chartModel.dataLabelEnabled)
                                           )
                            );
    }else if ([chartModel.chartType isEqualToString:AAChartTypeSpline]){
        plotOptions.splineSet(AAObject(AASpline)
                              .dataLabelsSet(AAObject(AADataLabels)
                                             .enabledSet(chartModel.dataLabelEnabled))
                              );
    }else if ([chartModel.chartType isEqualToString:AAChartTypePie]){
        plotOptions.pieSet(AAObject(AAPie)
                           .allowPointSelectSet(true)
                           .cursorSet(@"pointer")
                           .depthSet(chartModel.options3dDepth)//设置3d 图形阴影深度
                           .dataLabelsSet(AAObject(AADataLabels)
                                          .enabledSet(chartModel.dataLabelEnabled)
                                          .styleSet(AAObject(AAStyle)
                                                    .colorSet(@"white")
                                                    )
                                          )
                           .showInLegendSet(true)
                            );
    }
    
    
    AALegend *legend = AAObject(AALegend)
    .enabledSet(chartModel.legendEnabled)//是否显示 legend
    .layoutSet(chartModel.legendLayout)//图例数据项的布局。布局类型： "horizontal" 或 "vertical" 即水平布局和垂直布局 默认是：horizontal.
    .alignSet(chartModel.legendAlign)//设定图例在图表区中的水平对齐方式，合法值有left，center 和 right。
    .verticalAlignSet(chartModel.legendVerticalAlign)//设定图例在图表区中的垂直对齐方式，合法值有 top，middle 和 bottom。垂直位置可以通过 y 选项做进一步设定。
    .borderWidthSet(@0);
    
    
    AAOptions *options =AAObject(AAOptions)
    .chartSet(chart)
    .titleSet(title)
    .subtitleSet(subtitle)
    .xAxisSet(xAxis)
    .yAxisSet(yAxis)
    .tooltipSet(tooltip)
    .plotOptionsSet(plotOptions)
    .legendSet(legend)
    .seriesSet(chartModel.series)
    .colorsThemeSet(chartModel.colorsTheme)//设置颜色主题
    .gradientColorEnableSet(chartModel.gradientColorEnable)//设置主题颜色是否为渐变色
    ;
    return options;
}




@end
