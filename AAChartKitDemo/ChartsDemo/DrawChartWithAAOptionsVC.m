
//  SpecialChartVC.m
//  AAChartKit
//
//  Created by An An on 17/3/23.
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
 * JianShu       : https://www.jianshu.com/u/f1e6753d4254
 * SegmentFault  : https://segmentfault.com/u/huanghunbieguan
 *
 * -------------------------------------------------------------------------------
 
 */

#import "DrawChartWithAAOptionsVC.h"
#import "AADateUTCTool.h"
@interface DrawChartWithAAOptionsVC ()

@end

@implementation DrawChartWithAAOptionsVC

- (void)viewDidLoad {
    [super viewDidLoad];
    
}

- (id)chartConfigurationWithSelectedIndex:(NSUInteger)selectedIndex {
    switch (self.selectedIndex) {
        case 0:  return [self configureTheAAOptionsOfAreaChart];
        case 1:  return [self configureTheAAOptionsOfPieChart];
        case 2:  return [self adjustPieChartTitleAndDataLabelFontStyle];
        case 3:  return [self configureTheAAOptionsOfSpecialNestedColumnChart];
        case 4:  return [self configureThePolygonPolarChart];
        case 5:  return [self configureTheNoGapColunmChart];
        case 6:  return [self configureCustomStyleTooltipChart];
        case 7:  return [self adjustChartLeftAndRightMargin];
        case 8:  return [self configureChartWithBackgroundImage];
        case 9:  return [self configureDoubleYAxisChartOptions];
        case 10: return [self adjustChartSeriesDataAccuracy];
        case 11: return [self adjustGroupPaddingForPolarChart];
        case 12: return [self customStyleStackedColumnChart];
        case 13: return [self specialStyleStepLineChart];
        case 14: return [self disableChartAnimation];//禁用图表的渲染动画效果
        case 15: return [self customChartLengendItemStyle];//自定义图表的 legend 图例样式
        case 16: return [self configureTheMirrorColumnChart];//正负对称的镜像柱状图
        case 17: return [self configureTheMirrorColumnChartWithNoAnyGap];//没有任何衔接缝隙的镜像柱状图📊
        case 18: return [self simpleGaugeChart];//简易仪表图
        case 19: return [self gaugeChartWithPlotBand];//带有颜色标志带的仪表图
        case 20: return [self configureAAPlotBandsForChart];//带有颜色标志带的曲线图
        case 21: return [self configureAAPlotLinesForChart];//带有颜色标志线及文字的折线图表
        case 22: return [self configureAASeriesElementZones];//数据分区 Zones
        case 23: return [self configureAASeriesElementZonesMixedAAPlotLines];//数据分区 Zones 和颜色标志线混合
        case 24: return [self adjustChartDataLabelsStyle];//自定义DataLabels样式
        case 25: return [self customizeEveryDataLabelBySinglely];//单独自定义指定的data的DataLabels样式
        case 26: return [self configureXAxisLabelsFontColorWithHTMLString];//通过HTML字符串自定义X轴文字颜色
        case 27: return [self configureXAxisLabelsFontColorAndFontSizeWithHTMLString];//通过HTML字符串自定义X轴文字颜色和字体大小
        case 28: return [self configure_DataLabels_XAXis_YAxis_Legend_Style];//配置DataLabels、XAXis、YAxis、Legend等图表元素样式
        case 29: return [self configureXAxisPlotBand];//X轴带有颜色标志带的混合图表
        case 30: return [self configureStackingColumnChartDataLabelsOverflow];//允许DataLabels文字溢出绘图区
        case 31: return [self configureReversedBarChartDataLabelsStyle];//调整Y轴倒转的条形图的DataLabels风格样式
        case 32: return [self configureTripleYAxesMixedChart];//三条Y轴的混合图
        case 33: return [self configureDoubleYAxesAndColumnLineMixedChart];//双Y轴柱形曲线混合图
        case 34: return [self configureDoubleYAxesMarketDepthChart];//双Y轴市场深度图
        case 35: return [self customAreaChartTooltipStyleLikeHTMLTable];//自定义 tooltip 提示框为 HTML 表格样式
        case 36: return [self adjustPieChartTitleAndDataLabelFontStyle2];//自定义饼图的标题和 DataLabels
        case 37: return [self customChartStyleWhenNoData];//数据为空的情况下,配置图表的 x 轴 y 轴等样式
        case 38: return [self customChartStyleWhenEveryDataValueIsZero];//所有数据都为 0 的情况下, 配置图表的 x 轴 y 轴等样式
        case 39: return [self disableSpineChartHoverAnimationEffect];//禁用手指点击曲线或者掠过曲线后,曲线变粗的动画效果
        case 40: return [self configurePieChartFormatProperty];//配置饼图的 dataLabels 的 format 属性
        case 41: return [self customXAxisLabelsBeImages];//自定义曲线面积图 X 轴 labels 为一组图片🖼
        case 42: return [self configureTriangleRadarChart];//带有颜色标志带的三角形雷达图
        case 43: return [self configureQuadrangleRadarChart];//带有颜色标志带的四角形雷达图
        case 44: return [self configurePentagonRadarChart];//带有颜色标志带的五角形雷达图
        case 45: return [self configureHexagonRadarChart];//带有颜色标志带的六角形雷达图
        case 46: return [self configureSpiderWebRadarChart];//带有颜色标志带的🕸蜘蛛网状雷达图
        case 47: return [self configureComplicatedCustomAreasplineChart];//复杂自定义曲线填充图 1
        case 48: return [self configureComplicatedCustomAreasplineChart2];//复杂自定义曲线填充图 2
        case 49: return [self configureComplicatedCustomAreasplineChart3];//复杂自定义曲线填充图 3
        case 50: return [self yAxisOnTheRightSideChart];//y轴在右侧的图表
        case 51: return [self doubleLayerHalfPieChart];//双层嵌套的玉阕图
        case 52: return [self customAreasplineChartTooltipContentWithHeaderFormat];//通过 tooltip 的 headerFormat 属性来自定义 曲线填充图的 tooltip

    }
    return nil;
}


- (AAOptions *)configureTheAAOptionsOfAreaChart {
    AAChartModel *aaChartModel = AAChartModel.new
    .chartTypeSet(AAChartTypeAreaspline)
    .stackingSet(AAChartStackingTypeNormal)
    .markerRadiusSet(@0)
    .zoomTypeSet(AAChartZoomTypeX)
    .colorsThemeSet(@[
        AAGradientColor.oceanBlueColor,
        AAGradientColor.sanguineColor,
        AAGradientColor.lusciousLimeColor,
        AAGradientColor.mysticMauveColor
                    ])
    .seriesSet(@[
        AASeriesElement.new
        .nameSet(@"Tokyo Hot")
        .dataSet(@[@45000, @43000, @50000, @55000, @58000, @62000, @83000, @39000, @56000, @67000, @50000, @34000, @50000, @67000, @58000, @29000, @46000, @23000, @47000, @46000, @38000, @56000, @48000, @36000]),
        AASeriesElement.new
        .nameSet(@"Berlin Hot")
        .dataSet(@[@38000, @31000, @32000, @32000, @64000, @66000, @86000, @47000, @52000, @75000, @52000, @56000, @54000, @60000, @46000, @63000, @54000, @51000, @58000, @64000, @60000, @45000, @36000, @67000]),
        AASeriesElement.new
        .nameSet(@"London Hot")
        .dataSet(@[@46000, @32000, @53000, @58000, @86000, @68000, @85000, @73000, @69000, @71000, @91000, @74000, @60000, @50000, @39000, @67000, @55000, @49000, @65000, @45000, @64000, @47000, @63000, @64000]),
        AASeriesElement.new
        .nameSet(@"NewYork Hot")
        .dataSet(@[@60000, @51000, @52000, @53000, @64000, @84000, @65000, @68000, @63000, @47000, @72000, @60000, @65000, @74000, @66000, @65000, @71000, @59000, @65000, @77000, @52000, @53000, @58000, @53000]),
               ]);
    
    AAOptions *aaOptions = aaChartModel.aa_toAAOptions;
    
    aaOptions.chart
    .marginSet(AAMargin(100, 100, 100, 100));
    
    aaOptions.legend
    .enabledSet(true)
    .alignSet(AAChartAlignTypeRight)//设置图例位于水平方向上的右侧
    .layoutSet(AAChartLayoutTypeVertical)//设置图例排列方式为垂直排布
    .verticalAlignSet(AAChartVerticalAlignTypeTop)//设置图例位于竖直方向上的顶部
    ;
    
    //https://api.highcharts.com.cn/highcharts#xAxis.title
    aaOptions.xAxis
    .titleSet(AAAxisTitle.new
              .textSet(@"问世间情为何物???")
              .offsetSet(@25)
              .rotationSet(@-5)
              .styleSet(AAStyleColorSizeWeight(AAColor.redColor, 15, AAChartFontWeightTypeBold))
              );
    
    aaOptions.yAxis.labels.format = @"{value} €";//给y轴添加单位
    
    //禁用图例点击事件
    aaOptions.plotOptions.series.events = AAEvents.new
    .legendItemClickSet(@AAJSFunc(function() {
        return false;
    }));

    aaOptions.defaultOptions = AALang.new
    .resetZoomSet(@"重置缩放比例")
    .thousandsSepSet(@",");

    return aaOptions;
}

// Refer to the issue https://github.com/AAChartModel/AAChartKit/issues/173
// Refer to the issue https://github.com/AAChartModel/AAChartKit/issues/986
- (AAOptions *)configureTheAAOptionsOfPieChart {
    CGFloat aaChartViewWidth = self.view.frame.size.width;
    //计算X轴偏移量
    CGFloat xOffSet = (aaChartViewWidth - 40) * 0.1;
    
    AAOptions *aaOptions = AAOptions.new
    .chartSet(AAChart.new
              .typeSet(AAChartTypePie)
              .marginLeftSet(@0)
              .marginRightSet(@0)
              )
    .titleSet(AATitle.new
              .textSet(@"渠道销售额<br/>占比")//标题文本内容
              .alignSet(AAChartAlignTypeCenter)//标题水平居中
              .verticalAlignSet(AAChartVerticalAlignTypeMiddle)//标题垂直居中
              .xSet(@(-xOffSet))
              .ySet(@(-5))
              .styleSet(AAStyle.new
                        .colorSet(@"#000000")//Title font color
                        .fontSizeSet(@"14 px")//Title font size
                        .fontWeightSet(@"bold")//Title font weight
                        )
              )
    .plotOptionsSet(AAPlotOptions.new
                    .seriesSet(AASeries.new
                               .animationSet(AAAnimation.new
                                             .easingSet(AAChartAnimationBounce)
                                             .durationSet(@1000)
                                             )
                               )
                    .pieSet(AAPie.new
                            .showInLegendSet(true)
                            .centerSet(@[@"40%",@"50%"])
                            .dataLabelsSet(AADataLabels.new
                                           .enabledSet(false)
                                           //.formatSet(@"{point.percentage:.1f}%")
                                           )
                            )
                    )
    .legendSet(AALegend.new
               .enabledSet(true)
               .verticalAlignSet(AAChartVerticalAlignTypeMiddle)
               .layoutSet(AAChartLayoutTypeVertical)
               .alignSet(AAChartAlignTypeRight)
               )
    .seriesSet(@[
        AASeriesElement.new
        .nameSet(@"语言热度值")
        .sizeSet(@240)//环形图的半径大小
        .innerSizeSet(@"65%")//内部圆环半径大小占比
        .allowPointSelectSet(false)//是否允许在点击数据点标记(扇形图点击选中的块发生位移)
        .dataSet(@[
            @[@"Firefox",   @3336.2],
            @[@"IE",        @26.8],
            @[@"Safari",    @88.5],
            @[@"Opera",     @46.0],
            @[@"Others",    @223]
                 ]),
               ])
    .colorsSet(@[@"#1e90ff",@"#ef476f",@"#ffd066",@"#04d69f",@"#25547c",]);//设置颜色主题
    
    return aaOptions;
}

- (AAOptions *)adjustPieChartTitleAndDataLabelFontStyle {
    AAOptions *aaOptions = AAOptions.new
    .chartSet(AAChart.new.typeSet(AAChartTypePie))
    .titleSet(AATitle.new
              .useHTMLSet(true)
              .textSet(@"<span style=""color:#1E90FF;font-weight:thin;font-size:13px""> &nbsp&nbsp&nbsp近七天 </span>  <br> <span style=""color:#A9A9A9;font-weight:thin;font-size:10px""> 运行状态占比 </span>")//标题文本内容
              .alignSet(AAChartAlignTypeCenter)//标题水平居中
              .verticalAlignSet(AAChartVerticalAlignTypeMiddle)//标题垂直居中
              .ySet(@0)//标题相对于垂直对齐的偏移量，取值范围：图表的上边距（chart.spacingTop ）到图表的下边距（chart.spacingBottom），可以是负值，单位是px。默认值和字体大小有关。
              )
    .colorsSet(@[@"#1E90FF",@"#87CEFA",@"#A9A9A9",@"#fd4800",@"#F4A460"])//设置颜色主题
    .seriesSet(@[
        AASeriesElement.new
        .sizeSet(@200)//环形图的半径大小
        .innerSizeSet(@"60%")//内部圆环半径大小占比
        .allowPointSelectSet(false)//是否允许在点击数据点标记(扇形图点击选中的块发生位移)
        .dataLabelsSet(AADataLabels.new
                       .enabledSet(true)
                       .useHTMLSet(true)
                       .distanceSet(@30)//扇形图百分比线的长度
                       .formatSet(@"<span style=""color:#A9A9A9;font-weight:thin;font-size:10px"">{point.name}</span> <span style=""color:#1E90FF;font-weight:bold;font-size:15px"">{point.percentage:.1f}</span><span style=""color:#1E90FF;font-weight:thin;font-size:10px"">%</span>")
                       )
        .dataSet(@[
            @[@"Firefox",   @150],
            @[@"Opera",      @15],
            @[@"Others",     @35]
                 ]),
               ]);
    return aaOptions;
}

- (AAOptions *)adjustPieChartTitleAndDataLabelFontStyle2 {
    AAOptions *aaOptions = AAOptions.new
    .chartSet(AAChart.new.typeSet(AAChartTypePie))
    .titleSet(AATitle.new
              .useHTMLSet(true)
              .textSet((@"<span style=""color:#1E90FF;font-weight:thin;font-size:13px""> &nbsp&nbsp&nbsp近七天 </span>  <br> <span style=""color:#A9A9A9;font-weight:thin;font-size:10px""> 运行状态占比 </span>"))//标题文本内容
              .alignSet(AAChartAlignTypeCenter)//标题水平居中
              .verticalAlignSet(AAChartVerticalAlignTypeMiddle)//标题垂直居中
              .ySet(@0)//标题相对于垂直对齐的偏移量，取值范围：图表的上边距（chart.spacingTop ）到图表的下边距（chart.spacingBottom），可以是负值，单位是px。默认值和字体大小有关。
              )
    .colorsSet(@[@"#1e90ff",@"#ef476f",@"#ffd066",@"#04d69f",@"#4b2b7f",])//设置颜色主题
    .legendSet(AALegend.new
               .enabledSet(true)
               .floatingSet(true)
               .alignSet(AAChartAlignTypeRight)
               .verticalAlignSet(AAChartVerticalAlignTypeTop)
               .layoutSet(AAChartLayoutTypeVertical)
               )
    .tooltipSet(AATooltip.new
                .enabledSet(true)
                .styleSet(AAStyle.new
                          .colorSet(AAColor.whiteColor))
                .backgroundColorSet(AAColor.blackColor))
    .seriesSet(@[
        AASeriesElement.new
        .sizeSet(@300)//环形图的半径大小
        .innerSizeSet(@"40%")//内部圆环半径大小占比
        .allowPointSelectSet(false)//是否允许在点击数据点标记(扇形图点击选中的块发生位移)
        .dataLabelsSet(AADataLabels.new
                       .enabledSet(true)
                       .useHTMLSet(true)
                       .colorSet(AAColor.whiteColor)
                       .distanceSet(@-40)//扇形图百分比线的长度
                       .formatSet(@"<b>{point.name}</b>: <br> {point.percentage:.1f} %")
                       )
        .dataSet(@[
            @[@"Firefox",   @3336.2],
            @[@"IE",          @26.8],
            @[@"Chrome",     @666.8],
            @[@"Safari",     @188.5],
            @[@"Others",     @223.0],
                 ]),
               ]);
    return aaOptions;
}


- (AAOptions *)configureTheAAOptionsOfSpecialNestedColumnChart {
    AAChart *aaChart = AAChart.new
    .typeSet(AAChartTypeColumn);
    
    AATitle *aaTitle = AATitle.new
    .textSet(@"分公司效率优化嵌套图");
    
    AAXAxis *aaXAxis = AAXAxis.new
    .tickWidthSet(@3)
    .tickLengthSet(@10)
    .tickPositionSet(@"outside")
    .lineWidthSet(@3)
    .visibleSet(true)
    .categoriesSet(@[@"伦敦总部",@"柏林分部",@"纽约分部",]);
    
    AAYAxis *aaYAxis1 = AAYAxis.new
    .visibleSet(true)
    .minSet(0)
    .tickWidthSet(@3)
    .tickLengthSet(@10)
    .tickPositionSet(@"outside")
    .lineWidthSet(@3)
    .titleSet(AAAxisTitle.new.textSet(@"雇员"));
    
    AAYAxis *aaYAxis2 = AAYAxis.new
    .visibleSet(true)
    .oppositeSet(true)
    .tickWidthSet(@3)
    .tickLengthSet(@20)
    .tickPositionSet(@"inside")
    .lineWidthSet(@3)
    .titleSet(AAAxisTitle.new
              .textSet(@"利润 (millions)"));
    
    AATooltip *aaTooltip = AATooltip.new
    .enabledSet(true)
    .sharedSet(true);
    
    AAPlotOptions *aaPlotOptions = AAPlotOptions.new
    .seriesSet(AASeries.new
               .borderRadiusTopLeftSet((id)@"50%")
               .borderRadiusTopRightSet((id)@"50%")
               .animationSet(AAAnimation.new
                             .easingSet(AAChartAnimationBounce)
                             .durationSet(@1000)
                             )
               )
    .columnSet(AAColumn.new
               .groupingSet(false)
               .borderWidthSet(@0)
               );
    
    NSArray *aaSeries = @[
        AAColumn.new
        .nameSet(@"雇员")
        .dataSet(@[@150, @73, @20])
        .colorSet(@"rgba(165,170,217,1)")
        .groupingSet(false)
        .pointPaddingSet(@0.3)
        .pointPlacementSet(@(-0.2))
        ,
        AAColumn.new
        .nameSet(@"优化的员工")
        .dataSet(@[@140, @90, @40])
        .colorSet(@"rgba(126,86,134,.9)")
        .groupingSet(false)
        .pointPaddingSet(@0.4)
        .pointPlacementSet(@(-0.2)),
        AAColumn.new
        .nameSet(@"利润")
        .dataSet(@[@183.6, @178.8, @198.5])
        .colorSet(@"rgba(248,161,63,1)")
        .groupingSet(false)
        .pointPaddingSet(@0.3)
        .pointPlacementSet(@(0.2))
        .yAxisSet(@1),
        AAColumn.new
        .nameSet(@"优化的利润")
        .dataSet(@[@203.6, @198.8, @208.5])
        .colorSet(@"rgba(186,60,61,.9)")
        .groupingSet(false)
        .pointPaddingSet(@0.4)
        .pointPlacementSet(@(0.2))
        .yAxisSet(@1),
    ];
    
    AAOptions *aaOptions = AAOptions.new
    .chartSet(aaChart)
    .titleSet(aaTitle)
    .xAxisSet(aaXAxis)
    .yAxisSet((id)@[aaYAxis1,aaYAxis2])
    .tooltipSet(aaTooltip)
    .plotOptionsSet(aaPlotOptions)
    .seriesSet(aaSeries);
    return aaOptions;
}

- (AAOptions *)configureThePolygonPolarChart {
    AAChartModel *aaChartModel = AAChartModel.new
    .chartTypeSet(AAChartTypeArea)//图表类型
    .colorsThemeSet(@[@"#fe117c",@"#ffc069",@"#06caf4",@"#7dffc0"])//设置主体颜色数组
    .tooltipValueSuffixSet(@"℃")//设置浮动提示框单位后缀
    .yAxisGridLineStyleSet([AALineStyle styleWithWidth:@1])//y轴横向分割线宽度为0(即是隐藏分割线)
    .markerRadiusSet(@0)
    .polarSet(true)
    .seriesSet(@[
        AASeriesElement.new
        .nameSet(@"2017")
        .colorSet((id)AAGradientColor.deepSeaColor)
        .dataSet(@[@7.0, @6.9, @9.5, @14.5, @18.2, @21.5, @25.2, @26.5, @23.3, @18.3, @13.9, @9.6]),
               ]);
    
    AAOptions *aaOptions = aaChartModel.aa_toAAOptions;

    aaOptions.xAxis.visible = false;//避免多边形外环之外有额外套了一层无用的外环
    aaOptions.yAxis.gridLineInterpolation = AAYAxisGridLineInterpolationPolygon;
    return aaOptions;
}

