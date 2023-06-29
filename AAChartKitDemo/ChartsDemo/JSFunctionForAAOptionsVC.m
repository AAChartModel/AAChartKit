//
//  JSFunctionForAAOptionsVC.m
//  AAChartKitDemo
//
//  Created by AnAn on 2022/10/9.
//  Copyright © 2022 An An. All rights reserved.
//

#import "JSFunctionForAAOptionsVC.h"

@interface JSFunctionForAAOptionsVC ()

@end

@implementation JSFunctionForAAOptionsVC

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
}

//https://github.com/AAChartModel/AAChartKit/issues/780
- (AAOptions *)customDoubleXAxesChart {
    NSDictionary *gradientColorDic1 =
    [AAGradientColor gradientColorWithDirection:AALinearGradientDirectionToTop
                               startColorString:@"#7052f4"//颜色字符串设置支持十六进制类型和 rgba 类型
                                 endColorString:@"#00b0ff"];
    
    NSDictionary *gradientColorDic2 =
    [AAGradientColor gradientColorWithDirection:AALinearGradientDirectionToTop
                               startColorString:@"#EF71FF"//颜色字符串设置支持十六进制类型和 rgba 类型
                                 endColorString:@"#4740C8"];
    
    NSArray *categories = @[
        @"0-4", @"5-9", @"10-14", @"15-19",
        @"20-24", @"25-29", @"30-34", @"35-39", @"40-44",
        @"45-49", @"50-54", @"55-59", @"60-64", @"65-69",
        @"70-74", @"75-79", @"80-84", @"85-89", @"90-94",
        @"95-99", @"100 + ",];
    
    AAOptions *aaOptions = AAOptions.new
    .chartSet(AAChart.new
              .typeSet(AAChartTypeColumn)
              )
    .titleSet(AATitle.new
              .textSet(@"Population pyramid for Germany, 2015"))
    .xAxisSet((id)@[
        AAXAxis.new
        .reversedSet(true)
        .categoriesSet(categories)
        .labelsSet(AALabels.new
                   .enabledSet(true)
                   .stepSet(@1)),
        AAXAxis.new
        .reversedSet(true)
        .oppositeSet(true)
        .categoriesSet(categories)
        .linkedToSet(@0)
        .labelsSet(AALabels.new
                   .enabledSet(true)
                   .stepSet(@1)),
    ])
    .yAxisSet(AAYAxis.new
              .visibleSet(true)
              .gridLineWidthSet(@0)
              .titleSet(AAAxisTitle.new
                        .textSet(@"人口数"))
              .labelsSet(AALabels.new
                         .formatterSet(@AAJSFunc(function () {
        return (Math.abs(this.value) / 1000000) + 'M';
    }
                                                 ))))
    .tooltipSet(AATooltip.new
                .enabledSet(true)
                .sharedSet(false)
                .formatterSet(@AAJSFunc(function () {
        return '<b>' + this.series.name + ', age ' + this.point.category + '</b><br/>' +
        '人口: ' + Highcharts.numberFormat(Math.abs(this.point.y), 0);
    }
                                        )))
    .plotOptionsSet(AAPlotOptions.new
                    .seriesSet(AASeries.new
                               .animationSet(AAAnimation.new
                                             .easingSet(AAChartAnimationBounce)
                                             .durationSet(@1000)
                                             )
                               .stackingSet(AAChartStackingTypeNormal)
                               )
                    )
    .seriesSet(@[
        AASeriesElement.new
        .nameSet(@"Men")
        .colorSet((id)gradientColorDic1)
        .dataSet(@[
            @-1746181, @-1884428, @-2089758, @-2222362, @-2537431, @-2507081, @-2443179,
            @-2664537, @-3556505, @-3680231, @-3143062, @-2721122, @-2229181, @-2227768,
            @-2176300, @-1329968, @-836804, @-354784, @-90569, @-28367, @-3878]),
        AASeriesElement.new
        .nameSet(@"Women")
        .colorSet((id)gradientColorDic2)
        .dataSet(@[
            @1656154, @1787564, @1981671, @2108575, @2403438, @2366003, @2301402, @2519874,
            @3360596, @3493473, @3050775, @2759560, @2304444, @2426504, @2568938, @1785638,
            @1447162, @1005011, @330870, @130632, @21208]),
    ])
    ;
    
    return aaOptions;
}

