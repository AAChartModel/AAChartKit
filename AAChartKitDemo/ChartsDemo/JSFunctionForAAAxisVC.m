//
//  JSFunctionForAAAxisVC.m
//  AAChartKitDemo
//
//  Created by AnAn on 2022/9/9.
//  Copyright © 2022 An An. All rights reserved.
//

#import "JSFunctionForAAAxisVC.h"

@interface JSFunctionForAAAxisVC ()

@end

@implementation JSFunctionForAAAxisVC

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
}


//https://github.com/AAChartModel/AAChartKit/issues/675
- (AAOptions *)customYAxisLabels {
    AAChartModel *aaChartModel = AAChartModel.new
    .chartTypeSet(AAChartTypeLine)//图表类型
    .colorsThemeSet(@[@"#04d69f",@"#1e90ff",@"#ef476f",@"#ffd066",])
    .markerSymbolStyleSet(AAChartSymbolStyleTypeBorderBlank)//折线连接点样式为内部白色
    .markerRadiusSet(@8)
    .seriesSet(@[
        AASeriesElement.new
        .nameSet(@"Tokyo Hot")
        .lineWidthSet(@5.0)
        .fillOpacitySet(@0.4)
        .dataSet( @[@29.9, @71.5, @106.4, @129.2, @144.0, @176.0, @135.6, @148.5, @216.4, @194.1, @95.6, @54.4]),
    ]);
    
    AAOptions *aaOptions = aaChartModel.aa_toAAOptions;
    aaOptions
    .yAxis.labels
    .formatterSet(@AAJSFunc(function () {
        const yValue = this.value;
        if (yValue >= 200) {
            return "极佳";
        } else if (yValue >= 150 && yValue < 200) {
            return "非常棒";
        } else if (yValue >= 100 && yValue < 150) {
            return "相当棒";
        } else if (yValue >= 50 && yValue < 100) {
            return "还不错";
        } else {
            return "一般";
        }
    }))
    ;
    return aaOptions;
}

//https://github.com/AAChartModel/AAChartKit/issues/901
//https://github.com/AAChartModel/AAChartKit/issues/952
- (AAOptions *)configureTheAxesLabelsFormattersOfDoubleYAxesChart {
    AAChart *aaChart = AAChart.new
    .backgroundColorSet(AAColor.whiteColor);
    
    AATitle *aaTitle = AATitle.new
    .textSet(@"");
    
    AAXAxis *aaXAxis = AAXAxis.new
    .visibleSet(true)
    .minSet(@0)
    .categoriesSet(@[
        @"Java", @"Swift", @"Python", @"Ruby", @"PHP", @"Go",@"C",
        @"C#", @"C++", @"Perl", @"R", @"MATLAB", @"SQL"
                   ]);
    
    AAPlotOptions *aaPlotOptions = AAPlotOptions.new
    .seriesSet(AASeries.new
               .markerSet(AAMarker.new
                          .radiusSet(@7)//曲线连接点半径，默认是4
                          .symbolSet(AAChartSymbolTypeCircle)//曲线点类型："circle", "square", "diamond", "triangle","triangle-down"，默认是"circle"
                          .fillColorSet(AAColor.whiteColor)//点的填充色(用来设置折线连接点的填充色)
                          .lineWidthSet(@3)//外沿线的宽度(用来设置折线连接点的轮廓描边的宽度)
                          .lineColorSet(@"")//外沿线的颜色(用来设置折线连接点的轮廓描边颜色，当值为空字符串时，默认取数据点或数据列的颜色)
                          ));
    
    AAYAxis *yAxis1 = AAYAxis.new
    .visibleSet(true)
    .lineWidthSet(@1)
    .tickPositionsSet(@[@0, @50, @100, @150, @200])
    .labelsSet(AALabels.new
               .enabledSet(true)
               .styleSet(AAStyle.new
                         .colorSet(@"DodgerBlue"))
               .formatterSet(@AAJSFunc(function () {
        const yValue = this.value;
        if (yValue >= 200) {
            return "极佳";
        } else if (yValue >= 150 && yValue < 200) {
            return "非常棒";
        } else if (yValue >= 100 && yValue < 150) {
            return "相当棒";
        } else if (yValue >= 50 && yValue < 100) {
            return "还不错";
        } else {
            return "一般";
        }
    })))
    .gridLineWidthSet(@0)
    .titleSet(AAAxisTitle.new
              .textSet(@"中文")
              .styleSet(AAStyleColorSizeWeight(@"DodgerBlue", 14, AAChartFontWeightTypeBold)));
    
    AAYAxis *yAxis2 = AAYAxis.new
    .visibleSet(true)
    .lineWidthSet(@1)
    .tickPositionsSet(@[@0, @50, @100, @150, @200])
    .labelsSet(AALabels.new
               .enabledSet(true)
               .styleSet(AAStyle.new
                         .colorSet(AAColor.redColor))
               .formatterSet(@AAJSFunc(function () {
        const yValue = this.value;
        if (yValue >= 200) {
            return "Awesome";
        } else if (yValue >= 150 && yValue < 200) {
            return "Great";
        } else if (yValue >= 100 && yValue < 150) {
            return "Very Good";
        } else if (yValue >= 50 && yValue < 100) {
            return "Not Bad";
        } else {
            return "Just So So";
        }
    })))
    .gridLineWidthSet(@0)
    .titleSet(AAAxisTitle.new
              .textSet(@"ENGLISH")
              .styleSet(AAStyleColorSizeWeight(AAColor.redColor, 14, AAChartFontWeightTypeBold)))
    .oppositeSet(true);
    
    AATooltip *aaTooltip = AATooltip.new
    .enabledSet(true)
    .sharedSet(true);
    
    NSArray *seriesArr = @[
        AASeriesElement.new
        .nameSet(@"2020")
        .typeSet(AAChartTypeSpline)
        .lineWidthSet(@7)
        .colorSet((id)AAGradientColor.deepSeaColor)
        .borderRadiusSet(@4)
        .yAxisSet(@1)
        .dataSet(@[
            @0, @71.5, @106.4, @129.2, @144.0, @176.0,
            @135.6, @148.5, @216.4, @194.1, @95.6, @54.4
                 ]),
        AASeriesElement.new
        .nameSet(@"2021")
        .typeSet(AAChartTypeSpline)
        .lineWidthSet(@7)
        .colorSet((id)AAGradientColor.sanguineColor)
        .yAxisSet(@0)
        .dataSet(@[
            @135.6, @148.5, @216.4, @194.1, @95.6, @54.4,
            @0, @71.5, @106.4, @129.2, @144.0, @176.0
                 ])
    ];
    
    AAOptions *aaOptions = AAOptions.new
    .chartSet(aaChart)
    .titleSet(aaTitle)
    .plotOptionsSet(aaPlotOptions)
    .xAxisSet(aaXAxis)
    .yAxisSet((id)@[yAxis1,yAxis2])
    .tooltipSet(aaTooltip)
    .seriesSet(seriesArr)
    ;
    return aaOptions;
}