- (AAOptions *)configureTheNoGapColunmChart {
    AAChartModel *aaChartModel = AAChartModel.new
    .chartTypeSet(AAChartTypeColumn)//图表类型
    .titleSet(@"中间缝隙很小的柱状图")//图表主标题
    .subtitleSet(@"调整一下groupPadding即可")//图表副标题
    .colorsThemeSet(@[@"#fe117c",@"#ffc069",@"#06caf4",@"#7dffc0"])//设置主体颜色数组
    .tooltipValueSuffixSet(@"℃")//设置浮动提示框单位后缀
    .yAxisGridLineStyleSet([AALineStyle styleWithWidth:@1])//y轴横向分割线宽度为0(即是隐藏分割线)
    .markerRadiusSet(@0)
    .dataLabelsEnabledSet(true)
    .seriesSet(@[
        AASeriesElement.new
        .nameSet(@"2020")
        .borderRadiusTopLeftSet((id)@"50%")
        .borderRadiusTopRightSet((id)@"50%")
        .dataSet(@[@3.9, @4.2, @5.7, @8.5, @11.9, @15.2,]),
               ]);
    
    AAOptions *aaOptions = aaChartModel.aa_toAAOptions;
    
    //    *  关于 `pointPadding`
    //https://api.highcharts.com.cn/highcharts#plotOptions.column.groupPadding
    //
    //    * 关于 `pointPadding`
    //https://api.highcharts.com.cn/highcharts#plotOptions.column.pointPadding
    
    AAColumn *aaColumn = aaOptions.plotOptions.column;
    
    aaColumn.groupPadding = @0.05;//Padding between each column or bar, in x axis units. default：0.1.
    aaColumn.pointPadding = @0;//Padding between each value groups, in x axis units. default：0.2.
    
    aaOptions.plotOptions.series.dataLabels
    .ySet(@-10)
    .formatSet(@" {y} 美元 ")
    .backgroundColorSet(@"rgba(0, 0, 0, 0.75)")
    .shapeSet(@"callout")
    .styleSet(AAStyle.new
              .colorSet(AAColor.whiteColor)
              .textOutlineSet(@"none"));
    return aaOptions;
}

//https://github.com/AAChartModel/AAChartKit/issues/199
//https://github.com/AAChartModel/AAChartKit/issues/954
- (AAOptions *)configureCustomStyleTooltipChart {
    AAChartModel *aaChartModel = AAChartModel.new
    .chartTypeSet(AAChartTypeArea)//图表类型
    .titleSet(@"近三个月金价起伏周期图")//图表主标题
    .subtitleSet(@"金价(元/克)")//图表副标题
    .colorsThemeSet(@[@"#FFD700"/*(纯金色)*/,@"#ffc069",@"#06caf4",@"#7dffc0"])//设置主体颜色数组
    .markerSymbolStyleSet(AAChartSymbolStyleTypeBorderBlank)//折线连接点样式为外边缘空白
    .xAxisTickIntervalSet(@15)//x轴刻度点间隔数(设置每隔几个点显示一个 X轴的内容)
    .yAxisGridLineStyleSet([AALineStyle styleWithWidth:@0.8])//y轴横向分割线宽度(为0即是隐藏分割线)
    .zoomTypeSet(AAChartZoomTypeX)
    .categoriesSet(@[
        @"10-01",@"10-02",@"10-03",@"10-04",@"10-05",@"10-06",@"10-07",@"10-08",@"10-09",@"10-10",@"10-11",
        @"10-12",@"10-13",@"10-14",@"10-15",@"10-16",@"10-17",@"10-18",@"10-19",@"10-20",@"10-21",@"10-22",
        @"10-23",@"10-024",@"10-25",@"10-26",@"10-27",@"10-28",@"10-29",@"10-30",@"10-31",@"11-01",@"11-02",
        @"11-03",@"11-04",@"11-05",@"11-06",@"11-07",@"11-08",@"11-09",@"11-10",@"11-11",@"11-12",@"11-13",
        @"11-14",@"11-15",@"11-16",@"11-17",@"11-18",@"11-19",@"11-20",@"11-21",@"11-22",@"11-23",@"11-024",
        @"11-25",@"11-26",@"11-27",@"11-28",@"11-29",@"11-30",@"12-01",@"12-02",@"12-03",@"12-04",@"12-05",
        @"12-06",@"12-07",@"12-08",@"12-09",@"12-10",@"12-11",@"12-12",@"12-13",@"12-14",@"12-15",@"12-16",
        @"12-17",@"12-18",@"12-19",@"12-20",@"12-21",@"12-22",@"12-23",@"12-024",@"12-25",@"12-26",@"12-27",
        @"12-28",@"12-29",@"12-30"
                   ])
    .seriesSet(@[
        AASeriesElement.new
        .lineWidthSet(@1.5)
        .fillOpacitySet(@0.4)
        .nameSet(@"2021")
        .dataSet(@[
            @1.51, @6.7, @0.94, @1.44, @1.6, @1.63, @1.56, @1.91, @2.45, @3.87, @3.24, @4.90, @4.61, @4.10,
            @4.17, @3.85, @4.17, @3.46, @3.46, @3.55, @3.50, @4.13, @2.58, @2.28,@1.51, @12.7, @0.94, @1.44,
            @18.6, @1.63, @1.56, @1.91, @2.45, @3.87, @3.24, @4.90, @4.61, @4.10, @4.17, @3.85, @4.17, @3.46,
            @3.46, @3.55, @3.50, @4.13, @2.58, @2.28,@1.33, @4.68, @1.31, @1.10, @13.9, @1.10, @1.16, @1.67,
            @2.64, @2.86, @3.00, @3.21, @4.14, @4.07, @3.68, @3.11, @3.41, @3.25, @3.32, @3.07, @3.92, @3.05,
            @2.18, @3.24,@3.23, @3.15, @2.90, @1.81, @2.11, @2.43, @5.59, @3.09, @4.09, @6.14, @5.33, @6.05,
            @5.71, @6.22, @6.56, @4.75, @5.27, @6.02, @5.48
                 ])
               ]);
    
    AAOptions *aaOptions = aaChartModel.aa_toAAOptions;
    
    aaOptions.chart
    .resetZoomButtonSet(AAResetZoomButton.new
                        .themeSet(@{
                            @"display":@"none"//隐藏图表缩放后的默认显示的缩放按钮
                                  }));
    
    /*Custom Tooltip Style --- 自定义图表浮动提示框样式及内容*/
    aaOptions.tooltip
    .useHTMLSet(true)
    .headerFormatSet(@"🌕 🌖 🌗 🌘 🌑 🌒 🌓 🌔 <br>")
    .pointFormatSet(@" Support format properties Just Right Now !!!<br>")
    .footerFormatSet(@"The Gold Price In <b>{series.name}-{point.key}</b> Is &nbsp<b>{point.y}</b>&nbspDollars Per Gram")
    .valueDecimalsSet(@2)//设置取值精确到小数点后几位
    .backgroundColorSet(@"#000000")
    .borderColorSet(@"#000000")
    .styleSet(AAStyleColorSize(@"#FFD700", 12))
    ;
        
    return aaOptions;
}

- (AAOptions *)adjustChartLeftAndRightMargin {
    AAChartModel *aaChartModel = AAChartModel.new
    .chartTypeSet(AAChartTypeColumn)//图表类型
    .colorsThemeSet(@[@"#fe117c",@"#ffc069",@"#06caf4",@"#7dffc0"])//设置主体颜色数组
    .polarSet(true)
    .categoriesSet(@[@"Java", @"Swift", @"Python", @"Ruby", @"PHP", @"Go", @"C", @"C#", @"C++", @"Perl", @"R", @"MATLAB", @"SQL"])
    .seriesSet(@[
        AASeriesElement.new
        .nameSet(@"2017")
        .dataSet(@[@7.0, @6.9, @9.5, @14.5, @18.2, @21.5, @25.2, @26.5, @23.3, @18.3, @13.9, @9.6]),
               ]);
    
    AAOptions *aaOptions = aaChartModel.aa_toAAOptions;
    aaOptions.chart.marginLeft = @70;
    aaOptions.chart.marginRight = @70;
    return aaOptions;
}

- (AAOptions *)configureChartWithBackgroundImage {
    AAChartModel *aaChartModel = AAChartModel.new
    .chartTypeSet(AAChartTypePie)
    .titleSet(@"编程语言热度")
    .subtitleSet(@"虚拟数据")
    .dataLabelsEnabledSet(true)//是否直接显示扇形图数据
    .yAxisTitleSet(@"摄氏度")
    .seriesSet(@[
        AASeriesElement.new
        .nameSet(@"语言热度占比")
        .dataSet(@[
            @[@"Java"  , @67],
            @[@"Swift" , @44],
            @[@"Python", @83],
            @[@"OC"    , @11],
            @[@"Ruby"  , @42],
            @[@"PHP"   , @31],
            @[@"Go"    , @63],
            @[@"C"     , @24],
            @[@"C#"    , @888],
            @[@"C++"   , @66],
                 ]),
               ]);
    
    AAOptions *aaOptions = aaChartModel.aa_toAAOptions;
    aaOptions.chart.plotBackgroundImage = @"https://ss1.bdstatic.com/70cFvXSh_Q1YnxGkpoWK1HF6hhy/it/u=2859216016,2109779587&fm=27&gp=0.jpg";
    return aaOptions;
}

- (AAOptions *)configureDoubleYAxisChartOptions {
    AAChart *aaChart = AAChart.new
    .backgroundColorSet(@"#4b2b7f");
    
    AATitle *aaTitle = AATitle.new
    .textSet(@"");
    
    AAXAxis *aaXAxis = AAXAxis.new
    .visibleSet(true)
    .minSet(@0)
    .categoriesSet(@[
        @"Java", @"Swift", @"Python", @"Ruby", @"PHP", @"Go",@"C",
        @"C#", @"C++", @"Perl", @"R", @"MATLAB", @"SQL"]);
    
    AAStyle *aaYAxisTitleStyle = AAStyle.new
    .colorSet(@"#1e90ff")//Title font color
    .fontSizeSet(@"14px")//Title font size
    .fontWeightSet(AAChartFontWeightTypeBold)//Title font weight
    .textOutlineSet(@"0px 0px contrast");
    
    AALabels *aaYAxisLabels = AALabels.new
    .enabledSet(true)//设置 y 轴是否显示数字
    .formatSet(@"{value:.,0f}mm")//让y轴的值完整显示 而不是100000显示为100k,同时单位后缀为°C
    .styleSet(AAStyle.new
              .colorSet(@"#ff0000")//yAxis Label font color
              .fontSizeSet(@"15px")//yAxis Label font size
              .fontWeightSet(AAChartFontWeightTypeBold)//yAxis Label font weight
              );
    
    AAYAxis *yAxisOne = AAYAxis.new
    .visibleSet(true)
    .labelsSet(aaYAxisLabels)
    .titleSet(AAAxisTitle.new
              .textSet(@"冬季降雨量")
              .styleSet(aaYAxisTitleStyle))
    .oppositeSet(true);
    
    
    AAYAxis *yAxisTwo = AAYAxis.new
    .visibleSet(true)
    .labelsSet(aaYAxisLabels)
    .titleSet(AAAxisTitle.new
              .textSet(@"夏季降雨量")
              .styleSet(aaYAxisTitleStyle));
    
    AATooltip *aaTooltip = AATooltip.new
    .enabledSet(true)
    .sharedSet(true);
    
    AAMarker *aaMarker = AAMarker.new
    .radiusSet(@7)//曲线连接点半径，默认是4
    .symbolSet(AAChartSymbolTypeCircle)//曲线点类型："circle", "square", "diamond", "triangle","triangle-down"，默认是"circle"
    .fillColorSet(@"#ffffff")//点的填充色(用来设置折线连接点的填充色)
    .lineWidthSet(@3)//外沿线的宽度(用来设置折线连接点的轮廓描边的宽度)
    .lineColorSet(@"");//外沿线的颜色(用来设置折线连接点的轮廓描边颜色，当值为空字符串时，默认取数据点或数据列的颜色)
    
    AASeriesElement *element1 = AASeriesElement.new
    .nameSet(@"2017")
    .typeSet(AAChartTypeAreaspline)
    .borderRadiusSet(@4)
    .colorSet((id)AAGradientColor.new
              .directionSet(AALinearGradientDirectionToTop)
              .startColorSet(@"#f54ea2")
              .endColorSet(@"#ff7676"))
    .markerSet(aaMarker)
    .yAxisSet(@1)
    .dataSet(@[@7.0, @6.9, @2.5, @14.5, @18.2, @21.5, @5.2, @26.5, @23.3, @45.3, @13.9, @9.6]);
    
    AASeriesElement *element2 = AASeriesElement.new
    .nameSet(@"2018")
    .typeSet(AAChartTypeColumn)
    .colorSet((id)AAGradientColor.new
              .directionSet(AALinearGradientDirectionToTop)
              .startColorSet(@"#17ead9")
              .endColorSet(@"#6078ea"))
    .yAxisSet(@0)
    .dataSet(@[@7.0, @6.9, @2.5, @14.5, @18.2, @21.5, @5.2, @26.5, @23.3, @45.3, @13.9, @9.6]);

    
    AAOptions *aaOptions = AAOptions.new
    .chartSet(aaChart)
    .titleSet(aaTitle)
    .xAxisSet(aaXAxis)
    .yAxisSet((id)@[yAxisOne,yAxisTwo])
    .tooltipSet(aaTooltip)
    .seriesSet(@[element1,element2])
    ;
    return aaOptions;
}


- (AAOptions *)adjustChartSeriesDataAccuracy {
    AAChartModel *aaChartModel = AAChartModel.new
    .chartTypeSet(AAChartTypeArea)
    .titleSet(@"Adjust data accuracy")
    .dataLabelsEnabledSet(true)
    .markerSymbolSet(AAChartSymbolTypeCircle)
    .markerRadiusSet(@6)//设置折线连接点宽度为0,即是隐藏连接点
    .yAxisGridLineStyleSet([AALineStyle styleWithWidth:@0.5])
    .markerSymbolStyleSet(AAChartSymbolStyleTypeInnerBlank)
    .seriesSet(@[
        AASeriesElement.new
        .nameSet(@"2017")
        .dataSet(@[@(0.0000001),@(0.0000002),@(0.0000003),@(0.0000004),@(0.0000005)])
        .lineWidthSet(@5)
               ]);
    //数值格式化字符串是采用了 C 语言浮点型格式化的子集，格式化字符是在大括号内，变量之后，用冒号（:）分隔的内容。
    //默认情况下点号（.）表示小数点，空格（ ）代表千分符，当然这两个符号可以在 语言文字 选项集里中来设定。
    //具体参见 https://www.hcharts.cn/docs/basic-labels-string-formatting#h2-1
    AAOptions *aaOptions = aaChartModel.aa_toAAOptions;
    aaOptions.tooltip.valueDecimals = @9;//设置tooltip取值精确到小数点后9位
    aaOptions.plotOptions.area.dataLabels.format = @"{point.y:.9f}";//设置dataLabels取值精确到小数点后9位
    return aaOptions;
}

- (AAOptions *)adjustGroupPaddingForPolarChart {
    AAChartModel *aaChartModel = AAChartModel.new
    .chartTypeSet(AAChartTypeColumn)
    .titleSet(@"Colorful Column Chart")
    .subtitleSet(@"single data array colorful column chart")
    .borderRadiusSet(@5)
    .polarSet(true)
    .seriesSet(@[
        AASeriesElement.new
        .nameSet(@"2017")
        .dataSet(@[@211,@183,@157,@133,@111]),
               ]);
    
    AAOptions *aaOptions = aaChartModel.aa_toAAOptions;
    AAColumn *aaColumn = aaOptions.plotOptions.column;
    aaColumn.groupPadding = @0.05;
    aaColumn.colorByPoint = true;
    return aaOptions;
}

- (AAOptions *)customStyleStackedColumnChart {
    AAChart *aaChart = AAChart.new
    .typeSet(AAChartTypeColumn);
    
    AATitle *aaTitle = AATitle.new
    .textSet(@"Stacked column chart");
    
    AAXAxis *aaXAxis = AAXAxis.new
    .visibleSet(true)
    .categoriesSet(@[@"Apples", @"Oranges", @"Pears", @"Grapes", @"Bananas"]);
    
    AAYAxis *aaYAxis = AAYAxis.new
    .visibleSet(true)
    .minSet(@0)
    .titleSet(AAAxisTitle.new
              .textSet(@"Total fruit consumption"))
    .stackLabelsSet(AALabels.new
                    .enabledSet(true)
                    .styleSet(AAStyle.new.
                              fontWeightSet(AAChartFontWeightTypeBold))
                    );
    
    AALegend *aaLegend = AALegend.new
    .enabledSet(true)
    .alignSet(AAChartAlignTypeRight)
    .verticalAlignSet(AAChartVerticalAlignTypeTop)
    .borderColorSet(@"#ccc")
    .borderWidthSet(@1)
    .xSet(@(-30))
    .ySet(@25)
    ;
    
    AATooltip *aaTooltip = AATooltip.new
    .headerFormatSet(@"<b>{point.x}</b><br/>")
    .pointFormatSet(@"{series.name}: {point.y}<br/>Total: {point.stackTotal}");
    
    AAColumn *aaColumn = AAColumn.new
    .stackingSet(AAChartStackingTypeNormal)
    .dataLabelsSet(AADataLabels.new
                   .enabledSet(true)
                   .styleSet([AAStyle styleWithColor:AAColor.whiteColor
                                           fontSize:15
                                         fontWeight:AAChartFontWeightTypeThin
                                        textOutline:@"0px 0px contrast"])
                   )
    .pointPaddingSet(@0)//Padding between each value groups, in x axis units. default：0.2.
    .groupPaddingSet(@0.005)//Padding between each column or bar, in x axis units. default：0.1.
    .borderWidthSet(@0)//The width of the border surrounding each column or bar.(调整边缘线宽度) https://api.hcharts.cn/plotOptions.column.borderWidth
    ;
    
    AAPlotOptions *aaPlotOptions = AAPlotOptions.new
    .seriesSet(AASeries.new
               .animationSet(AAAnimation.new
                             .easingSet(AAChartAnimationBounce)
                             .durationSet(@1000)
                             )
               )
    .columnSet(aaColumn);
    
    NSArray *aaColors = @[@"#1e90ff",@"#ef476f",@"#ffd066",@"#04d69f",@"#25547c",];
    
    NSArray *aaSeriesArr = @[
        AASeriesElement.new
        .nameSet(@"John")
        .dataSet(@[@5, @3, @4, @7, @2]),
        AASeriesElement.new
        .nameSet(@"Jane")
        .dataSet(@[@5, @3, @4, @7, @2]),
        AASeriesElement.new
        .nameSet(@"Joe")
        .dataSet(@[@5, @3, @4, @7, @2]),
    ];
    
    AAOptions *aaOptions = AAOptions.new
    .chartSet(aaChart)
    .titleSet(aaTitle)
    .xAxisSet(aaXAxis)
    .yAxisSet(aaYAxis)
    .tooltipSet(aaTooltip)
    .plotOptionsSet(aaPlotOptions)
    .legendSet(aaLegend)
    .colorsSet(aaColors)
    .seriesSet(aaSeriesArr)
    ;
    
    return aaOptions;
}

// Refer to the issue https://github.com/AAChartModel/AAChartKit/issues/363
- (AAOptions *)specialStyleStepLineChart {
    //Method 1
    AAChartModel *aaChartModel = AAChartModel.new
    .chartTypeSet(AAChartTypeLine)//图形类型
    .animationTypeSet(AAChartAnimationBounce)//图形渲染动画类型为"bounce"
    .titleSet(@"STEP LINE CHART")//图形标题
    .subtitleSet(@"2020/08/08")//图形副标题
    .dataLabelsEnabledSet(NO)//是否显示数字
    .markerSymbolStyleSet(AAChartSymbolStyleTypeBorderBlank)//折线连接点样式
    .markerRadiusSet(@7)//折线连接点半径长度,为0时相当于没有折线连接点
    .seriesSet(@[
        AASeriesElement.new
        .nameSet(@"價格")
        .stepSet(@true)
        .dataSet(@[
            @[AADateUTC(2016, 9 - 1, 2),   @389.00],
            @[AADateUTC(2016, 10 - 1, 4),  @350.10],
            @[AADateUTC(2016, 10 - 1, 4),  @350.10],
            @[AADateUTC(2016, 10 - 1, 17), @389.00],
            @[AADateUTC(2016, 11 - 1, 24), @233.40],
            @[AADateUTC(2016, 11 - 1, 29), @389.00],
            @[AADateUTC(2016, 12 - 1, 20), @233.40],
            @[AADateUTC(2017, 1 - 1, 5),   @389.00],
            @[AADateUTC(2017, 2 - 1, 1),   @233.40],
            @[AADateUTC(2017, 2 - 1, 9),   @389.00],
            @[AADateUTC(2017, 4 - 1, 26),  @233.40],
            @[AADateUTC(2017, 5 - 1, 9),   @389.00],
            @[AADateUTC(2017, 7 - 1, 19),  @291.75],
            @[AADateUTC(2017, 8 - 1, 2),   @389.00],
            @[AADateUTC(2017, 10 - 1, 18), @155.60],
            @[AADateUTC(2017, 10 - 1, 31), @389.00],
            @[AADateUTC(2017, 11 - 1, 21), @194.50],
            @[AADateUTC(2017, 11 - 1, 28), @389.00],
            @[AADateUTC(2017, 11 - 1, 29), @194.50],
            @[AADateUTC(2017, 12 - 1, 13), @389.00],
            @[AADateUTC(2017, 12 - 1, 25), @194.50],
            @[AADateUTC(2018, 1 - 1, 9),   @389.00],
            @[AADateUTC(2018, 2 - 1, 8),   @194.50],
            @[AADateUTC(2018, 2 - 1, 21),  @389.00],
            @[AADateUTC(2018, 3 - 1, 8),   @155.60],
            @[AADateUTC(2018, 3 - 1, 18),  @389.00],
            @[AADateUTC(2018, 6 - 1, 8),   @155.60],
            @[AADateUTC(2018, 6 - 1, 18),  @389.00],
            @[AADateUTC(2018, 7 - 1, 12),  @194.50],
            //                                      @[Date.now(), @194.50]
                 ]),
        AASeriesElement.new
        .nameSet(@"PS+")
        .colorSet(@"#FFC535")
        .stepSet(@true)
        .dataSet(@[
            @[AADateUTC(2016, 9 - 1, 2),   @389.00],
            @[AADateUTC(2016, 10 - 1, 4),  @311.20],
            @[AADateUTC(2016, 10 - 1, 4),  @311.20],
            @[AADateUTC(2016, 10 - 1, 17), @389.00],
            @[AADateUTC(2016, 11 - 1, 24), @233.40],
            @[AADateUTC(2016, 11 - 1, 29), @389.00],
            @[AADateUTC(2016, 12 - 1, 20), @233.40],
            @[AADateUTC(2017, 1 - 1, 5),   @389.00],
            @[AADateUTC(2017, 2 - 1, 1),   @194.50],
            @[AADateUTC(2017, 2 - 1, 9),   @389.00],
            @[AADateUTC(2017, 4 - 1, 26),  @194.50],
            @[AADateUTC(2017, 5 - 1, 9),   @389.00],
            @[AADateUTC(2017, 7 - 1, 19),  @194.50],
            @[AADateUTC(2017, 8 - 1, 2),   @389.00],
            @[AADateUTC(2017, 10 - 1, 18), @155.60],
            @[AADateUTC(2017, 10 - 1, 31), @389.00],
            @[AADateUTC(2017, 11 - 1, 21), @155.60],
            @[AADateUTC(2017, 11 - 1, 28), @389.00],
            @[AADateUTC(2017, 11 - 1, 29), @155.60],
            @[AADateUTC(2017, 12 - 1, 13), @389.00],
            @[AADateUTC(2017, 12 - 1, 25), @155.60],
            @[AADateUTC(2018, 1 - 1, 9),   @389.00],
            @[AADateUTC(2018, 2 - 1, 8),   @155.60],
            @[AADateUTC(2018, 2 - 1, 21),  @389.00],
            @[AADateUTC(2018, 3 - 1, 8),   @155.60],
            @[AADateUTC(2018, 3 - 1, 18),  @389.00],
            @[AADateUTC(2018, 6 - 1, 8),   @155.60],
            @[AADateUTC(2018, 6 - 1, 18),  @389.00],
            @[AADateUTC(2018, 7 - 1, 12),  @155.60],
            //                                      @[Date.now(), @155.60]
                 ]),
               ]
               )
    ;
    AAOptions *aaOptions = aaChartModel.aa_toAAOptions;
    NSDictionary *xAxisDic = @{
        @"type": @"datetime",
        @"dateTimeLabelFormats": @{
                @"month": @"%e.%m.%y"
        }
    };
    
    aaOptions.xAxis = (id)xAxisDic;
    return aaOptions;
}

