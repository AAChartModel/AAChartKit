
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
#import "AAChartKit.h"

#import "AADateUTCTool.h"
@interface DrawChartWithAAOptionsVC ()

@property (nonatomic, strong) AAChartView *aaChartView;

@end

@implementation DrawChartWithAAOptionsVC

- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor = [UIColor whiteColor];
    self.title = self.navigationItemTitleArr[self.selectedIndex];
    
    [self setUpChartView];
}

- (void)setUpChartView {
    CGRect chartViewFrame = CGRectMake(0, 88, self.view.frame.size.width, self.view.frame.size.height - 88);
    AAChartView *aaChartView =[[AAChartView alloc]initWithFrame:chartViewFrame];
    [self.view addSubview:aaChartView];
    aaChartView.scrollEnabled = NO;
    self.aaChartView = aaChartView;
    
    AAOptions *aaOptions = [self configureChartOptions];
    [aaChartView aa_drawChartWithOptions:aaOptions];
    
    UIBarButtonItem *barItem = [[UIBarButtonItem alloc] initWithTitle:@"Next Chart"
                                                                style:UIBarButtonItemStylePlain
                                                               target:self
                                                               action:@selector(monitorTap)];
    self.navigationItem.rightBarButtonItem = barItem;
}


- (void)monitorTap {
    if (self.selectedIndex == 30) {
        self.title = [NSString stringWithFormat:@"❗️This is the last chart❗️"];
    } else {
        self.selectedIndex = self.selectedIndex + 1;
        self.title = self.navigationItemTitleArr[self.selectedIndex];
        AAOptions *aaOptions = [self configureChartOptions];
        [self.aaChartView aa_refreshChartWithOptions:aaOptions];
    }
}

- (AAOptions *)configureChartOptions {
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
        case 17: return [self yAxisOnTheRightSideChart];//y轴在右侧的图表
        case 18: return [self simpleGaugeChart];//简易仪表图
        case 19: return [self gaugeChartWithPlotBand];//带有颜色带的仪表图
        case 20: return [self configureAAPlotBandsForChart];//带有颜色标志带的曲线图表
        case 21: return [self configureAAPlotLinesForChart];//带有颜色标志线及文字的曲线图表
        case 22: return [self adjustChartDataLabelsStyle];//自定义DataLabels样式
        case 23: return [self customizeEveryDataLabelBySinglely];//单独自定义指定的data的DataLabels样式
        case 24: return [self configureXAxisLabelsFontColorWithHTMLString];//通过HTML字符串自定义X轴文字颜色
        case 25: return [self configureXAxisLabelsFontColorAndFontSizeWithHTMLString];//通过HTML字符串自定义X轴文字颜色和字体大小
        case 26: return [self configure_DataLabels_XAXis_YAxis_Legend_Style];//配置DataLabels、XAXis、YAxis、Legend等图表元素样式
        case 27: return [self configureXAxisPlotBand];//X轴带有颜色标志带的混合图表
        case 28: return [self configureStackingColumnChartDataLabelsOverflow];//允许DataLabels文字溢出绘图区
        case 29: return [self configureReversedBarChartDataLabelsStyle];//调整Y轴倒转的条形图的DataLabels风格样式
        case 30: return [self configureTripleYAxesMixedChart];//三条Y轴的混合图
    }
    return nil;
}

- (AAOptions *)configureTheAAOptionsOfAreaChart {
    AAChartModel *aaChartModel= AAChartModel.new
    .chartTypeSet(AAChartTypeAreaspline)
    .titleSet(@"")
    .subtitleSet(@"")
    .stackingSet(AAChartStackingTypeNormal)
    .markerRadiusSet(@0)
    .colorsThemeSet(@[
                      [AAGradientColor oceanBlueColor],
                      [AAGradientColor sanguineColor],
                      [AAGradientColor lusciousLimeColor],
                      [AAGradientColor mysticMauveColor],
                      ])
    .seriesSet(@[
                 AASeriesElement.new
                 .nameSet(@"Tokyo Hot")
                 .dataSet(@[@0.45, @0.43, @0.50, @0.55, @0.58, @0.62, @0.83, @0.39, @0.56, @0.67, @0.50, @0.34, @0.50, @0.67, @0.58, @0.29, @0.46, @0.23, @0.47, @0.46, @0.38, @0.56, @0.48, @0.36]),
                 AASeriesElement.new
                 .nameSet(@"Berlin Hot")
                 .dataSet(@[@0.38, @0.31, @0.32, @0.32, @0.64, @0.66, @0.86, @0.47, @0.52, @0.75, @0.52, @0.56, @0.54, @0.60, @0.46, @0.63, @0.54, @0.51, @0.58, @0.64, @0.60, @0.45, @0.36, @0.67]),
                 AASeriesElement.new
                 .nameSet(@"London Hot")
                 .dataSet(@[@0.46, @0.32, @0.53, @0.58, @0.86, @0.68, @0.85, @0.73, @0.69, @0.71, @0.91, @0.74, @0.60, @0.50, @0.39, @0.67, @0.55, @0.49, @0.65, @0.45, @0.64, @0.47, @0.63, @0.64]),
                 AASeriesElement.new
                 .nameSet(@"NewYork Hot")
                 .dataSet(@[@0.60, @0.51, @0.52, @0.53, @0.64, @0.84, @0.65, @0.68, @0.63, @0.47, @0.72, @0.60, @0.65, @0.74, @0.66, @0.65, @0.71, @0.59, @0.65, @0.77, @0.52, @0.53, @0.58, @0.53]),
                 ]
               );
    
    AAOptions *aaOptions = [AAOptionsConstructor configureChartOptionsWithAAChartModel:aaChartModel];
    
    aaOptions.legend 
    .enabledSet(true)
    .alignSet(AAChartAlignTypeRight)
    .layoutSet(AAChartLayoutTypeVertical)
    .verticalAlignSet(AAChartVerticalAlignTypeTop);
    
    aaOptions.yAxis.labels.format = @"{value} %";//给y轴添加单位
    return aaOptions;
}

