//
//  AAColumnAndBarAndSoOnOptions.m
//  AAChartKit
//
//  Created by An An on 17/1/9.
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

#import "AAOptionsConstructor.h"

@implementation AAOptionsConstructor
+ (AAOptions *)configureChartOptionsWithAAChartModel:(AAChartModel *)chartModel {
    
    AAChart *chart = AAObject(AAChart)
    .typeSet(chartModel.chartType)//绘图类型
    .invertedSet(chartModel.inverted)//设置是否反转坐标轴，使X轴垂直，Y轴水平。 如果值为 true，则 x 轴默认是 倒置 的。 如果图表中出现条形图系列，则会自动反转
    .backgroundColorSet(@"rgba(0,0,0,0)")//设置图表的背景色(包含透明度的设置)
    .zoomTypeSet(chartModel.zoomType)//设置手势缩放方向
    .panningSet(true)//设置手势缩放后是否可平移
    .polarSet(chartModel.polar);
    
    if (chartModel.options3dEnable == true) {
        chart.options3d = (AAObject(AAOptions3d)
                           .enabledSet(chartModel.options3dEnable)
                           .alphaSet(@-15)
                           );
    }
    
    AATitle *title = AAObject(AATitle)
    .textSet(chartModel.title)//标题文本内容
    .styleSet(AAObject(AAStyle)
              .colorSet(@"#000000")//标题颜色
              .fontSizeSet(@"12px")//标题字体大小
              );
    
    AASubtitle *subtitle = AAObject(AASubtitle)
    .textSet(chartModel.subtitle)//副标题内容
    .alignSet(chartModel.subtitleAlign)//图表副标题文本水平对齐方式。可选的值有 “left”，”center“和“right”。 默认是：center.
    .styleSet(AAObject(AAStyle)
              .colorSet(@"#000000")
              .fontSizeSet(@"9px")
              );
    
    AAXAxis *xAxis = AAObject(AAXAxis)
    .labelsSet(AAObject(AALabels)
               .enabledSet(chartModel.xAxisLabelsEnabled)//设置 x 轴是否显示文字
               )
    .reversedSet(chartModel.xAxisReversed)
    .gridLineWidthSet(chartModel.xAxisGridLineWidth)//x轴网格线宽度
    .categoriesSet(chartModel.categories);
    
    AAYAxis *yAxis = AAObject(AAYAxis)
    .labelsSet(AAObject(AALabels)
               .enabledSet(chartModel.yAxisLabelsEnabled)//设置 y 轴是否显示数字
               )
    .minSet(chartModel.yMin)//设置 y 轴最小值,最小值等于零就不能显示负值了
    .maxSet(chartModel.yMax)//y轴最大值
    .tickPositionsSet(chartModel.yTickPositions)//自定义Y轴坐标
    .allowDecimalsSet(chartModel.yAllowDecimals)//是否允许显示小数
    .plotLinesSet(chartModel.yPlotLines) //标示线设置
    .reversedSet(chartModel.yAxisReversed)
    .gridLineWidthSet(chartModel.yAxisGridLineWidth)//y轴网格线宽度
    .titleSet(AAObject(AATitle)
              .textSet(chartModel.yAxisTitle))//y 轴标题
    .lineWidthSet(@0);
    
    AATooltip *tooltip = AAObject(AATooltip)
    .enabledSet(true)//启用浮动提示框
    .sharedSet(true)//多组数据公享一个浮动提示框
    .crosshairsSet(chartModel.tooltipCrosshairs)
    .valueSuffixSet(chartModel.tooltipValueSuffix);//浮动提示框的单位名称后缀
    
    AAPlotOptions *plotOptions = AAObject(AAPlotOptions)
    .seriesSet(AAObject(AASeries)
//             .colorByPointSet(false)//决定了图表是否给每个数据列或每个点分配一个颜色，默认值是 false， 即默认是给每个数据类分配颜色，
               .stackingSet(chartModel.stacking)//设置是否百分比堆叠显示图形
//               .animationSet(AAObject(AAAnimation)
//                             .easingSet(chartAnimationType)
//                             .durationSet(chartModel.animationDuration)
//                             )
               );
    
    if (chartModel.animationType != 0) {
        NSString *chartAnimationType = [self configureTheEasingAnimationType:chartModel.animationType];
        plotOptions.series.animation = (AAObject(AAAnimation)
                                        .easingSet(chartAnimationType)
                                        .durationSet(chartModel.animationDuration)
                                        );
    }
    
    //数据点标记相关配置，只有线性图(折线图、曲线图、折线区域填充图、曲线区域填充图)才有数据点标记
    if (   [chartModel.chartType isEqualToString:AAChartTypeArea]
        || [chartModel.chartType isEqualToString:AAChartTypeAreaspline]
        || [chartModel.chartType isEqualToString:AAChartTypeLine]
        || [chartModel.chartType isEqualToString:AAChartTypeSpline]) {
        AAMarker *marker = AAObject(AAMarker)
        .radiusSet(chartModel.markerRadius)//曲线连接点半径，默认是4
        .symbolSet(chartModel.symbol);//曲线点类型："circle", "square", "diamond", "triangle","triangle-down"，默认是"circle"
        if (chartModel.symbolStyle == AAChartSymbolStyleTypeInnerBlank) {
            marker.fillColorSet(@"#ffffff")//点的填充色(用来设置折线连接点的填充色)
            .lineWidthSet(@2)//外沿线的宽度(用来设置折线连接点的轮廓描边的宽度)
            .lineColorSet(@"");//外沿线的颜色(用来设置折线连接点的轮廓描边颜色，当值为空字符串时，默认取数据点或数据列的颜色)
        } else if (chartModel.symbolStyle == AAChartSymbolStyleTypeBorderBlank) {
            marker.lineWidthSet(@2)
            .lineColorSet(@"#ffffff");
        }
        AASeries *series = plotOptions.series;
        series.connectNulls = chartModel.connectNulls;
        series.marker = marker;
    }
    
    plotOptions = [self configureTheAAPlotOptionsWithPlotOptions:plotOptions chartModel:chartModel];
    //   plotOptions.series.events = @{@"click":@"hahaha"};
    
    AALegend *legend = AAObject(AALegend)
    .enabledSet(chartModel.legendEnabled)//是否显示 legend
    .layoutSet(AALegendLayoutTypeHorizontal)//图例数据项的布局。布局类型： "horizontal" 或 "vertical" 即水平布局和垂直布局 默认是：horizontal.
    .alignSet(AALegendAlignTypeCenter)//设定图例在图表区中的水平对齐方式，合法值有left，center 和 right。
    .verticalAlignSet(AALegendVerticalAlignTypeBottom)//设定图例在图表区中的垂直对齐方式，合法值有 top，middle 和 bottom。垂直位置可以通过 y 选项做进一步设定。
    .itemMarginTopSet(@0);//图例的每一项的顶部外边距，单位px。 默认是：0.
    
    AAOptions *options = AAObject(AAOptions)
    .chartSet(chart)
    .titleSet(title)
    .subtitleSet(subtitle)
    .xAxisSet(xAxis)
    .yAxisSet(yAxis)
    .tooltipSet(tooltip)
    .plotOptionsSet(plotOptions)
    .legendSet(legend)
    .seriesSet(chartModel.series)
    .colorsSet(chartModel.colorsTheme)//设置颜色主题
    .gradientColorEnableSet(chartModel.gradientColorEnable);//设置主题颜色是否为渐变色
    
    //  options.plotOptions.pie.dataLabels.formatSet(@"你一生的故事<br/>你一生的故事<br/>你一生的故事<br/>");
    return options;
}

