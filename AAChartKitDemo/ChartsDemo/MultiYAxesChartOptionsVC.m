//
//  MultiYAxesChartOptionsVC.m
//  AAChartKitDemo
//
//  Created by Admin on 2021/9/15.
//  Copyright © 2021 An An. All rights reserved.
//

#import "MultiYAxesChartOptionsVC.h"

@interface MultiYAxesChartOptionsVC ()

@end

@implementation MultiYAxesChartOptionsVC

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
}

- (id)chartConfigurationWithSelectedIndex:(NSUInteger)selectedIndex {
    switch (self.selectedIndex) {
        case 0: return [self configureDoubleYAxesAreasplineMixedColumnChart];//双Y轴曲线面积-柱形混合图
        case 1: return [self configureTripleYAxesColumnMixedSplineChart];//三条Y轴柱形-曲线混合图
        case 2: return [self configureDoubleYAxesColumnMixedSplineChart];//双Y轴柱形-曲线混合图
        case 3: return [self configureDoubleYAxesMarketDepthChart];//双Y轴市场深度图

        default:
            break;
    }
    return nil;
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



- (AAOptions *)configureTripleYAxesColumnMixedSplineChart {
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

// https://github.com/AAChartModel/AAChartKit/issues/771
- (AAOptions *)configureDoubleYAxesColumnMixedSplineChart {
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
    
    for (NSUInteger i = 0; i < 33; i++) {
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
               .fillColorSet(AAColor.whiteColor)//点的填充色(用来设置折线连接点的填充色)
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
        .dashStyleSet(AAChartLineDashStyleTypeLongDashDot)
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


@end