- (AAOptions *)configureTheAAOptionsOfPieChart {
    //计算X轴偏移量
    CGFloat xOffSet = (self.aaChartView.frame.size.width - 40) * 0.1;
    
    //第一种写法
    AAOptions *aaOptions = AAOptions.new
    .chartSet(AAChart.new
              .typeSet(AAChartTypePie)
              .marginLeftSet(@0)
              .marginRightSet(@0)
              )
    .titleSet(AATitle.new
              .textSet(@"渠道销售额<br/>占比")//标题文本内容
              .alignSet(AAChartTitleAlignTypeCenter)//标题水平居中
              .verticalAlignSet(AAChartTitleVerticalAlignTypeMiddle)//标题垂直居中
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
                 .dataSet(
                          @[
                            @[@"Firefox",   @3336.2],
                            @[@"IE",        @26.8],
                            @[@"Safari",    @88.5],
                            @[@"Opera",     @46.0],
                            @[@"Others",    @223]
                            ]
                          ),
                 ])
    .colorsSet(@[@"#1e90ff",@"#ef476f",@"#ffd066",@"#04d69f",@"#25547c",]);//设置颜色主题
    return aaOptions;
    
    
    //下面是另一种更清晰的写法
    AAChart *aaChart = AAChart.new.typeSet(AAChartTypePie);
    
    //标题
    AATitle *aaTitle = AATitle.new
    .textSet(@"渠道销售额<br>占比")//标题文本内容
    .alignSet(AAChartTitleAlignTypeCenter)//标题水平居中
    .verticalAlignSet(AAChartTitleVerticalAlignTypeMiddle)//标题垂直居中
    .styleSet(AAStyle.new
              .colorSet(@"#000000")//Title font color
              .fontSizeSet(@"14 px")//Title font size
              .fontWeightSet(@"bold")//Title font weight
              );
    
    AAPlotOptions *aaPlotOptions = AAPlotOptions.new
    .seriesSet(AASeries.new
               .animationSet(AAAnimation.new
                             .easingSet(AAChartAnimationBounce)
                             .durationSet(@1000)
                             )
               )
    .pieSet(AAPie.new
            .showInLegendSet(true)
            .dataLabelsSet(AADataLabels.new
                           .enabledSet(true)
                           .formatSet(@"{point.percentage:.1f}%"))
            )
    ;
    
    //数据源
    NSArray *aaSeries = @[
                          AASeriesElement.new
                          .nameSet(@"语言热度值")
                          .innerSizeSet(@"80%")//内部圆环半径大小占比
                          .allowPointSelectSet(false)//是否允许在点击数据点标记(扇形图点击选中的块发生位移)
                          .dataSet(
                                   @[
                                     @[@"Firefox",   @3336.2],
                                     @[@"IE",        @26.8],
                                     @[@"Safari",    @88.5],
                                     @[@"Opera",     @46.0],
                                     @[@"Others",    @223]
                                     ]
                                   ),
                          ];
    
    NSArray *aaColors = @[@"#b5282a",@"#e7a701",@"#50c18d",@"#fd4800",@"#f1c6c5"];
    
    AAOptions *chartOptions = AAOptions.new;
    chartOptions.chart = aaChart;
    chartOptions.title = aaTitle;
    chartOptions.plotOptions = aaPlotOptions;
    chartOptions.series = aaSeries;
    chartOptions.colors = aaColors;
    return chartOptions;
}

- (AAOptions *)adjustPieChartTitleAndDataLabelFontStyle {
    AAOptions *aaOptions = AAOptions.new
    .chartSet(AAChart.new.typeSet(AAChartTypePie))
    .titleSet(AATitle.new
              .useHTMLSet(true)
              .textSet(@"<span style=""color:#1E90FF;font-weight:thin;font-size:13px""> &nbsp&nbsp&nbsp近七天 </span>  <br> <span style=""color:#A9A9A9;font-weight:thin;font-size:10px""> 运行状态占比 </span>")//标题文本内容
              .alignSet(AAChartTitleAlignTypeCenter)//标题水平居中
              .verticalAlignSet(AAChartTitleVerticalAlignTypeMiddle)//标题垂直居中
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
                                .distanceSet(@10)
                                .formatSet(@"<span style=""color:#A9A9A9;font-weight:thin;font-size:10px"">{point.name}</span> <span style=""color:#1E90FF;font-weight:bold;font-size:15px"">{point.percentage:.1f}</span><span style=""color:#1E90FF;font-weight:thin;font-size:10px"">%</span>")
                                )
                 .dataSet(
                          @[
                            @[@"Firefox",   @150],
                            @[@"Opera",      @15],
                            @[@"Others",     @35]
                            ]
                          ),
                 ]);
    return aaOptions;
}

- (AAOptions *)configureTheAAOptionsOfSpecialNestedColumnChart {

   // 下面是更清晰的另一种写法
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
      .pointPlacementSet(@(-0.2)),
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
    AAChartModel *aaChartModel= AAChartModel.new
    .chartTypeSet(AAChartTypeArea)//图表类型
    .titleSet(@"")//图表主标题
    .subtitleSet(@"")//图表副标题
    .colorsThemeSet(@[@"#fe117c",@"#ffc069",@"#06caf4",@"#7dffc0"])//设置主体颜色数组
    .yAxisTitleSet(@"")//设置 Y 轴标题
    .tooltipValueSuffixSet(@"℃")//设置浮动提示框单位后缀
    .yAxisGridLineWidthSet(@1)//y轴横向分割线宽度为0(即是隐藏分割线)
    .xAxisGridLineWidthSet(@0.5)
    .markerRadiusSet(@0)
    .polarSet(true)
    .seriesSet(@[
                 AASeriesElement.new
                 .nameSet(@"2017")
                 .colorSet((id)AAGradientColor.deepSeaColor)
                 .dataSet(@[@7.0, @6.9, @9.5, @14.5, @18.2, @21.5, @25.2, @26.5, @23.3, @18.3, @13.9, @9.6]),
                 ]
               );
    
    AAOptions *aaOptions = [AAOptionsConstructor configureChartOptionsWithAAChartModel:aaChartModel];
    aaOptions.xAxis.visible = false;//避免多边形外环之外有额外套了一层无用的外环
    aaOptions.yAxis.gridLineInterpolation = AAYAxisGridLineInterpolationPolygon;
    return aaOptions;
}