// Refer to the issue https://github.com/AAChartModel/AAChartKit/issues/380
- (AAOptions *)disableChartAnimation {
    AAChartModel *aaChartModel = AAChartModel.new
    .chartTypeSet(AAChartTypeColumn)//图表类型
    .yAxisLineWidthSet(@0)
    .seriesSet(@[
        AASeriesElement.new
        .nameSet(@"2018")
        .dataSet(@[@0.2, @0.8, @5.7, @11.3, @17.0, @22.0, @24.8, @24.1, @20.1, @14.1, @8.6, @2.5]),
               ]);
    
    AAOptions *aaOptions = aaChartModel.aa_toAAOptions;
    aaOptions.plotOptions.series.animation = (id)@(false);//禁用图表的渲染动画效果
    aaOptions.yAxis.gridLineDashStyle = AAChartLineDashStyleTypeLongDash;//设置Y轴的网格线样式为 AAChartLineDashStyleTypeLongDash
    return aaOptions;
}

// Refer to the issue https://github.com/AAChartModel/AAChartKit/issues/387
- (AAOptions *)customChartLengendItemStyle {
    AAChartModel *aaChartModel = AAChartModel.new
    .chartTypeSet(AAChartTypeArea)
    .categoriesSet(@[
        @"Java",@"Swift",@"Python",@"Ruby", @"PHP",@"Go",
        @"C",@"C#",@"C++",@"Perl",@"R",@"MATLAB",@"SQL"
                   ])
    .stackingSet(AAChartStackingTypeNormal)
    .markerSymbolSet(AAChartSymbolTypeCircle)
    .markerSymbolStyleSet(AAChartSymbolStyleTypeInnerBlank)
    .seriesSet(@[
        AASeriesElement.new
        .nameSet(@"2020")
        .dataSet(@[@7.0, @6.9, @2.5, @14.5, @18.2, @21.5, @5.2, @26.5, @23.3, @45.3, @13.9, @9.6]),
               ]);
    
    AAOptions *aaOptions = aaChartModel.aa_toAAOptions;
    
    //设定图例项的CSS样式。只支持有关文本的CSS样式设定。
    /*默认是：{
     "color": "#333333",
     "cursor": "pointer",
     "fontSize": "12px",
     "fontWeight": "bold"
     }
     */
    AAItemStyle *aaItemStyle = AAItemStyle.new
    .colorSet(@"#ff0000")//字体颜色
    .cursorSet(@"pointer")//(在移动端这个属性没什么意义,其实不用设置)指定鼠标滑过数据列时鼠标的形状。当绑定了数据列点击事件时，可以将此参数设置为 "pointer"，用来提醒用户改数据列是可以点击的。
    .fontSizeSet(@"20px")//字体大小
    .fontWeightSet(AAChartFontWeightTypeThin)//字体为细体字
    ;
    
    aaOptions.legend
    .itemMarginBottomSet(@20)
    .symbolRadiusSet(@10)//图标圆角
    .symbolHeightSet(@20)//标志高度
    .symbolWidthSet(@20)//图标宽度
    .alignSet(AAChartAlignTypeRight)
    .layoutSet(AAChartLayoutTypeVertical)
    .verticalAlignSet(AAChartVerticalAlignTypeTop)
    .itemStyleSet(aaItemStyle)
    ;
    
    aaOptions.xAxis
    .tickmarkPlacementSet(@"between")//本参数只对分类轴有效。 当值为 on 时刻度线将在分类上方显示；当值为 between 时，刻度线将在两个分类中间显示。当 tickInterval 为 1 时，默认是 between，其他情况默认是 on。 默认是：null.
    .tickColorSet(AAColor.redColor)
    .tickWidthSet(@1.5)//分类轴的刻度线默认为 0
    .tickLengthSet(@25)
    .gridLineColorSet(AAColor.redColor)
    .gridLineWidthSet(@1.5)
    ;
    
    aaOptions.yAxis
    .lineWidthSet(@0)
    .gridLineWidthSet(@0);

    return aaOptions;
}

- (AAOptions *)configureTheMirrorColumnChart {
    AAOptions *aaOptions = AAOptions.new
    .chartSet(AAChart.new
              .typeSet(AAChartTypeColumn)
              .backgroundColorSet(@"#161139"))
    .titleSet(AATitle.new.textSet(@""))
    .xAxisSet(AAXAxis.new
              .visibleSet(true)
              .categoriesSet(@[
                  @"一月", @"二月", @"三月", @"四月", @"五月", @"六月",
                  @"七月", @"八月", @"九月", @"十月", @"十一月", @"十二月"]))
    .yAxisSet((id)@[
        AAYAxis.new
        .visibleSet(true)
        .gridLineWidthSet(@0)
        .titleSet(AAAxisTitle.new
                  .textSet(@"收入")),
        AAYAxis.new
        .visibleSet(true)
        .titleSet(AAAxisTitle.new
                  .textSet(@"支出"))
        .lineWidthSet(@1)
        .oppositeSet(true)
                  ])
    .tooltipSet(AATooltip.new
                .enabledSet(false)
                .sharedSet(false))
    .plotOptionsSet(AAPlotOptions.new
                    .seriesSet(AASeries.new
                               .animationSet(AAAnimation.new
                                             .easingSet(AAChartAnimationBounce)
                                             .durationSet(@1000)
                                             )
                               )
                    .columnSet(AAColumn.new
                               .groupingSet(false)
                               .borderWidthSet(@0)
                               .borderRadiusSet(@5)
                               )
                    )
    .seriesSet(@[
        AASeriesElement.new
        .nameSet(@"收入")
        .dataSet(@[@7.0, @6.9, @9.5, @14.5, @18.2, @21.5, @25.2, @26.5,
                   @23.3, @18.3, @13.9,@7.0, @6.9, @9.5, @14.5,])
        .colorSet((id)AAGradientColor.new
                  .directionSet(AALinearGradientDirectionToTop)
                  .startColorSet(@"#7052f4")
                  .endColorSet(@"#00b0ff")),
        AASeriesElement.new
        .nameSet(@"支出")
        .dataSet(@[@-20.1, @-14.1, @-8.6, @-4.5, @-5.8, @-5.7, @-11.3, @-17.0,
                   @-22.0, @-24.8, @-24.1, @-20.1, @-14.1, @-8.6, @-4.5])
        .colorSet((id)AAGradientColor.new
                  .directionSet(AALinearGradientDirectionToTop)
                  .startColorSet(@"#EF71FF")
                  .endColorSet(@"#4740C8")),
               ]);
    return aaOptions;
}

- (AAOptions *)configureTheMirrorColumnChartWithNoAnyGap {
    AAOptions *aaOptions = [self configureTheMirrorColumnChart];
    
    aaOptions.plotOptions.column.borderRadius = @0;
    
    [aaOptions.series enumerateObjectsUsingBlock:^(AASeriesElement *  _Nonnull aaSeriesElement, NSUInteger idx, BOOL * _Nonnull stop) {
        if (idx == 0) {
            aaSeriesElement
            .borderRadiusTopLeftSet((id)@"50%")
            .borderRadiusTopRightSet((id)@"50%");
        } else if (idx == 1) {
            aaSeriesElement
            .borderRadiusBottomLeftSet((id)@"50%")
            .borderRadiusBottomRightSet((id)@"50%");
        }
    }];
    
    return aaOptions;
}

- (AAOptions *)yAxisOnTheRightSideChart {
    AAChartModel *aaChartModel = AAChartModel.new
    .chartTypeSet(AAChartTypeColumn)//图表类型
    .titleSet(@"Y轴在右侧的柱状图📊")//图表主标题
    .subtitleSet(@"设置 aaOptions.yAxis.opposite = YES 即可")//图表副标题
    .categoriesSet(@[@"一月", @"二月", @"三月", @"四月", @"五月", @"六月",])
    .borderRadiusSet(@9)
    .seriesSet(@[
        AASeriesElement.new
        .nameSet(@"2020")
        .colorSet((id)AAGradientColor.sanguineColor)
        .dataSet(@[@3.9, @4.2, @5.7, @8.5, @11.9, @15.2,]),
               ]);
    
    AAOptions *aaOptions = aaChartModel.aa_toAAOptions;
    AAColumn *aaColumn = aaOptions.plotOptions.column;
    aaColumn.groupPadding = @0.02;
    //是否将坐标轴显示在对立面，默认情况下 x 轴是在图表的下方显示，y 轴是在左方，
    //坐标轴显示在对立面后，x 轴是在上方显示，y 轴是在右方显示（即坐标轴会显示在对立面）。
    //该配置一般是用于多坐标轴区分展示，另外在 Highstock 中，y 轴默认是在对立面显示的。
    //默认是：false.
    aaOptions.yAxis.opposite = YES;
    return aaOptions;
}

- (AAOptions *)simpleGaugeChart {
    return AAOptions.new
    .chartSet(AAChart.new
              .typeSet(AAChartTypeGauge))
    .paneSet(AAPane.new
             .startAngleSet(@-150)
             .endAngleSet(@150))
    .yAxisSet(AAYAxis.new
              .minSet(@0)
              .maxSet(@100)
              .plotBandsSet(@[
                  AAPlotBandsElement.new
                  .fromSet(@0)
                  .toSet(@60)
                  .colorSet(@"#FF0000")
                            ])
              )
    .seriesSet(@[
        AASeriesElement.new
        .dataSet(@[@80])]);
}

- (AAOptions *)gaugeChartWithPlotBand {
    return AAOptions.new
    .chartSet(AAChart.new
              .typeSet(AAChartTypeGauge))
    .titleSet(AATitle.new
              .textSet(@"速度仪"))
    .paneSet(AAPane.new
             .startAngleSet(@-150)
             .endAngleSet(@150))
    .yAxisSet(AAYAxis.new
              .minSet(@0)
              .maxSet(@200)
              .titleSet(AAAxisTitle.new
                        .textSet(@"km/h"))
              .plotBandsSet(@[
                  AAPlotBandsElement.new
                  .fromSet(@0)
                  .toSet(@120)
                  .colorSet(@"#ffc069"),
                  AAPlotBandsElement.new
                  .fromSet(@120)
                  .toSet(@160)
                  .colorSet(@"#fe117c"),
                  AAPlotBandsElement.new
                  .fromSet(@160)
                  .toSet(@200)
                  .colorSet(@"#06caf4"),
                            ])
              )
    .seriesSet(@[
        AASeriesElement.new
        .nameSet(@"Speed")
        .dataSet(@[@80])
               ]);
}

- (AAOptions *)configureAAPlotBandsForChart {
    AACrosshair *aaCrosshair =
    [AACrosshair crosshairWithColor:AAColor.grayColor
                          dashStyle:AAChartLineDashStyleTypeLongDashDotDot
                              width:@1.5];
    
    AAChartModel *aaChartModel = AAChartModel.new
    .chartTypeSet(AAChartTypeSpline)
    .backgroundColorSet(AAColor.whiteColor)
    .categoriesSet(@[@"一月", @"二月", @"三月", @"四月", @"五月", @"六月", @"七月", @"八月", @"九月", @"十月", @"十一月", @"十二月"])
    .markerRadiusSet(@0)
    .yAxisMaxSet(@50)
    .yAxisGridLineStyleSet([AALineStyle styleWithWidth:@0])
    .xAxisCrosshairSet(aaCrosshair)
    .yAxisCrosshairSet(aaCrosshair)
    .legendEnabledSet(false)
    .seriesSet(@[
        AASeriesElement.new
        .nameSet(@"2017")
        .colorSet(AAColor.whiteColor)
        .lineWidthSet(@10)
        .dataSet(@[@7.0, @6.9, @2.5, @14.5, @18.2, @21.5, @5.2, @26.5, @23.3, @45.3, @13.9, @9.6]),
               ]);
    
    AAOptions *aaOptions = aaChartModel.aa_toAAOptions;
    aaOptions.yAxis.gridLineInterpolation = AAYAxisGridLineInterpolationPolygon;
    
    NSArray *aaPlotBandsArr = @[
        AAPlotBandsElement.new
        .fromSet(@0)
        .toSet(@5)
        .colorSet(@"#BC2B44"),
        AAPlotBandsElement.new
        .fromSet(@5)
        .toSet(@10)
        .colorSet(@"#EC6444"),
        AAPlotBandsElement.new
        .fromSet(@10)
        .toSet(@15)
        .colorSet(@"#f19742"),
        AAPlotBandsElement.new
        .fromSet(@15)
        .toSet(@20)
        .colorSet(@"#f3da60"),
        AAPlotBandsElement.new
        .fromSet(@20)
        .toSet(@25)
        .colorSet(@"#9bd040"),
        AAPlotBandsElement.new
        .fromSet(@25)
        .toSet(@50)
        .colorSet(@"#acf08f"),
    ];
    
    AAYAxis *aaYAxis = aaOptions.yAxis;
    aaYAxis.plotBands = aaPlotBandsArr;
    return aaOptions;
}