//https://github.com/AAChartModel/AAChartKit/issues/1324
- (AAOptions *)configureTheAxesLabelsFormattersOfDoubleYAxesChart2 {
    AAChart *aaChart = AAChart.new
    .backgroundColorSet(AAColor.whiteColor);
    
    AATitle *aaTitle = AATitle.new
    .textSet(@"");
    
    AAXAxis *aaXAxis = AAXAxis.new
    .visibleSet(true)
    .minSet(@0)
    .categoriesSet(@[
        @"Java", @"Swift", @"Python", @"Ruby", @"PHP", @"Go",@"C",
        @"C#", @"C++", @"Perl", @"R", @"MATLAB", @"SQL"
                   ]);
    
    AAPlotOptions *aaPlotOptions = AAPlotOptions.new
    .seriesSet(AASeries.new
               .markerSet(AAMarker.new
                          .radiusSet(@7)//曲线连接点半径，默认是4
                          .symbolSet(AAChartSymbolTypeCircle)//曲线点类型："circle", "square", "diamond", "triangle","triangle-down"，默认是"circle"
                          .fillColorSet(AAColor.whiteColor)//点的填充色(用来设置折线连接点的填充色)
                          .lineWidthSet(@3)//外沿线的宽度(用来设置折线连接点的轮廓描边的宽度)
                          .lineColorSet(@"")//外沿线的颜色(用来设置折线连接点的轮廓描边颜色，当值为空字符串时，默认取数据点或数据列的颜色)
                          ));
    
    AAYAxis *yAxis1 = AAYAxis.new
    .visibleSet(true)
    .lineWidthSet(@1)
    .tickPositionsSet(@[@0, @50, @100, @150, @200])
    .labelsSet(AALabels.new
               .enabledSet(true)
               .styleSet(AAStyle.new
                         .colorSet(@"DodgerBlue"))
               .formatterSet(@AAJSFunc(
                function () {
                   var yValue = this.value;
                   var formattedYValue = (yValue / 1000).toFixed(3) + '千';
                   return formattedYValue;
               }
                                       )))
    .gridLineWidthSet(@0)
    .titleSet(AAAxisTitle.new
              .textSet(@"以「千」为单位")
              .styleSet(AAStyleColorSizeWeight(@"DodgerBlue", 14, AAChartFontWeightTypeBold)));
    
    AAYAxis *yAxis2 = AAYAxis.new
    .visibleSet(true)
    .lineWidthSet(@1)
    .tickPositionsSet(@[@0, @50, @100, @150, @200])
    .labelsSet(AALabels.new
               .enabledSet(true)
               .styleSet(AAStyle.new
                         .colorSet(AAColor.redColor))
               .formatterSet(@AAJSFunc(
                function () {
                    var yValue = this.value;
                    var formattedYValue = (yValue / 10000).toFixed(4) + '万';
                    return formattedYValue;
                   }
                                       )))
    .gridLineWidthSet(@0)
    .titleSet(AAAxisTitle.new
              .textSet(@"以『万』为单位")
              .styleSet(AAStyleColorSizeWeight(AAColor.redColor, 14, AAChartFontWeightTypeBold)))
    .oppositeSet(true);
    
    AATooltip *aaTooltip = AATooltip.new
    .enabledSet(true)
    .sharedSet(true);
    
    NSArray *seriesArr = @[
        AASeriesElement.new
        .nameSet(@"2020")
        .typeSet(AAChartTypeSpline)
        .lineWidthSet(@7)
        .colorSet((id)AAGradientColor.deepSeaColor)
        .borderRadiusSet(@4)
        .yAxisSet(@1)
        .dataSet(@[
            @0, @71.5, @106.4, @129.2, @144.0, @176.0,
            @135.6, @148.5, @216.4, @194.1, @95.6, @54.4
                 ]),
        AASeriesElement.new
        .nameSet(@"2021")
        .typeSet(AAChartTypeSpline)
        .lineWidthSet(@7)
        .colorSet((id)AAGradientColor.sanguineColor)
        .yAxisSet(@0)
        .dataSet(@[
            @135.6, @148.5, @216.4, @194.1, @95.6, @54.4,
            @0, @71.5, @106.4, @129.2, @144.0, @176.0
                 ])
    ];
    
    AAOptions *aaOptions = AAOptions.new
    .chartSet(aaChart)
    .titleSet(aaTitle)
    .plotOptionsSet(aaPlotOptions)
    .xAxisSet(aaXAxis)
    .yAxisSet((id)@[yAxis1,yAxis2])
    .tooltipSet(aaTooltip)
    .seriesSet(seriesArr)
    ;
    return aaOptions;
}