- (AAOptions *)configureTheNoGapColunmChart {
    AAChartModel *aaChartModel= AAChartModel.new
    .chartTypeSet(AAChartTypeColumn)//图表类型
    .titleSet(@"中间缝隙很小的柱状图")//图表主标题
    .subtitleSet(@"调整一下groupPadding即可")//图表副标题
    .colorsThemeSet(@[@"#fe117c",@"#ffc069",@"#06caf4",@"#7dffc0"])//设置主体颜色数组
    .yAxisTitleSet(@"")//设置 Y 轴标题
    .tooltipValueSuffixSet(@"℃")//设置浮动提示框单位后缀
    .yAxisGridLineWidthSet(@1)//y轴横向分割线宽度为0(即是隐藏分割线)
    .xAxisGridLineWidthSet(@0.5)
    .markerRadiusSet(@0)
    .dataLabelsEnabledSet(true)
    .seriesSet(@[
                 AASeriesElement.new
                 .nameSet(@"2020")
                 .dataSet(@[@3.9, @4.2, @5.7, @8.5, @11.9, @15.2,]),
                 ]
               );
    
    AAOptions *aaOptions = [AAOptionsConstructor configureChartOptionsWithAAChartModel:aaChartModel];
    
    //    *  关于 `pointPadding`
    //https://api.highcharts.com.cn/highcharts#plotOptions.column.groupPadding
    //
    //    * 关于 `pointPadding`
    //https://api.highcharts.com.cn/highcharts#plotOptions.column.pointPadding
    
    AAColumn *aaColumn = aaOptions.plotOptions.column;
    
    aaColumn.groupPadding = @0.05;//Padding between each column or bar, in x axis units. default：0.1.
    aaColumn.pointPadding = @0;//Padding between each value groups, in x axis units. default：0.2.
    
    aaColumn.dataLabels
    .ySet(@-10)
    .formatSet(@" {y} 美元 ")
    .backgroundColorSet(@"rgba(0, 0, 0, 0.75)")
    .shapeSet(@"callout")
    .styleSet(AAStyle.new
              .colorSet(AAColor.whiteColor)
              .textOutlineSet(@"none"));
    return aaOptions;
}

- (AAOptions *)configureCustomStyleTooltipChart {
    
    AAChartModel *aaChartModel = AAChartModel.new
    .chartTypeSet(AAChartTypeArea)//图表类型
    .titleSet(@"近三个月金价起伏周期图")//图表主标题
    .subtitleSet(@"金价(元/克)")//图表副标题
    .colorsThemeSet(@[@"#FFD700"/*(纯金色)*/,@"#ffc069",@"#06caf4",@"#7dffc0"])//设置主体颜色数组
    .markerSymbolStyleSet(AAChartSymbolStyleTypeBorderBlank)//折线连接点样式为外边缘空白
    .xAxisTickIntervalSet(@15)//x轴刻度点间隔数(设置每隔几个点显示一个 X轴的内容)
    .yAxisTitleSet(@"")//设置 Y 轴标题
    .yAxisGridLineWidthSet(@0.8)//y轴横向分割线宽度(为0即是隐藏分割线)
    .categoriesSet(@[
                     @"10-01",@"10-02",@"10-03",@"10-04",@"10-05",@"10-06",@"10-07",@"10-08",@"10-09",@"10-10",@"10-11",
                     @"10-12",@"10-13",@"10-14",@"10-15",@"10-16",@"10-17",@"10-18",@"10-19",@"10-20",@"10-21",@"10-22",
                     @"10-23",@"10-024",@"10-25",@"10-26",@"10-27",@"10-28",@"10-29",@"10-30",@"10-31",@"11-01",@"11-02",
                     @"11-03",@"11-04",@"11-05",@"11-06",@"11-07",@"11-08",@"11-09",@"11-10",@"11-11",@"11-12",@"11-13",
                     @"11-14",@"11-15",@"11-16",@"11-17",@"11-18",@"11-19",@"11-20",@"11-21",@"11-22",@"11-23",@"11-024",
                     @"11-25",@"11-26",@"11-27",@"11-28",@"11-29",@"11-30",@"12-01",@"12-02",@"12-03",@"12-04",@"12-05",
                     @"12-06",@"12-07",@"12-08",@"12-09",@"12-10",@"12-11",@"12-12",@"12-13",@"12-14",@"12-15",@"12-16",
                     @"12-17",@"12-18",@"12-19",@"12-20",@"12-21",@"12-22",@"12-23",@"12-024",@"12-25",@"12-26",@"12-27",
                     @"12-28",@"12-29",@"12-30"])
    .seriesSet(@[
                 AASeriesElement.new
                 .lineWidthSet(@1.5)
                 .fillOpacitySet(@0.4)
                 .nameSet(@"2018")
                 .dataSet(
                          @[@1.51, @6.7, @0.94, @1.44, @1.6, @1.63, @1.56, @1.91, @2.45, @3.87, @3.24, @4.90, @4.61, @4.10,
                            @4.17, @3.85, @4.17, @3.46, @3.46, @3.55, @3.50, @4.13, @2.58, @2.28,@1.51, @12.7, @0.94, @1.44,
                            @18.6, @1.63, @1.56, @1.91, @2.45, @3.87, @3.24, @4.90, @4.61, @4.10, @4.17, @3.85, @4.17, @3.46,
                            @3.46, @3.55, @3.50, @4.13, @2.58, @2.28,@1.33, @4.68, @1.31, @1.10, @13.9, @1.10, @1.16, @1.67,
                            @2.64, @2.86, @3.00, @3.21, @4.14, @4.07, @3.68, @3.11, @3.41, @3.25, @3.32, @3.07, @3.92, @3.05,
                            @2.18, @3.24,@3.23, @3.15, @2.90, @1.81, @2.11, @2.43, @5.59, @3.09, @4.09, @6.14, @5.33, @6.05,
                            @5.71, @6.22, @6.56, @4.75, @5.27, @6.02, @5.48])
                 ]
               );
    
    /*Custom Tooltip Style --- 自定义图表浮动提示框样式及内容*/
    AAOptions *aaOptions = [AAOptionsConstructor configureChartOptionsWithAAChartModel:aaChartModel];
    AATooltip *tooltip = aaOptions.tooltip;
    tooltip
    .useHTMLSet(true)
    .headerFormatSet(@"{series.name}-<b>{point.key}</b> &nbsp12:00<br>")
    .pointFormatSet(@"<b>{point.y}</b>&nbsp元/克")
    .valueDecimalsSet(@2)//设置取值精确到小数点后几位
    .backgroundColorSet(@"#000000")
    .borderColorSet(@"#000000")
    .styleSet((id)AAStyle.new
              .colorSet(@"#FFD700")
              .fontSizeSet(@"12px"))
    ;
    return aaOptions;
}