- (AAOptions *)configureValueSegmentChartBasicOptions {
    NSArray *dataArr = @[@[@"2012-01-01",@81],@[@"2012-01-02",@74],@[@"2012-01-03",@35],@[@"2012-01-04",@30],@[@"2012-01-05",@63],@[@"2012-01-06",@95],@[@"2012-01-07",@65],@[@"2012-01-08",@89],@[@"2012-01-09",@102],@[@"2012-01-10",@161],@[@"2012-01-11",@25],@[@"2012-01-12",@86],@[@"2012-01-13",@79],@[@"2012-01-14",@60],@[@"2012-01-15",@70],@[@"2012-01-16",@106],@[@"2012-01-17",@111],@[@"2012-01-18",@193],@[@"2012-01-19",@269],@[@"2012-01-20",@131],@[@"2012-01-21",@21],@[@"2012-01-22",@23],@[@"2012-01-23",@149],@[@"2012-01-24",@49],@[@"2012-01-25",@45],@[@"2012-01-26",@78],@[@"2012-01-27",@67],@[@"2012-01-28",@74],@[@"2012-01-29",@62],@[@"2012-01-30",@66],@[@"2012-01-31",@92],@[@"2012-02-01",@30],@[@"2012-02-02",@26],@[@"2012-02-03",@60],@[@"2012-02-04",@52],@[@"2012-02-05",@84],@[@"2012-02-06",@112],@[@"2012-02-07",@64],@[@"2012-02-08",@34],@[@"2012-02-09",@58],@[@"2012-02-10",@49],@[@"2012-02-11",@73],@[@"2012-02-12",@75],@[@"2012-02-13",@100],@[@"2012-02-14",@125],@[@"2012-02-15",@62],@[@"2012-02-16",@61],@[@"2012-02-17",@34],@[@"2012-02-18",@29],@[@"2012-02-19",@68],@[@"2012-02-20",@73],@[@"2012-02-21",@118],@[@"2012-02-22",@118],@[@"2012-02-23",@73],@[@"2012-02-24",@73],@[@"2012-02-25",@57],@[@"2012-02-26",@57],@[@"2012-02-27",@95],@[@"2012-02-28",@152],@[@"2012-02-29",@118],@[@"2012-03-01",@142],@[@"2012-03-02",@111],@[@"2012-03-03",@68],@[@"2012-03-04",@90],@[@"2012-03-05",@97],@[@"2012-03-06",@63],@[@"2012-03-07",@38],@[@"2012-03-08",@31],@[@"2012-03-09",@65],@[@"2012-03-10",@78],@[@"2012-03-11",@36],@[@"2012-03-12",@62],@[@"2012-03-13",@104],@[@"2012-03-14",@57],@[@"2012-03-15",@64],@[@"2012-03-16",@109],@[@"2012-03-17",@144],@[@"2012-03-18",@61],@[@"2012-03-19",@57],@[@"2012-03-20",@81],@[@"2012-03-21",@105],@[@"2012-03-22",@146],@[@"2012-03-23",@55],@[@"2012-03-24",@56],@[@"2012-03-25",@30],@[@"2012-03-26",@90],@[@"2012-03-27",@112],@[@"2012-03-28",@65],@[@"2012-03-29",@90],@[@"2012-03-30",@76],@[@"2012-03-31",@159],@[@"2012-04-01",@78],@[@"2012-04-02",@103],@[@"2012-04-03",@73],@[@"2012-04-03",@73],@[@"2012-04-04",@73],@[@"2012-04-05",@64],@[@"2012-04-06",@70],@[@"2012-04-07",@71],@[@"2012-04-08",@119],@[@"2012-04-09",@118],@[@"2012-04-10",@138],@[@"2012-04-11",@41],@[@"2012-04-12",@69],@[@"2012-04-13",@81],@[@"2012-04-14",@100],@[@"2012-04-15",@109],@[@"2012-04-16",@84],@[@"2012-04-17",@100],@[@"2012-04-18",@140],@[@"2012-04-19",@98],@[@"2012-04-20",@133],@[@"2012-04-21",@81],@[@"2012-04-22",@102],@[@"2012-04-23",@140],@[@"2012-04-24",@133],@[@"2012-04-25",@32],@[@"2012-04-26",@60],@[@"2012-04-27",@147],@[@"2012-04-28",@164],@[@"2012-04-29",@473],@[@"2012-04-30",@268],@[@"2012-05-01",@208],@[@"2012-05-02",@111],@[@"2012-05-03",@106],@[@"2012-05-04",@100],@[@"2012-05-05",@99],@[@"2012-05-06",@100],@[@"2012-05-07",@100],@[@"2012-05-08",@111],@[@"2012-05-09",@107],@[@"2012-05-10",@129],@[@"2012-05-11",@133],@[@"2012-05-12",@90],@[@"2012-05-13",@96],@[@"2012-05-14",@64],@[@"2012-05-15",@58],@[@"2012-05-16",@58],@[@"2012-05-17",@78],@[@"2012-05-18",@84],@[@"2012-05-19",@143],@[@"2012-05-20",@85],@[@"2012-05-21",@97],@[@"2012-05-22",@109],@[@"2012-05-23",@64],@[@"2012-05-24",@69],@[@"2012-05-25",@63],@[@"2012-05-26",@90],@[@"2012-05-27",@88],@[@"2012-05-28",@133],@[@"2012-05-29",@116],@[@"2012-05-30",@29],@[@"2012-05-31",@64],@[@"2012-06-01",@54],@[@"2012-06-02",@90],@[@"2012-06-03",@112],@[@"2012-06-04",@80],@[@"2012-06-05",@65],@[@"2012-06-06",@98],@[@"2012-06-07",@71],@[@"2012-06-08",@77],@[@"2012-06-09",@91],@[@"2012-06-10",@32],@[@"2012-06-11",@50],@[@"2012-06-12",@58],@[@"2012-06-13",@62],@[@"2012-06-14",@50],@[@"2012-06-15",@22],@[@"2012-06-16",@33],@[@"2012-06-17",@69],@[@"2012-06-18",@137],@[@"2012-06-19",@132],@[@"2012-06-20",@105],@[@"2012-06-21",@112],@[@"2012-06-22",@84],@[@"2012-06-23",@81],@[@"2012-06-24",@95],@[@"2012-06-25",@49],@[@"2012-06-26",@65],@[@"2012-06-27",@55],@[@"2012-06-28",@54],@[@"2012-06-29",@60],@[@"2012-06-30",@46],@[@"2012-07-01",@70],@[@"2012-07-02",@69],@[@"2012-07-03",@59],@[@"2012-07-04",@71],@[@"2012-07-05",@70],@[@"2012-07-06",@59],@[@"2012-07-07",@86],@[@"2012-07-08",@84],@[@"2012-07-09",@64],@[@"2012-07-10",@50],@[@"2012-07-11",@44],@[@"2012-07-12",@46],@[@"2012-07-13",@31],@[@"2012-07-14",@48],@[@"2012-07-15",@53],@[@"2012-07-16",@70],@[@"2012-07-17",@78],@[@"2012-07-18",@71],@[@"2012-07-19",@82],@[@"2012-07-20",@111],@[@"2012-07-21",@131],@[@"2012-07-22",@15],@[@"2012-07-24",@60],@[@"2012-07-25",@72],@[@"2012-07-26",@55],@[@"2012-07-26",@55],@[@"2012-07-27",@50],@[@"2012-07-28",@56],@[@"2012-07-29",@57],@[@"2012-07-30",@30],@[@"2012-07-31",@28],@[@"2012-08-01",@20],@[@"2012-08-02",@17],@[@"2012-08-03",@53],@[@"2012-08-04",@40],@[@"2012-08-05",@48],@[@"2012-08-06",@60],@[@"2012-08-07",@59],@[@"2012-08-08",@68],@[@"2012-08-09",@43],@[@"2012-08-10",@72],@[@"2012-08-11",@80],@[@"2012-08-12",@41],@[@"2012-08-13",@36],@[@"2012-08-14",@62],@[@"2012-08-15",@60],@[@"2012-08-16",@68],@[@"2012-08-17",@83],@[@"2012-08-18",@110],@[@"2012-08-19",@84],@[@"2012-08-20",@92],@[@"2012-08-21",@25],@[@"2012-08-22",@40],@[@"2012-08-23",@74],@[@"2012-08-24",@94],@[@"2012-08-25",@92],@[@"2012-08-26",@117],@[@"2012-08-27",@100],@[@"2012-08-28",@59],@[@"2012-08-29",@84],@[@"2012-08-30",@135],@[@"2012-08-31",@150],@[@"2012-09-01",@128],@[@"2012-09-02",@52],@[@"2012-09-03",@15],@[@"2012-09-04",@22],@[@"2012-09-05",@50],@[@"2012-09-06",@70],@[@"2012-09-07",@77],@[@"2012-09-08",@40],@[@"2012-09-09",@79],@[@"2012-09-10",@96],@[@"2012-09-11",@93],@[@"2012-09-12",@44],@[@"2012-09-13",@28],@[@"2012-09-14",@31],@[@"2012-09-15",@50],@[@"2012-09-16",@65],@[@"2012-09-17",@63],@[@"2012-09-18",@61],@[@"2012-09-19",@56],@[@"2012-09-21",@128],@[@"2012-09-22",@93],@[@"2012-09-23",@85],@[@"2012-09-24",@74],@[@"2012-09-25",@78],@[@"2012-09-26",@26],@[@"2012-09-27",@65],@[@"2012-09-28",@15],@[@"2012-09-29",@24],@[@"2012-09-30",@38],@[@"2012-10-01",@52],@[@"2012-10-02",@78],@[@"2012-10-03",@108],@[@"2012-10-04",@28],@[@"2012-10-05",@41],@[@"2012-10-06",@74],@[@"2012-10-07",@83],@[@"2012-10-08",@123],@[@"2012-10-09",@140],@[@"2012-10-10",@18],@[@"2012-10-11",@73],@[@"2012-10-12",@121],@[@"2012-10-13",@97],@[@"2012-10-14",@40],@[@"2012-10-15",@83],@[@"2012-10-16",@78],@[@"2012-10-17",@23],@[@"2012-10-18",@65],@[@"2012-10-19",@79],@[@"2012-10-20",@139],@[@"2012-10-21",@81],@[@"2012-10-22",@26],@[@"2012-10-23",@54],@[@"2012-10-24",@89],@[@"2012-10-25",@90],@[@"2012-10-26",@163],@[@"2012-10-27",@154],@[@"2012-10-28",@22],@[@"2012-10-29",@59],@[@"2012-10-30",@36],@[@"2012-10-31",@51],@[@"2012-11-01",@67],@[@"2012-11-02",@103],@[@"2012-11-03",@135],@[@"2012-11-04",@20],@[@"2012-11-05",@16],@[@"2012-11-06",@48],@[@"2012-11-07",@80],@[@"2012-11-08",@62],@[@"2012-11-09",@93],@[@"2012-11-10",@82],@[@"2012-11-11",@17],@[@"2012-11-12",@27],@[@"2012-11-13",@30],@[@"2012-11-14",@26],@[@"2012-11-15",@71],@[@"2012-11-16",@92],@[@"2012-11-17",@47],@[@"2012-11-18",@96],@[@"2012-11-19",@55],@[@"2012-11-20",@74],@[@"2012-11-21",@123],@[@"2012-11-22",@156],@[@"2012-11-23",@22],@[@"2012-11-24",@80],@[@"2012-11-25",@133],@[@"2012-11-26",@44],@[@"2012-11-27",@105],@[@"2012-11-28",@151],@[@"2012-11-29",@54],@[@"2012-12-01",@50],@[@"2012-12-02",@96],@[@"2012-12-03",@123],@[@"2012-12-04",@50],@[@"2012-12-05",@64],@[@"2012-12-06",@50],@[@"2012-12-07",@73],@[@"2012-12-08",@53],@[@"2012-12-09",@38],@[@"2012-12-10",@53],@[@"2012-12-11",@86],@[@"2012-12-12",@103],@[@"2012-12-13",@130],@[@"2012-12-14",@107],@[@"2012-12-15",@114],@[@"2012-12-16",@108],@[@"2012-12-17",@45],@[@"2012-12-18",@22],@[@"2012-12-19",@72],@[@"2012-12-20",@121],@[@"2012-12-21",@120],@[@"2012-12-22",@24],@[@"2012-12-23",@36],@[@"2012-12-24",@53],@[@"2012-12-25",@58],@[@"2012-12-26",@67],@[@"2012-12-28",@137],@[@"2012-12-29",@94],@[@"2012-12-30",@38],@[@"2012-12-31",@57],@[@"2013-01-01",@71],@[@"2013-01-02",@27],@[@"2013-01-03",@35],@[@"2013-01-04",@57],@[@"2013-01-05",@79],@[@"2013-01-06",@58],@[@"2013-01-07",@105],@[@"2013-01-08",@124],@[@"2013-01-09",@32],@[@"2013-01-10",@87],@[@"2013-01-11",@232],@[@"2013-01-12",@174],@[@"2013-01-13",@498],@[@"2013-01-14",@184],@[@"2014-01-01",@85],@[@"2014-01-02",@158],@[@"2014-01-03",@74],@[@"2014-01-04",@165],@[@"2014-01-05",@113],@[@"2014-01-06",@190],@[@"2014-01-07",@122],@[@"2014-01-10",@95],@[@"2014-01-11",@159],@[@"2014-01-12",@52],@[@"2014-01-13",@117],@[@"2014-01-14",@113],@[@"2014-01-15",@180],@[@"2014-01-16",@403],@[@"2014-01-17",@209],@[@"2014-01-18",@113],@[@"2014-01-19",@149],@[@"2014-01-21",@68],@[@"2014-01-22",@162],@[@"2014-01-23",@276],@[@"2014-01-24",@195],@[@"2014-01-26",@77],@[@"2014-01-27",@114],@[@"2014-01-28",@67],@[@"2014-01-29",@165],@[@"2014-01-30",@93],@[@"2014-01-31",@188],@[@"2014-02-01",@178],@[@"2014-02-02",@85],@[@"2014-02-05",@119],@[@"2014-02-06",@158],@[@"2014-02-07",@124],@[@"2014-02-08",@84],@[@"2014-02-10",@53],@[@"2014-02-11",@142],@[@"2014-02-12",@150],@[@"2014-02-13",@242],@[@"2014-02-14",@329],@[@"2014-02-15",@429],@[@"2014-02-16",@348],@[@"2014-02-17",@118],@[@"2014-02-18",@98],@[@"2014-02-19",@92],@[@"2014-02-20",@270],@[@"2014-02-21",@311],@[@"2014-02-22",@311],@[@"2014-02-23",@255],@[@"2014-02-24",@313],@[@"2014-02-25",@404],@[@"2014-02-28",@113],@[@"2014-03-01",@68],@[@"2014-03-02",@189],@[@"2014-03-03",@268],@[@"2014-03-04",@67],@[@"2014-03-07",@70],@[@"2014-03-08",@179],@[@"2014-03-09",@127],@[@"2014-03-10",@110],@[@"2014-03-11",@195],@[@"2014-03-13",@69],@[@"2014-03-14",@64],@[@"2014-03-15",@133],@[@"2014-03-16",@145],@[@"2014-03-17",@142],@[@"2014-03-18",@85],@[@"2014-03-19",@73],@[@"2014-03-21",@62],@[@"2014-03-22",@86],@[@"2014-03-23",@186],@[@"2014-03-24",@271],@[@"2014-03-25",@255],@[@"2014-03-26",@331],@[@"2014-03-27",@285],@[@"2014-03-28",@169],@[@"2014-03-29",@63],@[@"2014-03-30",@77],@[@"2014-03-31",@183],@[@"2014-04-01",@147],@[@"2014-04-02",@133],@[@"2014-04-03",@66],@[@"2014-04-04",@91],@[@"2014-04-05",@68],@[@"2014-04-06",@98],@[@"2014-04-07",@135],@[@"2014-04-08",@223],@[@"2014-04-09",@156],@[@"2014-04-10",@246],@[@"2014-04-11",@83],@[@"2014-04-12",@133],@[@"2014-04-13",@212],@[@"2014-04-14",@270],@[@"2014-04-15",@109],@[@"2014-04-16",@90],@[@"2014-04-17",@124],@[@"2014-04-18",@182],@[@"2014-04-19",@84],@[@"2014-04-20",@84],@[@"2014-04-21",@73],@[@"2014-04-22",@85],@[@"2014-04-23",@156],@[@"2014-04-24",@156],@[@"2014-04-25",@163],@[@"2014-04-26",@69],@[@"2014-04-27",@74],@[@"2014-04-28",@83],@[@"2014-04-29",@122],@[@"2014-04-30",@139],@[@"2014-05-01",@156],@[@"2014-05-03",@93],@[@"2014-05-04",@57],@[@"2014-05-05",@54],@[@"2014-05-06",@105],@[@"2014-05-07",@82],@[@"2014-05-08",@104],@[@"2014-05-09",@84],@[@"2014-05-10",@69],@[@"2014-05-12",@74],@[@"2014-05-13",@86],@[@"2014-05-14",@59],@[@"2014-05-15",@122],@[@"2014-05-16",@92],@[@"2014-05-17",@124],@[@"2014-05-18",@171],@[@"2014-05-19",@146],@[@"2014-05-20",@113],@[@"2014-05-21",@170],@[@"2014-05-22",@183],@[@"2014-05-23",@140],@[@"2014-05-24",@104],@[@"2014-05-25",@91],@[@"2014-05-26",@77],@[@"2014-05-27",@107],@[@"2014-05-28",@121],@[@"2014-05-29",@120],@[@"2014-05-30",@192],@[@"2014-05-31",@177],@[@"2014-06-01",@130],@[@"2014-06-02",@90],@[@"2014-06-03",@117],@[@"2014-06-04",@124],@[@"2014-06-05",@157],@[@"2014-06-06",@103],@[@"2014-06-07",@51],@[@"2014-06-08",@70],@[@"2014-06-09",@87],@[@"2014-06-10",@95],@[@"2014-06-11",@74],@[@"2014-06-12",@90],@[@"2014-06-13",@116],@[@"2014-06-14",@165],@[@"2014-06-15",@178],@[@"2014-06-16",@178],@[@"2014-06-17",@104],@[@"2014-06-18",@116],@[@"2014-06-19",@116],@[@"2014-06-20",@84],@[@"2014-06-21",@96],@[@"2014-06-22",@91],@[@"2014-06-23",@115],@[@"2014-06-24",@161],@[@"2014-06-25",@138],@[@"2014-06-26",@163],@[@"2014-06-27",@68],@[@"2014-06-28",@77],@[@"2014-06-29",@161],@[@"2014-06-30",@185],@[@"2014-07-01",@172],@[@"2014-07-02",@80],@[@"2014-07-03",@248],@[@"2014-07-04",@237],@[@"2014-07-05",@165],@[@"2014-07-06",@256],@[@"2014-07-07",@216],@[@"2014-07-08",@134],@[@"2014-07-09",@63],@[@"2014-07-10",@114],@[@"2014-07-11",@77],@[@"2014-07-12",@80],@[@"2014-07-13",@64],@[@"2014-07-14",@156],@[@"2014-07-15",@140],@[@"2014-07-16",@133],@[@"2014-07-17",@186],@[@"2014-07-18",@182],@[@"2014-07-19",@106],@[@"2014-07-20",@119],@[@"2014-07-21",@68],@[@"2014-07-22",@54],@[@"2014-07-23",@82],@[@"2014-07-24",@90],@[@"2014-07-25",@134],@[@"2014-07-26",@188],@[@"2014-07-27",@194],@[@"2014-07-28",@159],@[@"2014-07-29",@159],@[@"2014-07-30",@169],@[@"2014-07-31",@244],@[@"2014-08-01",@199],@[@"2014-08-02",@163],@[@"2014-08-03",@149],@[@"2014-08-05",@80],@[@"2014-08-06",@67],@[@"2014-08-07",@162],@[@"2014-08-08",@140],@[@"2014-08-09",@143],@[@"2014-08-10",@125],@[@"2014-08-11",@76],@[@"2014-08-12",@119],@[@"2014-08-13",@70],@[@"2014-08-14",@104],@[@"2014-08-15",@109],@[@"2014-08-16",@159],@[@"2014-08-17",@124],@[@"2014-08-18",@135],@[@"2014-08-19",@150],@[@"2014-08-20",@164],@[@"2014-08-21",@169],@[@"2014-08-22",@83],@[@"2014-08-23",@155],@[@"2014-08-24",@75],@[@"2014-08-25",@59],@[@"2014-08-26",@78],@[@"2014-08-27",@136],@[@"2014-08-28",@103],@[@"2014-08-29",@104],@[@"2014-08-30",@176],@[@"2014-08-31",@89],@[@"2014-09-01",@127],@[@"2014-09-03",@54],@[@"2014-09-04",@100],@[@"2014-09-05",@140],@[@"2014-09-06",@186],@[@"2014-09-07",@200],@[@"2014-09-08",@61],@[@"2014-09-09",@109],@[@"2014-09-10",@111],@[@"2014-09-11",@114],@[@"2014-09-12",@97],@[@"2014-09-13",@94],@[@"2014-09-14",@66],@[@"2014-09-15",@54],@[@"2014-09-16",@87],@[@"2014-09-17",@80],@[@"2014-09-18",@84],@[@"2014-09-19",@117],@[@"2014-09-20",@168],@[@"2014-09-21",@129],@[@"2014-09-22",@127],@[@"2014-09-23",@64],@[@"2014-09-24",@60],@[@"2014-09-25",@144],@[@"2014-09-26",@170],@[@"2014-09-27",@58],@[@"2014-09-28",@87],@[@"2014-09-29",@70],@[@"2014-09-30",@53],@[@"2014-10-01",@92],@[@"2014-10-02",@78],@[@"2014-10-03",@123],@[@"2014-10-04",@95],@[@"2014-10-05",@54],@[@"2014-10-06",@68],@[@"2014-10-07",@200],@[@"2014-10-08",@314],@[@"2014-10-09",@379],@[@"2014-10-10",@346],@[@"2014-10-11",@233],@[@"2014-10-14",@80],@[@"2014-10-15",@73],@[@"2014-10-16",@76],@[@"2014-10-17",@132],@[@"2014-10-18",@211],@[@"2014-10-19",@289],@[@"2014-10-20",@250],@[@"2014-10-21",@82],@[@"2014-10-22",@99],@[@"2014-10-23",@163],@[@"2014-10-24",@267],@[@"2014-10-25",@353],@[@"2014-10-26",@78],@[@"2014-10-27",@72],@[@"2014-10-28",@88],@[@"2014-10-29",@140],@[@"2014-10-30",@206],@[@"2014-10-31",@204],@[@"2014-11-01",@65],@[@"2014-11-03",@59],@[@"2014-11-04",@150],@[@"2014-11-05",@79],@[@"2014-11-07",@63],@[@"2014-11-08",@93],@[@"2014-11-09",@80],@[@"2014-11-10",@95],@[@"2014-11-11",@59],@[@"2014-11-13",@65],@[@"2014-11-14",@77],@[@"2014-11-15",@143],@[@"2014-11-16",@98],@[@"2014-11-17",@64],@[@"2014-11-18",@93],@[@"2014-11-19",@282],@[@"2014-11-23",@155],@[@"2014-11-24",@94],@[@"2014-11-25",@196],@[@"2014-11-26",@293],@[@"2014-11-27",@83],@[@"2014-11-28",@114],@[@"2014-11-29",@276],@[@"2014-12-01",@54],@[@"2014-12-02",@65],@[@"2014-12-03",@51],@[@"2014-12-05",@62],@[@"2014-12-06",@89],@[@"2014-12-07",@65],@[@"2014-12-08",@82],@[@"2014-12-09",@276],@[@"2014-12-10",@153],@[@"2014-12-11",@52],@[@"2014-12-13",@69],@[@"2014-12-14",@113],@[@"2014-12-15",@82],@[@"2014-12-17",@99],@[@"2014-12-19",@53],@[@"2014-12-22",@103],@[@"2014-12-23",@100],@[@"2014-12-25",@73],@[@"2014-12-26",@155],@[@"2014-12-27",@243],@[@"2014-12-28",@155],@[@"2014-12-29",@125],@[@"2014-12-30",@65],@[@"2015-01-01",@65],@[@"2015-01-02",@79],@[@"2015-01-03",@200],@[@"2015-01-04",@226],@[@"2015-01-05",@122],@[@"2015-01-06",@60],@[@"2015-01-07",@85],@[@"2015-01-08",@190],@[@"2015-01-09",@105],@[@"2015-01-10",@208],@[@"2015-01-11",@59],@[@"2015-01-12",@160],@[@"2015-01-13",@211],@[@"2015-01-14",@265],@[@"2015-01-15",@386],@[@"2015-01-16",@118],@[@"2015-01-17",@89],@[@"2015-01-18",@94],@[@"2015-01-19",@77],@[@"2015-01-20",@113],@[@"2015-01-22",@143],@[@"2015-01-23",@257],@[@"2015-01-24",@117],@[@"2015-01-25",@185],@[@"2015-01-26",@119],@[@"2015-01-28",@65],@[@"2015-01-29",@87],@[@"2015-01-31",@60],@[@"2015-02-01",@108],@[@"2015-02-02",@188],@[@"2015-02-03",@143],@[@"2015-02-05",@62],@[@"2015-02-06",@100],@[@"2015-02-09",@152],@[@"2015-02-10",@166],@[@"2015-02-11",@55],@[@"2015-02-12",@59],@[@"2015-02-13",@175],@[@"2015-02-14",@293],@[@"2015-02-15",@326],@[@"2015-02-16",@153],@[@"2015-02-18",@73],@[@"2015-02-19",@267],@[@"2015-02-20",@183],@[@"2015-02-21",@394],@[@"2015-02-22",@158],@[@"2015-02-23",@86],@[@"2015-02-24",@207]];
    
    NSMutableArray *categories = [NSMutableArray array];
    NSMutableArray *data = [NSMutableArray array];
    [dataArr enumerateObjectsUsingBlock:^(NSArray *  _Nonnull obj, NSUInteger idx, BOOL * _Nonnull stop) {
        NSString *xValue = obj[0];
        [categories addObject:xValue];
        NSNumber *yValue = obj[1];
        [data addObject:yValue];
    }];
    
    AAChartModel *aaChartModel = AAChartModel.new
    .chartTypeSet(AAChartTypeLine)
    .categoriesSet(categories)
    .backgroundColorSet(AAColor.whiteColor)
    .markerRadiusSet(@0)
    .yAxisGridLineStyleSet([AALineStyle styleWithWidth:@0])
    .legendEnabledSet(false)
    .seriesSet(@[
        AASeriesElement.new
        .nameSet(@"2019")
        .fillOpacitySet(@0.5)
        .lineWidthSet(@3)
        .dataSet(data)
        .zIndexSet(@0)
               ]);
    
    AAOptions *aaOptions = aaChartModel.aa_toAAOptions;
    aaOptions.xAxis.labels.enabled = false;
    aaOptions.xAxis.tickWidth = @0;
    aaOptions.plotOptions.series.animation = (id)@(false);//禁用图表的渲染动画效果
    return aaOptions;
}

- (AAOptions *)configureAAPlotLinesForChart  {
    AAOptions *aaOptions = [self configureValueSegmentChartBasicOptions];
    
    AAStyle *aaStyle = AAStyle.new
    .colorSet(@"#ef476f")
    .fontWeightSet(AAChartFontWeightTypeBold);
    
    NSArray *aaPlotLinesArr = @[
        AAPlotLinesElement.new
        .colorSet(@"#ef476f")
        .dashStyleSet(AAChartLineDashStyleTypeLongDashDotDot)
        .widthSet(@(1.5))
        .valueSet(@(50))
        .zIndexSet(@(5)) //层叠,标示线在图表中显示的层叠级别，值越大，显示越向前
        .labelSet(AALabel.new
                  .textSet(@"PLOT LINES ONE")
                  .styleSet(aaStyle))
        ,
        AAPlotLinesElement.new
        .colorSet(@"#ef476f")
        .dashStyleSet(AAChartLineDashStyleTypeShortDot)
        .widthSet(@(1.5))
        .valueSet(@(100))
        .zIndexSet(@(5)) //层叠,标示线在图表中显示的层叠级别，值越大，显示越向前
        .labelSet(AALabel.new
                  .textSet(@"PLOT LINES TWO")
                  .styleSet(aaStyle))
        ,
        AAPlotLinesElement.new
        .colorSet(@"#ef476f")
        .dashStyleSet(AAChartLineDashStyleTypeShortDashDot)
        .widthSet(@(1.5))
        .valueSet(@(150))
        .zIndexSet(@(5)) //层叠,标示线在图表中显示的层叠级别，值越大，显示越向前
        .labelSet(AALabel.new
                  .textSet(@"PLOT LINES THREE")
                  .styleSet(aaStyle))
        ,
        AAPlotLinesElement.new
        .colorSet(@"#ef476f")
        .dashStyleSet(AAChartLineDashStyleTypeDashDot)
        .widthSet(@(1.5))
        .valueSet(@(200))
        .zIndexSet(@(5)) //层叠,标示线在图表中显示的层叠级别，值越大，显示越向前
        .labelSet(AALabel.new
                  .textSet(@"PLOT LINES FOUR")
                  .styleSet(aaStyle))
        ,
        AAPlotLinesElement.new
        .colorSet(@"#5e5e5e")//颜色值(16进制)
        .dashStyleSet(AAChartLineDashStyleTypeLongDashDot)//样式：Dash,Dot,Solid等,默认Solid
        .widthSet(@(1.5))
        .valueSet(@(300)) //所在位置
        .zIndexSet(@(5)) //层叠,标示线在图表中显示的层叠级别，值越大，显示越向前
        .labelSet(AALabel.new
                  .textSet(@"PLOT LINES FIVE")
                  .styleSet(AAStyle.new
                            .colorSet(@"#5e5e5e")
                            .fontWeightSet(AAChartFontWeightTypeBold)))
        ,
    ];
    
    AAYAxis *aaYAxis = aaOptions.yAxis;
    aaYAxis.plotLines = aaPlotLinesArr;
    
    return aaOptions;
}