//https://github.com/AAChartModel/AAChartKit/issues/1324
//https://github.com/AAChartModel/AAChartKit/issues/1330
- (AAOptions *)configureTheAxesLabelsFormattersOfDoubleYAxesChart3 {
    AAChart *aaChart = AAChart.new
    .backgroundColorSet(AAColor.whiteColor);
    
    AATitle *aaTitle = AATitle.new
    .textSet(@"");
    
    AAXAxis *aaXAxis = AAXAxis.new
    .visibleSet(true)
    .minSet(@0)
    .categoriesSet(@[
        @"Java", @"Swift", @"Python", @"Ruby", @"PHP", @"Go",@"C",
        @"C#", @"C++", @"Perl", @"R", @"MATLAB", @"SQL"
                   ]);
    
    AAPlotOptions *aaPlotOptions = AAPlotOptions.new
    .seriesSet(AASeries.new
               .markerSet(AAMarker.new
                          .radiusSet(@7)//曲线连接点半径，默认是4
                          .symbolSet(AAChartSymbolTypeCircle)//曲线点类型："circle", "square", "diamond", "triangle","triangle-down"，默认是"circle"
                          .fillColorSet(AAColor.whiteColor)//点的填充色(用来设置折线连接点的填充色)
                          .lineWidthSet(@3)//外沿线的宽度(用来设置折线连接点的轮廓描边的宽度)
                          .lineColorSet(@"")//外沿线的颜色(用来设置折线连接点的轮廓描边颜色，当值为空字符串时，默认取数据点或数据列的颜色)
                          ));
    
    AAYAxis *yAxis1 = AAYAxis.new
    .visibleSet(true)
    .lineWidthSet(@1)
    .tickPositionsSet(@[@0, @50, @100, @150, @200])
    .labelsSet(AALabels.new
               .enabledSet(true)
               .styleSet(AAStyle.new
                         .colorSet(@"DodgerBlue"))
               .formatterSet(@AAJSFunc(
                function () {
                    var yValue = this.value;
                    var unitStr = "千";
                    if (yValue == 0) {
                        unitStr = "";
                    }
                    var formattedYValue = (yValue / 1000).toFixed(3) + unitStr;
                    return formattedYValue;
                }
                                       )))//Y轴文字数值为 0 的时候, 不显示单位
    .gridLineWidthSet(@0)
    .titleSet(AAAxisTitle.new
              .textSet(@"以「千」为单位")
              .styleSet(AAStyleColorSizeWeight(@"DodgerBlue", 14, AAChartFontWeightTypeBold)));
    
    AAYAxis *yAxis2 = AAYAxis.new
    .visibleSet(true)
    .lineWidthSet(@1)
    .tickPositionsSet(@[@0, @50, @100, @150, @200])
    .labelsSet(AALabels.new
               .enabledSet(true)
               .styleSet(AAStyle.new
                         .colorSet(AAColor.redColor))
               .formatterSet(@AAJSFunc(
                function () {
                    var yValue = this.value;
                    var unitStr = "万";
                    if (yValue == 0) {
                        unitStr = "";
                    }
                    var formattedYValue = (yValue / 10000).toFixed(4) + unitStr;
                    return formattedYValue;
                }
                                       )))//Y轴文字数值为 0 的时候, 不显示单位
    .gridLineWidthSet(@0)
    .titleSet(AAAxisTitle.new
              .textSet(@"以『万』为单位")
              .styleSet(AAStyleColorSizeWeight(AAColor.redColor, 14, AAChartFontWeightTypeBold)))
    .oppositeSet(true);
    
    AATooltip *aaTooltip = AATooltip.new
    .enabledSet(true)
    .sharedSet(true);
    
    NSArray *seriesArr = @[
        AASeriesElement.new
        .nameSet(@"2020")
        .typeSet(AAChartTypeSpline)
        .lineWidthSet(@7)
        .colorSet((id)AAGradientColor.deepSeaColor)
        .borderRadiusSet(@4)
        .yAxisSet(@1)
        .dataSet(@[
            @0, @71.5, @106.4, @129.2, @144.0, @176.0,
            @135.6, @148.5, @216.4, @194.1, @95.6, @54.4
                 ]),
        AASeriesElement.new
        .nameSet(@"2021")
        .typeSet(AAChartTypeSpline)
        .lineWidthSet(@7)
        .colorSet((id)AAGradientColor.sanguineColor)
        .yAxisSet(@0)
        .dataSet(@[
            @135.6, @148.5, @216.4, @194.1, @95.6, @54.4,
            @0, @71.5, @106.4, @129.2, @144.0, @176.0
                 ])
    ];
    
    AAOptions *aaOptions = AAOptions.new
    .chartSet(aaChart)
    .titleSet(aaTitle)
    .plotOptionsSet(aaPlotOptions)
    .xAxisSet(aaXAxis)
    .yAxisSet((id)@[yAxis1,yAxis2])
    .tooltipSet(aaTooltip)
    .seriesSet(seriesArr)
    ;
    return aaOptions;
}