- (AAOptions *)adjustChartLeftAndRightMargin {
    AAChartModel *aaChartModel= AAChartModel.new
    .chartTypeSet(AAChartTypeColumn)//图表类型
    .titleSet(@"")//图表主标题
    .subtitleSet(@"")//图表副标题
    .colorsThemeSet(@[@"#fe117c",@"#ffc069",@"#06caf4",@"#7dffc0"])//设置主体颜色数组
    .yAxisTitleSet(@"")//设置 Y 轴标题
    .polarSet(true)
    .categoriesSet(@[@"Java", @"Swift", @"Python", @"Ruby", @"PHP", @"Go", @"C", @"C#", @"C++", @"Perl", @"R", @"MATLAB", @"SQL"])
    .seriesSet(@[
                 AASeriesElement.new
                 .nameSet(@"2017")
                 .dataSet(@[@7.0, @6.9, @9.5, @14.5, @18.2, @21.5, @25.2, @26.5, @23.3, @18.3, @13.9, @9.6]),
                 ]
               );
    
    AAOptions *aaOptions = [AAOptionsConstructor configureChartOptionsWithAAChartModel:aaChartModel];
    aaOptions.chart.marginLeft = @70;
    aaOptions.chart.marginRight = @70;
    return aaOptions;
}

- (AAOptions *)configureChartWithBackgroundImage {
    AAChartModel *aaChartModel= AAChartModel.new
    .chartTypeSet(AAChartTypePie)
    .titleSet(@"编程语言热度")
    .subtitleSet(@"虚拟数据")
    .dataLabelsEnabledSet(true)//是否直接显示扇形图数据
    .yAxisTitleSet(@"摄氏度")
    .seriesSet(
               @[AASeriesElement.new
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
                 ]
               )
    ;
    
    AAOptions *aaOptions = [AAOptionsConstructor configureChartOptionsWithAAChartModel:aaChartModel];
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
    
    NSDictionary *gradientColorDic1 =
     [AAGradientColor gradientColorWithDirection:AALinearGradientDirectionToTop
                                startColorString:@"#f54ea2"//颜色字符串设置支持十六进制类型和 rgba 类型
                                  endColorString:@"#ff7676"];
    
    NSDictionary *gradientColorDic2 =
     [AAGradientColor gradientColorWithDirection:AALinearGradientDirectionToTop
                                startColorString:@"#17ead9"//颜色字符串设置支持十六进制类型和 rgba 类型
                                  endColorString:@"#6078ea"];
    
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
    .colorSet((id)gradientColorDic1)
    .markerSet(aaMarker)
    .yAxisSet(@1)
    .dataSet(@[@7.0, @6.9, @2.5, @14.5, @18.2, @21.5, @5.2, @26.5, @23.3, @45.3, @13.9, @9.6]);
    
    AASeriesElement *element2 = AASeriesElement.new
    .nameSet(@"2018")
    .typeSet(AAChartTypeColumn)
    .colorSet((id)gradientColorDic2)
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
    .yAxisTitleSet(@"")
    .dataLabelsEnabledSet(true)
    .markerSymbolSet(AAChartSymbolTypeCircle)
    .markerRadiusSet(@6)//设置折线连接点宽度为0,即是隐藏连接点
    .yAxisGridLineWidthSet(@0.5)
    .markerSymbolStyleSet(AAChartSymbolStyleTypeInnerBlank)
    .seriesSet(@[AASeriesElement.new
                 .nameSet(@"2017")
                 .dataSet(@[@(0.0000001),@(0.0000002),@(0.0000003),@(0.0000004),@(0.0000005)])
                 .lineWidthSet(@5)
                 ]
               );
    //数值格式化字符串是采用了 C 语言浮点型格式化的子集，格式化字符是在大括号内，变量之后，用冒号（:）分隔的内容。
    //默认情况下点号（.）表示小数点，空格（ ）代表千分符，当然这两个符号可以在 语言文字 选项集里中来设定。
    //具体参见 https://www.hcharts.cn/docs/basic-labels-string-formatting#h2-1
    AAOptions *aaOptions = [AAOptionsConstructor configureChartOptionsWithAAChartModel:aaChartModel];
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
                 ]
               );
    
    AAOptions *aaOptions = [AAOptionsConstructor configureChartOptionsWithAAChartModel:aaChartModel];
    AAColumn *aaColumn = aaOptions.plotOptions.column;
    aaColumn.groupPadding = @0.05;
    aaColumn.colorByPoint = true;
    return aaOptions;
}

- (AAOptions *)customStyleStackedColumnChart {
    //Method 1
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
                   .styleSet(AAStyle.new
                             .colorSet(AAColor.whiteColor)
                             .fontSizeSet(@"15px")
                             .fontWeightSet(AAChartFontWeightTypeThin)
                             .textOutlineSet(@"0px 0px contrast")
                             )
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
    
    AAOptions *aaOptions = AAOptions.new;
    aaOptions.chart = aaChart;
    aaOptions.title = aaTitle;
    aaOptions.xAxis = aaXAxis;
    aaOptions.yAxis = aaYAxis;
    aaOptions.tooltip = aaTooltip;
    aaOptions.plotOptions = aaPlotOptions;
    aaOptions.legend = aaLegend;
    aaOptions.series = aaSeriesArr;
    aaOptions.colors = @[@"#1e90ff",@"#ef476f",@"#ffd066",@"#04d69f",@"#25547c",];
    
//    return aaOptions;
    
    // Method 2
    AAOptions *options2 = AAOptions.new
    .chartSet(AAChart.new.typeSet(AAChartTypeColumn))
    .titleSet(AATitle.new.textSet(@"Stacked column chart"))
    .xAxisSet(AAXAxis.new
              .visibleSet(true)
              .categoriesSet(@[@"Apples", @"Oranges", @"Pears", @"Grapes", @"Bananas"])
              )
    .yAxisSet(AAYAxis.new
              .visibleSet(true)
              .minSet(@0)
              .titleSet(AAAxisTitle.new.textSet(@"Total fruit consumption"))
              .stackLabelsSet(AALabels.new
                              .enabledSet(true)
                              .styleSet(AAStyle.new.fontWeightSet(AAChartFontWeightTypeBold))
                              )
              )
    .legendSet(AALegend.new
               .enabledSet(true)
               .alignSet(AAChartAlignTypeRight)
               .xSet(@(-30))
               .verticalAlignSet(AAChartVerticalAlignTypeTop)
               .ySet(@25)
               .borderColorSet(@"#ccc")
               .borderWidthSet(@1)
               )
    .tooltipSet(AATooltip.new
                .headerFormatSet(@"<b>{point.x}</b><br/>")
                .pointFormatSet(@"{series.name}: {point.y}<br/>Total: {point.stackTotal}")
                )
    .plotOptionsSet(AAPlotOptions.new
                    .seriesSet(AASeries.new
                               .animationSet(AAAnimation.new
                                             .easingSet(AAChartAnimationBounce)
                                             .durationSet(@1000)
                                             )
                               )
                    .columnSet(AAColumn.new
                               .stackingSet(AAChartStackingTypeNormal)
                               .dataLabelsSet(AADataLabels.new.enabledSet(true))
                               )
                    )
    .seriesSet(@[
                 AASeriesElement.new
                 .nameSet(@"John")
                 .dataSet(@[@5, @3, @4, @7, @2]),
                 AASeriesElement.new
                 .nameSet(@"Jane")
                 .dataSet(@[@5, @3, @4, @7, @2]),
                 AASeriesElement.new
                 .nameSet(@"Joe")
                 .dataSet(@[@5, @3, @4, @7, @2]),
                 ]);
    
    return options2;
}

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
    AAOptions *aaOptions = [AAOptionsConstructor configureChartOptionsWithAAChartModel:aaChartModel];
    NSDictionary *xAxisDic = @{
                               @"type": @"datetime",
                               @"dateTimeLabelFormats": @{
                                       @"month": @"%e.%m.%y"
                                       }
                               };
    
    aaOptions.xAxis = (id)xAxisDic;
    return aaOptions;
}