- (AAOptions *)configureAASeriesElementZones {
    AAOptions *aaOptions = [self configureValueSegmentChartBasicOptions];
    NSArray *seriesArr = aaOptions.series;
    AASeriesElement *aaSeriesElement = seriesArr[0];
    aaSeriesElement.zones = @[
        AAZonesElement.new
        .valueSet(@50)
        .colorSet(@"#ffde33"),
        AAZonesElement.new
        .valueSet(@100)
        .colorSet(@"#ff9933"),
        AAZonesElement.new
        .valueSet(@150)
        .colorSet(@"#cc0033"),
        AAZonesElement.new
        .valueSet(@200)
        .colorSet(@"#660099"),
        AAZonesElement.new
        .valueSet(@300)
        .colorSet(@"#7e0023"),
        
        AAZonesElement.new
        .colorSet(@"#096000"),
    ];
    
    return aaOptions;
}

- (AAOptions *)configureAASeriesElementZonesMixedAAPlotLines {
    AAChartModel *aaChartModel = AAChartModel.new
    .chartTypeSet(AAChartTypeAreaspline)
    .backgroundColorSet(AAColor.whiteColor)
    .categoriesSet(@[@"一月", @"二月", @"三月", @"四月", @"五月", @"六月", @"七月", @"八月", @"九月", @"十月", @"十一月", @"十二月"])
    .markerRadiusSet(@0)
    .yAxisMaxSet(@50)
    .yAxisGridLineStyleSet([AALineStyle styleWithWidth:@0])
    .legendEnabledSet(false)
    .seriesSet(@[
        AASeriesElement.new
        .nameSet(@"2019")
        .fillOpacitySet(@0.5)
        .lineWidthSet(@10)
        .dataSet(@[@7.0, @6.9, @2.5, @14.5, @18.2, @21.5, @5.2, @26.5, @23.3, @45.3, @13.9, @9.6])
        .zonesSet(@[
            AAZonesElement.new
            .valueSet(@12)
            .colorSet(@"#1e90ff"),
            AAZonesElement.new
            .valueSet(@24)
            .colorSet(@"#ef476f"),
            AAZonesElement.new
            .valueSet(@36)
            .colorSet(@"#04d69f"),
            
            AAZonesElement.new
            .colorSet(@"#ffd066"),
                  ]),
               ]);
    //    @[@"#1e90ff",@"#ef476f",@"#ffd066",@"#04d69f",@"#25547c",]
    AAOptions *aaOptions = aaChartModel.aa_toAAOptions;
    
    NSArray *aaPlotLinesArr = @[
        AAPlotLinesElement.new
        .colorSet(@"#1e90ff")//颜色值(16进制)
        .dashStyleSet(AAChartLineDashStyleTypeLongDashDot)//样式：Dash,Dot,Solid等,默认Solid
        .widthSet(@(1)) //标示线粗细
        .valueSet(@(12)) //所在位置
        .zIndexSet(@(1)) //层叠,标示线在图表中显示的层叠级别，值越大，显示越向前
        .labelSet(AALabel.new
                  .textSet(@"PLOT LINES ONE")
                  .styleSet(AAStyleColorSizeWeight(@"#1e90ff", 13, AAChartFontWeightTypeBold)))
        ,
        AAPlotLinesElement.new
        .colorSet(@"#ef476f")
        .dashStyleSet(AAChartLineDashStyleTypeLongDashDot)
        .widthSet(@(1))
        .valueSet(@(24))
        .labelSet(AALabel.new
                  .textSet(@"PLOT LINES TWO")
                  .styleSet(AAStyleColorSizeWeight(@"#ef476f", 13, AAChartFontWeightTypeBold)))
        ,
        AAPlotLinesElement.new
        .colorSet(@"#04d69f")
        .dashStyleSet(AAChartLineDashStyleTypeLongDashDot)
        .widthSet(@(1))
        .valueSet(@(36))
        .labelSet(AALabel.new
                  .textSet(@"PLOT LINES THREE")
                  .styleSet(AAStyleColorSizeWeight(@"#04d69f", 13, AAChartFontWeightTypeBold)))
    ];
    
    AAYAxis *aaYAxis = aaOptions.yAxis;
    aaYAxis.plotLines = aaPlotLinesArr;
    return aaOptions;
}

// Refer to the issue https://github.com/AAChartModel/AAChartKit/issues/521
- (AAOptions *)adjustChartDataLabelsStyle {
    AAChartModel *aaChartModel = AAChartModel.new
    .chartTypeSet(AAChartTypeSpline)//图表类型
    .markerRadiusSet(@7)
    .markerSymbolStyleSet(AAChartSymbolStyleTypeBorderBlank)
    .dataLabelsEnabledSet(true)
    .yAxisLineWidthSet(0)
    .legendEnabledSet(false)
    .xAxisGridLineStyleSet([AALineStyle styleWithColor:AAColor.grayColor dashStyle:AAChartLineDashStyleTypeLongDashDot width:@1])
    .tooltipEnabledSet(false)
    .categoriesSet(@[
        @"10-01",@"10-02",@"10-03",@"10-04",@"10-05",@"10-06",@"10-07",@"10-08",@"10-09",
        @"10-10",@"10-11",@"10-12",@"10-13",@"10-14",@"10-15",])
    .seriesSet(@[
        AASeriesElement.new
        .colorSet(AAColor.redColor)// blue color
        .nameSet(@"2020")
        .dataSet(@[
            @1.51, @6.7, @0.94, @1.44, @3.87, @3.24, @4.90, @4.61, @4.10,
            @4.17, @3.85, @4.17, @3.46, @3.46, @3.55,]),
               ]);
    
    AAOptions *aaOptions = aaChartModel.aa_toAAOptions;
    aaOptions.yAxis.gridLineDashStyle = AAChartLineDashStyleTypeLongDash;//设置Y轴的网格线样式为 AAChartLineDashStyleTypeLongDash
    aaOptions.plotOptions.series.dataLabels
    .ySet(@-10)
    .formatSet(@"{y}美元")
    .colorSet(AAColor.redColor)
    .backgroundColorSet(AAColor.whiteColor)
    .borderColorSet(AAColor.redColor)
    .shapeSet(@"callout")
    .borderRadiusSet(@1)
    .borderWidthSet(@1);
    
    return aaOptions;
}

// Refer to the issue https://github.com/AAChartModel/AAChartKit/issues/589
- (AAOptions *)customizeEveryDataLabelBySinglely {
    NSArray *dataArr = @[
        AADataElement.new
        .dataLabelsSet(AADataLabels.new
                       .enabledSet(true)
                       .formatSet(@"{y} 美元")
                       )
        .ySet(@7.1),
        AADataElement.new
        .dataLabelsSet(AADataLabels.new
                       .enabledSet(true)
                       .formatSet(@"{y} 欧元")
                       )
        .ySet(@6.9),
        AADataElement.new
        .dataLabelsSet(AADataLabels.new
                       .enabledSet(true)
                       .formatSet(@"{y} 人民币")
                       )
        .ySet(@2.5),
        AADataElement.new
        .dataLabelsSet(AADataLabels.new
                       .enabledSet(true)
                       .formatSet(@"{y} 日元")
                       )
        .ySet(@14.5),
        AADataElement.new
        .dataLabelsSet(AADataLabels.new
                       .enabledSet(true)
                       .formatSet(@"{y} 韩元")
                       )
        .ySet(@18.2),
        AADataElement.new
        .dataLabelsSet(AADataLabels.new
                       .enabledSet(true)
                       .formatSet(@"{y} 越南盾")
                       )
        .ySet(@18.2),
        AADataElement.new
        .dataLabelsSet(AADataLabels.new
                       .enabledSet(true)
                       .formatSet(@"{y} 港币")
                       )
        .ySet(@21.5),
    ];
    
    AAChartModel *aaChartModel = AAChartModel.new
    .chartTypeSet(AAChartTypeAreaspline)//图表类型
    .dataLabelsEnabledSet(true)
    .tooltipEnabledSet(false)
    .colorsThemeSet(@[AAColor.lightGrayColor])
    .markerRadiusSet(@0)
    .legendEnabledSet(false)
    .categoriesSet(@[@"美国🇺🇸",@"欧洲🇪🇺",@"中国🇨🇳",@"日本🇯🇵",@"韩国🇰🇷",@"越南🇻🇳",@"中国香港🇭🇰",])
    .seriesSet(@[
        AASeriesElement.new
        .colorSet((id)AAGradientColor.fizzyPeachColor)
        .dataSet(dataArr),
               ]);
    
    AAOptions *aaOptions = aaChartModel.aa_toAAOptions;
    
    aaOptions.yAxis.gridLineDashStyle = AAChartLineDashStyleTypeLongDash;//设置Y轴的网格线样式为 AAChartLineDashStyleTypeLongDash
    
    aaOptions.plotOptions.series.dataLabels
    .xSet(@3)
    .ySet(@-20)
    .verticalAlignSet(AAChartVerticalAlignTypeMiddle)
    .backgroundColorSet(AAColor.whiteColor)// white color
    .borderColorSet(AAColor.redColor)// red color
    .shapeSet(@"callout")
    .borderRadiusSet(@1.5)
    .borderWidthSet(@1.3)
    .styleSet(AAStyleColorSizeWeight(AAColor.redColor, 15, AAChartFontWeightTypeBold))
    ;
    return aaOptions;
}

- (AAOptions *)configureXAxisLabelsFontColorWithHTMLString {
    NSArray *categories = @[
        @"<font color=\\\"#CC0066\\\">孤岛危机</font>",
        @"<font color=\\\"#CC0033\\\">使命召唤</font>",
        @"<font color=\\\"#FF0066\\\">荣誉勋章</font>",
        @"<font color=\\\"##66FF99\\\">狙击精英</font>",
        @"<font color=\\\"#00FF00\\\">神秘海域</font>",
        @"<font color=\\\"#00CC00\\\">美国末日</font>",
        @"<font color=\\\"#666FF\\\">巫师狂猎</font>",
        @"<font color=\\\"#000CC\\\">死亡搁浅</font>",
        @"<font color=\\\"#9933CC\\\">地狱边境</font>",
        @"<font color=\\\"##FFCC99\\\">忍者之印</font>",
        @"<font color=\\\"#FFCC00\\\">合金装备</font>",
        @"<font color=\\\"#CC99090\\\">全战三国</font>",
    ];
    
    AAChartModel *aaChartModel = AAChartModel.new
    .chartTypeSet(AAChartTypeAreaspline)
    .stackingSet(AAChartStackingTypeNormal)
    .categoriesSet(categories)
    .markerRadiusSet(@0)
    .seriesSet(@[
        AASeriesElement.new
        .nameSet(@"Berlin Hot")
        .colorSet((id)[AAGradientColor mysticMauveColor])
        .dataSet(@[@7.0, @6.9, @2.5, @14.5, @18.2, @21.5, @5.2, @26.5, @23.3, @45.3, @13.9, @9.6]),
               ]);
    
    AAOptions *aaOptions = aaChartModel.aa_toAAOptions;
    aaOptions.yAxis.labels.format = @"{value} %";//给y轴添加单位
    aaOptions.xAxis.labels.useHTML = true;
    return aaOptions;
}

// Refer to the issue https://github.com/AAChartModel/AAChartKit/issues/630
- (AAOptions *)configureXAxisLabelsFontColorAndFontSizeWithHTMLString {
    NSArray *categories = @[
        @"<span style=\\\"color:#CC0066;font-weight:bold;font-size:10px\\\">使命召唤</span>",
        @"<span style=\\\"color:#CC0033;font-weight:bold;font-size:11px\\\">荣誉勋章</span>",
        @"<span style=\\\"color:#FF0066;font-weight:bold;font-size:12px\\\">狙击精英</span>",
        @"<span style=\\\"color:#66FF99;font-weight:bold;font-size:13px\\\">神秘海域</span>",
        @"<span style=\\\"color:#00FF00;font-weight:bold;font-size:14px\\\">美国末日</span>",
        @"<span style=\\\"color:#00CC00;font-weight:bold;font-size:15px\\\">巫师狂猎</span>",
        @"<span style=\\\"color:#000CCC;font-weight:bold;font-size:14px\\\">孤岛危机</span>",
        @"<span style=\\\"color:#666FFF;font-weight:bold;font-size:15px\\\">地狱边境</span>",
        @"<span style=\\\"color:#9933CC;font-weight:bold;font-size:13px\\\">忍者之印</span>",
        @"<span style=\\\"color:#FFCC99;font-weight:bold;font-size:12px\\\">合金装备</span>",
        @"<span style=\\\"color:#FFCC00;font-weight:bold;font-size:11px\\\">全战三国</span>",
        @"<span style=\\\"color:#CC9909;font-weight:bold;font-size:10px\\\">死亡搁浅</span>",
    ];
    
    AAChartModel *aaChartModel = AAChartModel.new
    .chartTypeSet(AAChartTypeAreaspline)
    .stackingSet(AAChartStackingTypeNormal)
    .yAxisVisibleSet(false)
    .categoriesSet(categories)
    .markerRadiusSet(@0)
    .seriesSet(@[
        AASeriesElement.new
        .nameSet(@"Berlin Hot")
        .colorSet((id)[AAGradientColor deepSeaColor])
        .dataSet(@[@7.0, @6.9, @2.5, @14.5, @18.2, @21.5, @5.2, @26.5, @23.3, @45.3, @13.9, @9.6]),
               ]);
    
    AAOptions *aaOptions = aaChartModel.aa_toAAOptions;
    aaOptions.yAxis.labels.format = @"{value} %";//给y轴添加单位
    aaOptions.xAxis.labels.useHTML = true;
    return aaOptions;
}

// Refer to the issue https://github.com/AAChartModel/AAChartKit/issues/696
- (AAOptions *)configure_DataLabels_XAXis_YAxis_Legend_Style {
    NSDictionary *fillColorGradientColor =
    [AAGradientColor gradientColorWithDirection:AALinearGradientDirectionToTop//渐变色方向向上🔼
                               startColorString:@"rgba(256,256,256,0.3)"//颜色字符串设置支持十六进制类型和 rgba 类型
                                 endColorString:@"rgba(256,256,256,1.0)"];
    
    NSDictionary *backgroundColorGradientColor =
    [AAGradientColor gradientColorWithDirection:AALinearGradientDirectionToTopLeft//渐变色方向向左上↖️
                               startColorString:@"#4F00BC"//颜色字符串设置支持十六进制类型和 rgba 类型
                                 endColorString:@"#29ABE2"];
    
    AAChartModel *aaChartModel = AAChartModel.new
    .chartTypeSet(AAChartTypeAreaspline)
    .backgroundColorSet((id)backgroundColorGradientColor)
    .stackingSet(AAChartStackingTypeNormal)
    .yAxisVisibleSet(true)
    .categoriesSet(@[@"一月", @"二月", @"三月", @"四月", @"五月", @"六月", @"七月", @"八月", @"九月", @"十月", @"十一月", @"十二月"])
    .markerRadiusSet(@0)
    .seriesSet(@[
        AASeriesElement.new
        .nameSet(@"Berlin Hot")
        .colorSet(AAColor.whiteColor)
        .lineWidthSet(@7)
        .fillColorSet((id)fillColorGradientColor)
        .dataSet(@[@7.0, @6.9, @2.5, @14.5, @18.2, @21.5, @5.2, @26.5, @23.3, @45.3, @13.9, @9.6]),
               ]);
    
    AAOptions *aaOptions = aaChartModel.aa_toAAOptions;
    
    aaOptions.plotOptions.series
    .dataLabels
    .enabledSet(true)
    .styleSet([AAStyle styleWithColor:AAColor.whiteColor
                             fontSize:14
                           fontWeight:AAChartFontWeightTypeThin
                          textOutline:@"0px 0px contrast"])
    ;
    
    aaOptions.xAxis
    .tickWidthSet(@0)//X轴刻度线宽度
    .lineWidthSet(@1.5)//X轴轴线宽度
    .lineColorSet(AAColor.whiteColor)//X轴轴线颜色
    .gridLineColorSet(AAColor.whiteColor)
    .gridLineWidthSet(@0.5)//X轴网格线宽度
    .gridLineDashStyleSet(AAChartLineDashStyleTypeDash)
    .labels.style.colorSet(AAColor.whiteColor)//X轴文字颜色
    ;
    
    aaOptions.yAxis
    .lineWidthSet(@1.5)//Y轴轴线颜色
    .lineColorSet(AAColor.whiteColor)//Y轴轴线颜色
    .gridLineColorSet(AAColor.whiteColor)
    .gridLineWidthSet(@0.5)//Y轴网格线宽度
    .gridLineDashStyleSet(AAChartLineDashStyleTypeDash)
    .labels.style.colorSet(AAColor.whiteColor)//Y轴文字颜色
    ;
    
    //设定图例项的CSS样式。只支持有关文本的CSS样式设定。
    /*默认是：{
     "color": "#333333",
     "cursor": "pointer",
     "fontSize": "12px",
     "fontWeight": "bold"
     }
     */
    aaOptions.legend
    .itemStyleSet(AAItemStyle.new
                  .colorSet(AAColor.whiteColor)//字体颜色
                  .fontSizeSet(@"13px")//字体大小
                  .fontWeightSet(AAChartFontWeightTypeThin)//字体为细体字
                  );
    
    return aaOptions;
}

- (AAOptions *)configureXAxisPlotBand {
    AAChartModel *aaChartModel = AAChartModel.new
    .chartTypeSet(AAChartTypeAreaspline)
    .categoriesSet(@[@"一月", @"二月", @"三月", @"四月", @"五月", @"六月",
                     @"七月", @"八月", @"九月", @"十月", @"十一月", @"十二月"])
    .markerRadiusSet(@8.0)//marker点半径为8个像素
    .markerSymbolStyleSet(AAChartSymbolStyleTypeInnerBlank)//marker点为空心效果
    .markerSymbolSet(AAChartSymbolTypeCircle)//marker点为圆形点○
    .yAxisLineWidthSet(@0)
    .yAxisGridLineStyleSet([AALineStyle styleWithWidth:@0])
    .legendEnabledSet(false)
    .seriesSet(@[
        AASeriesElement.new
        .nameSet(@"New York Hot")
        .lineWidthSet(@5.0)
        .colorSet(@"rgba(220,20,60,1)")//猩红色, alpha 透明度 1
        .dataSet(@[@7.0, @6.9, @2.5, @14.5, @18.2, @21.5, @5.2, @26.5, @23.3, @45.3, @13.9, @9.6]),
        AASeriesElement.new
        .typeSet(AAChartTypeColumn)
        .nameSet(@"Berlin Hot")
        .colorSet(@"#25547c")
        .dataSet(@[@7.0, @6.9, @2.5, @14.5, @18.2, @21.5, @5.2, @26.5, @23.3, @45.3, @13.9, @9.6]),
               ]);
    AAOptions *aaOptions = aaChartModel.aa_toAAOptions;
    
    //  refer to https://api.highcharts.com.cn/highcharts#xAxis.plotBands
    NSArray *aaPlotBandsArr = @[
        AAPlotBandsElement.new
        .fromSet(@-0.25)//值域颜色带X轴起始值
        .toSet(@4.75)//值域颜色带X轴结束值
        .colorSet(@"#ef476f66")//值域颜色带填充色
        .zIndexSet(0),//层叠,标示线在图表中显示的层叠级别，值越大，显示越向前
        AAPlotBandsElement.new
        .fromSet(@4.75)
        .toSet(@8.25)
        .colorSet(@"#ffd06666")
        .zIndexSet(0),
        AAPlotBandsElement.new
        .fromSet(@8.25)
        .toSet(@11.25)
        .colorSet(@"#04d69f66")
        .zIndexSet(0),
    ];
    
    AAXAxis *aaXAxis = aaOptions.xAxis;
    aaXAxis.plotBands = aaPlotBandsArr;
    return aaOptions;
}

// Refer to the issue https://github.com/AAChartModel/AAChartKit/issues/707
- (AAOptions *)configureStackingColumnChartDataLabelsOverflow {
    AAChartModel *aaChartModel = AAChartModel.new
    .chartTypeSet(AAChartTypeColumn)
    .subtitleSet(@"检测数量")
    .dataLabelsEnabledSet(true)
    .categoriesSet(@[@"呋喃西林代谢物",@"孔雀石绿🦚",@"氯霉素",@"呋喃唑酮代谢物"])
    .stackingSet(AAChartStackingTypeNormal)
    .seriesSet(@[
        AASeriesElement.new
        .nameSet(@"不合格")
        .colorSet(@"#F55E4E")
        .dataSet(@[@3,@1,@1,@0])
        ,
        AASeriesElement.new
        .nameSet(@"合格")
        .colorSet(@"#5274BC")
        .dataSet(@[@4,@0,@1,@1])
        ,
               ]);
    
    AAOptions *aaOptions = aaChartModel.aa_toAAOptions;
    AADataLabels *aaDataLabels = aaOptions.plotOptions.series.dataLabels;
    
    //通过设置 crop 为 false 及 overflow 为"none" 可以让数据标签显示在绘图区的外面
    //参见:https://api.highcharts.com.cn/highcharts#plotOptions.column.dataLabels.overflow
    aaDataLabels
    .enabledSet(YES)
    .allowOverlapSet(YES)
    .cropSet(false)
    .overflowSet(@"none")
    .styleSet(AAStyle.new
              .colorSet(@"#000000")
              .fontSizeSet(@"11px")
              )
    ;
    
    return aaOptions;
}

