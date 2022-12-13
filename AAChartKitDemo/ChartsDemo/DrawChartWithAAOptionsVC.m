
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
 * StackOverflow : https://stackoverflow.com/users/12302132/codeforu
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
        case 1:  return [self configureTheAAOptionsOfSpecialNestedColumnChart];
        case 2:  return [self configureTheNoGapColunmChart];
        case 3:  return [self adjustChartLeftAndRightMargin];
        case 4:  return [self configureChartWithBackgroundImage];
        case 5:  return [self adjustChartSeriesDataAccuracy];
        case 6:  return [self customStyleStackedColumnChart];
        case 7:  return [self disableChartAnimation];//禁用图表的渲染动画效果
        case 8:  return [self customChartLengendItemStyle];//自定义图表的 legend 图例样式
        case 9:  return [self configure_DataLabels_XAXis_YAxis_Legend_Style];//配置DataLabels、XAXis、YAxis、Legend等图表元素样式
        case 10: return [self customChartStyleWhenNoData];//数据为空的情况下,配置图表的 x 轴 y 轴等样式
        case 11: return [self customChartStyleWhenEveryDataValueIsZero];//所有数据都为 0 的情况下, 配置图表的 x 轴 y 轴等样式
        case 12: return [self disableSpineChartHoverAnimationEffect];//禁用手指点击曲线或者掠过曲线后,曲线变粗的动画效果
        case 13: return [self yAxisOnTheRightSideChart];//y轴在右侧的图表
        case 14: return [self configureBoxplotChartWithSpecialStyle];//配置箱线图特殊样式
        case 15: return [self toFixHighchartsWithAThickLineAt0ValuesTheLineIsHalfHidden];//修复 Highcharts 在数值为 0 的时候,线条会变粗,但是却被遮挡一半的问题

        default:
            break;
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
              )
    ;
    
    aaOptions.yAxis.labels.format = @"{value} €";//给y轴添加单位
    
    aaOptions.xAxis
    .gridLineColorSet(AAColor.darkGrayColor)
    .gridLineWidthSet(@1)
    .minorGridLineColorSet(AAColor.lightGrayColor)
    .minorGridLineWidthSet(@0.5)
    .minorTickIntervalSet((id)@"auto")
    ;
    
    aaOptions.yAxis
    .gridLineColorSet(AAColor.darkGrayColor)
    .gridLineWidthSet(@1)
    .minorGridLineColorSet(AAColor.lightGrayColor)
    .minorGridLineWidthSet(@0.5)
    .minorTickIntervalSet((id)@"auto")
    ;

    
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
    .minSet(@0)
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
    .colorSet(AAColor.redColor)//字体颜色
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
    
    AAStyle *dataLabelsStyle =
    [AAStyle styleWithColor:AAColor.whiteColor
                   fontSize:16
                 fontWeight:AAChartFontWeightTypeBold
                textOutline:@"0px 0px contrast"];
    
    AAStyle *axisLabelsStyle = AAStyleColor(AAColor.whiteColor);
    
    AAChartModel *aaChartModel = AAChartModel.new
    .chartTypeSet(AAChartTypeAreaspline)
    .backgroundColorSet((id)backgroundColorGradientColor)
    .stackingSet(AAChartStackingTypeNormal)
    .dataLabelsEnabledSet(true)
    .dataLabelsStyleSet(dataLabelsStyle)
    .xAxisLabelsStyleSet(axisLabelsStyle)
    .yAxisLabelsStyleSet(axisLabelsStyle)
    .yAxisVisibleSet(true)
    .categoriesSet(@[
        @"一月", @"二月", @"三月", @"四月", @"五月", @"六月",
        @"七月", @"八月", @"九月", @"十月", @"十一月", @"十二月"
                   ])
    .markerRadiusSet(@0)
    .seriesSet(@[
        AASeriesElement.new
        .nameSet(@"Berlin Hot")
        .colorSet(AAColor.whiteColor)
        .lineWidthSet(@7)
        .fillColorSet((id)fillColorGradientColor)
        .dataSet(@[
            @7.0, @6.9, @2.5, @14.5, @18.2, @21.5, @5.2, @26.5, @23.3, @45.3, @13.9, @9.6
                 ]),
               ]);
    
    AAOptions *aaOptions = aaChartModel.aa_toAAOptions;
    
    aaOptions.xAxis
    .tickWidthSet(@0)//X轴刻度线宽度
    .lineWidthSet(@1.5)//X轴轴线宽度
    .lineColorSet(AAColor.whiteColor)//X轴轴线颜色
    .gridLineColorSet(AAColor.whiteColor)
    .gridLineWidthSet(@0.5)//X轴网格线宽度
    .gridLineDashStyleSet(AAChartLineDashStyleTypeDash)
    ;
    
    aaOptions.yAxis
    .lineWidthSet(@1.5)//Y轴轴线颜色
    .lineColorSet(AAColor.whiteColor)//Y轴轴线颜色
    .gridLineColorSet(AAColor.whiteColor)
    .gridLineWidthSet(@0.5)//Y轴网格线宽度
    .gridLineDashStyleSet(AAChartLineDashStyleTypeDash)
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


