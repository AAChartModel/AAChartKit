
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
 * JianShu       : http://www.jianshu.com/u/f1e6753d4254
 * SegmentFault  : https://segmentfault.com/u/huanghunbieguan
 *
 * -------------------------------------------------------------------------------
 
 */

#import "DrawChartWithAAOptionsVC.h"
#import "AAChartKit.h"

@interface DrawChartWithAAOptionsVC ()

@end

@implementation DrawChartWithAAOptionsVC

- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor = [UIColor whiteColor];
    
    AAChartView *chartView =[[AAChartView alloc]initWithFrame:CGRectMake(0, 0, self.view.frame.size.width, self.view.frame.size.height)];
    chartView.contentHeight = chartView.frame.size.height-80;
    [self.view addSubview:chartView];
    chartView.scrollEnabled = NO;
    
    AAOptions *chartOptions = [self configureChartOptions];
    [chartView aa_drawChartWithOptions:chartOptions];
    
}

- (AAOptions *)configureChartOptions {
    switch (self.selectedIndex) {
        case 0: return [self configureTheAAOptionsOfAreaChart];
        case 1: return [self configureTheAAOptionsOfPieChart];
        case 2: return [self configureTheAAOptionsOfSpecialNestedColumnChart];
        case 3: return [self configureThePolygonPolarChart];
        case 4: return [self configureTheNoGapColunmChart];
        case 5: return [self configureCustomStyleTooltipChart];
        case 6: return [self adjustChartLeftAndRightMargin];
    }
    return nil;
}

- (AAOptions *)configureTheAAOptionsOfAreaChart {
/****************************************************参照原生 JavaScript 代码仿写构建生成 AAOptions 实例对象(方法1)****************************************************/
    NSDictionary *chart = @{@"type":@"area"};
    
    //标题
    NSDictionary *title = @{@"text":@"AAChartKit"};
    
    //副标题
    NSDictionary *subtitle = @{@"subtitle":@"Source: https://github.com/AAChartModel/AAChartKit"};
    
    //X轴
    NSDictionary *xAxis = @{
                           @"categories": @[@"Jan", @"Feb", @"Mar", @"Apr", @"May", @"Jun",
                                            @"Jul", @"Aug", @"Sep", @"Oct", @"Nov", @"Dec"]
                           };
    
    //Y轴
    NSDictionary *yAxis = @{
                           @"title":@{
                                   @"text":@"Temperature (xB0C)"
                                   },
                           @"plotLines":@[@{
                                              @"value":@0,
                                              @"width":@1,
                                              @"color":@"#808080"
                                              }]
                           
                           };
    
    //浮动提示框
    NSDictionary *tooltip = @{
                              @"valueSuffix": @"xB0C"
                              };
    
    //图例
    NSDictionary *legend = @{
                             @"layout": @"vertical",
                             @"align": @"right",
                             @"verticalAlign": @"top",
                             @"borderWidth": @0
                             };
    
    //数据源
    NSArray *series = @[
                        @{
                            @"name": @"Tokyo",
                            @"data": @[@7.0, @6.9, @9.5, @14.5, @18.2, @21.5, @25.2,
                                       @26.5, @23.3, @18.3, @13.9, @9.6]
                            },
                        @{
                            @"name": @"New York",
                            @"data": @[@-0.2, @0.8, @5.7, @11.3, @17.0, @22.0, @24.8,
                                         @24.1, @20.1, @14.1, @8.6, @2.5]
                            },
                        @{
                            @"name": @"London",
                            @"data": @[@3.9, @4.2, @5.7, @8.5, @11.9, @15.2, @17.0,
                                       @16.6, @14.2, @10.3, @6.6, @4.8]
                            }
                        ];

    
    NSArray *colors = @[@"#b5282a",@"#e7a701",@"#50c18d",@"#fd4800",@"#f1c6c5"];
    
    //第一种写法
    AAOptions *options = AAObject(AAOptions);
    options.chart = (id)chart;
    options.title = (id)title;
    options.subtitle = (id)subtitle;
    options.xAxis = (id)xAxis;
    options.yAxis = (id)yAxis;
    options.tooltip = (id)tooltip;
    options.legend = (id)legend;
    options.series = (id)series;
    options.colors = colors;
    
    return options;
    
    
    //另一种写法
    AAOptions *chartOptions = AAObject(AAOptions)
    .chartSet((id)chart)
    .titleSet((id)title)
    .subtitleSet((id)subtitle)
    .xAxisSet((id)xAxis)
    .yAxisSet((id)yAxis)
    .tooltipSet((id)tooltip)
    .legendSet((id)legend)
    .seriesSet((id)series)
    .colorsSet(colors);
    
    return chartOptions;
    


/****************************************************参照原生 JavaScript 代码仿写构建生成 AAOptions 实例对象(方法1)****************************************************/
 

}