// Refer to the issue https://github.com/AAChartModel/AAChartKit/issues/735
- (AAOptions *)configureReversedBarChartDataLabelsStyle {
    AAChartModel *aaChartModel = AAChartModel.new
    .chartTypeSet(AAChartTypeBar)
    .stackingSet(AAChartStackingTypeNormal)
    .markerRadiusSet(@0)
    .yAxisReversedSet(true)
    .colorsThemeSet(@[AAGradientColor.sanguineColor])
    .seriesSet(@[
        AASeriesElement.new
        .nameSet(@"Tokyo Hot")
        .dataSet(@[@140,@120,@100,@80,@60,@40,@20])
               ]);
    
    AAOptions *aaOptions = aaChartModel.aa_toAAOptions;
    
    aaOptions.plotOptions.series
    .dataLabelsSet(AADataLabels.new
                   .enabledSet(true)
                   .alignSet(AAChartAlignTypeRight)//DataLabels水平对齐位置
                   .insideSet(true)//DataLabels是否在条形图的长条内部
                   .styleSet(AAStyle.new
                             .colorSet(AAColor.whiteColor)
                             .fontWeightSet(AAChartFontWeightTypeBold)
                             .fontSizeSet(@"28px")
                             .textOutlineSet(@"0px 0px contrast")//文字轮廓描边
                             ));
    
    return aaOptions;
}

- (AAOptions *)configureTripleYAxesMixedChart {
    NSArray *colorsThemeArr = @[@"red",@"mediumspringgreen",@"deepskyblue",];
    
    AATitle *aaTitle = AATitle.new
    .textSet(@"东京月平均天气数据");
    
    AASubtitle *aaSubtitle = AASubtitle.new
    .textSet(@"数据来源: WorldClimate.com");
    
    AAXAxis *aaXAxis = AAXAxis.new
    .visibleSet(true)
    .minSet(@0)
    .categoriesSet(@[@"一月", @"二月", @"三月", @"四月", @"五月", @"六月",
                     @"七月", @"八月", @"九月", @"十月", @"十一月", @"十二月"]);
    
    AAYAxis *yAxis1 = AAYAxis.new
    .visibleSet(true)
    .gridLineWidthSet(@0)
    .labelsSet(AALabels.new
               .enabledSet(true)//设置 y 轴是否显示数字
               .formatSet(@"{value}°C")
               .styleSet(AAStyle.new
                         .colorSet(colorsThemeArr[2])//yAxis Label font color
                         ))
    .titleSet(AAAxisTitle.new
              .textSet(@"温度")
              .styleSet(AAStyle.new
                        .colorSet(colorsThemeArr[2])))
    .oppositeSet(true);
    
    
    AAYAxis *yAxis2 = AAYAxis.new
    .visibleSet(true)
    .gridLineWidthSet(@0)
    .labelsSet(AALabels.new
               .enabledSet(true)//设置 y 轴是否显示数字
               .formatSet(@"{value}°mm")
               .styleSet(AAStyle.new
                         .colorSet(colorsThemeArr[0])//yAxis Label font color
                         ))
    .titleSet(AAAxisTitle.new
              .textSet(@"降雨量")
              .styleSet(AAStyle.new
                        .colorSet(colorsThemeArr[0])));
    
    AAYAxis *yAxis3 = AAYAxis.new
    .visibleSet(true)
    .gridLineWidthSet(@0)
    .labelsSet(AALabels.new
               .enabledSet(true)//设置 y 轴是否显示数字
               .formatSet(@"{value}°mb")
               .styleSet(AAStyle.new
                         .colorSet(colorsThemeArr[1])//yAxis Label font color
                         ))
    .titleSet(AAAxisTitle.new
              .textSet(@"海平面气压")
              .styleSet(AAStyle.new
                        .colorSet(colorsThemeArr[1])))
    .oppositeSet(true);
    
    AATooltip *aaTooltip = AATooltip.new
    .enabledSet(true)
    .sharedSet(true);
    
    AALegend *aaLegend = AALegend.new
    .enabledSet(true)
    .floatingSet(true)
    .layoutSet(AAChartLayoutTypeVertical)
    .alignSet(AAChartAlignTypeLeft)
    .xSet(@80)
    .verticalAlignSet(AAChartVerticalAlignTypeTop)
    .ySet(@55);
    
    AASeriesElement *element1 = AASeriesElement.new
    .nameSet(@"降雨量")
    .typeSet(AAChartTypeColumn)
    .yAxisSet(@1)
    .dataSet(@[@49.9, @71.5, @106.4, @129.2, @144.0, @176.0, @135.6, @148.5, @216.4, @194.1, @95.6, @54.4])
    .borderRadiusTopLeftSet((id)@"50%")
    .borderRadiusTopRightSet((id)@"50%")
    .tooltipSet(AATooltip.new
                .valueSuffixSet(@" mm"));
    
    AASeriesElement *element2 = AASeriesElement.new
    .nameSet(@"海平面气压")
    .typeSet(AAChartTypeSpline)
    .yAxisSet(@2)
    .dataSet(@[@1016, @1016, @1015.9, @1015.5, @1012.3, @1009.5, @1009.6, @1010.2, @1013.1, @1016.9, @1018.2, @1016.7])
    .dashStyleSet(AAChartLineDashStyleTypeShortDot)
    .tooltipSet(AATooltip.new
                .valueSuffixSet(@" mb"));
    
    AASeriesElement *element3 = AASeriesElement.new
    .nameSet(@"温度")
    .typeSet(AAChartTypeSpline)
    .yAxisSet(@0)
    .dataSet(@[@7.0, @6.9, @9.5, @14.5, @18.2, @21.5, @25.2, @26.5, @23.3, @18.3, @13.9, @9.6])
    .tooltipSet(AATooltip.new
                .valueSuffixSet(@" ℃"));
    
    AAOptions *aaOptions = AAOptions.new
    .titleSet(aaTitle)
    .subtitleSet(aaSubtitle)
    .colorsSet(colorsThemeArr)
    .xAxisSet(aaXAxis)
    .yAxisSet((id)@[yAxis1,yAxis2,yAxis3])
    .tooltipSet(aaTooltip)
    .legendSet(aaLegend)
    .seriesSet(@[element1,element2,element3])
    ;
    return aaOptions;
}

// Refer to the issue https://github.com/AAChartModel/AAChartKit/issues/771
- (AAOptions *)configureDoubleYAxesAndColumnLineMixedChart {
    NSArray *stopsArr = @[
        @[@0.0, @"rgba(156,107,211,0.5)"],//颜色字符串设置支持十六进制类型和 rgba 类型
        @[@0.2, @"rgba(156,107,211,0.3)"],
        @[@1.0, @"rgba(156,107,211,0)"]
    ];
    NSDictionary *gradientColorDic1 =
    [AAGradientColor gradientColorWithDirection:AALinearGradientDirectionToBottom
                                     stopsArray:stopsArr];
    
    NSDictionary *gradientColorDic2 =
    [AAGradientColor gradientColorWithDirection:AALinearGradientDirectionToBottom
                               startColorString:@"#956FD4"//颜色字符串设置支持十六进制类型和 rgba 类型
                                 endColorString:@"#3EACE5"];
    
    NSArray *categories = @[
        @"市区",@"万州",@"江北",@"南岸",@"北碚",@"綦南",@"长寿",@"永川",@"璧山",@"江津",
        @"城口",@"大足",@"垫江",@"丰都",@"奉节",@"合川",@"江津区",@"开州",@"南川",@"彭水",
        @"黔江",@"石柱",@"铜梁",@"潼南",@"巫山",@"巫溪",@"武隆",@"秀山",@"酉阳",@"云阳",
        @"忠县",@"川东",@"检修"];
    
    NSArray *goalValuesArr = @[
        @18092,@20728,@24045,@28348,@32808,
        @36097,@39867,@44715,@48444,@50415,
        @56061,@62677,@59521,@67560,@18092,
        @20728,@24045,@28348,@32808,@36097,
        @39867,@44715,@48444,@50415,@36097,
        @39867,@44715,@48444,@50415,@50061,
        @32677,@49521,@32808];
    
    NSArray *realValuesArr = @[
        @4600,@5000,@5500,@6500,@7500,
        @8500,@9900,@12500,@14000,@21500,
        @23200,@24450,@25250,@33300,@4600,
        @5000,@5500,@6500,@7500,@8500,
        @9900,@22500,@14000,@21500,@8500,
        @9900,@12500,@14000,@21500,@23200,
        @24450,@25250,@7500];
    
    NSMutableArray *rateValuesArr = [NSMutableArray arrayWithCapacity:33];
    
    for (int i = 0; i < 33; i++) {
        NSNumber *goalValueNum = goalValuesArr[i];
        NSNumber *realValueNum = realValuesArr[i];
        CGFloat goalValue = [goalValueNum doubleValue];
        CGFloat realValue = [realValueNum doubleValue];
        CGFloat rateValue = realValue / goalValue;
        NSNumber *rateValueNum = @(rateValue);
        [rateValuesArr addObject:rateValueNum];
    }
    
    AAChart *aaChart = AAChart.new
    .backgroundColorSet(@"#191E40");
    
    AATitle *aaTitle = AATitle.new
    .textSet(@"");
    
    AALabels *aaLabels = AALabels.new
    .enabledSet(true)
    .styleSet(AAStyle.new
              .colorSet(AAColor.lightGrayColor));
    
    AAXAxis *aaXAxis = AAXAxis.new
    .visibleSet(true)
    .labelsSet(aaLabels)
    .minSet(@0)
    .categoriesSet(categories);
    
    AAStyle *aaYAxisTitleStyle = AAStyle.new
    .colorSet(@"#1e90ff")//Title font color
    .fontSizeSet(@"14px")//Title font size
    .fontWeightSet(AAChartFontWeightTypeBold)//Title font weight
    .textOutlineSet(@"0px 0px contrast");
    
    AAYAxis *yAxis1 = AAYAxis.new
    .visibleSet(true)
    .labelsSet(aaLabels)
    .gridLineWidthSet(@0)
    .titleSet(AAAxisTitle.new
              .textSet(@"已贯通 / 计划贯通")
              .styleSet(aaYAxisTitleStyle));
    
    AAYAxis *yAxis2 = AAYAxis.new
    .visibleSet(true)
    .labelsSet(aaLabels)
    .gridLineWidthSet(@0)
    .titleSet(AAAxisTitle.new
              .textSet(@"贯通率")
              .styleSet(aaYAxisTitleStyle))
    .oppositeSet(true);
    
    AATooltip *aaTooltip = AATooltip.new
    .enabledSet(true)
    .sharedSet(true);
    
    AAPlotOptions *aaPlotOptions = AAPlotOptions.new
    .seriesSet(AASeries.new
               .animationSet(AAAnimation.new
                             .easingSet(AAChartAnimationBounce)
                             .durationSet(@1000)
                             )
               )
    .columnSet(AAColumn.new
               .groupingSet(false)
               .pointPaddingSet(@0)
               .pointPlacementSet(@(0))
               );
    
    AALegend *aaLegend = AALegend.new
    .enabledSet(true)
    .itemStyleSet(AAItemStyle.new
                  .colorSet(AAColor.lightGrayColor))
    .floatingSet(true)
    .layoutSet(AAChartLayoutTypeHorizontal)
    .alignSet(AAChartAlignTypeLeft)
    .xSet(@30)
    .verticalAlignSet(AAChartVerticalAlignTypeTop)
    .ySet(@10);
    
    
    AASeriesElement *goalValuesElement = AASeriesElement.new
    .nameSet(@"计划贯通")
    .typeSet(AAChartTypeColumn)
    .borderWidthSet(@0)
    .borderRadiusSet(@4)
    .colorSet((id)gradientColorDic1)
    .yAxisSet(@0)
    .dataSet(goalValuesArr);
    
    AASeriesElement *realValuesElement = AASeriesElement.new
    .nameSet(@"已贯通")
    .typeSet(AAChartTypeColumn)
    .borderWidthSet(@0)
    .borderRadiusSet(@4)
    .colorSet((id)gradientColorDic2)
    .yAxisSet(@0)
    .dataSet(realValuesArr);
    
    AASeriesElement *rateValuesElement = AASeriesElement.new
    .nameSet(@"贯通率")
    .typeSet(AAChartTypeSpline)
    .markerSet(AAMarker.new
               .radiusSet(@7)//曲线连接点半径，默认是4
               .symbolSet(AAChartSymbolTypeCircle)//曲线点类型："circle", "square", "diamond", "triangle","triangle-down"，默认是"circle"
               .fillColorSet(@"#ffffff")//点的填充色(用来设置折线连接点的填充色)
               .lineWidthSet(@3)//外沿线的宽度(用来设置折线连接点的轮廓描边的宽度)
               .lineColorSet(@"")//外沿线的颜色(用来设置折线连接点的轮廓描边颜色，当值为空字符串时，默认取数据点或数据列的颜色)
               )
    .colorSet(@"#F02FC2")
    .yAxisSet(@1)
    .dataSet(rateValuesArr);
    
    AAOptions *aaOptions = AAOptions.new
    .chartSet(aaChart)
    .titleSet(aaTitle)
    .xAxisSet(aaXAxis)
    .yAxisSet((id)@[yAxis1,yAxis2])
    .tooltipSet(aaTooltip)
    .plotOptionsSet(aaPlotOptions)
    .legendSet(aaLegend)
    .seriesSet(@[
        goalValuesElement,
        realValuesElement,
        rateValuesElement
               ])
    ;
    return aaOptions;
}

// Refer to the issue https://github.com/AAChartModel/AAChartKit/issues/772
- (AAOptions *)configureDoubleYAxesMarketDepthChart {
    AAChart *aaChart = AAChart.new
    .typeSet(AAChartTypeArea);
    
    AATitle *aaTitle = AATitle.new
    .textSet(@"ETH-BTC 市场深度图");
    
    AASubtitle *aaSubtitle = AASubtitle.new
    .textSet(@"数据来源: https://github.com/AAChartModel");
    
    AAXAxis *aaXAxis = AAXAxis.new
    .visibleSet(true)
    .plotLinesSet(@[
        AAPlotLinesElement.new
        .colorSet(@"#888")
        .valueSet(@0.1523)
        .widthSet(@1)
        .labelSet(AALabel.new
                  .textSet(@"实际价格")
                  .rotationSet(@90))
                  ])
    ;
    
    AAYAxis *yAxis1 = AAYAxis.new
    .visibleSet(true)
    .lineWidthSet(@1)
    .titleSet((id)NSNull.null)
    .tickWidthSet(@1)
    .tickLengthSet(@5)
    .tickPositionSet(@"inside")
    .gridLineWidthSet(@1)
    .labelsSet(AALabels.new
               .enabledSet(true)//设置 y 轴是否显示数字
               .alignSet(AAChartAlignTypeLeft)
               .xSet(@8)
               );
    
    AAYAxis *yAxis2 = AAYAxis.new
    .oppositeSet(true)
    .visibleSet(true)
    .lineWidthSet(@1)
    .titleSet((id)NSNull.null)
    .tickWidthSet(@1)
    .tickLengthSet(@5)
    .tickPositionSet(@"inside")
    .gridLineWidthSet(@0)
    .labelsSet(AALabels.new
               .enabledSet(true)//设置 y 轴是否显示数字
               .alignSet(AAChartAlignTypeRight)
               .xSet(@-8)
               );
    
    AATooltip *aaTooltip = AATooltip.new
    .enabledSet(true)
    .headerFormatSet(@"<span style=""font-size:10px;"">Price: {point.key}</span><br/>")
    .valueDecimalsSet(@2)
    ;
    
    AALegend *aaLegend = AALegend.new
    .enabledSet(false);
    
    AAPlotOptions *aaPlotOptions = AAPlotOptions.new
    .seriesSet(AASeries.new
               .animationSet(AAAnimation.new
                             .easingSet(AAChartAnimationBounce)
                             .durationSet(@1000))
               .statesSet(AAStates.new
                          .inactiveSet(AAInactive.new
                                       .opacitySet(@1))));
    
    AASeriesElement *element1 = AASeriesElement.new
    .nameSet(@"Bids")
    .colorSet(AAColor.redColor)
    .fillColorSet((id)AAGradientColor.new
                  .directionSet(AALinearGradientDirectionToBottom)
                  .stopsArraySet(@[
                      @[@0.0, AARgbaColor(255, 0, 0, 1.0)],//颜色字符串设置支持十六进制类型和 rgba 类型
                      @[@0.6, AARgbaColor(255, 0, 0, 0.2)],
                      @[@1.0, AARgbaColor(255, 0, 0, 0.0)]
                                 ])
                  )
    .stepSet(@true)
    .dataSet(@[
        @[@0.1524, @0.948665],
        @[@0.1539, @35.510715],
        @[@0.154,  @39.883437],
        @[@0.1541, @40.499661],
        @[@0.1545, @43.262994000000006],
        @[@0.1547, @60.14799400000001],
        @[@0.1553, @60.30799400000001],
        @[@0.1558, @60.55018100000001],
        @[@0.1564, @68.381696],
        @[@0.1567, @69.46518400000001],
        @[@0.1569, @69.621464],
        @[@0.157,  @70.398015],
        @[@0.1574, @70.400197],
        @[@0.1575, @73.199217],
        @[@0.158,  @77.700017],
        @[@0.1583, @79.449017],
        @[@0.1588, @79.584064],
        @[@0.159,  @80.584064],
        @[@0.16,   @81.58156],
        @[@0.1608, @83.38156]
             ]);
    
    AASeriesElement *element2 = AASeriesElement.new
    .nameSet(@"Asks")
    .colorSet(@"#1E90FF")
    .fillColorSet((id)AAGradientColor.new
                  .directionSet(AALinearGradientDirectionToBottom)
                  .stopsArraySet(@[
                      @[@0.0, AARgbaColor(30, 144, 255, 1.0)],//颜色字符串设置支持十六进制类型和 rgba 类型
                      @[@0.6, AARgbaColor(30, 144, 255, 0.2)],
                      @[@1.0, AARgbaColor(30, 144, 255, 0.0)]
                                 ])
                  )
    .stepSet(@true)
    .dataSet(@[
        @[@0.1435, @242.521842],
        @[@0.1436, @206.49862099999999],
        @[@0.1437, @205.823735],
        @[@0.1438, @197.33275],
        @[@0.1439, @153.677454],
        @[@0.144,  @146.007722],
        @[@0.1442, @82.55212900000001],
        @[@0.1443, @59.152814000000006],
        @[@0.1444, @57.942260000000005],
        @[@0.1445, @57.483850000000004],
        @[@0.1446, @52.39210800000001],
        @[@0.1447, @51.867208000000005],
        @[@0.1448, @44.104697],
        @[@0.1449, @40.131217],
        @[@0.145,  @31.878217],
        @[@0.1451, @22.794916999999998],
        @[@0.1453, @12.345828999999998],
        @[@0.1454, @10.035642],
        @[@0.148,  @9.326642],
        @[@0.1522, @3.76317]
             ]);
    
    AAOptions *aaOptions = AAOptions.new
    .chartSet(aaChart)
    .titleSet(aaTitle)
    .subtitleSet(aaSubtitle)
    .xAxisSet(aaXAxis)
    .yAxisSet((id)@[yAxis1,yAxis2])
    .tooltipSet(aaTooltip)
    .legendSet(aaLegend)
    .plotOptionsSet(aaPlotOptions)
    .seriesSet(@[element1,element2])
    ;
    return aaOptions;
}

// Chart Sample Online:   https://jshare.com.cn/highcharts/hhhhG1
- (AAOptions *)customAreaChartTooltipStyleLikeHTMLTable {
    NSString *pointFormat = [NSString stringWithFormat:@"%@%@",
                             @" <tr><td style= \\\"color: {series.color} \\\">{series.name}: </td>",
                             @"<td style= \\\"text-align: right \\\"><b>{point.y * 10000000000} %EUR</b></td></tr>"];
    
    AAChartModel *aaChartModel = AAChartModel.new
    .chartTypeSet(AAChartTypeAreaspline)//图表类型
    .colorsThemeSet(@[@"#04d69f",@"#1e90ff",@"#ef476f",@"#ffd066",])
    .stackingSet(AAChartStackingTypeNormal)
    .yAxisVisibleSet(false)
    .markerRadiusSet(@0)
    .seriesSet(@[
        AASeriesElement.new
        .nameSet(@"TokyoHot")
        .lineWidthSet(@5.0)
        .fillOpacitySet(@0.4)
        .dataSet(@[@0.45, @0.43, @0.50, @0.55, @0.58, @0.62, @0.83, @0.39, @0.56, @0.67, @0.50, @0.34, @0.50, @0.67, @0.58, @0.29, @0.46, @0.23, @0.47, @0.46, @0.38, @0.56, @0.48, @0.36]),
        AASeriesElement.new
        .nameSet(@"BerlinHot")
        .lineWidthSet(@5.0)
        .fillOpacitySet(@0.4)
        .dataSet(@[@0.38, @0.31, @0.32, @0.32, @0.64, @0.66, @0.86, @0.47, @0.52, @0.75, @0.52, @0.56, @0.54, @0.60, @0.46, @0.63, @0.54, @0.51, @0.58, @0.64, @0.60, @0.45, @0.36, @0.67]),
        AASeriesElement.new
        .nameSet(@"LondonHot")
        .lineWidthSet(@5.0)
        .fillOpacitySet(@0.4)
        .dataSet(@[@0.46, @0.32, @0.53, @0.58, @0.86, @0.68, @0.85, @0.73, @0.69, @0.71, @0.91, @0.74, @0.60, @0.50, @0.39, @0.67, @0.55, @0.49, @0.65, @0.45, @0.64, @0.47, @0.63, @0.64]),
        AASeriesElement.new
        .nameSet(@"NewYorkHot")
        .lineWidthSet(@5.0)
        .fillOpacitySet(@0.4)
        .dataSet(@[@0.60, @0.51, @0.52, @0.53, @0.64, @0.84, @0.65, @0.68, @0.63, @0.47, @0.72, @0.60, @0.65, @0.74, @0.66, @0.65, @0.71, @0.59, @0.65, @0.77, @0.52, @0.53, @0.58, @0.53]),
               ]);
    
    AAOptions *aaOptions = aaChartModel.aa_toAAOptions;
    aaOptions.tooltip
    .sharedSet(true)
    .useHTMLSet(true)
    .headerFormatSet(@"<small>{point.key} 摄氏度</small><table>")
    .pointFormatSet(pointFormat)
    .footerFormatSet(@"</table>")
    .valueDecimalsSet(@2)
    ;
    return aaOptions;
}