- (AAOptions *)disableChartAnimation {
    AAChartModel *aaChartModel= AAChartModel.new
    .chartTypeSet(AAChartTypeColumn)//图表类型
    .yAxisLineWidthSet(@0)
    .seriesSet(@[
                 AASeriesElement.new
                 .nameSet(@"2018")
                 .dataSet(@[@0.2, @0.8, @5.7, @11.3, @17.0, @22.0, @24.8, @24.1, @20.1, @14.1, @8.6, @2.5]),
                 ]
               );
    AAOptions *aaOptions = [AAOptionsConstructor configureChartOptionsWithAAChartModel:aaChartModel];
    aaOptions.plotOptions.series.animation = (id)@(false);//禁用图表的渲染动画效果
    aaOptions.yAxis.gridLineDashStyle = AAChartLineDashStyleTypeLongDash;//设置Y轴的网格线样式为 AAChartLineDashStyleTypeLongDash
    return aaOptions;
}


- (AAOptions *)customChartLengendItemStyle {
    AAChartModel *aaChartModel= AAChartModel.new
    .chartTypeSet(AAChartTypeArea)
    .titleSet(@"")
    .subtitleSet(@"")
    .categoriesSet(@[@"Java",@"Swift",@"Python",@"Ruby", @"PHP",@"Go",@"C",@"C#",@"C++",@"Perl",@"R",@"MATLAB",@"SQL"])
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
                 ]
               );

    AAOptions *aaOptions = [AAOptionsConstructor configureChartOptionsWithAAChartModel:aaChartModel];
    
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
    
//    aaOptions.xAxis.tickmarkPlacement = @"on";//本参数只对分类轴有效。 当值为 on 时刻度线将在分类上方显示；当值为 between 时，刻度线将在两个分类中间显示。当 tickInterval 为 1 时，默认是 between，其他情况默认是 on。 默认是：null.
//    aaOptions.yAxis.minPadding = @0;
    aaOptions.yAxis.lineWidth = @0;
    return aaOptions;
}

- (AAOptions *)configureTheMirrorColumnChart {
    NSDictionary *gradientColorDic1 =
    [AAGradientColor gradientColorWithDirection:AALinearGradientDirectionToTop
                               startColorString:@"#7052f4"//颜色字符串设置支持十六进制类型和 rgba 类型
                                 endColorString:@"#00b0ff"];
    
    NSDictionary *gradientColorDic2 =
    [AAGradientColor gradientColorWithDirection:AALinearGradientDirectionToTop
                               startColorString:@"#EF71FF"//颜色字符串设置支持十六进制类型和 rgba 类型
                                 endColorString:@"#4740C8"];
    AAOptions *aaOptions = AAOptions.new
    .chartSet(AAChart.new
              .typeSet(AAChartTypeColumn)
//              .backgroundColorSet(@"#161139")
              )
    .titleSet(AATitle.new.textSet(@""))
    .xAxisSet(AAXAxis.new
              .visibleSet(true)
              .categoriesSet(@[@"一月", @"二月", @"三月", @"四月", @"五月", @"六月", @"七月", @"八月", @"九月", @"十月", @"十一月", @"十二月"]))
    .yAxisSet((id)@[AAYAxis.new
                    .visibleSet(true)
                    .gridLineWidthSet(@0)
                    .titleSet(AAAxisTitle.new.textSet(@"收入")),
                    AAYAxis.new
                    .visibleSet(true)
                    .titleSet(AAAxisTitle.new.textSet(@"支出"))
                    .lineWidthSet(@1)
                    .oppositeSet(true)
                    ])
    .tooltipSet(AATooltip.new
                .enabledSet(true)
                .sharedSet(true))
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
                 .dataSet(@[@7.0, @6.9, @9.5, @14.5, @18.2, @21.5, @25.2, @26.5, @23.3, @18.3, @13.9,@7.0, @6.9, @9.5, @14.5,])
                 .colorSet((id)gradientColorDic1),
                 AASeriesElement.new
                 .nameSet(@"支出")
                 .dataSet(@[@-20.1, @-14.1, @-8.6, @-2.5, @-0.8, @-5.7, @-11.3, @-17.0, @-22.0, @-24.8, @-24.1, @-20.1, @-14.1, @-8.6, @-2.5])
                 .colorSet((id)gradientColorDic2),
]);
    return aaOptions;
}

- (AAOptions *)yAxisOnTheRightSideChart {
    AAChartModel *aaChartModel= AAChartModel.new
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
                 ]
               );
    
    AAOptions *aaOptions = [AAOptionsConstructor configureChartOptionsWithAAChartModel:aaChartModel];
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
    NSDictionary *aaOptions =
    @{
      @"chart": @{
              @"type": @"gauge"
              },
      @"pane": @{
              @"startAngle": @-150,
              @"endAngle": @150
              },
      @"yAxis": @{
              @"min": @0,
              @"max": @100,
              @"plotBands": @[
                      @{
                          @"from": @0,
                          @"to": @60,
                          @"color": @"#FF0000",
                          @"outerRadius": @"105%",
                          @"thickness": @"5%"
                          }]
              },
      @"series": @[@{
                       @"data": @[@80]
                       }]
      };
    
    return (id)aaOptions;
}