- (AAOptions *)configureTheAAOptionsOfPieChart {
    
    //第一种写法
    AAOptions *aaOptions = AAObject(AAOptions)
    .chartSet(AAObject(AAChart)
              .typeSet(AAChartTypePie))
    .titleSet(AAObject(AATitle)
              .textSet(@"渠道销售额<br>占比")//标题文本内容
              .alignSet(AAChartTitleAlignTypeCenter)//标题水平居中
              .verticalAlignSet(AAChartTitleVerticalAlignTypeMiddle)//标题垂直居中
              .styleSet(AAObject(AAStyle)
                        .colorSet(@"#000000")//Title font color
                        .fontSizeSet(@"14 px")//Title font size
                        .fontWeightSet(@"bold")//Title font weight
                        )
              )
    .plotOptionsSet(AAObject(AAPlotOptions)
                    .seriesSet(AAObject(AASeries)
                               .animationSet(AAObject(AAAnimation)
                                             .easingSet(@"bounce")
                                             .durationSet(@1000)
                                             )
                               )
                    .pieSet(AAObject(AAPie)
                            .showInLegendSet(true)
                            .dataLabelsSet(AAObject(AADataLabels)
                                           .enabledSet(false)
                                           //.formatSet(@"{point.percentage:.1f}%")
                                           )
                            )
                    )
    .legendSet(AAObject(AALegend)
               .enabledSet(true)
               .verticalAlignSet(AALegendVerticalAlignTypeTop)
               .layoutSet(AALegendLayoutTypeVertical)
               .alignSet(AALegendAlignTypeCenter)
               )
    .seriesSet(@[
                 AAObject(AASeriesElement)
                 .nameSet(@"语言热度值")
                 //                 .sizeSet(@300)//环形图的半径大小
                 .innerSizeSet(@"60%")//内部圆环半径大小占比
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
    .colorsSet(@[@"#1E90FF",@"#e7a701",@"#50c18d",@"#fd4800",@"#F4A460"]);//设置颜色主题
    
    return aaOptions;
    
    
    //下面是另一种更清晰的写法
    AAChart *aaChart = AAObject(AAChart)
    .typeSet(AAChartTypePie);
    
    //标题
    AATitle *aaTitle = AAObject(AATitle)
    .textSet(@"渠道销售额<br>占比")//标题文本内容
    .alignSet(AAChartTitleAlignTypeCenter)//标题水平居中
    .verticalAlignSet(AAChartTitleVerticalAlignTypeMiddle)//标题垂直居中
    .styleSet(AAObject(AAStyle)
              .colorSet(@"#000000")//Title font color
              .fontSizeSet(@"14 px")//Title font size
              .fontWeightSet(@"bold")//Title font weight
              );
    
    AAPlotOptions *aaPlotOptions = (AAObject(AAPlotOptions)
                                    .seriesSet(AAObject(AASeries)
                                               .animationSet(AAObject(AAAnimation)
                                                             .easingSet(@"bounce")
                                                             .durationSet(@1000)
                                                             )
                                               )
                                    .pieSet(AAObject(AAPie)
                                            .showInLegendSet(true)
                                            .dataLabelsSet(AAObject(AADataLabels)
                                                           .enabledSet(true)
                                                           .formatSet(@"{point.percentage:.1f}%"))
                                            )
                                    );
    
    //数据源
    NSArray *aaSeries = @[
                          AAObject(AASeriesElement)
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
    
    AAOptions *chartOptions = AAObject(AAOptions);
    chartOptions.chart = aaChart;
    chartOptions.title = aaTitle;
    chartOptions.plotOptions = aaPlotOptions;
    chartOptions.series = aaSeries;
    chartOptions.colors = aaColors;
}

- (AAOptions *)configureTheAAOptionsOfSpecialNestedColumnChart {
    
    //    第一种写法
    AAOptions *aaOptions = AAObject(AAOptions)
    .chartSet(AAObject(AAChart)
              .typeSet(AAChartTypeColumn))
    .titleSet(AAObject(AATitle)
              .textSet(@"分公司效率优化嵌套图"))
    .xAxisSet(AAObject(AAXAxis)
              .categoriesSet(@[@"伦敦总部",@"柏林分部",@"纽约分部",]))
    .yAxisSet((id)@[AAObject(AAYAxis)
                    .visibleSet(true)
                    .minSet(0)
                    .titleSet(AAObject(AATitle)
                              .textSet(@"雇员")),
                    AAObject(AAYAxis)
                    .visibleSet(true)
                    .titleSet(AAObject(AATitle)
                              .textSet(@"利润 (millions)"))
                    .oppositeSet(true)
                    ])
    .tooltipSet(AAObject(AATooltip)
                .sharedSet(true))
    .plotOptionsSet(AAObject(AAPlotOptions)
                    .seriesSet(AAObject(AASeries)
                               .animationSet(AAObject(AAAnimation)
                                             .easingSet(@"bounce")
                                             .durationSet(@1000)
                                             )
                               )
                    .columnSet(AAObject(AAColumn)
                               .groupingSet(false)
                               .borderWidthSet(@0)))
    .seriesSet(@[@{
                     @"name": @"雇员",
                     @"color": @"rgba(165,170,217,1)",
                     @"data": @[@150, @73, @20],
                     @"pointPadding": @0.3,
                     @"pointPlacement": @-0.2
                     }, @{
                     @"name": @"优化的员工",
                     @"color": @"rgba(126,86,134,.9)",
                     @"data": @[@140, @90, @40],
                     @"pointPadding": @0.4,
                     @"pointPlacement": @-0.2
                     }, @{
                     @"name": @"利润",
                     @"color": @"rgba(248,161,63,1)",
                     @"data": @[@183.6, @178.8, @198.5],
                     @"tooltip": @{
                             @"valuePrefix": @"$",
                             @"valueSuffix": @" M"
                             },
                     @"pointPadding": @0.3,
                     @"pointPlacement": @0.2,
                     @"yAxis": @1
                     }, @{
                     @"name": @"优化的利润",
                     @"color": @"rgba(186,60,61,.9)",
                     @"data": @[@203.6, @198.8, @208.5],
                     @"tooltip": @{
                             @"valuePrefix": @"$",
                             @"valueSuffix": @" M"
                             },
                     @"pointPadding": @0.4,
                     @"pointPlacement": @0.2,
                     @"yAxis": @1
                     }]);
    
    return aaOptions;
    
   // 下面是更清晰的另一种写法
    AAChart *aaChart = AAObject(AAChart)
    .typeSet(AAChartTypeColumn);
    
    AATitle *aaTitle = AAObject(AATitle)
    .textSet(@"分公司效率优化嵌套图");
    
    AAXAxis *aaXAxis = AAObject(AAXAxis)
    .categoriesSet(@[@"伦敦总部",@"柏林分部",@"纽约分部",]);
    
    AAYAxis *aaYAxis1 =
    AAObject(AAYAxis)
    .visibleSet(true)
    .minSet(0)
    .titleSet(AAObject(AATitle)
              .textSet(@"雇员"));
    
    AAYAxis *aaYAxis2 =
    AAObject(AAYAxis)
    .visibleSet(true)
    .titleSet(AAObject(AATitle)
              .textSet(@"利润 (millions)"))
    .oppositeSet(true);
    
    AATooltip *aaTooltip = AAObject(AATooltip).sharedSet(true);
    AAPlotOptions *aaPlotOptions = AAObject(AAPlotOptions)
    .seriesSet(AAObject(AASeries)
               .animationSet(AAObject(AAAnimation)
                             .easingSet(@"bounce")
                             .durationSet(@1000)
                             )
               )
    .columnSet(AAObject(AAColumn)
               .groupingSet(false)
               .borderWidthSet(@0));
    
    NSArray *aaSeries = @[@{
                              @"name": @"雇员",
                              @"color": @"rgba(165,170,217,1)",
                              @"data": @[@150, @73, @20],
                              @"pointPadding": @0.3,
                              @"pointPlacement": @-0.2
                              }, @{
                              @"name": @"优化的员工",
                              @"color": @"rgba(126,86,134,.9)",
                              @"data": @[@140, @90, @40],
                              @"pointPadding": @0.4,
                              @"pointPlacement": @-0.2
                              }, @{
                              @"name": @"利润",
                              @"color": @"rgba(248,161,63,1)",
                              @"data": @[@183.6, @178.8, @198.5],
                              @"tooltip": @{
                                      @"valuePrefix": @"$",
                                      @"valueSuffix": @" M"
                                      },
                              @"pointPadding": @0.3,
                              @"pointPlacement": @0.2,
                              @"yAxis": @1
                              }, @{
                              @"name": @"优化的利润",
                              @"color": @"rgba(186,60,61,.9)",
                              @"data": @[@203.6, @198.8, @208.5],
                              @"tooltip": @{
                                      @"valuePrefix": @"$",
                                      @"valueSuffix": @" M"
                                      },
                              @"pointPadding": @0.4,
                              @"pointPlacement": @0.2,
                              @"yAxis": @1
                              }];
    
    AAOptions *chartOptions = AAObject(AAOptions);
    chartOptions.chart = aaChart;
    chartOptions.title = aaTitle;
    chartOptions.xAxis = aaXAxis;
    chartOptions.yAxis = (id)@[aaYAxis1,aaYAxis2];
    chartOptions.tooltip = aaTooltip;
    chartOptions.plotOptions = aaPlotOptions;
    chartOptions.series = aaSeries;

}

- (AAOptions *)configureThePolygonPolarChart {
    AAChartModel *aaChartModel= AAObject(AAChartModel)
    .chartTypeSet(AAChartTypeArea)//图表类型
    .titleSet(@"")//图表主标题
    .subtitleSet(@"")//图表副标题
    .colorsThemeSet(@[@"#fe117c",@"#ffc069",@"#06caf4",@"#7dffc0"])//设置主体颜色数组
    .yAxisTitleSet(@"")//设置 Y 轴标题
    .tooltipValueSuffixSet(@"℃")//设置浮动提示框单位后缀
    .backgroundColorSet(@"#222733")
    .yAxisGridLineWidthSet(@1)//y轴横向分割线宽度为0(即是隐藏分割线)
    .xAxisGridLineWidthSet(@0.5)
    .markerRadiusSet(@0)
    .gradientColorEnabledSet(true)
    .polarSet(true)
    .seriesSet(@[
                 AAObject(AASeriesElement)
                 .nameSet(@"2017")
                 .dataSet(@[@7.0, @6.9, @9.5, @14.5, @18.2, @21.5, @25.2, @26.5, @23.3, @18.3, @13.9, @9.6]),
                 AAObject(AASeriesElement)
                 .nameSet(@"2018")
                 .dataSet(@[@0.2, @0.8, @5.7, @11.3, @17.0, @22.0, @24.8, @24.1, @20.1, @14.1, @8.6, @2.5]),
                 AAObject(AASeriesElement)
                 .nameSet(@"2019")
                 .dataSet(@[@0.9, @0.6, @3.5, @8.4, @13.5, @17.0, @18.6, @17.9, @14.3, @9.0, @3.9, @1.0]),
                 AAObject(AASeriesElement)
                 .nameSet(@"2020")
                 .dataSet(@[@3.9, @4.2, @5.7, @8.5, @11.9, @15.2, @17.0, @16.6, @14.2, @10.3, @6.6, @4.8]),
                 ]
               );
    
    AAOptions *aaOptions = [AAOptionsConstructor configureChartOptionsWithAAChartModel:aaChartModel];
    aaOptions.xAxis.lineWidth = @0;
    aaOptions.yAxis.gridLineInterpolation = AAYAxisGridLineInterpolationPolygon;
    return aaOptions;
}

- (AAOptions *)configureTheNoGapColunmChart {
    AAChartModel *aaChartModel= AAObject(AAChartModel)
    .chartTypeSet(AAChartTypeColumn)//图表类型
    .titleSet(@"中间缝隙很小的柱状图")//图表主标题
    .subtitleSet(@"调整一下groupPadding即可")//图表副标题
    .colorsThemeSet(@[@"#fe117c",@"#ffc069",@"#06caf4",@"#7dffc0"])//设置主体颜色数组
    .yAxisTitleSet(@"")//设置 Y 轴标题
    .tooltipValueSuffixSet(@"℃")//设置浮动提示框单位后缀
//    .backgroundColorSet(@"#222733")
    .yAxisGridLineWidthSet(@1)//y轴横向分割线宽度为0(即是隐藏分割线)
    .xAxisGridLineWidthSet(@0.5)
    .markerRadiusSet(@0)
    .seriesSet(@[
                 AAObject(AASeriesElement)
                 .nameSet(@"2020")
                 .dataSet(@[@3.9, @4.2, @5.7, @8.5, @11.9, @15.2,]),
                 ]
               );
    
    
    AAOptions *aaOptions = [AAOptionsConstructor configureChartOptionsWithAAChartModel:aaChartModel];
    aaOptions.plotOptions.column.groupPadding = @0;//设置棱柱之间的间距百分比
    aaOptions.plotOptions.column.dataLabels = (id)@{
                                                @"enabled": @true,
                                                @"verticalAlign": @"bottom",
                                                @"y": @(-10),
                                                @"shape":@"callout",
                                                @"backgroundColor":@"rgba(0, 0, 0, 0.75)",
                                                @"style": @{
                                                        @"color":@"#FFFFFF",
                                                        @"textOutline":@"none"
                                                        }
                                                };
    return aaOptions;
}

- (AAOptions *)configureCustomStyleTooltipChart {
    AAChartModel *aaChartModel = AAObject(AAChartModel)
    .chartTypeSet(AAChartTypeArea)//图表类型
    .titleSet(@"近三个月金价起伏周期图")//图表主标题
    .subtitleSet(@"金价(元/克)")//图表副标题
    .colorsThemeSet(@[@"#FFD700"/*(纯金色)*/,@"#ffc069",@"#06caf4",@"#7dffc0"])//设置主体颜色数组
    .symbolStyleSet(AAChartSymbolStyleTypeBorderBlank)//折线连接点样式为外边缘空白
    .xAxisTickIntervalSet(@15)//x轴刻度点间隔数(设置每隔几个点显示一个 X轴的内容)
    .yAxisTitleSet(@"")//设置 Y 轴标题
    .yAxisGridLineWidthSet(@0.8)//y轴横向分割线宽度(为0即是隐藏分割线)
    .categoriesSet(@[@"10-01",@"10-02",@"10-03",@"10-04",@"10-05",@"10-06",@"10-07",@"10-08",@"10-09",@"10-10",@"10-11",@"10-12",@"10-13",@"10-14",@"10-15",@"10-16",@"10-17",@"10-18",@"10-19",@"10-20",@"10-21",@"10-22",@"10-23",@"10-024",@"10-25",@"10-26",@"10-27",@"10-28",@"10-29",@"10-30",@"10-31",@"11-01",@"11-02",@"11-03",@"11-04",@"11-05",@"11-06",@"11-07",@"11-08",@"11-09",@"11-10",@"11-11",@"11-12",@"11-13",@"11-14",@"11-15",@"11-16",@"11-17",@"11-18",@"11-19",@"11-20",@"11-21",@"11-22",@"11-23",@"11-024",@"11-25",@"11-26",@"11-27",@"11-28",@"11-29",@"11-30",@"12-01",@"12-02",@"12-03",@"12-04",@"12-05",@"12-06",@"12-07",@"12-08",@"12-09",@"12-10",@"12-11",@"12-12",@"12-13",@"12-14",@"12-15",@"12-16",@"12-17",@"12-18",@"12-19",@"12-20",@"12-21",@"12-22",@"12-23",@"12-024",@"12-25",@"12-26",@"12-27",@"12-28",@"12-29",@"12-30"])
    .seriesSet(@[
                 AAObject(AASeriesElement)
                 .lineWidthSet(@1.5)
                 .fillOpacitySet(@0.4)
                 .nameSet(@"2018")
                 .dataSet(@[@1.51, @6.7, @0.94, @1.44, @1.6, @1.63, @1.56, @1.91, @2.45, @3.87, @3.24, @4.90, @4.61, @4.10, @4.17, @3.85, @4.17, @3.46, @3.46, @3.55, @3.50, @4.13, @2.58, @2.28,@1.51, @12.7, @0.94, @1.44, @18.6, @1.63, @1.56, @1.91, @2.45, @3.87, @3.24, @4.90, @4.61, @4.10, @4.17, @3.85, @4.17, @3.46, @3.46, @3.55, @3.50, @4.13, @2.58, @2.28,@1.33, @4.68, @1.31, @1.10, @13.9, @1.10, @1.16, @1.67, @2.64, @2.86, @3.00, @3.21, @4.14, @4.07, @3.68, @3.11, @3.41, @3.25, @3.32, @3.07, @3.92, @3.05, @2.18, @3.24,@3.23, @3.15, @2.90, @1.81, @2.11, @2.43, @5.59, @3.09, @4.09, @6.14, @5.33, @6.05, @5.71, @6.22, @6.56, @4.75, @5.27, @6.02, @5.48])
                 ]
               );
    
    /*Custom Tooltip Style --- 自定义图表浮动提示框样式及内容*/
    AAOptions *options = [AAOptionsConstructor configureChartOptionsWithAAChartModel:aaChartModel];
    AATooltip *tooltip = options.tooltip;
    tooltip
    .useHTMLSet(true)
    .headerFormatSet(@"{series.name}-<b>{point.key}</b> &nbsp12:00<br>")
    .pointFormatSet(@"<b>{point.y}</b>&nbsp元/克")
    .valueDecimalsSet(@2)//设置取值精确到小数点后几位
    .backgroundColorSet(@"#000000")
    .borderColorSet(@"#000000")
    .styleSet(@{@"color":@"#FFD700"/*(纯金色)*/,
                @"fontSize":@"12px",})
    ;

    return options;
    
    
}

- (AAOptions *)adjustChartLeftAndRightMargin {
    AAChartModel *aaChartModel= AAObject(AAChartModel)
    .chartTypeSet(AAChartTypeColumn)//图表类型
    .titleSet(@"")//图表主标题
    .subtitleSet(@"")//图表副标题
    .colorsThemeSet(@[@"#fe117c",@"#ffc069",@"#06caf4",@"#7dffc0"])//设置主体颜色数组
    .yAxisTitleSet(@"")//设置 Y 轴标题
    .polarSet(true)
    .categoriesSet(@[@"Java", @"Swift", @"Python", @"Ruby", @"PHP", @"Go", @"C", @"C#", @"C++", @"Perl", @"R", @"MATLAB", @"SQL"])
    .seriesSet(@[
                 AAObject(AASeriesElement)
                 .nameSet(@"2017")
                 .dataSet(@[@7.0, @6.9, @9.5, @14.5, @18.2, @21.5, @25.2, @26.5, @23.3, @18.3, @13.9, @9.6]),
                 ]
               );
    
    AAOptions *aaOptions = [AAOptionsConstructor configureChartOptionsWithAAChartModel:aaChartModel];
    aaOptions.chart.marginLeft = @70;
    aaOptions.chart.marginRight = @70;
    return aaOptions;
}

@end