// Refer to the issue https://github.com/AAChartModel/AAChartKit/issues/804
- (AAOptions *)customChartStyleWhenNoData {
    AAChartModel *aaChartModel = AAChartModel.new
    .chartTypeSet(AAChartTypeLine)//图表类型
    .subtitleSet(@"温度 (℃)")//图表副标题
    .subtitleFontSizeSet(@14)
    .subtitleFontColorSet(AAColor.grayColor)
    .subtitleAlignSet(AAChartAlignTypeLeft)
    .stackingSet(AAChartStackingTypeFalse)
    .categoriesSet(@[@"12.03", @"12.04", @"12.05", @"12.06", @"12.07", @"12.08", @"12.09",])
    .markerRadiusSet(@4)
    .markerSymbolSet(AAChartSymbolTypeCircle)
    .markerSymbolStyleSet(AAChartSymbolStyleTypeInnerBlank)
    .yAxisGridLineStyleSet([AALineStyle styleWithWidth:@0])
    .seriesSet(@[
        AASeriesElement.new
        .nameSet(@"智能设备记录")
        .dataSet(@[NSNull.null, NSNull.null, NSNull.null, NSNull.null, NSNull.null, NSNull.null, NSNull.null, ])
        ,
        AASeriesElement.new
        .nameSet(@"手工记录")
        .dataSet(@[NSNull.null, NSNull.null, NSNull.null, NSNull.null, NSNull.null, NSNull.null, NSNull.null, ])
        ,
               ]);
    
    AAOptions *aaOptions = aaChartModel.aa_toAAOptions;
    
    aaOptions.xAxis
    .tickWidthSet(@0); //隐藏 X轴刻度线
    
    aaOptions.yAxis
    .maxSet(@38)
    .minSet(@35)
    .tickPositionsSet(@[@35.00, @35.50, @36.00, @36.50, @37.00, @37.50, @38.00])//设置 Y 轴刻度值为一组指定值数组
    .labelsSet(AALabels.new
               .formatSet(@"{value:.2f}"))//设置Labels保留小数点后两位
    .plotLinesSet(@[
        AAPlotLinesElement.new //y 轴阈值标志线
        .colorSet(AAColor.lightGrayColor)
        .dashStyleSet(AAChartLineDashStyleTypeDash)
        .valueSet(@36.75)
        .labelSet(AALabel.new
                  .textSet(@"高温")
                  .alignSet(AAChartAlignTypeRight)
                  .xSet(@-20)
                  .styleSet(AAStyle.new
                            .colorSet(AAColor.redColor)
                            .fontSizeSet(@"14px")))
                  ]);
    
    aaOptions.legend
    .floatingSet(true)
    .verticalAlignSet(AAChartVerticalAlignTypeTop)
    .alignSet(AAChartAlignTypeRight)
    .layoutSet(AAChartLayoutTypeVertical)
    .itemStyleSet(AAItemStyle.new
                  .fontSizeSet(@"14px")
                  .fontWeightSet(AAChartFontWeightTypeThin)
                  .colorSet(AAColor.grayColor))
    ;
    
    return aaOptions;
}

// Refer to the issue https://github.com/AAChartModel/AAChartKit/issues/773
- (AAOptions *)customChartStyleWhenEveryDataValueIsZero {
    AAChartModel *aaChartModel = AAChartModel.new
    .chartTypeSet(AAChartTypeAreaspline)
    .titleSet(@"Custom Chart Style When Every Data Value Is 0")
    .categoriesSet(@[
        @"Java", @"Swift", @"Python", @"Ruby", @"PHP", @"Go",@"C",
        @"C#", @"C++", @"Perl", @"R", @"SQL"])
    .yAxisTitleSet(@"摄氏度 (℃)")
    .seriesSet(@[
        AASeriesElement.new
        .nameSet(@"Tokyo Hot")
        .dataSet(@[@0, @0, @0, @0, @0, @0, @0, @0, @0, @0, @0, @0, ]),
               ]);
    
    AAOptions *aaOptions = aaChartModel.aa_toAAOptions;
    
    aaOptions.yAxis
    .minSet(@0)
    .minRangeSet(@1);
    
    return aaOptions;
}

// Refer to the issue https://github.com/AAChartModel/AAChartKit/issues/624
- (AAOptions *)disableSpineChartHoverAnimationEffect {
    AAChartModel *aaChartModel = AAChartModel.new
    .chartTypeSet(AAChartTypeSpline)//图表类型
    .titleSet(@"Disable Line Chart Hover Animation Effect")//图表主标题
    .yAxisVisibleSet(false)
    .dataLabelsEnabledSet(true)
    .markerSymbolStyleSet(AAChartSymbolStyleTypeBorderBlank)
    .seriesSet(@[
        AASeriesElement.new
        .nameSet(@"2017")
        .dataSet(@[@7.0, @6.9, @9.5, @14.5, @18.2, @21.5, @25.2, @26.5, @23.3, @18.3, @13.9, @9.6]),
        AASeriesElement.new
        .nameSet(@"2018")
        .enableMouseTrackingSet(@false)
        .dataSet(@[@0.2, @0.8, @5.7, @11.3, @17.0, @22.0, @24.8, @24.1, @20.1, @14.1, @8.6, @2.5]),
        AASeriesElement.new
        .nameSet(@"2019")
        .enableMouseTrackingSet(@false)
        .dataSet(@[@0.9, @0.6, @3.5, @8.4, @13.5, @17.0, @18.6, @17.9, @14.3, @9.0, @3.9, @1.0]),
        AASeriesElement.new
        .nameSet(@"2020")
        .enableMouseTrackingSet(@false)
        .dataSet(@[@3.9, @4.2, @5.7, @8.5, @11.9, @15.2, @17.0, @16.6, @14.2, @10.3, @6.6, @4.8]),
               ]);
    
    AAOptions *aaOptions = aaChartModel.aa_toAAOptions;
    
    aaOptions.plotOptions
    .splineSet(AASpline.new
               .statesSet(AAStates.new
                          .hoverSet(AAHover.new
                                    .lineWidthPlusSet(@0))))
    ;
    return aaOptions;
}

- (AAOptions *)configurePieChartFormatProperty {
    AAChartModel *chartModel = AAChartModel.new
    .chartTypeSet(AAChartTypePie)
    .colorsThemeSet(@[
        @"#0c9674",@"#7dffc0",@"#ff3333",@"#facd32",@"#ffffa0",
        @"#EA007B",@"#fe117c",@"#ffc069",@"#06caf4",@"#7dffc0"
                    ])
    .dataLabelsEnabledSet(true)//是否直接显示扇形图数据
    .yAxisTitleSet(@"摄氏度")
    .seriesSet(@[
        AASeriesElement.new
        .nameSet(@"语言热度值")
        .innerSizeSet(@"20%")//内部圆环半径大小占比
        .borderWidthSet(@0)//描边的宽度
        .allowPointSelectSet(true)//是否允许在点击数据点标记(扇形图点击选中的块发生位移)
        .statesSet(AAStates.new
                   .hoverSet(AAHover.new
                             .enabledSet(false)//禁用点击区块之后出现的半透明遮罩层
                             ))
        .dataSet(@[
            @[@"Firefox",   @3336.2],
            @[@"IE",          @26.8],
            @{@"sliced": @true,
              @"selected": @true,
              @"name": @"Chrome",
              @"y": @666.8,        },
            @[@"Safari",      @88.5],
            @[@"Opera",       @46.0],
            @[@"Others",     @223.0],
            @[@"Firefox",   @3336.2],
            @[@"IE",          @26.8],
            @{@"sliced": @true,
              @"selected": @true,
              @"name": @"Chrome",
              @"y": @666.8,        },
            @[@"Safari",      @88.5],
            @[@"Opera",       @46.0],
            @[@"Others",     @223.0],
                 ])])
    ;
    
    AAOptions *aaOptions = chartModel.aa_toAAOptions;
    aaOptions.chart
    .marginLeftSet(@120)
    .marginRightSet(@120)
    ;
    
    aaOptions.plotOptions.series.dataLabels
    .allowOverlapSet(true)//允许字符重叠
    .formatSet(@"<b>{point.name}</b>: {point.percentage:.2f} %") //保留二位小数
    ;
    
    return aaOptions;
}

- (AAOptions *)customXAxisLabelsBeImages {
    NSArray *imageLinkStrArr = @[
        @"<span><img src=\\\"https:/image.flaticon.com/icons/svg/197/197582.svg\\\" style=\\\"width: 30px; height: 30px;\\\"/><br></span>",
        @"<span><img src=\\\"https:/image.flaticon.com/icons/svg/197/197604.svg\\\" style=\\\"width: 30px; height: 30px;\\\"/><br></span>",
        @"<span><img src=\\\"https:/image.flaticon.com/icons/svg/197/197507.svg\\\" style=\\\"width: 30px; height: 30px;\\\"/><br></span>",
        @"<span><img src=\\\"https:/image.flaticon.com/icons/svg/197/197571.svg\\\" style=\\\"width: 30px; height: 30px;\\\"/><br></span>",
        @"<span><img src=\\\"https:/image.flaticon.com/icons/svg/197/197408.svg\\\" style=\\\"width: 30px; height: 30px;\\\"/><br></span>",
        @"<span><img src=\\\"https:/image.flaticon.com/icons/svg/197/197375.svg\\\" style=\\\"width: 30px; height: 30px;\\\"/><br></span>",
        @"<span><img src=\\\"https:/image.flaticon.com/icons/svg/197/197374.svg\\\" style=\\\"width: 30px; height: 30px;\\\"/><br></span>",
        @"<span><img src=\\\"https:/image.flaticon.com/icons/svg/197/197484.svg\\\" style=\\\"width: 30px; height: 30px;\\\"/><br></span>"
    ];
    
    AAChartModel *aaChartModel = AAChartModel.new
    .chartTypeSet(AAChartTypeAreaspline)
    .stackingSet(AAChartStackingTypeNormal)
    .yAxisVisibleSet(false)
    .categoriesSet(imageLinkStrArr)
    .markerRadiusSet(@0)
    .seriesSet(@[
        AASeriesElement.new
        .nameSet(@"Berlin Hot")
        .colorSet((id)[AAGradientColor deepSeaColor])
        .dataSet(@[@7.0, @6.9, @2.5, @14.5, @13.2, @18.2, @29.5, @21.5, ]),
               ]);
    
    AAOptions *aaOptions = aaChartModel.aa_toAAOptions;
    aaOptions.xAxis.labels.useHTML = true;
    return aaOptions;
}

//三角形雷达图
- (AAOptions *)configureTriangleRadarChart {
    AALineStyle *gridLineStyle = [AALineStyle styleWithWidth:@1];
    
    AACrosshair *crosshairStyle =
    [AACrosshair crosshairWithColor:AAColor.whiteColor
                      dashStyle:AAChartLineDashStyleTypeLongDashDotDot
                          width:@1.5];
    
    AAChartModel *aaChartModel = AAChartModel.new
    .chartTypeSet(AAChartTypeArea)
    .backgroundColorSet(AAColor.whiteColor)
    .markerRadiusSet(@0)
    .yAxisMaxSet(@25)
    .yAxisGridLineStyleSet([AALineStyle styleWithWidth:@1])
    .polarSet(true)
    .legendEnabledSet(false)
    .tooltipEnabledSet(false)
    .xAxisGridLineStyleSet(gridLineStyle)
    .yAxisGridLineStyleSet(gridLineStyle)
    .xAxisCrosshairSet(crosshairStyle)
    .yAxisCrosshairSet(crosshairStyle)
    .yAxisTickPositionsSet(@[@5,@10,@15,@20,@25,])
    .seriesSet(@[
        AASeriesElement.new
        .colorSet(AAColor.whiteColor)
        .fillOpacitySet(@0.01)
        .dataLabelsSet(AADataLabels.new
                       .colorSet(AARgbaColor(30, 144, 255, 1.0)))
        .dataSet(@[@17.0, @16.9, @12.5,]),
               ]);
    
    AAOptions *aaOptions = aaChartModel.aa_toAAOptions;
    aaOptions.yAxis.gridLineInterpolation = AAYAxisGridLineInterpolationPolygon;
    
    aaOptions.xAxis.lineWidth = @0;//避免多边形外环之外有额外套了一层无用的外环
    aaOptions.xAxis.gridLineColor = AARgbaColor(30, 144, 255, 0.6);
    aaOptions.yAxis.gridLineColor = AARgbaColor(30, 144, 255, 1.0);
    
    NSArray *aaPlotBandsArr = @[
        AAPlotBandsElement.new
        .fromSet(@0)
        .toSet(@5)
        .colorSet(AARgbaColor(30, 144, 255, 1.0)),
        AAPlotBandsElement.new
        .fromSet(@5)
        .toSet(@10)
        .colorSet(AARgbaColor(30, 144, 255, 0.8)),
        AAPlotBandsElement.new
        .fromSet(@10)
        .toSet(@15)
        .colorSet(AARgbaColor(30, 144, 255, 0.6)),
        AAPlotBandsElement.new
        .fromSet(@15)
        .toSet(@20)
        .colorSet(AARgbaColor(30, 144, 255, 0.4)),
        AAPlotBandsElement.new
        .fromSet(@20)
        .toSet(@25)
        .colorSet(AARgbaColor(30, 144, 255, 0.2)),
    ];
    
    AAYAxis *aaYAxis = aaOptions.yAxis;
    aaYAxis.plotBands = aaPlotBandsArr;
    return aaOptions;
}

//四边形雷达图
- (AAOptions *)configureQuadrangleRadarChart {
    AAOptions *aaOptions = [self configureTriangleRadarChart];
    aaOptions.yAxis.plotBands = @[
        AAPlotBandsElement.new
        .fromSet(@0)
        .toSet(@5)
        .colorSet(AARgbaColor(255, 0, 0, 1.0)),
        AAPlotBandsElement.new
        .fromSet(@5)
        .toSet(@10)
        .colorSet(AARgbaColor(255, 0, 0, 0.8)),
        AAPlotBandsElement.new
        .fromSet(@10)
        .toSet(@15)
        .colorSet(AARgbaColor(255, 0, 0, 0.6)),
        AAPlotBandsElement.new
        .fromSet(@15)
        .toSet(@20)
        .colorSet(AARgbaColor(255, 0, 0, 0.4)),
        AAPlotBandsElement.new
        .fromSet(@20)
        .toSet(@25)
        .colorSet(AARgbaColor(255, 0, 0, 0.2)),
        
    ];
    
    aaOptions.xAxis.gridLineColor = AARgbaColor(255, 0, 0, 0.6);
    aaOptions.yAxis.gridLineColor = AARgbaColor(255, 0, 0, 1.0);
    
    AASeriesElement *element = aaOptions.series[0];
    element
    .dataSet(@[@17.0, @16.9, @12.5, @14.5,])
    .dataLabelsSet(AADataLabels.new
                   .colorSet(AARgbaColor(255, 0, 0, 1.0)))
    ;
    
    return aaOptions;
}

//五边形雷达图
- (AAOptions *)configurePentagonRadarChart {
    AAOptions *aaOptions = [self configureTriangleRadarChart];
    aaOptions.yAxis.plotBands = @[
        AAPlotBandsElement.new
        .fromSet(@0)
        .toSet(@5)
        .colorSet(AARgbaColor(255, 215, 0, 1.0)),
        AAPlotBandsElement.new
        .fromSet(@5)
        .toSet(@10)
        .colorSet(AARgbaColor(255, 215, 0, 0.8)),
        AAPlotBandsElement.new
        .fromSet(@10)
        .toSet(@15)
        .colorSet(AARgbaColor(255, 215, 0, 0.6)),
        AAPlotBandsElement.new
        .fromSet(@15)
        .toSet(@20)
        .colorSet(AARgbaColor(255, 215, 0, 0.4)),
        AAPlotBandsElement.new
        .fromSet(@20)
        .toSet(@25)
        .colorSet(AARgbaColor(255, 215, 0, 0.2)),
        
    ];
    
    aaOptions.xAxis.gridLineColor = AARgbaColor(255, 215, 0, 0.6);
    aaOptions.yAxis.gridLineColor = AARgbaColor(255, 215, 0, 1.0);
    
    AASeriesElement *element = aaOptions.series[0];
    element
    .dataSet(@[@17.0, @16.9, @12.5, @14.5, @18.2,])
    .dataLabelsSet(AADataLabels.new
                   .colorSet(AARgbaColor(255, 215, 0, 1.0)))
    ;
    
    return aaOptions;
}

//六边形雷达图
- (AAOptions *)configureHexagonRadarChart {
    AAOptions *aaOptions = [self configureTriangleRadarChart];
    aaOptions.yAxis.plotBands = @[
        AAPlotBandsElement.new
        .fromSet(@0)
        .toSet(@5)
        .colorSet(AARgbaColor(50, 205, 50, 1.0)),
        AAPlotBandsElement.new
        .fromSet(@5)
        .toSet(@10)
        .colorSet(AARgbaColor(50, 205, 50, 0.8)),
        AAPlotBandsElement.new
        .fromSet(@10)
        .toSet(@15)
        .colorSet(AARgbaColor(50, 205, 50, 0.6)),
        AAPlotBandsElement.new
        .fromSet(@15)
        .toSet(@20)
        .colorSet(AARgbaColor(50, 205, 50, 0.4)),
        AAPlotBandsElement.new
        .fromSet(@20)
        .toSet(@25)
        .colorSet(AARgbaColor(50, 205, 50, 0.2)),
        
    ];
    
    aaOptions.xAxis.gridLineColor = AARgbaColor(50, 205, 50, 0.6);
    aaOptions.yAxis.gridLineColor = AARgbaColor(50, 205, 50, 1.0);
    
    AASeriesElement *element = aaOptions.series[0];
    element
    .dataSet(@[@17.0, @16.9, @12.5, @14.5, @18.2, @21.5,])
    .dataLabelsSet(AADataLabels.new
                   .colorSet(AARgbaColor(50, 205, 50, 1.0)))
    ;
    
    return aaOptions;
}

//🕸蜘蛛网状雷达图
- (AAOptions *)configureSpiderWebRadarChart {
    AAOptions *aaOptions = [self configureTriangleRadarChart];
    aaOptions.yAxis.plotBands = @[
        AAPlotBandsElement.new
        .fromSet(@0)
        .toSet(@5)
        .colorSet(AARgbaColor(138, 43, 226, 1.0)),
        AAPlotBandsElement.new
        .fromSet(@5)
        .toSet(@10)
        .colorSet(AARgbaColor(138, 43, 226, 0.8)),
        AAPlotBandsElement.new
        .fromSet(@10)
        .toSet(@15)
        .colorSet(AARgbaColor(138, 43, 226, 0.6)),
        AAPlotBandsElement.new
        .fromSet(@15)
        .toSet(@20)
        .colorSet(AARgbaColor(138, 43, 226, 0.4)),
        AAPlotBandsElement.new
        .fromSet(@20)
        .toSet(@25)
        .colorSet(AARgbaColor(138, 43, 226, 0.2)),
    ];
    
    aaOptions.xAxis.gridLineColor = AARgbaColor(138, 43, 226, 0.6);
    aaOptions.yAxis.gridLineColor = AARgbaColor(138, 43, 226, 1.0);
    
    AASeriesElement *element = aaOptions.series[0];
    element
    .dataSet(@[@2, @4, @6, @8, @10, @12, @14, @16, @18, @20, @22, @24])
    .dataLabelsSet(AADataLabels.new
                   .colorSet(AARgbaColor(138, 43, 226, 1.0)))
    ;
    
    return aaOptions;
}