- (AAOptions *)gaugeChartWithPlotBand {
    NSDictionary *aaOptions =
    @{
      @"chart": @{
              @"type": @"gauge",
              },
      @"title": @{
              @"text": @"速度仪"
              },
      @"pane": @{
              @"startAngle": @-150,
              @"endAngle": @150,
              },
      // the value axis
      @"yAxis": @{
              @"min": @0,
              @"max": @200,
              
              @"title": @{
                      @"text": @"km/h"
                      },
              @"plotBands": @[@{
                               @"from":@ 0,
                               @"to": @120,
                               @"color": @"#ffc069"
                               }, @{
                               @"from": @120,
                               @"to": @160,
                               @"color": @"#fe117c"
                               }, @{
                               @"from": @160,
                               @"to": @200,
                               @"color": @"#06caf4"
                               }]
              },
      @"series": @[@{
                    @"name": @"Speed",
                    @"data": @[@80],
                    }]
      };
    
    return (id)aaOptions;
}

- (AAOptions *)configureAAPlotBandsForChart {
    AAChartModel *aaChartModel = AAChartModel.new
    .chartTypeSet(AAChartTypeSpline)
    .titleSet(@"")
    .subtitleSet(@"")
    .yAxisTitleSet(@"")
    .backgroundColorSet(AAColor.whiteColor)
    .categoriesSet(@[@"一月", @"二月", @"三月", @"四月", @"五月", @"六月", @"七月", @"八月", @"九月", @"十月", @"十一月", @"十二月"])
    .markerRadiusSet(@0)
    .yAxisMaxSet(@50)
    .yAxisGridLineWidthSet(@0)
    .legendEnabledSet(false)
    .xAxisCrosshairWidthSet(@1.5)
    .xAxisCrosshairColorSet(AAColor.grayColor)
    .xAxisCrosshairDashStyleTypeSet(AAChartLineDashStyleTypeLongDashDotDot)
    .yAxisCrosshairWidthSet(@1.5)
    .yAxisCrosshairColorSet(AAColor.grayColor)
    .yAxisCrosshairDashStyleTypeSet(AAChartLineDashStyleTypeLongDashDotDot)
    .seriesSet(@[
                 AASeriesElement.new
                 .nameSet(@"2017")
                 .colorSet(AAColor.whiteColor)
                 .lineWidthSet(@10)
                 .dataSet(@[@7.0, @6.9, @2.5, @14.5, @18.2, @21.5, @5.2, @26.5, @23.3, @45.3, @13.9, @9.6]),
                 ]
               );
    
    AAOptions *aaOptions = [AAOptionsConstructor configureChartOptionsWithAAChartModel:aaChartModel];
    NSArray *aaPlotBandsArr =
    @[
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

- (AAOptions *)configureAAPlotLinesForChart {
    AAChartModel *aaChartModel = AAChartModel.new
    .chartTypeSet(AAChartTypeAreaspline)
    .titleSet(@"")
    .subtitleSet(@"")
    .yAxisTitleSet(@"")
    .backgroundColorSet(AAColor.whiteColor)
    .categoriesSet(@[@"一月", @"二月", @"三月", @"四月", @"五月", @"六月", @"七月", @"八月", @"九月", @"十月", @"十一月", @"十二月"])
    .markerRadiusSet(@0)
    .yAxisMaxSet(@50)
    .yAxisGridLineWidthSet(@0)
    .legendEnabledSet(false)
    .seriesSet(@[
                 AASeriesElement.new
                 .nameSet(@"2019")
                 .fillOpacitySet(@0.5)
                 .lineWidthSet(@10)
                 .dataSet(@[@7.0, @6.9, @2.5, @14.5, @18.2, @21.5, @5.2, @26.5, @23.3, @45.3, @13.9, @9.6])
                 .zonesSet(@[
                             @{@"value": @12, @"color": @"#1e90ff"},
                             @{@"value": @24, @"color": @"#ef476f"},
                             @{@"value": @36, @"color": @"#04d69f"},
                             @{@"color": @"#ffd066"}
                             ]),
                 ]
               );
//    @[@"#1e90ff",@"#ef476f",@"#ffd066",@"#04d69f",@"#25547c",]
    AAOptions *aaOptions = [AAOptionsConstructor configureChartOptionsWithAAChartModel:aaChartModel];
    
    NSArray *aaPlotLinesArr =
    @[
      AAPlotLinesElement.new
      .colorSet(@"#1e90ff")//颜色值(16进制)
      .dashStyleSet(AAChartLineDashStyleTypeLongDashDot)//样式：Dash,Dot,Solid等,默认Solid
      .widthSet(@(1)) //标示线粗细
      .valueSet(@(12)) //所在位置
      .zIndexSet(@(1)) //层叠,标示线在图表中显示的层叠级别，值越大，显示越向前
      .labelSet(AALabel.new
                .textSet(@"PLOT LINES ONE")
                .styleSet(AAStyle.new
                          .colorSet(@"#1e90ff")
                          .fontWeightSet(AAChartFontWeightTypeBold)))
      ,AAPlotLinesElement.new
      .colorSet(@"#ef476f")
      .dashStyleSet(AAChartLineDashStyleTypeLongDashDot)
      .widthSet(@(1))
      .valueSet(@(24))
      .labelSet(AALabel.new
                .textSet(@"PLOT LINES TWO")
                .styleSet(AAStyle.new
                          .colorSet(@"#ef476f")
                          .fontWeightSet(AAChartFontWeightTypeBold)))
      ,AAPlotLinesElement.new
      .colorSet(@"#04d69f")
      .dashStyleSet(AAChartLineDashStyleTypeLongDashDot)
      .widthSet(@(1))
      .valueSet(@(36))
      .labelSet(AALabel.new
                .textSet(@"PLOT LINES THREE")
                .styleSet(AAStyle.new
                          .colorSet(@"#04d69f")
                          .fontWeightSet(AAChartFontWeightTypeBold)))
      ];
    
    AAYAxis *aaYAxis = aaOptions.yAxis;
    aaYAxis.plotLines = aaPlotLinesArr;
    return aaOptions;
}

- (AAOptions *)adjustChartDataLabelsStyle {
    AAChartModel *aaChartModel= AAChartModel.new
    .chartTypeSet(AAChartTypeSpline)//图表类型
    .titleSet(@"")//图表主标题
    .subtitleSet(@"")//图表副标题
    .markerRadiusSet(@7)
    .markerSymbolStyleSet(AAChartSymbolStyleTypeBorderBlank)
    .dataLabelsEnabledSet(true)
    .yAxisLineWidthSet(0)
    .yAxisTitleSet(@"")
    .legendEnabledSet(false)
    .xAxisCrosshairWidthSet(@1)
    .xAxisCrosshairDashStyleTypeSet(AAChartLineDashStyleTypeLongDashDot)
    .xAxisCrosshairColorSet(AAColor.grayColor)
    .tooltipEnabledSet(false)
    .categoriesSet(@[
                     @"10-01",@"10-02",@"10-03",@"10-04",@"10-05",@"10-06",@"10-07",@"10-08",@"10-09",
                     @"10-10",@"10-11",@"10-12",@"10-13",@"10-14",@"10-15",])
    .seriesSet(@[
                 AASeriesElement.new
                 .colorSet(AAColor.redColor)// blue color
                 .nameSet(@"2020")
                 .dataSet(@[@1.51, @6.7, @0.94, @1.44, @3.87, @3.24, @4.90, @4.61, @4.10,
                            @4.17, @3.85, @4.17, @3.46, @3.46, @3.55,]),
                 ]
               );
    
    AAOptions *aaOptions = [AAOptionsConstructor configureChartOptionsWithAAChartModel:aaChartModel];
    aaOptions.yAxis.gridLineDashStyle = AAChartLineDashStyleTypeLongDash;//设置Y轴的网格线样式为 AAChartLineDashStyleTypeLongDash
    AADataLabels *aaDatalabels = aaOptions.plotOptions.spline.dataLabels;
    aaDatalabels
    .ySet(@-10)
    .formatSet(@"{y}美元")
    .colorSet(AAColor.redColor)// blue color
    .backgroundColorSet(AAColor.whiteColor)// white color
    .borderColorSet(AAColor.redColor)// blue color
    .borderRadiusSet(@1)
    .borderWidthSet(@1);
    return aaOptions;
}

- (AAOptions *)customizeEveryDataLabelBySinglely {
   NSArray *dataArr =
    @[
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
    
    AAChartModel *aaChartModel= AAChartModel.new
    .chartTypeSet(AAChartTypeAreaspline)//图表类型
    .titleSet(@"")//图表主标题
    .subtitleSet(@"")//图表副标题
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
                 ]
               );
    
    AAOptions *aaOptions = [AAOptionsConstructor configureChartOptionsWithAAChartModel:aaChartModel];
    aaOptions.plotOptions.pie.dataLabels.allowOverlap = true;
    
    
    aaOptions.yAxis.gridLineDashStyle = AAChartLineDashStyleTypeLongDash;//设置Y轴的网格线样式为 AAChartLineDashStyleTypeLongDash
    AADataLabels *aaDatalabels = aaOptions.plotOptions.areaspline.dataLabels;
    aaDatalabels
    .xSet(@3)
    .verticalAlignSet(AAChartVerticalAlignTypeMiddle)
    .ySet(@-20)
    .styleSet(AAStyle.new
              .fontSizeSet(@"10px")
              .fontWeightSet(AAChartFontWeightTypeBold)
              .colorSet(AAColor.redColor)
              .textOutlineSet(@"1px 1px contrast")
              )
    .backgroundColorSet(AAColor.whiteColor)// white color
    .borderColorSet(AAColor.redColor)// red color
    .borderRadiusSet(@1.5)
    .borderWidthSet(@1.3);
    return aaOptions;
}

- (AAOptions *)configureXAxisLabelsFontColorWithHTMLString {
    NSArray *categories =
    @[@"<font color=\\\"#CC0066\\\">孤岛危机<\\/font>",
      @"<font color=\\\"#CC0033\\\">使命召唤<\\/font>",
      @"<font color=\\\"#FF0066\\\">荣誉勋章<\\/font>",
      @"<font color=\\\"##66FF99\\\">狙击精英<\\/font>",
      @"<font color=\\\"#00FF00\\\">神秘海域<\\/font>",
      @"<font color=\\\"#00CC00\\\">美国末日<\\/font>",
      @"<font color=\\\"#666FF\\\">巫师狂猎<\\/font>",
      @"<font color=\\\"#000CC\\\">死亡搁浅<\\/font>",
      @"<font color=\\\"#9933CC\\\">地狱边境<\\/font>",
      @"<font color=\\\"##FFCC99\\\">忍者之印<\\/font>",
      @"<font color=\\\"#FFCC00\\\">合金装备<\\/font>",
      @"<font color=\\\"#CC99090\\\">全战三国<\\/font>",
      ];
    
    AAChartModel *aaChartModel = AAChartModel.new
    .chartTypeSet(AAChartTypeAreaspline)
    .titleSet(@"")
    .subtitleSet(@"")
    .stackingSet(AAChartStackingTypeNormal)
    .categoriesSet(categories)
    .markerRadiusSet(@0)
    .seriesSet(@[AASeriesElement.new
                 .nameSet(@"Berlin Hot")
                 .colorSet((id)[AAGradientColor mysticMauveColor])
                 .dataSet(@[@7.0, @6.9, @2.5, @14.5, @18.2, @21.5, @5.2, @26.5, @23.3, @45.3, @13.9, @9.6]),
                 ]
               );
    
    AAOptions *aaOptions = [AAOptionsConstructor configureChartOptionsWithAAChartModel:aaChartModel];
    aaOptions.yAxis.labels.format = @"{value} %";//给y轴添加单位
    aaOptions.xAxis.labels.useHTML = true;
    return aaOptions;
}

- (AAOptions *)configureXAxisLabelsFontColorAndFontSizeWithHTMLString {
    NSArray *categories =
    @[
      @"<span style=\\\"color:#CC0066;font-weight:bold;font-size:10px\\\">使命召唤</span>",
      @"<span style=\\\"color:#CC0033;font-weight:bold;font-size:11px\\\">荣誉勋章</span>",
      @"<span style=\\\"color:#FF0066;font-weight:bold;font-size:12px\\\">狙击精英</span>",
      @"<span style=\\\"color:#66FF99;font-weight:bold;font-size:13px\\\">神秘海域</span>",
      @"<span style=\\\"color:#00FF00;font-weight:bold;font-size:14px\\\">美国末日</span>",
      @"<span style=\\\"color:#00CC00;font-weight:bold;font-size:15px\\\">巫师狂猎</span>",
      @"<span style=\\\"color:#666FF;font-weight:bold;font-size:15px\\\">孤岛危机</span>",
      @"<span style=\\\"color:#000CC;font-weight:bold;font-size:14px\\\">地狱边境</span>",
      @"<span style=\\\"color:#9933CC;font-weight:bold;font-size:13px\\\">忍者之印</span>",
      @"<span style=\\\"color:#FFCC99;font-weight:bold;font-size:12px\\\">合金装备</span>",
      @"<span style=\\\"color:#FFCC00;font-weight:bold;font-size:11px\\\">全战三国</span>",
      @"<span style=\\\"color:#CC99090;font-weight:bold;font-size:10px\\\">死亡搁浅</span>",
      ];
    
    AAChartModel *aaChartModel= AAChartModel.new
    .chartTypeSet(AAChartTypeAreaspline)
    .titleSet(@"")
    .subtitleSet(@"")
    .stackingSet(AAChartStackingTypeNormal)
    .yAxisVisibleSet(false)
    .categoriesSet(categories)
    .markerRadiusSet(@0)
    .seriesSet(@[AASeriesElement.new
                 .nameSet(@"Berlin Hot")
                 .colorSet((id)[AAGradientColor deepSeaColor])
                 .dataSet(@[@7.0, @6.9, @2.5, @14.5, @18.2, @21.5, @5.2, @26.5, @23.3, @45.3, @13.9, @9.6]),
                 ]
               );
    
    AAOptions *aaOptions = [AAOptionsConstructor configureChartOptionsWithAAChartModel:aaChartModel];
    aaOptions.yAxis.labels.format = @"{value} %";//给y轴添加单位
    aaOptions.xAxis.labels.useHTML = true;
    return aaOptions;
}

- (AAOptions *)configure_DataLabels_XAXis_YAxis_Legend_Style {
    NSDictionary *fillColorGradientColor =
    [AAGradientColor gradientColorWithDirection:AALinearGradientDirectionToTop//渐变色方向向上🔼
                               startColorString:@"rgba(256,256,256,0.3)"//颜色字符串设置支持十六进制类型和 rgba 类型
                                 endColorString:@"rgba(256,256,256,1.0)"];
    
    NSDictionary *backgroundColorGradientColor =
    [AAGradientColor gradientColorWithDirection:AALinearGradientDirectionToTopLeft//渐变色方向向左上↖️
                               startColorString:@"#4F00BC"//颜色字符串设置支持十六进制类型和 rgba 类型
                                 endColorString:@"#29ABE2"];
    
    AAChartModel *aaChartModel= AAChartModel.new
    .chartTypeSet(AAChartTypeAreaspline)
    .titleSet(@"")
    .subtitleSet(@"")
    .backgroundColorSet((id)backgroundColorGradientColor)
    .stackingSet(AAChartStackingTypeNormal)
    .yAxisVisibleSet(true)
    .yAxisTitleSet(@"")
    .categoriesSet(@[@"一月", @"二月", @"三月", @"四月", @"五月", @"六月", @"七月", @"八月", @"九月", @"十月", @"十一月", @"十二月"])
    .markerRadiusSet(@0)
    .seriesSet(@[AASeriesElement.new
                 .nameSet(@"Berlin Hot")
                 .colorSet(AAColor.whiteColor)
                 .lineWidthSet(@7)
                 .fillColorSet((id)fillColorGradientColor)
                 .dataSet(@[@7.0, @6.9, @2.5, @14.5, @18.2, @21.5, @5.2, @26.5, @23.3, @45.3, @13.9, @9.6]),
                 ]
               );
    
    AAOptions *aaOptions = [AAOptionsConstructor configureChartOptionsWithAAChartModel:aaChartModel];
    
    aaOptions.plotOptions.areaspline
    .dataLabelsSet(AADataLabels.new
                   .enabledSet(true)
                   .styleSet(AAStyle.new
                             .colorSet(AAColor.whiteColor)
                             .fontSizeSet(@"14px")
                             .fontWeightSet(AAChartFontWeightTypeThin)
                             .textOutlineSet(@"0px 0px contrast")//文字轮廓描边
                             ))
    ;

    aaOptions.yAxis
    .lineWidthSet(@1.5)//Y轴轴线颜色
    .lineColorSet(AAColor.whiteColor)//Y轴轴线颜色
    .gridLineWidthSet(@0)//Y轴网格线宽度
    .labels.style.colorSet(AAColor.whiteColor)//Y轴文字颜色
    ;
    
    aaOptions.xAxis
    .tickWidthSet(@0)//X轴刻度线宽度
    .lineWidthSet(@1.5)//X轴轴线宽度
    .lineColorSet(AAColor.whiteColor)//X轴轴线颜色
    .labels.style.colorSet(AAColor.whiteColor)//X轴文字颜色
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
    .titleSet(@"")
    .subtitleSet(@"")
    .categoriesSet(@[@"一月", @"二月", @"三月", @"四月", @"五月", @"六月",
                     @"七月", @"八月", @"九月", @"十月", @"十一月", @"十二月"])
    .yAxisTitleSet(@"")
    .markerRadiusSet(@8.0)//marker点半径为8个像素
    .markerSymbolStyleSet(AAChartSymbolStyleTypeInnerBlank)//marker点为空心效果
    .markerSymbolSet(AAChartSymbolTypeCircle)//marker点为圆形点○
    .yAxisLineWidthSet(@0)
    .yAxisGridLineWidthSet(@0)
    .legendEnabledSet(false)
    .easyGradientColorsSet(true)
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
    AAOptions *aaOptions = [AAOptionsConstructor configureChartOptionsWithAAChartModel:aaChartModel];
    
    //  refer to https://api.highcharts.com.cn/highcharts#xAxis.plotBands
    NSArray *aaPlotBandsArr =
    @[
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

- (AAOptions *)configureStackingColumnChartDataLabelsOverflow {
    AAChartModel *aaChartModel = AAChartModel.new
    .chartTypeSet(AAChartTypeColumn)
    .titleSet(@"")
    .subtitleSet(@"检测数量")
    .yAxisTitleSet(@"")
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
    
    AAOptions *aaOptions = [AAOptionsConstructor configureChartOptionsWithAAChartModel:aaChartModel];
    AADataLabels *aaDataLabels = aaOptions.plotOptions.column.dataLabels;
    
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

- (AAOptions *)configureReversedBarChartDataLabelsStyle {
    AAChartModel *aaChartModel= AAChartModel.new
    .chartTypeSet(AAChartTypeBar)
    .titleSet(@"")
    .subtitleSet(@"")
    .stackingSet(AAChartStackingTypeNormal)
    .markerRadiusSet(@0)
    .yAxisReversedSet(true)
    .colorsThemeSet(@[AAGradientColor.sanguineColor])
    .seriesSet(@[
                 AASeriesElement.new
                 .nameSet(@"Tokyo Hot")
                 .dataSet(@[@140,@120,@100,@80,@60,@40,@20])
                 ]
               );
    
    AAOptions *aaOptions = [AAOptionsConstructor configureChartOptionsWithAAChartModel:aaChartModel];
    
 aaOptions.plotOptions.bar
  .dataLabelsSet(
  AADataLabels.new
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


@end