//Stupid method
- (AAOptions *)customAreaChartXAxisLabelsTextUnitSuffix1 {
    NSDictionary *gradientColorDic1 =
    [AAGradientColor gradientColorWithDirection:AALinearGradientDirectionToTop
                               startColorString:@"#7052f4"//颜色字符串设置支持十六进制类型和 rgba 类型
                                 endColorString:@"#00b0ff"];
    
    AAChartModel *aaChartModel = AAChartModel.new
    .chartTypeSet(AAChartTypeArea)//图表类型
    .titleSet(@"Custom X Axis Labels Text")//图表主标题
    .subtitleSet(@"By Using JavaScript Formatter Function")//图表副标题
    .markerSymbolStyleSet(AAChartSymbolStyleTypeBorderBlank)//折线连接点样式为外边缘空白
    .yAxisGridLineStyleSet([AALineStyle styleWithWidth:@0])//y轴横向分割线宽度(为0即是隐藏分割线)
    .seriesSet(@[
        AASeriesElement.new
        .lineWidthSet(@1.5)
        .colorSet(@"#00b0ff")
        .fillColorSet((id)gradientColorDic1)
        .nameSet(@"2018")
        .dataSet(@[
            @1.51, @6.7, @0.94, @1.44, @1.6, @1.63, @1.56, @1.91, @2.45, @3.87, @3.24, @4.90, @4.61, @4.10,
            @4.17, @3.85, @4.17, @3.46, @3.46, @3.55, @3.50, @4.13, @2.58, @2.28,@1.51, @12.7, @0.94, @1.44,
            @18.6, @1.63, @1.56, @1.91, @2.45, @3.87, @3.24, @4.90, @4.61, @4.10, @4.17, @3.85, @4.17, @3.46,
            @3.46, @3.55, @3.50, @4.13, @2.58, @2.28,@1.33, @4.68, @1.31, @1.10, @13.9, @1.10, @1.16, @1.67,
            @2.64, @2.86, @3.00, @3.21, @4.14, @4.07, @3.68, @3.11, @3.41, @3.25, @3.32, @3.07, @3.92, @3.05,
            @2.18, @3.24,@3.23, @3.15, @2.90, @1.81, @2.11, @2.43, @5.59, @3.09, @4.09, @6.14, @5.33, @6.05,
            @5.71, @6.22, @6.56, @4.75, @5.27, @6.02, @5.48])
    ]);
    
    AAOptions *aaOptions = aaChartModel.aa_toAAOptions;
    aaOptions.xAxis.labels
    .formatterSet(@AAJSFunc(function () {
        const xValue = this.value;
        if (xValue%10 == 0) {
            return xValue + " sec"
        } else {
            return "";
        }
    }))
    ;
    
    return aaOptions;
}