- (AAOptions *)configureComplicatedCustomAreasplineChart {
    AAChart *aaChart = AAChart.new
    .typeSet(AAChartTypeAreaspline)
    .backgroundColorSet(AAColor.blackColor);
    
    AATitle *aaTitle = AATitle.new
    .textSet((id)NSNull.null);
    
    AAXAxis *aaXAxis = AAXAxis.new
    .categoriesSet(@[
        @"一月", @"二月", @"三月", @"四月", @"五月", @"六月",
        @"七月", @"八月", @"九月", @"十月", @"十一月", @"十二月"
                   ])
    .tickWidthSet(@0)//X轴刻度线宽度
    .lineWidthSet(@1.5)//X轴轴线宽度
    .lineColorSet(AAColor.whiteColor)//X轴轴线颜色
    .gridLineColorSet(AAColor.whiteColor)
    .gridLineWidthSet(@0.5)//X轴网格线宽度
    .gridLineDashStyleSet(AAChartLineDashStyleTypeDash)
    .labelsSet(AALabels.new
               .styleSet(AAStyle.new
                         .colorSet(AAColor.whiteColor))//X轴文字颜色
               );
    
    AAYAxis *aaYAXis = AAYAxis.new
    .titleSet(AAAxisTitle.new
              .textSet((id)NSNull.null))
    .tickPositionsSet(@[@0, @20, @40, @60, @80, @100])
    .lineWidthSet(@1.5)//Y轴轴线颜色
    .lineColorSet(AAColor.whiteColor)//Y轴轴线颜色
    .gridLineWidthSet(@0)//Y轴网格线宽度
    .gridLineDashStyleSet(AAChartLineDashStyleTypeDash)
    .labelsSet(AALabels.new
               .formatSet(@"{value} %")//给y轴添加单位
               .styleSet(AAStyle.new
                         .colorSet(AAColor.whiteColor))//Y轴文字颜色
               );
    
    
    AAPlotOptions *aaPlotOptions = AAPlotOptions.new
    .seriesSet(AASeries.new
               .markerSet(AAMarker.new
                          .symbolSet(AAChartSymbolTypeCircle)
                          .radiusSet(@0)));
    
    AALegend *aaLegend = AALegend.new
    .enabledSet(true)
    .itemStyleSet(AAItemStyle.new
                  .colorSet(AAColor.whiteColor))
    .alignSet(AAChartAlignTypeLeft)//设置图例位于水平方向上的右侧
    .layoutSet(AAChartLayoutTypeHorizontal)//设置图例排列方式为垂直排布
    .verticalAlignSet(AAChartVerticalAlignTypeTop)//设置图例位于竖直方向上的顶部
    ;
    
    NSArray *blueStopsArr = @[
        @[@0.0, AARgbaColor(30, 144, 255, 1.0)],//颜色字符串设置支持十六进制类型和 rgba 类型
        @[@0.6, AARgbaColor(30, 144, 255, 0.2)],
        @[@1.0, AARgbaColor(30, 144, 255, 0.0)]
    ];
    NSDictionary *gradientBlueColorDic =
    [AAGradientColor gradientColorWithDirection:AALinearGradientDirectionToBottom
                                     stopsArray:blueStopsArr];
    
    
    NSArray *redStopsArr = @[
        @[@0.0, AARgbaColor(255, 0, 0, 1.0)],//颜色字符串设置支持十六进制类型和 rgba 类型
        @[@0.6, AARgbaColor(255, 0, 0, 0.2)],
        @[@1.0, AARgbaColor(255, 0, 0, 0.0)]
    ];
    NSDictionary *gradientRedColorDic =
    [AAGradientColor gradientColorWithDirection:AALinearGradientDirectionToBottom
                                     stopsArray:redStopsArr];
    
    
    AADataElement *singleSpecialData1 = AADataElement.new
    .markerSet(AAMarker.new
               .radiusSet(@8)//曲线连接点半径
               .symbolSet(AAChartSymbolTypeCircle)//曲线点类型："circle", "square", "diamond", "triangle","triangle-down"，默认是"circle"
               .fillColorSet(@"#FFFFFF")//点的填充色(用来设置折线连接点的填充色)
               .lineWidthSet(@5)//外沿线的宽度(用来设置折线连接点的轮廓描边的宽度)
               //外沿线的颜色(用来设置折线连接点的轮廓描边颜色，当值为空字符串时，默认取数据点或数据列的颜色)
               .lineColorSet(@"#1e90ff")
               )
    .dataLabelsSet(AADataLabels.new
                   .enabledSet(true)
                   .useHTMLSet(true)
                   .backgroundColorSet(@"#1e90ff")
                   .borderRadiusSet(@5)
                   .shapeSet(@"callout")
                   .formatSet(@"{point.category}<br>{series.name}: {point.y} %")
                   .styleSet(AAStyle.new
                             .fontWeightSet(AAChartFontWeightTypeBold)
                             .colorSet(AAColor.whiteColor)
                             .fontSizeSet(@"16px")
                             .fontWeightSet(AAChartFontWeightTypeThin))
                   .ySet(@(-75))
                   .alignSet(AAChartAlignTypeCenter)
                   .verticalAlignSet(AAChartVerticalAlignTypeTop)
                   .overflowSet(@"none")
                   .cropSet(false)
                   )
    .ySet(@51.5);
    
    AADataElement *singleSpecialData2 = AADataElement.new
    .markerSet(AAMarker.new
               .radiusSet(@8)//曲线连接点半径
               .symbolSet(AAChartSymbolTypeCircle)//曲线点类型："circle", "square", "diamond", "triangle","triangle-down"，默认是"circle"
               .fillColorSet(@"#FFFFFF")//点的填充色(用来设置折线连接点的填充色)
               .lineWidthSet(@5)//外沿线的宽度(用来设置折线连接点的轮廓描边的宽度)
               //外沿线的颜色(用来设置折线连接点的轮廓描边颜色，当值为空字符串时，默认取数据点或数据列的颜色)
               .lineColorSet(@"#ef476f")
               )
    .dataLabelsSet(AADataLabels.new
                   .enabledSet(true)
                   .useHTMLSet(true)
                   .backgroundColorSet(AAColor.redColor)
                   .borderRadiusSet(@5)
                   .shapeSet(@"callout")
                   .formatSet(@"{point.category}<br>{series.name}: {point.y} %")
                   .styleSet(AAStyle.new
                             .fontWeightSet(AAChartFontWeightTypeBold)
                             .colorSet(AAColor.whiteColor)
                             .fontSizeSet(@"16px")
                             .fontWeightSet(AAChartFontWeightTypeThin))
                   .ySet(@(-75))
                   .alignSet(AAChartAlignTypeCenter)
                   .verticalAlignSet(AAChartVerticalAlignTypeTop)
                   .overflowSet(@"none")
                   .cropSet(false)
                   )
    .ySet(@26.5);
    
    NSArray *aaSeriesArr = @[
        AASeriesElement.new
        .nameSet(@"空气湿度")
        .fillColorSet((id)gradientBlueColorDic)
        .lineWidthSet(@6)
        .dataSet(@[@17.0, @16.9, @8.5, @34.5, @28.2, singleSpecialData1, @15.2, @56.5, @33.3, @85.3, @23.9, @29.6]),
        AASeriesElement.new
        .nameSet(@"土壤湿度")
        .fillColorSet((id)gradientRedColorDic)
        .lineWidthSet(@6)
        .dataSet(@[@7.0, @6.9, @2.5, @14.5, @18.2, singleSpecialData2, @5.2, @26.5, @23.3, @45.3, @13.9, @9.6]),
    ];
    
    AAOptions *aaOptions = AAOptions.new
    .chartSet(aaChart)
    .titleSet(aaTitle)
    .colorsSet(@[@"#1e90ff",AAColor.redColor,])
    .xAxisSet(aaXAxis)
    .yAxisSet(aaYAXis)
    .plotOptionsSet(aaPlotOptions)
    .legendSet(aaLegend)
    .seriesSet(aaSeriesArr)
    ;
    
    return aaOptions;
}

- (AAOptions *)configureComplicatedCustomAreasplineChart2 {
    AAOptions *aaOptions = [self configureComplicatedCustomAreasplineChart];
    
    aaOptions.chart.backgroundColor = (id)AAGradientColor.new
    .directionSet(AALinearGradientDirectionToTop)
    .startColorSet(AARgbaColor(113, 180, 185, 1.0))
    .endColorSet(AARgbaColor(115, 183, 166, 1.0));
    
    aaOptions.colors = @[
        AARgbaColor(204, 150, 103, 1.0),
        AARgbaColor(154, 243, 247, 1.0),
    ];

    aaOptions.tooltip = AATooltip.new
    .sharedSet(true)
    .backgroundColorSet(AAColor.whiteColor)
    .valueSuffixSet(@" %");
    
    AAStyle *aaDataLabelsStyle = AAStyle.new
    .fontWeightSet(AAChartFontWeightTypeBold)
    .colorSet(AAColor.whiteColor)
    .fontSizeSet(@"16px")
    .fontWeightSet(AAChartFontWeightTypeThin);
    
    AADataElement *singleSpecialData1 = AADataElement.new
    .markerSet(AAMarker.new
               .radiusSet(@8)//曲线连接点半径
               .symbolSet(AAChartSymbolTypeCircle)//曲线点类型："circle", "square", "diamond", "triangle","triangle-down"，默认是"circle"
               .fillColorSet(@"#FFFFFF")//点的填充色(用来设置折线连接点的填充色)
               .lineWidthSet(@5)//外沿线的宽度(用来设置折线连接点的轮廓描边的宽度)
               //外沿线的颜色(用来设置折线连接点的轮廓描边颜色，当值为空字符串时，默认取数据点或数据列的颜色)
               .lineColorSet(AARgbaColor(204, 150, 103, 1.0))
               )
    .dataLabelsSet(AADataLabels.new
                   .enabledSet(true)
                   .allowOverlapSet(true)
                   .useHTMLSet(true)
                   .backgroundColorSet(AARgbaColor(219, 148, 111, 1.0))
                   .borderRadiusSet(@10)
                   .shapeSet(@"callout")
                   .formatSet(@"{point.category}<br>{series.name}: {point.y} %")
                   .styleSet(aaDataLabelsStyle)
                   .ySet(@(-75))
                   .alignSet(AAChartAlignTypeCenter)
                   .verticalAlignSet(AAChartVerticalAlignTypeTop)
                   .overflowSet(@"none")
                   .cropSet(false)
                   )
    .ySet(@51.5);
    
    AADataElement *singleSpecialData2 = AADataElement.new
    .markerSet(AAMarker.new
               .radiusSet(@8)//曲线连接点半径
               .symbolSet(AAChartSymbolTypeCircle)//曲线点类型："circle", "square", "diamond", "triangle","triangle-down"，默认是"circle"
               .fillColorSet(@"#FFFFFF")//点的填充色(用来设置折线连接点的填充色)
               .lineWidthSet(@5)//外沿线的宽度(用来设置折线连接点的轮廓描边的宽度)
               //外沿线的颜色(用来设置折线连接点的轮廓描边颜色，当值为空字符串时，默认取数据点或数据列的颜色)
               .lineColorSet(AARgbaColor(154, 243, 247, 1.0))
               )
    .dataLabelsSet(AADataLabels.new
                   .enabledSet(true)
                   .allowOverlapSet(true)
                   .useHTMLSet(true)
                   .backgroundColorSet(AARgbaColor(65, 111, 166, 1.0))
                   .borderRadiusSet(@10)
                   .shapeSet(@"callout")
                   .formatSet(@"{point.category}<br>{series.name}: {point.y} %")
                   .styleSet(aaDataLabelsStyle)
                   .ySet(@(-75))
                   .alignSet(AAChartAlignTypeCenter)
                   .verticalAlignSet(AAChartVerticalAlignTypeTop)
                   .overflowSet(@"none")
                   .cropSet(false)
                   )
    .ySet(@26.5);
    
    NSArray *aaSeriesArr = @[
        AASeriesElement.new
        .nameSet(@"空气湿度")
        .lineWidthSet(@3)
        .zoneAxisSet(@"x")
        .zonesSet(@[
            AAZonesElement.new
            .valueSet(@5)
            .fillColorSet((id)AAGradientColor.new
                          .directionSet(AALinearGradientDirectionToTop)
                          .stopsArraySet(@[
                              @[@0.0, AAColor.clearColor],//颜色字符串设置支持十六进制类型和 rgba 类型
                              @[@0.6, AARgbaColor(219, 148, 111, 0.6)],
                              @[@1.0, AARgbaColor(219, 148, 111, 1.0)]
                                         ])),
            AAZonesElement.new
            .fillColorSet(AAColor.clearColor),
                  ])
        .dataSet(@[@17.0, @16.9, @8.5, @34.5, @28.2, singleSpecialData1, @15.2, @56.5, @33.3, @85.3, @23.9, @29.6]),
        
        AASeriesElement.new
        .nameSet(@"土壤湿度")
        .lineWidthSet(@3)
        .zoneAxisSet(@"x")
        .zonesSet(@[
            AAZonesElement.new
            .valueSet(@5)
            .fillColorSet((id)AAGradientColor.new
                          .directionSet(AALinearGradientDirectionToTop)
                          .stopsArraySet(@[
                              @[@0.0, AAColor.clearColor],//颜色字符串设置支持十六进制类型和 rgba 类型
                              @[@0.6, AARgbaColor(65, 111, 166, 0.6)],
                              @[@1.0, AARgbaColor(65, 111, 166, 1.0)]
                                         ])),
            AAZonesElement.new
            .fillColorSet(AAColor.clearColor),
                  ])
        .dataSet(@[@7.0, @6.9, @2.5, @14.5, @18.2, singleSpecialData2, @5.2, @26.5, @23.3, @45.3, @13.9, @9.6]),
    ];

    aaOptions.series = aaSeriesArr;
    
    return aaOptions;
}

- (AAOptions *)configureComplicatedCustomAreasplineChart3 {
    AAStyle *aaDataLabelsStyle = AAStyle.new
    .fontWeightSet(AAChartFontWeightTypeBold)
    .colorSet(AAColor.whiteColor)
    .fontSizeSet(@"16px")
    .fontWeightSet(AAChartFontWeightTypeThin);
    
    AADataElement *singleSpecialData1 = AADataElement.new
    .markerSet(AAMarker.new
               .radiusSet(@8)//曲线连接点半径
               .symbolSet(AAChartSymbolTypeCircle)//曲线点类型："circle", "square", "diamond", "triangle","triangle-down"，默认是"circle"
               .fillColorSet(@"#FFFFFF")//点的填充色(用来设置折线连接点的填充色)
               .lineWidthSet(@5)//外沿线的宽度(用来设置折线连接点的轮廓描边的宽度)
               //外沿线的颜色(用来设置折线连接点的轮廓描边颜色，当值为空字符串时，默认取数据点或数据列的颜色)
               .lineColorSet(AARgbaColor(204, 150, 103, 1.0))
               )
    .dataLabelsSet(AADataLabels.new
                   .enabledSet(true)
                   .allowOverlapSet(true)
                   .useHTMLSet(true)
                   .backgroundColorSet(AARgbaColor(219, 148, 111, 1.0))
                   .borderRadiusSet(@10)
                   .shapeSet(@"callout")
                   .formatSet(@"{point.category}<br>{series.name}: {point.y} %")
                   .styleSet(aaDataLabelsStyle)
                   .ySet(@(-75))
                   .alignSet(AAChartAlignTypeCenter)
                   .verticalAlignSet(AAChartVerticalAlignTypeTop)
                   .overflowSet(@"none")
                   .cropSet(false)
                   )
    .ySet(@34.5);
    
    AADataElement *singleSpecialData2 = AADataElement.new
    .markerSet(AAMarker.new
               .radiusSet(@8)//曲线连接点半径
               .symbolSet(AAChartSymbolTypeCircle)//曲线点类型："circle", "square", "diamond", "triangle","triangle-down"，默认是"circle"
               .fillColorSet(@"#FFFFFF")//点的填充色(用来设置折线连接点的填充色)
               .lineWidthSet(@5)//外沿线的宽度(用来设置折线连接点的轮廓描边的宽度)
               //外沿线的颜色(用来设置折线连接点的轮廓描边颜色，当值为空字符串时，默认取数据点或数据列的颜色)
               .lineColorSet(AARgbaColor(154, 243, 247, 1.0))
               )
    .dataLabelsSet(AADataLabels.new
                   .enabledSet(true)
                   .allowOverlapSet(true)
                   .useHTMLSet(true)
                   .backgroundColorSet(AARgbaColor(65, 111, 166, 1.0))
                   .borderRadiusSet(@10)
                   .shapeSet(@"callout")
                   .formatSet(@"{point.category}<br>{series.name}: {point.y} %")
                   .styleSet(aaDataLabelsStyle)
                   .ySet(@(-75))
                   .alignSet(AAChartAlignTypeCenter)
                   .verticalAlignSet(AAChartVerticalAlignTypeTop)
                   .overflowSet(@"none")
                   .cropSet(false)
                   )
    .ySet(@14.5);
    
    NSArray *aaSeriesArr = @[
        AASeriesElement.new
        .nameSet(@"空气湿度")
        .lineWidthSet(@3)
        .zoneAxisSet(@"x")
        .zonesSet(@[
            AAZonesElement.new
            .valueSet(@3)
            .fillColorSet(AAColor.clearColor),
            AAZonesElement.new
            .fillColorSet((id)AAGradientColor.new
                          .directionSet(AALinearGradientDirectionToTop)
                          .stopsArraySet(@[
                              @[@0.0, AAColor.clearColor],//颜色字符串设置支持十六进制类型和 rgba 类型
                              @[@0.6, AARgbaColor(219, 148, 111, 0.6)],
                              @[@1.0, AARgbaColor(219, 148, 111, 1.0)]
                                         ])),
                  ])
        .dataSet(@[@17.0, @16.9, @8.5, singleSpecialData1, @28.2, @51.5, @15.2, @56.5, @33.3, @85.3, @23.9, @29.6]),
        
        AASeriesElement.new
        .nameSet(@"土壤湿度")
        .lineWidthSet(@3)
        .zoneAxisSet(@"x")
        .zonesSet(@[
            AAZonesElement.new
            .valueSet(@3)
            .fillColorSet(AAColor.clearColor),
            AAZonesElement.new
            .fillColorSet((id)AAGradientColor.new
                          .directionSet(AALinearGradientDirectionToTop)
                          .stopsArraySet(@[
                              @[@0.0, AAColor.clearColor],//颜色字符串设置支持十六进制类型和 rgba 类型
                              @[@0.6, AARgbaColor(65, 111, 166, 0.6)],
                              @[@1.0, AARgbaColor(65, 111, 166, 1.0)]
                                         ])),
                  ])
        .dataSet(@[@7.0, @6.9, @2.5, singleSpecialData2, @18.2, @26.5, @5.2, @26.5, @23.3, @45.3, @13.9, @9.6]),
    ];
    
    AAOptions *aaOptions = [self configureComplicatedCustomAreasplineChart2];

    aaOptions.series = aaSeriesArr;
    
    return aaOptions;
}

//https://github.com/AAChartModel/AAChartKit/issues/981
- (AAOptions *)doubleLayerHalfPieChart {
    AAChartModel *aaChartModel = AAChartModel.new
    .chartTypeSet(AAChartTypePie)
    .titleSet(@"浏览器市场占比历史对比")
    .subtitleSet(@"无任何可靠依据的虚拟数据")
    .dataLabelsEnabledSet(false)//是否直接显示扇形图数据
    .yAxisTitleSet(@"摄氏度")
    .seriesSet(@[
        AASeriesElement.new
        .nameSet(@"Past")
        .sizeSet((id)@"25%")//尺寸大小
        .innerSizeSet(@"20%")//内部圆环半径大小占比
        .borderWidthSet(@0)//描边的宽度
        .allowPointSelectSet(false)//是否允许在点击数据点标记(扇形图点击选中的块发生位移)
        .dataSet(@[
            @[@"Firefox Past",   @3336.2],
            @[@"Chrome Past",      @26.8],
            @[@"Safari Past",      @88.5],
            @[@"Opera Past",       @46.0],
            @[@"Others Past",     @223.0],
                 ]),
        
        AASeriesElement.new
        .nameSet(@"Now")
        .sizeSet((id)@"80%")//尺寸大小
        .innerSizeSet(@"45%")//内部圆环半径大小占比
        .borderWidthSet(@0)//描边的宽度
        .allowPointSelectSet(false)//是否允许在点击数据点标记(扇形图点击选中的块发生位移)
        .dataSet(@[
            @[@"Firefox Now",    @336.2],
            @[@"Chrome Now",    @6926.8],
            @[@"Safari Now",     @388.5],
            @[@"Opera Now",      @446.0],
            @[@"Others Now",     @223.0],
                 ])
               ]);
    
    AAOptions *aaOptions = aaChartModel.aa_toAAOptions;
    
    aaOptions.plotOptions.pie
    .startAngleSet(@-138)
    .endAngleSet(@138)
    ;
    
    return aaOptions;
}

//https://github.com/AAChartModel/AAChartKit/issues/987
//headerFormat 参考链接: https://api.highcharts.com.cn/highcharts#tooltip.headerFormat
// \<span> 标签🏷 参考链接: https://www.w3school.com.cn/tags/tag_span.asp
- (AAOptions *)customAreasplineChartTooltipContentWithHeaderFormat {
    AAChartModel *aaChartModel = AAChartModel.new
    .chartTypeSet(AAChartTypeAreaspline)//图表类型
    .colorsThemeSet(@[@"#04d69f",@"#1e90ff",@"#ef476f",@"#ffd066",])
    .stackingSet(AAChartStackingTypeNormal)
    .markerRadiusSet(@0)
    .categoriesSet(@[
        @"01", @"02", @"03", @"04", @"05", @"06", @"07", @"08", @"09", @"10",
        @"11", @"12", @"13", @"14", @"15", @"16", @"17", @"18", @"19", @"20",
        @"21", @"22", @"23", @"24", @"25", @"26", @"27", @"28", @"29", @"30",
        @"31"
                   ])
    .yAxisVisibleSet(false)
    .markerRadiusSet(@0)
    .seriesSet(@[
        AASeriesElement.new
        .nameSet(@"客流")
        .lineWidthSet(@5.0)
        .fillOpacitySet(@0.4)
        .dataSet(@[
            @26, @27, @53, @41, @35, @55, @33, @42, @33, @63,
            @40, @43, @36, @0,  @0,  @0,  @0,  @0,  @0,  @0,
            @0,  @0,  @0,  @0,  @0,  @0,  @0,  @0,  @0,  @0,
            @0
                 ]),
               ]);
    
    NSString *title = @"<span style=""color:red;font-size:17px;font-weight:bold;"">客流</span><br>";
    NSString *week = @"周一";
    NSString *time = [NSString stringWithFormat:@"时间: 8.{point.x} (%@)<br>",week];
    NSString *headerFormat = [NSString stringWithFormat:@"%@%@",title,time];
    
    AAOptions *aaOptions = aaChartModel.aa_toAAOptions;
    aaOptions.tooltip
    .useHTMLSet(true)
    .headerFormatSet(headerFormat)
    .styleSet(AAStyleColorSize(AAColor.whiteColor, 14))
    .backgroundColorSet(@"#050505")
    .borderColorSet(@"#050505")
    ;
    
    //禁用图例点击事件
    aaOptions.plotOptions.series.events = AAEvents.new
    .legendItemClickSet(@AAJSFunc(function() {
        return false;
    }));
    
    return aaOptions;
}


@end