// Refer to the issue https://github.com/AAChartModel/AAChartKit/issues/804
- (AAOptions *)customChartStyleWhenNoData {
    AAChartModel *aaChartModel = AAChartModel.new
    .chartTypeSet(AAChartTypeLine)//图表类型
    .subtitleSet(@"温度 (℃)")//图表副标题
    .subtitleStyleSet(AAStyleColorSizeWeight(AAColor.grayColor, 14, AAChartFontWeightTypeBold))
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

//https://github.com/AAChartModel/AAChartKit/issues/1381
- (AAOptions *)configureBoxplotChartWithSpecialStyle {
    AAChartModel *aaChartModel = AAChartModel.new
    .chartTypeSet(AAChartTypeBoxplot)//图表类型
    .titleSet(@"BOXPLOT CHART")//图表主标题
    .subtitleSet(@"virtual data")//图表副标题
    .yAxisTitleSet(@"℃")//设置 Y 轴标题
    .yAxisVisibleSet(true)//设置 Y 轴是否可见
    .seriesSet(@[
        AASeriesElement.new
        .nameSet(@"Observed Data")
        .colorSet(@"#ef476f")
        .fillColorSet(@"#04d69f")
        .dataSet(@[
            @[@760, @801, @848, @895, @965],
            @[@733, @853, @939, @980, @1080],
            @[@714, @762, @817, @870, @918],
            @[@724, @802, @806, @871, @950],
            @[@834, @836, @864, @882, @910]
        ]),
    ]);

    AAOptions *aaOptions = aaChartModel.aa_toAAOptions;

    aaOptions.plotOptions
    .boxplotSet(AABoxplot.new
                .boxDashStyleSet(AAChartLineDashStyleTypeDash)
                .fillColorSet(@"#F0F0E0")
                .lineWidthSet(@2)
                .medianColorSet(@"#0C5DA5")
                .medianDashStyleSet(AAChartLineDashStyleTypeShortDot)
                .medianWidthSet(@3)
                .stemColorSet(@"#A63400")
                .stemDashStyleSet(AAChartLineDashStyleTypeDot)
                .stemWidthSet(@1)
                .whiskerColorSet(@"#3D9200")
                .whiskerDashStyleSet(AAChartLineDashStyleTypeSolid)
                .whiskerLengthSet(@"60%")
                .whiskerWidthSet(@6)
                );
    
    aaOptions.plotOptions.series
//        .maxPointWidthSet(@120)
        .pointWidthSet(@100);
    
    return aaOptions;
}

//https://stackoverflow.com/questions/64397169/highcharts-with-a-thick-line-at-0-values-the-line-is-half-hidden
//Highcharts.chart("chart", {
//  chart: {
//    type: "line",
//    height: 300,
//  },
//  credits: {
//    enabled: false
//  },
//  legend: {
//    enabled: false
//  },
//  title: {
//    text: "Chart"
//  },
//  yAxis: [{
//    endOnTick: false,
//    max: 0.1,
//    title: {
//      text: "Negative values make me sad"
//    }
//  }],
//  series: [{
//    data: [0, 0, 0, -2, -2, -1, 0, -2], // If you put a `1` value in and then everything renders nicely.
//    lineWidth: 8
//  }]
//});

//https://stackoverflow.com/questions/64397169/highcharts-with-a-thick-line-at-0-values-the-line-is-half-hidden
- (AAOptions *)toFixHighchartsWithAThickLineAt0ValuesTheLineIsHalfHidden {
    return AAOptions.new
    .chartSet(AAChart.new
              .typeSet(AAChartTypeLine))
    .creditsSet(AACredits.new
                .enabledSet(false))
    .legendSet(AALegend.new
               .enabledSet(false))
    .titleSet(AATitle.new
              .textSet(@"Chart"))
    .yAxisSet(AAYAxis.new
              .endOnTickSet(false)
              .maxSet(@0.1)
              .titleSet(AAAxisTitle .new
                        .textSet(@"Negative values make me sad")))
    .seriesSet(@[
        AASeriesElement.new
        .dataSet(@[@0, @0, @0, @-2, @-2, @-1, @0, @-2])
        .lineWidthSet(@8),
    ]);
}


- (AAOptions *)configureDoubleYAxesAreasplineMixedColumnChart {
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
              .colorSet(AAColor.redColor)//yAxis Label font color
              .fontSizeSet(@"15px")//yAxis Label font size
              .fontWeightSet(AAChartFontWeightTypeBold)//yAxis Label font weight
              );
    
    AAYAxis *yAxisOne = AAYAxis.new
    .visibleSet(true)
    .maxSet(@1200.0)
    .minSet(@-1200.0)
    .labelsSet(aaYAxisLabels)
    .titleSet(AAAxisTitle.new
              .textSet(@"冬季降雨量")
              .styleSet(aaYAxisTitleStyle))
    .oppositeSet(true);
    
    
    AAYAxis *yAxisTwo = AAYAxis.new
    .visibleSet(true)
    .maxSet(@1200.0)
    .minSet(@-1200.0)
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
    .fillColorSet(AAColor.whiteColor)//点的填充色(用来设置折线连接点的填充色)
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
    .dataSet(@[@1000.0, @6.9, @2.5, @14.5, @18.2, @21.5, @5.2, @26.5, @23.3, @45.3, @13.9, @9.6]);
    
    AASeriesElement *element2 = AASeriesElement.new
    .nameSet(@"2018")
    .typeSet(AAChartTypeColumn)
    .colorSet((id)AAGradientColor.new
              .directionSet(AALinearGradientDirectionToTop)
              .startColorSet(@"#17ead9")
              .endColorSet(@"#6078ea"))
    .yAxisSet(@0)
    .dataSet(@[@-7.0, @-6.9, @-2.5, @-14.5, @-18.2, @-21.5, @-5.2, @-26.5, @-23.3, @-45.3, @-13.9, @-9.6]);

    
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


@end