//Smart method
- (AAOptions *)customAreaChartXAxisLabelsTextUnitSuffix2 {
    AAOptions *aaOptions = [self customAreaChartXAxisLabelsTextUnitSuffix1];
    aaOptions.xAxis
    .labelsSet(AALabels.new
               .stepSet(@10)
               .formatSet(@"{value} sec"))
    ;
    
    return aaOptions;
}

//https://github.com/AAChartModel/AAChartKit/issues/1217
- (AAOptions *)customColumnChartXAxisLabelsTextByInterceptTheFirstFourCharacters {
    AAChartModel *aaChartModel = AAChartModel.new
    .chartTypeSet(AAChartTypeBar)//图表类型
    .titleSet(@"春江花月夜")//图表主标题
    .subtitleSet(@"张若虚")//图表副标题
    .yAxisGridLineStyleSet([AALineStyle styleWithWidth:@0])//y轴横向分割线宽度(为0即是隐藏分割线)
    .xAxisReversedSet(true)
    .xAxisLabelsStyleSet(AAStyleColor(AAColor.blackColor))
    .legendEnabledSet(false)
    .categoriesSet(@[
        @"春江潮水连海平", @"海上明月共潮生",
        @"滟滟随波千万里", @"何处春江无月明",
        @"江流宛转绕芳甸", @"月照花林皆似霰",
        @"空里流霜不觉飞", @"汀上白沙看不见",
        @"江天一色无纤尘", @"皎皎空中孤月轮",
        @"江畔何人初见月", @"江月何年初照人",
        @"人生代代无穷已", @"江月年年望相似",
        @"不知江月待何人", @"但见长江送流水",
        @"白云一片去悠悠", @"青枫浦上不胜愁",
        @"谁家今夜扁舟子", @"何处相思明月楼",
        @"可怜楼上月裴回", @"应照离人妆镜台",
        @"玉户帘中卷不去", @"捣衣砧上拂还来",
        @"此时相望不相闻", @"愿逐月华流照君",
        @"鸿雁长飞光不度", @"鱼龙潜跃水成文",
        @"昨夜闲潭梦落花", @"可怜春半不还家",
        @"江水流春去欲尽", @"江潭落月复西斜",
        @"斜月沉沉藏海雾", @"碣石潇湘无限路",
        @"不知乘月几人归", @"落月摇情满江树",
                   ])
    .seriesSet(@[
        AASeriesElement.new
        .lineWidthSet(@1.5)
        .colorSet((id)AAGradientColor.new
                  .directionSet(AALinearGradientDirectionToTop)
                  .startColorSet(@"#7052f4")
                  .endColorSet(@"#00b0ff"))
        .nameSet(@"2018")
        .dataSet(@[
            @1.51, @3.7, @0.94, @1.44, @1.6, @1.63, @1.56, @1.91, @2.45, @3.87, @3.24, @4.90, @4.61, @4.10,
            @4.17, @3.85, @4.17, @3.46, @3.46, @3.55, @3.50, @4.13, @2.58, @2.28,@1.51, @2.7, @0.94, @1.44,
            @3.6, @1.63, @1.56, @1.91, @2.45, @3.87, @3.24, @4.90,
                 ])
    ]);
    
    AAOptions *aaOptions = aaChartModel.aa_toAAOptions;
    aaOptions.xAxis.labels
    .formatterSet(@AAJSFunc(function () {
        const xAxisCategory = this.value;
        if (xAxisCategory.length > 4) {
            return xAxisCategory.substr(0, 4);
        } else {
            return xAxisCategory;
        }
    }))
    ;
    
    return aaOptions;
}



@end
