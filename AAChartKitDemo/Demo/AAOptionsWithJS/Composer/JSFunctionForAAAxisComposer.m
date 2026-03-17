//
//  JSFunctionForAAAxisVC.m
//  AAChartKitDemo
//
//  Created by AnAn on 2022/9/9.
//  Copyright © 2022 An An. All rights reserved.
//*************** ............ SOURCE CODE ............ ***************
//***.............................................................  ***
//*** iOS     :https://github.com/AAChartModel/AAChartKit           ***
//*** iOS     :https://github.com/AAChartModel/AAChartKit-Swift     ***
//*** Android :https://github.com/AAChartModel/AAChartCore          ***
//*** Android :https://github.com/AAChartModel/AAChartCore-Kotlin   ***
//***...............................................................***
//*************** ............ SOURCE CODE ............ ***************

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

#import "JSFunctionForAAAxisComposer.h"
#import "AAChartKit.h"

@interface JSFunctionForAAAxisComposer ()

@end

@implementation JSFunctionForAAAxisComposer

//https://github.com/AAChartModel/AAChartKit/issues/675
+ (AAOptions *)customYAxisLabels {
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

+ (AAOptions *)customYAxisLabels2 {
    AAChartModel *aaChartModel = AAChartModel.new
    .chartTypeSet(AAChartTypeLine)//图表类型
    .markerSymbolStyleSet(AAChartSymbolStyleTypeBorderBlank)//折线连接点样式为外边缘空白
    .dataLabelsEnabledSet(false)
    .colorsThemeSet(@[@"#04d69f",@"#1e90ff",@"#ef476f",@"#ffd066",])
    .stackingSet(AAChartStackingTypeNormal)
    .markerRadiusSet(@8)
    .seriesSet(@[
        AASeriesElement.new
        .nameSet(@"Tokyo Hot")
        .lineWidthSet(@5.0)
        .fillOpacitySet(@0.4)
        .dataSet( @[@229.9, @771.5, @1106.4, @1129.2, @6644.0, @1176.0, @8835.6, @148.5, @8816.4, @6694.1, @7795.6, @9954.4]),
    ]);

    AALabels *aaYAxisLabels = AALabels.new
    .styleSet(AAStyle.new
              .colorSet(AAColor.grayColor)
              .fontSizeSet(@"10px")
              .fontWeightSet(AAChartFontWeightTypeBold))
    .formatterSet(@AAJSFunc(function () {
        const yValue = this.value;
        if (yValue == 0) {
            return "0";
        } else if (yValue == 2500) {
            return "25%";
        } else if (yValue == 5000) {
            return "50%";
        } else if (yValue == 7500) {
            return "75%";
        } else if (yValue == 10000) {
            return "100%";
        }
    }));

    AAOptions *aaOptions = aaChartModel.aa_toAAOptions;
    aaOptions.yAxis
    .oppositeSet(true)
    .tickWidthSet(@2)
    .lineWidthSet(@1.5)//Y轴轴线颜色
    .lineColorSet(AAColor.lightGrayColor)//Y轴轴线颜色
    .gridLineWidthSet(@0)//Y轴网格线
    .tickPositionsSet(@[@0,@2500,@5000,@7500,@10000])
    .labelsSet(aaYAxisLabels)
    ;

    return aaOptions;
}

//Stupid method
+ (AAOptions *)customAreaChartXAxisLabelsTextUnitSuffix1 {
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
                .fillColorSet((id)[AAGradientColor gradientColorWithDirection:AALinearGradientDirectionToTop
                                                             startColorString:@"#7052f4"//颜色字符串设置支持十六进制类型和 rgba 类型
                                                               endColorString:@"#00b0ff"])
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
+ (AAOptions *)customAreaChartXAxisLabelsTextUnitSuffix2 {
    AAOptions *aaOptions = [self customAreaChartXAxisLabelsTextUnitSuffix1];
    aaOptions.xAxis
        .labelsSet(AALabels.new
                   .stepSet(@10)
                   .formatSet(@"{value} sec"))
    ;
    
    return aaOptions;
}


//https://github.com/AAChartModel/AAChartKit/issues/901
//https://github.com/AAChartModel/AAChartKit/issues/952
+ (AAOptions *)configureTheAxesLabelsFormattersOfDoubleYAxesChart {
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
+ (AAOptions *)configureTheAxesLabelsFormattersOfDoubleYAxesChart2 {
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
+ (AAOptions *)configureTheAxesLabelsFormattersOfDoubleYAxesChart3 {
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

//https://github.com/AAChartModel/AAChartKit/issues/1217
+ (AAOptions *)customColumnChartXAxisLabelsTextByInterceptTheFirstFourCharacters {
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

//https://github.com/AAChartModel/AAChartKit/issues/852 自定义蜘蛛🕷图样式
+ (AAOptions *)customSpiderChartStyle {
    NSArray *categoryArr = @[
        @"周转天数(天)",
        @"订单满足率",
        @"订单履约时效",
        @"动销率",
        @"畅销商品缺货率",
        @"高库存金额占比",
        @"不动销金额占比",
        @"停采金额占比",
     ];
    
    NSString *categoryJSArrStr = [categoryArr aa_toJSArray];
    
    NSString *xAxisLabelsFormatter = [NSString stringWithFormat:(@AAJSFunc(function () {
        return %@[this.value];
    })),categoryJSArrStr];
    
    AAChartModel *aaChartModel = AAChartModel.new
    .chartTypeSet(AAChartTypeLine)//图表类型
    .titleSet(@"健康体检表")//图表主标题
    .colorsThemeSet(@[@"#fe117c",@"#ffc069",])//设置主体颜色数组
    .yAxisLineWidthSet(@0)
    .yAxisGridLineStyleSet([AALineStyle styleWithWidth:@0])
    .yAxisTickPositionsSet(@[@0, @5, @10, @15, @20, @25, @30, @35])
    .markerRadiusSet(@5)
    .markerSymbolSet(AAChartSymbolTypeCircle)
    .polarSet(true)
    .seriesSet(@[
        AASeriesElement.new
        .nameSet(@"本月得分")
        .dataSet(@[@7.0, @6.9, @9.5, @14.5, @18.2, @21.5, @25.2, @26.5,]),
        AASeriesElement.new
        .nameSet(@"上月得分")
        .dataSet(@[@0.2, @0.8, @5.7, @11.3, @17.0, @22.0, @24.8, @24.1, ]),
    ]);
    
    AAOptions *aaOptions = aaChartModel.aa_toAAOptions;
    
    aaOptions.chart
    .marginLeftSet(@80)
    .marginRightSet(@80);
    
    aaOptions.xAxis
    .lineWidthSet(@0)//避免多边形外环之外有额外套了一层无用的外环
    .labels.styleSet(AAStyleColor(AAColor.blackColor))
    .formatterSet(xAxisLabelsFormatter);

    aaOptions.yAxis
    .gridLineInterpolationSet(AAChartYAxisGridLineInterpolationTypePolygon)//设置蜘蛛网🕸图表的网线为多边形
    .labels.styleSet(AAStyleColor(AAColor.blackColor))
    ;
    
    //设定图例项的CSS样式。只支持有关文本的CSS样式设定。
    /*默认是：{
     "color": "#333333",
     "cursor": "pointer",
     "fontSize": "12px",
     "fontWeight": "bold"
     }
     */
    AAStyle *aaItemStyle = AAStyle.new
    .colorSet(AAColor.grayColor)//字体颜色
    .cursorSet(@"pointer")//(在移动端这个属性没什么意义,其实不用设置)指定鼠标滑过数据列时鼠标的形状。当绑定了数据列点击事件时，可以将此参数设置为 "pointer"，用来提醒用户改数据列是可以点击的。
    .fontSizeSet(@"14px")//字体大小
    .fontWeightSet(AAChartFontWeightTypeThin)//字体为细体字
    ;
    
    aaOptions.legend
    .enabledSet(true)
    .alignSet(AAChartAlignTypeCenter)//设置图例位于水平方向上的右侧
    .layoutSet(AAChartLayoutTypeHorizontal)//设置图例排列方式为垂直排布
    .verticalAlignSet(AAChartVerticalAlignTypeTop)//设置图例位于竖直方向上的顶部
    .itemStyleSet(aaItemStyle)
    ;
    
    return aaOptions;
}


// Refer to the issue https://github.com/AAChartModel/AAChartKit/issues/589
+ (AAOptions *)customizeEveryDataLabelSinglelyByDataLabelsFormatter {
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

// Refer to GitHub issue: https://github.com/AAChartModel/AAChartKit/issues/938
// Refer to online chart sample: https://www.highcharts.com/demo/column-comparison
+ (AAOptions *)customXAxisLabelsBeImages {
    NSArray *nameArr = @[
        @"South Korea",
        @"Japan",
        @"Australia",
        @"Germany",
        @"Russia",
        @"China",
        @"Great Britain",
        @"United States"
    ];
    
    NSArray *colorArr = @[
        AARgbColor(201, 36,  39 ),
        AARgbColor(201, 36,  39 ),
        AARgbColor(0,   82,  180),
        AARgbColor(0,   0,   0  ),
        AARgbColor(240, 240, 240),
        AARgbColor(255, 217, 68 ),
        AARgbColor(0,   82,  180),
        AARgbColor(215, 0,   38 )
    ];
    
    NSArray *imageLinkFlagArr = @[
        @"197582",
        @"197604",
        @"197507",
        @"197571",
        @"197408",
        @"197375",
        @"197374",
        @"197484"
    ];
    
    AAChartModel *aaChartModel = AAChartModel.new
    .chartTypeSet(AAChartTypeColumn)
    .titleSet(@"Custom X Axis Labels Be Images")
    .subtitleSet(@"use HTML")
    .categoriesSet(nameArr)
    .colorsThemeSet(colorArr)
    .seriesSet(@[
        AASeriesElement.new
        .nameSet(@"AD 2020")
        .dataSet(@[@9.0, @9.9, @9.5, @14.5, @18.2, @21.5, @25.2, @26.5])
        .colorByPointSet(@true)
        .borderRadiusTopLeftSet((id)@"50%")
        .borderRadiusTopRightSet((id)@"50%")
               ]);
    
    NSString *imageLinkFlagJSArrStr = [imageLinkFlagArr aa_toJSArray];
    NSString *xLabelsFormatter = [NSString stringWithFormat:(@AAJSFunc(function () {
        const imageFlag = %@[this.pos];
        const imageLink = "<span><img src=\"https://image.flaticon.com/icons/svg/197/" + imageFlag + ".svg\" style=\"width: 30px; height: 30px;\"/><br></span>";
        return imageLink;
    })),imageLinkFlagJSArrStr];
    
    //    https://api.highcharts.com.cn/highcharts#xAxis.labels.formatter
    AAOptions *aaOptions = aaChartModel.aa_toAAOptions;
    aaOptions.xAxis.labels
    .useHTMLSet(true)
    .formatterSet(xLabelsFormatter)
    ;
    
    aaOptions.plotOptions.column.groupPaddingSet(@0.005);

    /*Custom tooltip style*/
    NSString *tooltipFormatter = [NSString stringWithFormat:(@AAJSFunc(function () {
        const imageFlag = %@[this.point.index];
        const imageLink = "<span><img src=\"https://image.flaticon.com/icons/svg/197/" + imageFlag + ".svg\" style=\"width: 30px; height: 30px;\"/><br></span>";
        return imageLink
        + " 🌕 🌖 🌗 🌘 🌑 🌒 🌓 🌔 <br/> "
        + " Support JavaScript Function Just Right Now !!! <br/> "
        + " The Gold Price For <b>2020 "
        +  this.x
        + " </b> Is <b> "
        +  this.y
        + " </b> Dollars ";
    })),imageLinkFlagJSArrStr];
    
    aaOptions.tooltip
    .sharedSet(false)
    .useHTMLSet(true)
    .formatterSet(tooltipFormatter)
    ;
    
    return aaOptions;
}


// Refer to GitHub issue: https://github.com/AAChartModel/AAChartKit/issues/938
// Refer to online chart sample: https://www.highcharts.com/demo/column-comparison
//https://github.com/AAChartModel/AAChartKit/issues/1404
+ (AAOptions *)loadImageForAATooltip {
    NSArray *nameArr = @[
        @"South Korea",
        @"Japan",
        @"Australia",
        @"Germany",
        @"Russia",
        @"China",
        @"Great Britain",
        @"United States"
    ];
    
    NSArray *colorArr = @[
        AARgbColor(201, 36,  39 ),
        AARgbColor(201, 36,  39 ),
        AARgbColor(0,   82,  180),
        AARgbColor(0,   0,   0  ),
        AARgbColor(240, 240, 240),
        AARgbColor(255, 217, 68 ),
        AARgbColor(0,   82,  180),
        AARgbColor(215, 0,   38 )
    ];
    
    AAChartModel *aaChartModel = AAChartModel.new
    .chartTypeSet(AAChartTypeColumn)
    .categoriesSet(nameArr)
    .colorsThemeSet(colorArr)
    .seriesSet(@[
        AASeriesElement.new
        .nameSet(@"AD 2020")
        .dataSet(@[@9.0, @9.9, @9.5, @14.5, @18.2, @21.5, @25.2, @26.5])
        .colorByPointSet(@true)
        .borderRadiusTopLeftSet((id)@"50%")
        .borderRadiusTopRightSet((id)@"50%")
               ]);
    
    AAOptions *aaOptions = aaChartModel.aa_toAAOptions;
    aaOptions.plotOptions.column
        .groupPaddingSet(@0.005);
    
    NSString *imgFilePath = @"https://www.highcharts.com/samples/graphics/sun.png";
    //如果是加载本地图片, 使用如下👇🏻方法
    //NSString *imgFilePath = [[NSBundle mainBundle] pathForResource:@"sun" ofType:@".png"];

    /*Custom tooltip style*/
    NSString *tooltipFormatter = [NSString stringWithFormat:(@AAJSFunc(function () {
        const imageLink = "<span><img src=\"%@\" style=\"width: 30px; height: 30px;\"/></span><br/>";
        return imageLink
        + " Support JavaScript Function Just Right Now !!! <br/> "
        + " The Gold Price For <b>2020 "
        +  this.x
        + " </b> Is <b> "
        +  this.y
        + " </b> Dollars ";
    })), imgFilePath];
    
    aaOptions.tooltip
    .sharedSet(false)
    .useHTMLSet(true)
    .formatterSet(tooltipFormatter)
    ;
    
    return aaOptions;
}


@end
