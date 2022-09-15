//
//  PieChartOptionsVC.m
//  AAChartKitDemo
//
//  Created by Admin on 2021/9/15.
//  Copyright © 2021 An An. All rights reserved.
//

#import "PieChartOptionsVC.h"

@interface PieChartOptionsVC ()

@end

@implementation PieChartOptionsVC

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
}

- (id)chartConfigurationWithSelectedIndex:(NSUInteger)selectedIndex {
    switch (self.selectedIndex) {
        case 0: return [self showPieChartPointNamePointYAndPointPercentForDataLabels];//自定义饼图的标题
        case 1: return [self adjustPieChartTitleAndDataLabelFontStyle];//自定义饼图的标题和 DataLabels
        case 2: return [self adjustPieChartTitleAndDataLabelFontStyle2];//自定义饼图的标题和 DataLabels
        case 3: return [self configurePieChartFormatProperty];//配置饼图的 dataLabels 的 format 属性
        case 4: return [self doubleLayerHalfPieChart];//双层嵌套的玉阕图
        case 5: return [self adjustPieChartDataLabelStyleAndPostion];//调整饼图的 dataLabels 样式及位置使其居中
        case 6: return [self showPieChartPointNamePointYAndPointPercentForDataLabels]; //自定义饼图 dataLabels 显示 point.name, point.x, point.percent

        default:
            break;
    }
    return nil;
}


// Refer to the issue https://github.com/AAChartModel/AAChartKit/issues/173
// Refer to the issue https://github.com/AAChartModel/AAChartKit/issues/986
- (AAOptions *)configurePieChartTitle {
    CGFloat aaChartViewWidth = self.view.frame.size.width;
    //计算X轴偏移量
    CGFloat xOffSet = (aaChartViewWidth - 40) * 0.1;
    
    AAOptions *aaOptions = AAOptions.new
    .chartSet(AAChart.new
              .typeSet(AAChartTypePie)
              .marginLeftSet(@0)
              .marginRightSet(@0))
    .titleSet(AATitle.new
              .textSet(@"渠道销售额<br/>占比")//标题文本内容
              .alignSet(AAChartAlignTypeCenter)//标题水平居中
              .verticalAlignSet(AAChartVerticalAlignTypeMiddle)//标题垂直居中
              .xSet(@(-xOffSet))
              .ySet(@(-5))
              .styleSet(AAStyleColorSizeWeight(AAColor.blackColor, 16, AAChartFontWeightTypeBold)))
    .colorsSet(@[@"#1e90ff",@"#ef476f",@"#ffd066",@"#04d69f",@"#25547c",])
    .plotOptionsSet(AAPlotOptions.new
                    .seriesSet(AASeries.new
                               .animationSet(AAAnimation.new
                                             .easingSet(AAChartAnimationBounce)
                                             .durationSet(@1000)))
                    .pieSet(AAPie.new
                            .showInLegendSet(true)
                            .centerSet(@[@"40%",@"50%"])
                            .dataLabelsSet(AADataLabels.new
                                           .enabledSet(false)
                                           //.formatSet(@"{point.percentage:.1f}%")
                                           )))
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
               ]);
    
    return aaOptions;
}

- (AAOptions *)adjustPieChartTitleAndDataLabelFontStyle {
    AAOptions *aaOptions = AAOptions.new
    .chartSet(AAChart.new.typeSet(AAChartTypePie))
    .titleSet(AATitle.new
              .useHTMLSet(true)
              .textSet(@"<span style=""color:#1E90FF;font-weight:thin;font-size:13px""> &nbsp&nbsp&nbsp近七天 </span>  <br>\
                         <span style=""color:#A9A9A9;font-weight:thin;font-size:10px""> 运行状态占比 </span>")//标题文本内容
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
                       .formatSet(@"<span style=""color:#A9A9A9;font-weight:thin;font-size:10px"">{point.name}</span>\
                                    <span style=""color:#1E90FF;font-weight:bold;font-size:15px"">{point.percentage:.1f}</span>\
                                    <span style=""color:#1E90FF;font-weight:thin;font-size:10px"">%</span>")
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
              .textSet((@"<span style=""color:#1E90FF;font-weight:thin;font-size:13px""> &nbsp&nbsp&nbsp近七天 </span>  <br>\
                          <span style=""color:#A9A9A9;font-weight:thin;font-size:10px""> 运行状态占比 </span>"))//标题文本内容
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

//https://github.com/AAChartModel/AAChartKit/issues/1331
- (AAOptions *)adjustPieChartDataLabelStyleAndPostion {
    AAOptions *aaOptions = AAOptions.new
        .chartSet(AAChart.new
                  .typeSet(AAChartTypePie))
        .titleSet((id)NSNull.null)
        .tooltipSet(AATooltip.new
                    .enabledSet(true)
                    .valueDecimalsSet(@2))
        .legendSet(AALegend.new
                   .enabledSet(false))
        .seriesSet(@[
            AASeriesElement.new
                .nameSet(@"")
                .sizeSet(@100)//尺寸大小
                .borderWidthSet(@0)//描边的宽度
                .allowPointSelectSet(true)//是否允许在点击数据点标记(扇形图点击选中的块发生位移)
                .dataLabelsSet(AADataLabels.new
                    .enabledSet(true)
                    .useHTMLSet(true)
                    .colorSet(AAColor.whiteColor)
                    .ySet(@-20)
                    .distanceSet(@-25)//扇形图百分比线的长度
                    .formatSet(@"<b>{point.name}</b>: <br> {point.y:.0f} <br>kWh"))
                .dataSet(@[
                    @[@"充电量",   @2506],
                    @[@"放电量",   @2506],
                ]
            ),
        ]);
    return aaOptions;
}

//https://github.com/AAChartModel/AAChartKit/issues/1395
- (AAOptions *)showPieChartPointNamePointYAndPointPercentForDataLabels {
    AAOptions *aaOptions = AAOptions.new
    .chartSet(AAChart.new.typeSet(AAChartTypePie))
    .titleSet(AATitle.new
              .useHTMLSet(true)
              .textSet(@"<span style=""color:#1E90FF;font-weight:thin;font-size:13px""> &nbsp&nbsp&nbsp近七天 </span>  <br>\
                         <span style=""color:#A9A9A9;font-weight:thin;font-size:10px""> 运行状态占比 </span>")//标题文本内容
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
                       .formatSet(@"<span style=""color:#A9A9A9;font-weight:thin;font-size:10px"">{point.name}</span><br>\
                                    <span style=""color:#FF0000;font-weight:bold;font-size:18px"">{point.y}&nbsp</span>\
                                    <span style=""color:#1E90FF;font-weight:bold;font-size:15px"">({point.percentage:.2f}%)</span>")
                       )
        .dataSet(@[
            @[@"Firefox",   @150],
            @[@"Opera",      @15],
            @[@"Others",     @35]
                 ]),
               ]);
    return aaOptions;
}


@end
