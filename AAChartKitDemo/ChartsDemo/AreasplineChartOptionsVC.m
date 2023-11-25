//
//  AreasplineChartOptionsVC.m
//  AAChartKitDemo
//
//  Created by Admin on 2021/9/16.
//  Copyright © 2021 An An. All rights reserved.
//

#import "AreasplineChartOptionsVC.h"

@interface AreasplineChartOptionsVC ()

@end

@implementation AreasplineChartOptionsVC

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
}

- (id)chartConfigurationWithSelectedIndex:(NSUInteger)selectedIndex {
    switch (self.selectedIndex) {
        case 0: return [self configureComplicatedCustomAreasplineChart];//复杂自定义曲线填充图 1
        case 1: return [self configureComplicatedCustomAreasplineChart2];//复杂自定义曲线填充图 2
        case 2: return [self configureComplicatedCustomAreasplineChart3];//复杂自定义曲线填充图 3
        case 3: return [self fanChart];//折扇图

        default:
            break;
    }
    return nil;
}

// https://github.com/AAChartModel/AAChartKit/issues/941
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
               .fillColorSet(AAColor.whiteColor)//点的填充色(用来设置折线连接点的填充色)
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
               .fillColorSet(AAColor.whiteColor)//点的填充色(用来设置折线连接点的填充色)
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
               .fillColorSet(AAColor.whiteColor)//点的填充色(用来设置折线连接点的填充色)
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
               .fillColorSet(AAColor.whiteColor)//点的填充色(用来设置折线连接点的填充色)
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
               .fillColorSet(AAColor.whiteColor)//点的填充色(用来设置折线连接点的填充色)
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
               .fillColorSet(AAColor.whiteColor)//点的填充色(用来设置折线连接点的填充色)
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

- (AAOptions *)fanChart {
    return AAOptions.new
        .chartSet(AAChart.new
                  .typeSet(AAChartTypeArearange)
                  .pinchTypeSet(AAChartZoomTypeX))
        .titleSet(AATitle.new.textSet(@"EU GDP"))
        .subtitleSet(AASubtitle.new
                   .textSet(@"<a href=\"https://economy-finance.ec.europa.eu/system/files/2023-05/SF_2023_Statistical%20Annex.pdf\" target=\"_blank\">European Economic Forecast, Spring 2023</a>".aa_toPureJSString))
        .xAxisSet(AAXAxis.new
                  .typeSet(AAChartAxisTypeCategory)
                  .minSet(@1)
                  .maxSet(@12)
                  .endOnTickSet(false)
                  .crosshairSet(AACrosshair.new
                                .dashStyleSet(AAChartLineDashStyleTypeSolid)
                                .colorSet(AAColor.lightGrayColor))
                  .plotBandsSet(@[
                       AAPlotBandsElement.new
                           .colorSet(@"rgba(255, 75, 66, 0.07)")
                           .fromSet(@5.5)
                           .toSet(@99)
                           .labelSet(AALabel.new
                           .textSet(@"Forecast"))
                   ])
                   .plotLinesSet(@[
                       AAPlotLinesElement.new
                           .dashStyleSet(AAChartLineDashStyleTypeDash)
                           .colorSet(AAColor.grayColor)
                           .widthSet(@2)
                           .valueSet(@5.5)
                   ]))
        .yAxisSet(AAYAxis.new
                  .oppositeSet(true)
                  .titleSet(AAAxisTitle.new
                            .textSet(@"GDP change<br/>on preceding year"))
                  .labelsSet(AALabels.new.formatSet(@"{value}%"))
                  .maxSet(@30))
        .tooltipSet(AATooltip.new
                    .sharedSet(true)
                    .valueSuffixSet(@"%")
                    .valuePrefixSet(@"+"))
        .plotOptionsSet(AAPlotOptions.new
                        .seriesSet(AASeries.new
                                   .markerSet(AAMarker.new
                                              .enabledSet(false)))
                        .arearangeSet(AAArearange.new
                                      .enableMouseTrackingSet(@NO)
                                      .statesSet(AAStates.new
                                                 .inactiveSet(AAInactive.new
                                                              .enabledSet(true)))
                                      .colorSet(AAColor.redColor)
                                      .fillOpacitySet(@(1 / 3.0))
                                      .lineWidthSet(@0)))
        .legendSet(AALegend.new
                   .enabledSet(false))
        .seriesSet(@[
            AASeriesElement.new
            .nameSet(@"EU GDP")
            .typeSet(AAChartTypeLine)
            .dataSet(@[
                @[@"2021", @5.4],
                @[@"Q1.2022", @5.7],
                @[@"Q2.2022", @4.4],
                @[@"Q3.2022", @2.6],
                @[@"Q4.2022", @1.7],
                @[@"Q1.2023", @1.3],
                @[@"Q2.2023", @0.6],
                @[@"Q3.2023", @0.6],
                @[@"Q4.2023", @1.1],
                @[@"Q1.2024", @1.3],
                @[@"Q2.2024", @1.5],
                @[@"Q3.2024", @1.6],
                @[@"Q4.2024", @1.7],
                @[@"2025", @1.7]
            ])
            .zIndexSet(@2)
            .colorSet(AAColor.redColor)
            .lineWidthSet(@4),
            AASeriesElement.new
            .nameSet(@"1σ")
            .dataSet(@[
                @[@"Q1.2023", @1.3, @1.3],
                @[@"Q2.2023", @-3.4, @4.6],
                @[@"Q3.2023", @-3.4, @4.6],
                @[@"Q4.2023", @-2.9, @5.1],
                @[@"Q1.2024", @-2.7, @5.3],
                @[@"Q2.2024", @-2.5, @5.5],
                @[@"Q3.2024", @-2.4, @5.6],
                @[@"Q4.2024", @-2.3, @5.7],
                @[@"2025", @-2.3, @5.7]
            ]),
            AASeriesElement.new
            .nameSet(@"2σ")
            .dataSet(@[
                @[@"Q1.2023", @1.3, @1.3],
                @[@"Q2.2023", @-7.4, @8.6],
                @[@"Q3.2023", @-7.4, @8.6],
                @[@"Q4.2023", @-6.9, @9.1],
                @[@"Q1.2024", @-6.7, @9.3],
                @[@"Q2.2024", @-6.5, @9.5],
                @[@"Q3.2024", @-6.4, @9.6],
                @[@"Q4.2024", @-6.3, @9.7],
                @[@"2025", @-6.3, @9.7]
            ]),
            AASeriesElement.new
            .nameSet(@"3σ")
            .dataSet(@[
                @[@"Q1.2023", @1.3, @1.3],
                @[@"Q2.2023", @-11.4, @12.6],
                @[@"Q3.2023", @-11.4, @12.6],
                @[@"Q4.2023", @-10.9, @13.1],
                @[@"Q1.2024", @-10.7, @13.3],
                @[@"Q2.2024", @-10.5, @13.5],
                @[@"Q3.2024", @-10.4, @13.6],
                @[@"Q4.2024", @-10.3, @13.7],
                @[@"2025", @-10.3, @13.7]
            ])
        ]);
}

@end