+ (NSString *)configureTheEasingAnimationType:(AAChartAnimation)animationType {
    
    NSArray *animationTypeArr = @[
                                  @"linear",
                                  @"easeInQuad",
                                  @"easeOutQuad",
                                  @"easeInOutQuad",
                                  @"easeInCubic",
                                  @"easeOutCubic",
                                  @"easeInOutCubic",
                                  @"easeInQuart",
                                  @"easeOutQuart",
                                  @"easeInOutQuart",
                                  @"easeInQuint",
                                  @"easeOutQuint",
                                  @"easeInOutQuint",
                                  @"easeInSine",
                                  @"easeOutSine",
                                  @"easeInOutSine",
                                  @"easeInExpo",
                                  @"easeOutExpo",
                                  @"easeInOutExpo",
                                  @"easeInCirc",
                                  @"easeOutCirc",
                                  @"easeInOutCirc",
                                  @"easeOutBounce",
                                  @"easeInBack",
                                  @"easeOutBack",
                                  @"easeInOutBack",
                                  @"elastic",
                                  @"swingFromTo",
                                  @"swingFrom",
                                  @"swingTo",
                                  @"bounce",
                                  @"bouncePast",
                                  @"easeFromTo",
                                  @"easeFrom",
                                  @"easeTo",
                                  ] ;
    return animationTypeArr[animationType];
}