//https://github.com/AAChartModel/AAChartKit/issues/967
- (AAOptions *)disableColumnChartUnselectEventEffectBySeriesPointEventClickFunction {
    AAChartModel *aaChartModel = AAChartModel.new
    .chartTypeSet(AAChartTypeBar)
    .titleSet(@"Custom Bar Chart select color")
    .yAxisReversedSet(true)
    .xAxisReversedSet(true)
    .seriesSet(@[
        AASeriesElement.new
        .nameSet(@"ElementOne")
        .dataSet(@[@211,@183,@157,@133,@111,@91,@73,@57,@43,@31,@21,@13,@7,@3])
        .allowPointSelectSet(YES)
        .statesSet(AAStates.new
                   .hoverSet(AAHover.new
                             .colorSet(AAColor.yellowColor))
                   .selectSet(AASelect.new
                              .colorSet(AAColor.redColor))
                   )
               ]);
        
    AAOptions *aaOptions = aaChartModel.aa_toAAOptions;

    AAPoint *point = AAPoint.new
    .eventsSet(AAPointEvents.new
               .clickSet(@AAJSFunc(function () {
                   if (this.selected == true) {
                       this.selected = false;
                   }
                   return;
               })));
    
    aaOptions.plotOptions.series
    .pointSet(point);
    
    return aaOptions;
}

// Refer to the issue https://github.com/AAChartModel/AAChartKit/issues/589
- (AAOptions *)customizeEveryDataLabelSinglelyByDataLabelsFormatter {
    AAChartModel *aaChartModel = AAChartModel.new
    .chartTypeSet(AAChartTypeAreaspline)//图表类型
    .dataLabelsEnabledSet(true)
    .tooltipEnabledSet(false)
    .colorsThemeSet(@[AAGradientColor.fizzyPeachColor])
    .markerRadiusSet(@0)
    .legendEnabledSet(false)
    .categoriesSet(@[@"美国🇺🇸",@"欧洲🇪🇺",@"中国🇨🇳",@"日本🇯🇵",@"韩国🇰🇷",@"越南🇻🇳",@"中国香港🇭🇰",])
    .seriesSet(@[
        AASeriesElement.new
        .dataSet(@[@7.0, @6.9, @2.5, @14.5, @18.2, @21.5, @5.2]),
    ]);
    
    AAOptions *aaOptions = aaChartModel.aa_toAAOptions;
    aaOptions.yAxis.gridLineDashStyle = AAChartLineDashStyleTypeLongDash;//设置Y轴的网格线样式为 AAChartLineDashStyleTypeLongDash
    
    NSArray *unitArr = @[@"美元", @"欧元", @"人民币", @"日元", @"韩元", @"越南盾", @"港币", ];
    NSString *unitJSArrStr = [unitArr aa_toJSArray];
    NSString *dataLabelsFormatter = [NSString stringWithFormat:(@AAJSFunc(function () {
        return this.y + %@[this.point.index];  //单组 serie 图表, 获取选中的点的索引是 this.point.index ,多组并且共享提示框,则是this.points[0].index
    })),unitJSArrStr];
    
    AADataLabels *aaDatalabels = aaOptions.plotOptions.series.dataLabels;
    aaDatalabels
    .styleSet(AAStyleColorSizeWeightOutline(AAColor.redColor, 10, AAChartFontWeightTypeBold, @"1px 1px contrast"))
    .formatterSet(dataLabelsFormatter)
    .backgroundColorSet(AAColor.whiteColor)// white color
    .borderColorSet(AAColor.redColor)// red color
    .borderRadiusSet(@1.5)
    .borderWidthSet(@1.3)
    .xSet(@3).ySet(@-20)
    .verticalAlignSet(AAChartVerticalAlignTypeMiddle)
    ;
    return aaOptions;
}

