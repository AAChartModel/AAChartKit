
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

#import "AADateUTCTool.h"
@interface DrawChartWithAAOptionsVC ()

@end

@implementation DrawChartWithAAOptionsVC

- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor = [UIColor whiteColor];
    self.title = self.navigationItemTitle;
    
    AAChartView *aaChartView =[[AAChartView alloc]initWithFrame:CGRectMake(0, 0, self.view.frame.size.width, self.view.frame.size.height)];
    aaChartView.contentHeight = aaChartView.frame.size.height-80;
    [self.view addSubview:aaChartView];
    aaChartView.scrollEnabled = NO;
    
    AAOptions *aaOptions = [self configureChartOptions];
    [aaChartView aa_drawChartWithOptions:aaOptions];
    
}

- (AAOptions *)configureChartOptions {
    switch (self.selectedIndex) {
        case 0: return [self configureTheAAOptionsOfAreaChart];
        case 1: return [self configureTheAAOptionsOfPieChart];
        case 2: return [self adjustPieChartTitleAndDataLabelFontStyle];
        case 3: return [self configureTheAAOptionsOfSpecialNestedColumnChart];
        case 4: return [self configureThePolygonPolarChart];
        case 5: return [self configureTheNoGapColunmChart];
        case 6: return [self configureCustomStyleTooltipChart];
        case 7: return [self adjustChartLeftAndRightMargin];
        case 8: return [self configureChartWithBackgroundImage];
        case 9: return [self configureDoubleYAxisChartOptions];
        case 10: return [self adjustChartSeriesDataAccuracy];
        case 11: return [self adjustGroupPaddingForPolarChart];
        case 12: return [self customStyleStackedColumnChart];
        case 13: return [self specialStyleStepLineChart];
        case 14: return [self disableChartAnimation];//禁用图表的渲染动画效果
        case 15: return [self customChartLengendItemStyle];//自定义图表的 legend 图例样式

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
                                             .easingSet(AAChartAnimationBounce)
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
                                                             .easingSet(AAChartAnimationBounce)
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
    
    return chartOptions;
}

- (AAOptions *)adjustPieChartTitleAndDataLabelFontStyle {
    AAOptions *aaOptions = AAObject(AAOptions)
    .chartSet(AAObject(AAChart)
              .typeSet(AAChartTypePie))
    .titleSet(AAObject(AATitle)
              .useHTMLSet(true)
              .textSet(@"<span style=""color:#1E90FF;font-weight:thin;font-size:13px""> &nbsp&nbsp&nbsp近七天 </span>  <br> <span style=""color:#A9A9A9;font-weight:thin;font-size:10px""> 运行状态占比 </span>")//标题文本内容
              .alignSet(AAChartTitleAlignTypeCenter)//标题水平居中
              .verticalAlignSet(AAChartTitleVerticalAlignTypeMiddle)//标题垂直居中
              .ySet(@0)//标题相对于垂直对齐的偏移量，取值范围：图表的上边距（chart.spacingTop ）到图表的下边距（chart.spacingBottom），可以是负值，单位是px。默认值和字体大小有关。
              )
    .colorsSet(@[@"#1E90FF",@"#87CEFA",@"#A9A9A9",@"#fd4800",@"#F4A460"])//设置颜色主题
    .seriesSet(@[
                 AAObject(AASeriesElement)
                 .sizeSet(@200)//环形图的半径大小
                 .innerSizeSet(@"60%")//内部圆环半径大小占比
                 .allowPointSelectSet(false)//是否允许在点击数据点标记(扇形图点击选中的块发生位移)
                 .dataLabelsSet(AAObject(AADataLabels)
                                .enabledSet(true)
                                .useHTMLSet(true)
                                .distanceSet(@10)
                                .formatSet(@"<span style=""color:#A9A9A9;font-weight:thin;font-size:10px"">{point.name}</span> <span style=""color:#1E90FF;font-weight:bold;font-size:15px"">{point.percentage:.1f}</span><span style=""color:#1E90FF;font-weight:thin;font-size:10px"">%</span>")
                                )
                 .dataSet(
                          @[
                            @[@"Firefox",   @150],
                            @[@"Opera",      @15],
                            @[@"Others",    @35]
                            ]
                          ),
                 ]);
    
    return aaOptions;
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
                                             .easingSet(AAChartAnimationBounce)
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
                             .easingSet(AAChartAnimationBounce)
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
    
    return chartOptions;

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
                                                @"enabled": @(true),
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
                 AAObject(AASeriesElement)
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

- (AAOptions *)configureChartWithBackgroundImage {
    AAChartModel *aaChartModel= AAObject(AAChartModel)
    .chartTypeSet(AAChartTypePie)
    .titleSet(@"编程语言热度")
    .subtitleSet(@"虚拟数据")
    .dataLabelEnabledSet(true)//是否直接显示扇形图数据
    .yAxisTitleSet(@"摄氏度")
    .seriesSet(
               @[AAObject(AASeriesElement)
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
    AATitle *aaTitle = AAObject(AATitle)
    .textSet(@"双Y轴混合图");
    
    AALabels *labels = (AAObject(AALabels)
                        .enabledSet(true)//设置 y 轴是否显示数字
                        .styleSet(AAObject(AAStyle)
                                  .colorSet(@"#ff0000")//yAxis Label font color
                                  .fontSizeSet(@"15px")//yAxis Label font size
                                  .fontWeightSet(AAChartFontWeightTypeBold)//yAxis Label font weight
                                  )
                        .formatSet(@"{value:.,0f}°C")//让y轴的值完整显示 而不是100000显示为100k,同时单位后缀为°C
                        );
    
    AAYAxis *yAxisOne = AAObject(AAYAxis)
    .visibleSet(true)
    .labelsSet(labels)
    .titleSet(AAObject(AATitle)
              .textSet(@"温度")
              )
    .oppositeSet(true);
    
    
    AAYAxis *yAxisTwo = AAObject(AAYAxis)
    .visibleSet(true)
    .labelsSet(labels.formatSet(@"{value}mm"))
    .titleSet(AAObject(AATitle)
              .textSet(@"降雨量")
              );
    
    
    NSArray *yAxisArr = @[yAxisOne,// Primary yAxis
                          yAxisTwo // Secondary yAxis
                          ];
    AATooltip *aaTooltip = AAObject(AATooltip).sharedSet(true).enabledSet(true);
    NSArray *aaSeries = @[
                          AAObject(AASeriesElement)
                          .nameSet(@"2017")
                          .typeSet(AAChartTypeColumn)
                          .yAxisSet(@1)
                          .dataSet(@[@7.0, @6.9, @9.5, @14.5, @18.2, @21.5, @25.2, @26.5, @23.3, @18.3, @13.9, @9.6])
                          .dataLabelsSet(AAObject(AADataLabels)
                                         .enabledSet(true)
                                         )
                          ,
                          AAObject(AASeriesElement)
                          .nameSet(@"2018")
                          .typeSet(AAChartTypeLine)
                          .dataSet(@[@0.2, @0.8, @5.7, @11.3, @17.0, @22.0, @24.8, @24.1, @20.1, @14.1, @8.6, @2.5])
                          .dataLabelsSet(AAObject(AADataLabels)
                                         .enabledSet(true)
                                         )
                          ];
    
    AAOptions *chartOptions = AAObject(AAOptions);
    chartOptions.title = aaTitle;
    chartOptions.yAxis = (id)yAxisArr;
    chartOptions.tooltip = aaTooltip;
    chartOptions.series = aaSeries;
    
    return chartOptions;
}


- (AAOptions *)adjustChartSeriesDataAccuracy {
    AAChartModel *aaChartModel = AAObject(AAChartModel)
    .chartTypeSet(AAChartTypeArea)
    .titleSet(@"Adjust data accuracy")
    .yAxisTitleSet(@"")
    .dataLabelEnabledSet(true)
    .symbolSet(AAChartSymbolTypeCircle)
    .markerRadiusSet(@6)//设置折线连接点宽度为0,即是隐藏连接点
    .yAxisGridLineWidthSet(@0.5)
    .symbolStyleSet(AAChartSymbolStyleTypeInnerBlank)
    .seriesSet(@[AAObject(AASeriesElement)
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
    AAChartModel *aaChartModel = AAObject(AAChartModel)
    .chartTypeSet(AAChartTypeColumn)
    .titleSet(@"Colorful Column Chart")
    .subtitleSet(@"single data array colorful column chart")
    .borderRadiusSet(@5)
    .polarSet(true)
    .seriesSet(@[
                 AAObject(AASeriesElement)
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
    AAChart *aaChart = AAObject(AAChart)
                        .typeSet(AAChartTypeColumn);

    AATitle *aaTitle = AAObject(AATitle)
                        .textSet(@"Stacked column chart");

    AAXAxis *aaXAsix = AAObject(AAXAxis)
                        .visibleSet(true)
                        .categoriesSet(@[@"Apples", @"Oranges", @"Pears", @"Grapes", @"Bananas"]);

    AAYAxis *aaYAxis = AAObject(AAYAxis)
                        .visibleSet(true)
                        .minSet(@0)
                        .titleSet(AAObject(AATitle)
                                  .textSet(@"Total fruit consumption")
                                  )
                        .stackLabelsSet(AAObject(AALabels)
                                        .enabledSet(true)
                                        .styleSet(AAObject(AAStyle)
                                                  .fontWeightSet(AAChartFontWeightTypeBold)
                                                  )
                                        );

    AALegend *aaLegend = AAObject(AALegend)
                          .enabledSet(true)
                          .alignSet(AALegendAlignTypeRight)
                          .xSet(@(-30))
                          .verticalAlignSet(AALegendVerticalAlignTypeTop)
                          .ySet(@25)
                          .borderColorSet(@"#ccc")
                          .borderWidthSet(@1);

    AATooltip *aaTooltip = AAObject(AATooltip)
                            .headerFormatSet(@"<b>{point.x}</b><br/>")
                            .pointFormatSet(@"{series.name}: {point.y}<br/>Total: {point.stackTotal}");

    AAPlotOptions *aaPlotOptions = AAObject(AAPlotOptions)
                                    .seriesSet(AAObject(AASeries)
                                               .animationSet(AAObject(AAAnimation)
                                                             .easingSet(AAChartAnimationBounce)
                                                             .durationSet(@1000)
                                                             )
                                               )
                                    .columnSet(AAObject(AAColumn)
                                               .stackingSet(AAChartStackingTypeNormal)
                                               .dataLabelsSet(AAObject(AADataLabels)
                                                              .enabledSet(true)
                                                              )
                                               );

    NSArray *seriesElementArr = @[
                                  AAObject(AASeriesElement)
                                  .nameSet(@"John")
                                  .dataSet(@[@5, @3, @4, @7, @2]),
                                  AAObject(AASeriesElement)
                                  .nameSet(@"Jane")
                                  .dataSet(@[@5, @3, @4, @7, @2]),
                                  AAObject(AASeriesElement)
                                  .nameSet(@"Joe")
                                  .dataSet(@[@5, @3, @4, @7, @2]),
                                  ];

    AAOptions *aaOptions = AAObject(AAOptions)
    .chartSet(aaChart)
    .titleSet(aaTitle)
    .xAxisSet(aaXAsix)
    .yAxisSet(aaYAxis)
    .legendSet(aaLegend)
    .tooltipSet(aaTooltip)
    .plotOptionsSet(aaPlotOptions)
    .seriesSet(seriesElementArr);

    return aaOptions;


     // Method 2
    AAOptions *options2 = AAObject(AAOptions)
    .chartSet(AAObject(AAChart)
              .typeSet(AAChartTypeColumn)
              )
    .titleSet(AAObject(AATitle)
              .textSet(@"Stacked column chart")
              )
    .xAxisSet(AAObject(AAXAxis)
              .visibleSet(true)
              .categoriesSet(@[@"Apples", @"Oranges", @"Pears", @"Grapes", @"Bananas"])
              )
    .yAxisSet(AAObject(AAYAxis)
              .visibleSet(true)
              .minSet(@0)
              .titleSet(AAObject(AATitle)
                        .textSet(@"Total fruit consumption")
                        )
              .stackLabelsSet(AAObject(AALabels)
                              .enabledSet(true)
                              .styleSet(AAObject(AAStyle)
                                        .fontWeightSet(AAChartFontWeightTypeBold)
                                        )
                              )
              )
    .legendSet(AAObject(AALegend)
               .enabledSet(true)
               .alignSet(AALegendAlignTypeRight)
               .xSet(@(-30))
               .verticalAlignSet(AALegendVerticalAlignTypeTop)
               .ySet(@25)
               .borderColorSet(@"#ccc")
               .borderWidthSet(@1)
               )
    .tooltipSet(AAObject(AATooltip)
                .headerFormatSet(@"<b>{point.x}</b><br/>")
                .pointFormatSet(@"{series.name}: {point.y}<br/>Total: {point.stackTotal}")
                )
    .plotOptionsSet(AAObject(AAPlotOptions)
                    .seriesSet(AAObject(AASeries)
                               .animationSet(AAObject(AAAnimation)
                                             .easingSet(AAChartAnimationBounce)
                                             .durationSet(@1000)
                                             )
                               )
                    .columnSet(AAObject(AAColumn)
                               .stackingSet(AAChartStackingTypeNormal)
                               .dataLabelsSet(AAObject(AADataLabels)
                                              .enabledSet(true)
                                              )
                               )
                    )
    .seriesSet(@[
                 AAObject(AASeriesElement)
                 .nameSet(@"John")
                 .dataSet(@[@5, @3, @4, @7, @2]),
                 AAObject(AASeriesElement)
                 .nameSet(@"Jane")
                 .dataSet(@[@5, @3, @4, @7, @2]),
                 AAObject(AASeriesElement)
                 .nameSet(@"Joe")
                 .dataSet(@[@5, @3, @4, @7, @2]),
                 ]);

    return options2;
    
    //Method 3
    AAOptions *options3 = (id)@{
                            @"chart": @{
                                    @"type": @"column"
                                    },
                            @"title": @{
                                    @"text": @"Stacked column chart"
                                    },
                            @"xAxis": @{
                                    @"categories": @[@"Apples", @"Oranges", @"Pears", @"Grapes", @"Bananas"]
                                    },
                            @"yAxis": @{
                                    @"min": @0,
                                    @"title": @{
                                            @"text": @"Total fruit consumption"
                                            },
                                    @"stackLabels": @{
                                            @"enabled": @(true),
                                            @"style": @{
                                                    @"fontWeight": @"bold",
                                                    }
                                            }
                                    },
                            @"legend": @{
                                    @"align": @"right",
                                    @"x": @-30,
                                    @"verticalAlign": @"top",
                                    @"y": @25,
                                    @"floating": @(true),
                                    
                                    @"borderColor": @"#CCC",
                                    @"borderWidth": @1,
                                    @"shadow": @(false)
                                    },
                            @"tooltip": @{
                                    @"headerFormat": @"<b>{point.x}</b><br/>",
                                    @"pointFormat": @"{series.name}: {point.y}<br/>Total: {point.stackTotal}"
                                    },
                            @"plotOptions": @{
                                    @"series":@{
                                            @"animation":@{
                                                    @"easing":@(AAChartAnimationBounce),
                                                    @"duration":@1000
                                                    }
                                            },
                                    @"column": @{
                                            @"stacking": @"normal",
                                            @"dataLabels": @{
                                                    @"enabled": @(true),
                                                    
                                                    }
                                            }
                                    },
                            @"series": @[@{
                                             @"name": @"John",
                                             @"data": @[@5, @3, @4, @7, @2]
                                             }, @{
                                             @"name": @"Jane",
                                             @"data": @[@2, @2, @3, @2, @1]
                                             }, @{
                                             @"name": @"Joe",
                                             @"data": @[@3, @4, @4, @2, @5]
                                             }]
                            };
    
    return options3;
}

- (AAOptions *)specialStyleStepLineChart {
    
    //Method 1
    AAChartModel *aaChartModel = AAObject(AAChartModel)
    .chartTypeSet(AAChartTypeLine)//图形类型
    .animationTypeSet(AAChartAnimationBounce)//图形渲染动画类型为"bounce"
    .titleSet(@"STEP LINE CHART")//图形标题
    .subtitleSet(@"2020/08/08")//图形副标题
    .dataLabelEnabledSet(NO)//是否显示数字
    .symbolStyleSet(AAChartSymbolStyleTypeBorderBlank)//折线连接点样式
    .markerRadiusSet(@7)//折线连接点半径长度,为0时相当于没有折线连接点
    .seriesSet(@[
                 AAObject(AASeriesElement)
                 .nameSet(@"價格")
                 .colorSet(@"#003386")
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
                 AAObject(AASeriesElement)
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
//    return aaOptions;
    
 //Method 2
  NSDictionary *aaOptions2 = @{
                   @"title": @false,
                   @"credits": @false,
                   @"chart": @{
                           @"type": @"line",
                           @"backgroundColor": @"#ffffff"
                           },
                   @"plotOptions": @{
                           @"series":@{
                                   @"animation":@{
                                           @"easing":@(AAChartAnimationLinear),
                                           @"duration":@1000
                                           }
                                   },
                           @"line": @{
                                   @"color": @"#003386",
                                   @"lineWidth": @1,
                                   @"dataLabels": @{
                                           @"enabled": @false,
                                           @"backgroundColor": @"rgba(255, 255, 255, 1.0)",
                                           @"format": @"{y} HK$",
                                           @"zIndex": @3
                                           },
                                   @"enableMouseTracking": @true,
                                   @"marker": @{
                                           @"fillColor": @"white",
                                           @"symbol": @"circle",
                                           @"lineWidth": @1,
                                           @"lineColor": @"#003386"
                                           }
                                   }
                           },
                   @"legend": @{
                           @"layout": @"horizontal",
                           @"align": @"left",
                           @"verticalAlign": @"bottom"
                           },
                   @"tooltip": @{
                           @"shared": @true,
                           @"shadow": @false,
                           @"crosshairs": @true,
                           @"backgroundColor": @"#fff",
                           @"borderColor": @"#5177b4",
                           @"borderWidth": @1,
                           @"xDateFormat": @"%Y-%m-%d",
                           @"valueSuffix": @"  HK$"
                           },
                   @"xAxis": @{
                           @"type": @"datetime",
                           @"dateTimeLabelFormats": @{
                                   @"month": @"%e.%m.%y"
                                   }
                           },
                   @"yAxis": @{
                           @"title": @false,
                           @"tickPixelInterval": @40,
                           @"alternateGridColor": @"#fafafa",
                           @"gridLineColor": @"#f0f0f0",
                           @"gridLineDashStyle": @"dash",
                           @"labels": @{
                                   @"enabled": @true,
                                   @"format": @"{value} HK$"
                                   },
                           @"min": @0,
                           @"showFirstLabel": @false
                           },
                   @"series": @[@{
                                     @"zIndex": @2,
                                     @"name": @"價格",
                                     @"color": @"#003386",
                                     @"step": @"left",
                                     @"data": @[
                                             @[@1472774400000, @389],
                                             @[@1475539200000, @350.1],
                                             @[@1475539200000, @350.1],
                                             @[@1476662400000, @389],
                                             @[@1479945600000, @233.4],
                                             @[@1480377600000, @389],
                                             @[@1482192000000, @233.4],
                                             @[@1483574400000, @389],
                                             @[@1485907200000, @233.4],
                                             @[@1486598400000, @389],
                                             @[@1493164800000, @233.4],
                                             @[@1494288000000, @389],
                                             @[@1500422400000, @291.75],
                                             @[@1501632000000, @389],
                                             @[@1508284800000, @155.6],
                                             @[@1509408000000, @389],
                                             @[@1511222400000, @194.5],
                                             @[@1511827200000, @389],
                                             @[@1511913600000, @194.5],
                                             @[@1513123200000, @389],
                                             @[@1514160000000, @194.5],
                                             @[@1515456000000, @389],
                                             @[@1518048000000, @194.5],
                                             @[@1519171200000, @389],
                                             @[@1520467200000, @155.6],
                                             @[@1521331200000, @389],
                                             @[@1528416000000, @155.6],
                                             @[@1529280000000, @389],
                                             @[@1531353600000, @194.5],
                                             @[@1532052447381, @194.5]
                                             ]
                                     }, @{
                                     @"zIndex": @1,
                                     @"name": @"PS+",
                                     @"color": @"#FFC535",
                                     @"marker": @{
                                             @"lineColor": @"#FFC535"
                                             },
                                     @"step": @"left",
                                     @"data": @[
                                             @[@1472774400000, @389],
                                             @[@1475539200000, @311.2],
                                             @[@1475539200000, @311.2],
                                             @[@1476662400000, @389],
                                             @[@1479945600000, @233.4],
                                             @[@1480377600000, @389],
                                             @[@1482192000000, @233.4],
                                             @[@1483574400000, @389],
                                             @[@1485907200000, @194.5],
                                             @[@1486598400000, @389],
                                             @[@1493164800000, @194.5],
                                             @[@1494288000000, @389],
                                             @[@1500422400000, @194.5],
                                             @[@1501632000000, @389],
                                             @[@1508284800000, @155.6],
                                             @[@1509408000000, @389],
                                             @[@1511222400000, @155.6],
                                             @[@1511827200000, @389],
                                             @[@1511913600000, @155.6],
                                             @[@1513123200000, @389],
                                             @[@1514160000000, @155.6],
                                             @[@1515456000000, @389],
                                             @[@1518048000000, @155.6],
                                             @[@1519171200000, @389],
                                             @[@1520467200000, @155.6],
                                             @[@1521331200000, @389],
                                             @[@1528416000000, @155.6],
                                             @[@1529280000000, @389],
                                             @[@1531353600000, @155.6],
                                             @[@1532052447381, @155.6]
                                             ]
                                     }]
                   };

    return aaOptions2;
}

- (AAOptions *)disableChartAnimation {
    AAChartModel *aaChartModel= AAObject(AAChartModel)
    .chartTypeSet(AAChartTypeColumn)//图表类型
    .seriesSet(@[
                 AAObject(AASeriesElement)
                 .nameSet(@"2018")
                 .dataSet(@[@0.2, @0.8, @5.7, @11.3, @17.0, @22.0, @24.8, @24.1, @20.1, @14.1, @8.6, @2.5]),
                 ]
               );
    AAOptions *aaOptions = [AAOptionsConstructor configureChartOptionsWithAAChartModel:aaChartModel];
    aaOptions.plotOptions.series.animation = (id)@(false);//禁用图表的渲染动画效果
    return aaOptions;
}


- (AAOptions *)customChartLengendItemStyle {
    
    AAChartModel *aaChartModel= AAObject(AAChartModel)
    .chartTypeSet(AAChartTypeLine)
    .titleSet(@"")
    .subtitleSet(@"")
    .categoriesSet(@[@"Java",@"Swift",@"Python",@"Ruby", @"PHP",@"Go",@"C",@"C#",@"C++",@"Perl",@"R",@"MATLAB",@"SQL"])
    .seriesSet(@[
                 AAObject(AASeriesElement)
                 .nameSet(@"2018")
                 .dataSet(@[@31,@22,@33,@54,@35,@36,@27,@38,@39,@54,@41,@29]),
                 ]
               );

    //设定图例项的CSS样式。只支持有关文本的CSS样式设定。 默认是：{ "color": "#333333", "cursor": "pointer", "fontSize": "12px", "fontWeight": "bold" }.
    AAItemStyle *aaItemStyle = AAObject(AAItemStyle)
    .colorSet(@"#ff0000")//字体颜色
    .cursorSet(@"pointer")//(在移动端这个属性没什么意义,其实不用设置)指定鼠标滑过数据列时鼠标的形状。当绑定了数据列点击事件时，可以将此参数设置为 "pointer"，用来提醒用户改数据列是可以点击的。
    .fontSizeSet(@"20px")//字体大小
    .fontWeightSet(AAChartFontWeightTypeThin);//字体为细体字
    
    AAOptions *aaOptions = [AAOptionsConstructor configureChartOptionsWithAAChartModel:aaChartModel];
    aaOptions.legend.itemStyle = aaItemStyle;
    
    return aaOptions;
}

@end