+ (AAPlotOptions *)configureTheAAPlotOptionsWithPlotOptions:(AAPlotOptions *)plotOptions
                                                 chartModel:(AAChartModel *)chartModel {
    
    //数据点标记相关配置，只有线性图才有数据点标记
    if ([chartModel.chartType isEqualToString:AAChartTypeColumn]) {
        AAColumn *column = (AAObject(AAColumn)
                            .borderWidthSet(@0)
                            .borderRadiusSet(chartModel.borderRadius)
                            .dataLabelsSet(AAObject(AADataLabels)
                                           .enabledSet(chartModel.dataLabelEnabled)
                                           )
                            );
        if (chartModel.polar == YES) {
            column.pointPaddingSet(@0)
            .groupPaddingSet(@0.005);
        }
        plotOptions.columnSet(column);
    } else if ([chartModel.chartType isEqualToString:AAChartTypeBar]) {
        AABar *bar = (AAObject(AABar)
                      .borderWidthSet(@0)
                      .borderRadiusSet(chartModel.borderRadius)
                      .dataLabelsSet(AAObject(AADataLabels)
                                     .enabledSet(chartModel.dataLabelEnabled)
                                     )
                      );
        if (chartModel.polar == YES) {
            bar.pointPaddingSet(@0)
            .groupPaddingSet(@0.005);
        }
        plotOptions.barSet(bar);
    } else if ([chartModel.chartType isEqualToString:AAChartTypeArea]) {
        plotOptions.areaSet(AAObject(AAArea)
                            .dataLabelsSet(AAObject(AADataLabels)
                                           .enabledSet(chartModel.dataLabelEnabled)
                                           )
                            );
    } else if ([chartModel.chartType isEqualToString:AAChartTypeAreaspline]) {
        plotOptions.areasplineSet(AAObject(AAAreaspline)
                                  .dataLabelsSet(AAObject(AADataLabels)
                                                 .enabledSet(chartModel.dataLabelEnabled)
                                                 )
                                  );
    } else if ([chartModel.chartType isEqualToString:AAChartTypeLine]) {
        plotOptions.lineSet(AAObject(AALine)
                            .dataLabelsSet(AAObject(AADataLabels)
                                           .enabledSet(chartModel.dataLabelEnabled)
                                           )
                            );
    } else if ([chartModel.chartType isEqualToString:AAChartTypeSpline]) {
        plotOptions.splineSet(AAObject(AASpline)
                              .dataLabelsSet(AAObject(AADataLabels)
                                             .enabledSet(chartModel.dataLabelEnabled))
                              );
        
    } else if ([chartModel.chartType isEqualToString:AAChartTypePie]) {
        plotOptions.pieSet(AAObject(AAPie)
                           .allowPointSelectSet(true)
                           .cursorSet(@"pointer")
                           .dataLabelsSet(AAObject(AADataLabels)
                                          .enabledSet(chartModel.dataLabelEnabled)
                                          .formatSet(@"{point.percentage:.1f}%")
                                          .styleSet(AAObject(AAStyle)
                                                    .colorSet(@"black")
                                                    )
                                          )
                           .showInLegendSet(true)
                           );
        
        if (chartModel.options3dEnable ==true) {
            plotOptions.pie.depth = chartModel.options3dDepth;//设置3d 图形阴影深度
        }
        //      plotOptions.series.colorByPoint = true;
    }
    
    return plotOptions;
}

@end