//https://github.com/AAChartModel/AAChartKit-Swift/issues/404
- (AAOptions *)configureColorfulDataLabelsForPieChart {
    AAOptions *aaOptions = AAOptions.new
    .chartSet(AAChart.new
              .marginLeftSet(@120)
              .marginRightSet(@120))
    .titleSet(AATitle.new
              .textSet(@"Colorful DataLabels For Pie Chart"))
    .colorsSet(@[@"#0c9674", @"#7dffc0", @"#ff3333", @"#facd32", @"#ffffa0",
                 @"#EA007B", @"#fe117c", @"#ffc069", @"#06caf4", @"#7dffc0"])
    .seriesSet(@[
        AASeriesElement.new
        .typeSet(AAChartTypePie)
        .nameSet(@"语言热度值")
        .innerSizeSet(@"20%")//内部圆环半径大小占比
        .borderWidthSet(@0)//描边的宽度
        .allowPointSelectSet(true)//是否允许在点击数据点标记(扇形图点击选中的块发生位移)
        .statesSet(AAStates.new
                   .hoverSet(AAHover.new
                             .enabledSet(false)))//禁用点击区块之后出现的半透明遮罩层
        .dataLabelsSet(AADataLabels.new
                       .allowOverlapSet(true)//允许字符重叠
                       .useHTMLSet(true)
                       .formatterSet(@AAJSFunc(
        function () {
            const point = this.point;
            return '<span style=\"color: ' + point.color + '\">' +
            point.name + ': ' + point.y + '%</span>';
        })))
        .dataSet(@[
            @[@"Firefox",   @3336.2],
            @[@"IE",          @26.8],
            @[@"Chrome",      @666.8],
            @[@"Safari",      @88.5],
            @[@"Opera",       @46.0],
            @[@"Others",     @223.0],
            @[@"Firefox",   @3336.2],
            @[@"IE",          @26.8],
            @[@"Chrome",      @666.8],
            @[@"Safari",      @88.5],
            @[@"Opera",       @46.0],
            @[@"Others",     @223.0],
        ])
    ]);

    return aaOptions;
}

//https://github.com/AAChartModel/AAChartKit/issues/1427
- (AAOptions *)customizeCrosshairsStyle {
    return AAOptions.new
        .plotOptionsSet(AAPlotOptions.new
                        .seriesSet(AASeries.new
                                   .pointSet(AAPoint.new
                                             .eventsSet(AAPointEvents.new
                                                        .mouseOverSet(@AAJSFunc(function() {
                                                            const chart = this.series.chart;
                                                            const pointBox = this.graphic.getBBox();
                                                            const left = pointBox.x + (pointBox.width / 2) + chart.plotLeft;
                                                            const top = pointBox.y + chart.plotTop;
                                                            const height = chart.plotHeight + chart.plotTop;
                                                            
                                                            if (this.series.options.enabledCrosshairs) {
                                                                chart.crosshair = chart.renderer.path(['M', left, top, 'L', left, height])
                                                                    .attr({
                                                                        'stroke-width': 8,
                                                                    stroke: 'red'
                                                                    })
                                                                    .add();
                                                            }
                                                        }
                                                                                ))
                                                        .mouseOutSet(@AAJSFunc(function() {
                                                            const chart = this.series.chart;
                                                            if (chart.crosshair) chart.crosshair.destroy();
                                                        }))
                                                        
                                                        ))))//设置点击事件
        .seriesSet(@[
            AASeriesElement.new
                .enabledCrosshairsSet(@true)
                .dataSet(@[@2, @5, @2, @3, @6, @5]),
        ]);
}


@end
