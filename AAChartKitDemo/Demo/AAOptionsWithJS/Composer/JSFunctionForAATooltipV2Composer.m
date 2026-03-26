//
//  JSFunctionForAATooltipVC2.m
//  AAChartKitDemo
//
//  Created by AnAn on 2022/10/9.
//  Copyright © 2022 An An. All rights reserved.
//

#import "JSFunctionForAATooltipV2Composer.h"
#import "AAChartKit.h"

@interface JSFunctionForAATooltipV2Composer ()

@end

@implementation JSFunctionForAATooltipV2Composer

//https://github.com/AAChartModel/AAChartKit/issues/966
+ (AAOptions *)customTooltipPostionerFunction {
    NSArray *categoriesArr = @[
        @"孤岛危机",
        @"使命召唤",
        @"荣誉勋章",
        @"狙击精英",
        @"神秘海域",
        @"最后生还者",
        @"巫师3狂猎",
        @"对马之魂",
        @"蝙蝠侠阿甘骑士",
        @"地狱边境",
        @"闪客",
        @"忍者之印"
    ];
    
    AAChartModel *aaChartModel = AAChartModel.new
    .chartTypeSet(AAChartTypeColumn)
    .categoriesSet(categoriesArr)
    .seriesSet(@[
        AASeriesElement.new
        .nameSet(@"单机大作")
        .colorSet(AAColor.redColor)
        .dataSet(@[@7.0, @6.9, @9.5, @14.5, @18.2, @21.5, @25.2, @26.5, @23.3, @18.3, @13.9, @9.6])
               ])
    ;
    
    AAOptions *aaOptions = aaChartModel.aa_toAAOptions;
    
    aaOptions.tooltip
    .positionerSet(@AAJSFunc(function (labelWidth, labelHeight, point) {
        const position = {};
        position["x"] = point.plotX;
        position["y"] = 20;
        return position;
    }));
    
    return aaOptions;
}

+ (AAOptions *)fixedTooltipPositionByCustomPositionerFunction {
    AAOptions *aaOptions = [self customTooltipPostionerFunction];
    aaOptions.tooltip
    .positionerSet(@AAJSFunc(function () {
        const position = {};
        position["x"] = 50;
        position["y"] = 50;
        return position;
    }));
    
    return aaOptions;
}

//https://github.com/AAChartModel/AAChartKit/issues/1033
+ (AAOptions *)customPlotAreaOutsideComlicatedTooltipStyle {
    NSArray *categoriesArr = @[
        @"11 月 01 日",
        @"11 月 02 日",
        @"11 月 03 日",
        @"11 月 04 日",
        @"11 月 05 日",
        @"11 月 06 日",
        @"11 月 07 日",
        @"11 月 08 日",
        @"11 月 09 日",
        
        @"11 月 10 日",
        @"11 月 11 日",
        @"11 月 12 日",
        @"11 月 13 日",
        @"11 月 14 日",
        @"11 月 15 日",
        @"11 月 16 日",
        @"11 月 17 日",
        @"11 月 18 日",
        @"11 月 19 日",

        @"11 月 20 日",
        @"11 月 21 日",
        @"11 月 22 日",
        @"11 月 23 日",
        @"11 月 24 日",
        @"11 月 25 日",
        @"11 月 26 日",
        @"11 月 27 日",
        @"11 月 28 日",
        @"11 月 29 日",
        @"11 月 30 日",
        
        @"12 月 01 日",
        @"12 月 02 日",
        @"12 月 03 日",
        @"12 月 04 日",
        @"12 月 05 日",
        @"12 月 06 日",
        @"12 月 07 日",
        @"12 月 08 日",
        @"12 月 09 日",
        
        @"12 月 10 日",
        @"12 月 11 日",
        @"12 月 12 日",
        @"12 月 13 日",
        @"12 月 14 日",
        @"12 月 15 日",
        @"12 月 16 日",
        @"12 月 17 日",
        @"12 月 18 日",
        @"12 月 19 日",

        @"12 月 20 日",
        @"12 月 21 日",
        @"12 月 22 日",
        @"12 月 23 日",
        @"12 月 24 日",
        @"12 月 25 日",
        @"12 月 26 日",
        @"12 月 27 日",
        @"12 月 28 日",
        @"12 月 29 日",
        @"12 月 30 日",
        @"12 月 31 日",
    ];
    
    AAChartModel *aaChartModel = AAChartModel.new
    .chartTypeSet(AAChartTypeColumn)
    .categoriesSet(categoriesArr)
    .seriesSet(@[
        AASeriesElement.new
        .nameSet(@"个人徒步数据统计")
        .colorSet(AARgbaColor(235, 88, 40, 1.0))
        .borderRadiusTopLeftSet((id)@"50%")
        .borderRadiusTopRightSet((id)@"50%")
        .dataSet(@[
            @1300.988, @900.699,@1000.089, @1100.965, @1000.534, @1400.523,
            @1800.254, @1900.377, @2100.523, @2500.256, @2600.555, @2800.366,
            @1300.988, @900.699,@1000.089, @1100.965, @1000.534, @1400.523,
            @1800.254, @1900.377, @2100.523, @2500.256, @2600.555, @2800.366,
            @1300.988, @900.699,@1000.089, @1100.965, @1000.534, @1400.523,
            @1800.254, @1900.377, @2100.523, @2500.256, @2600.555, @2800.366,
            @1300.988, @900.699,@1000.089, @1100.965, @1000.534, @1400.523,
            @1800.254, @1900.377, @2100.523, @2500.256, @2600.555, @2800.366,
            @1300.988, @900.699,@1000.089, @1100.965, @1000.534, @1400.523,
            @1800.254, @1900.377, @2100.523, @2500.256, @2600.555, @2800.366,
                 ])
               ])
    ;
    
    AAOptions *aaOptions = aaChartModel.aa_toAAOptions;
    
    aaOptions.xAxis
    .crosshairSet(AACrosshair.new
                  .colorSet(AARgbaColor(209, 209, 209, 1.0))
                  .dashStyleSet(AAChartLineDashStyleTypeLongDash)
                  .widthSet(@3))
    ;
    
    aaOptions.yAxis
    .topSet(@"30%")//https://api.highcharts.com/highcharts/yAxis.top
    .heightSet(@"70%")//https://api.highcharts.com/highcharts/yAxis.height
    ;
    
    CGFloat screenWidth = UIScreen.mainScreen.bounds.size.width;
    
    NSString *positionerStr = [NSString stringWithFormat:@AAJSFunc(function (labelWidth, labelHeight, point) {
        const xPosition = point.plotX;
        const maxXPosition = %@ - 268;
        if (xPosition >= maxXPosition) {
            xPosition = maxXPosition
        }
        const position = {};
        position["x"] = xPosition;
        position["y"] = 50;
        return position;
    }), @(screenWidth)];
    
    aaOptions.tooltip
    .useHTMLSet(true)
    .headerFormatSet(@"总计<br/>")
    .pointFormatSet(@"<span style=""color:black;font-weight:bold;font-size:38px"">{point.y} </span> 步<br/>")
    .footerFormatSet(@"2020 年 {point.x} ")
    .valueDecimalsSet(@2)//设置取值精确到小数点后几位
    .backgroundColorSet(AARgbaColor(242, 242, 242, 1.0))
    .borderWidthSet(@0)
    .shapeSet(@"square")
    .styleSet(AAStyleColorSize(AARgbaColor(132, 132, 132, 1.0), 28))
    .positionerSet(positionerStr);
    
    return aaOptions;
}

//https://github.com/AAChartModel/AAChartKit/issues/1042
+ (AAOptions *)makePieChartShow0Data {
    return AAOptions.new
    .titleSet((id)NSNull.null)
    .chartSet(AAChart.new
              .typeSet(AAChartTypePie))
    .seriesSet(@[
        AASeriesElement.new
        .nameSet(@"ZeroDataPie")
        .dataSet(@[
            @{@"y":@1, @"isZero":@true, @"name": @"One"  },
            @{@"y":@1, @"isZero":@true, @"name": @"Two"  },
            @{@"y":@1, @"isZero":@true, @"name": @"Three"}
                 ])
        .tooltipSet(AATooltip.new
                    .sharedSet(false)
                    .pointFormatterSet(@AAJSFunc(
        function() {
            return "<span style=\'color:" + this.color + "\'> ◉ </span>"
            + this.series.name
            + ": <b>"
            + (this.options.isZero ? 0 : this.y)
            + "</b><br/>";
        })))
               ])
    ;
}

//https://github.com/AAChartModel/AAChartKit-Swift/issues/365
//https://api.highcharts.com/highcharts/tooltip.formatter
//Callback function to format the text of the tooltip from scratch. In case of single or shared tooltips,
//a string should be returned. In case of split tooltips, it should return an array where the first item
//is the header, and subsequent items are mapped to the points. Return `false` to disable tooltip for a
//specific point on series.
+ (AAOptions *)customColumnChartBorderStyleAndStatesHoverColor {
    AAChartModel *aaChartModel = AAChartModel.new
        .chartTypeSet(AAChartTypeColumn)
        .stackingSet(AAChartStackingTypeNormal)
        .colorsThemeSet(@[AAColor.darkGrayColor, AAColor.lightGrayColor])//Colors theme
        .categoriesSet(@[
            @"January", @"February", @"March", @"April", @"May", @"June",
            @"July", @"August", @"September", @"October", @"November", @"December"
        ])
        .seriesSet(@[
            AASeriesElement.new
                .nameSet(@"Berlin Hot")
                .borderColorSet(AAColor.whiteColor)
                .borderWidthSet(@3)
                .borderRadiusSet(@10)
                .statesSet(AAStates.new
                    .hoverSet(AAHover.new
                        .colorSet(AAColor.redColor)))
                .dataSet(@[@7.0, @6.9, @9.5, @14.5, @18.2, @21.5, @25.2, @26.5, @23.3, @18.3, @13.9, @9.6]),
            
            AASeriesElement.new
                .nameSet(@"Beijing Hot")
                .borderColorSet(AAColor.whiteColor)
                .borderWidthSet(@3)
                .borderRadiusSet(@10)
                .statesSet(AAStates.new
                    .hoverSet(AAHover.new
                        .colorSet(@"dodgerblue")))// Dodgerblue／道奇藍／#1e90ff十六进制颜色代码
                .dataSet(@[@0.2, @0.8, @5.7, @11.3, @17.0, @22.0, @24.8, @24.1, @20.1, @14.1, @8.6, @2.5]),
        ]);
    
    AAOptions *aaOptions = aaChartModel.aa_toAAOptions;
    aaOptions.tooltip
        .formatterSet(@AAJSFunc(function () {
               return false;
        }));
    
    return aaOptions;
}

//https://github.com/AAChartModel/AAChartKit/issues/1406
//https://www.highcharts.com/forum/viewtopic.php?f=9&t=49629
+ (AAOptions *)customizeTooltipShapeAndShadowBeSpecialStyle {
  AAOptions *aaOptions = AAOptions.new
    .chartSet(AAChart.new
                .typeSet(AAChartTypeSpline)
                .backgroundColorSet(@"#f4f8ff"))
    .tooltipSet(AATooltip.new
                  .useHTMLSet(true)
                  .backgroundColorSet(@"transparent")
                  .borderColorSet(@"transparent")
                  .shadowSet(false)
                  .paddingSet(@0)
                  .sharedSet(true)
                  .formatterSet(@AAJSFunc(function() {
                      const points = this.points;

                      let htmlPoints = "";

                      points.forEach(function(point) {
                          htmlPoints += "<div>"
                              + "<span style='color:" + point.color + "'>\u25CF</span> "
                              + point.y
                              + "</div>";
                      });
                      
                      return "<div style='"
                          + "border-radius: 0.5rem 0.5rem 0.5rem 0;"
                          + "background-color: white;"
                          + "box-shadow: #b1c7ff 0px 3px 10px 0px;"
                          + "padding: 0.5rem;"
                          + "line-height: 18px;"
                          + "'>"
                          + htmlPoints
                          + "</div>";
                  }))
                .positionerSet(@AAJSFunc((function(labelWidth, labelHeight) {
                    const chart = this.chart,
                    point = chart.hoverPoint,
                    offset = 10,
                    pointX = chart.plotLeft + point.plotX + offset,
                    x = chart.chartWidth < pointX + labelWidth ? chart.chartWidth - labelWidth : pointX,
                    y = chart.plotTop + point.plotY - labelHeight - offset;
                    
                    return {x, y};
                }))))
    .seriesSet(@[
        AASeriesElement.new
            .dataSet(@[@223.2, @312.1, @152.7, @161.9, @196.6]),
        AASeriesElement.new
            .dataSet(@[@122.2, @53.7, @300.0, @110.5, @320.4]),
    ]);

    return aaOptions;
}



// Helper function to create Date UTC timestamps for data
NSDate *getDateUTC(NSInteger hour, NSInteger minute) {
    NSDate *now = [NSDate date];
    NSCalendar *calendar = [[NSCalendar alloc] initWithCalendarIdentifier:NSCalendarIdentifierGregorian];
    [calendar setTimeZone:[NSTimeZone timeZoneWithAbbreviation:@"UTC"]];
    NSDateComponents *components = [calendar components:(NSCalendarUnitYear | NSCalendarUnitMonth | NSCalendarUnitDay) fromDate:now];
    [components setHour:hour];
    [components setMinute:minute];
    [components setSecond:0];
    return [calendar dateFromComponents:components];
}

//https://github.com/AAChartModel/AAChartKit/issues/1586
+ (AAOptions *)specialStyleForAreaChart {
    AAOptions *aaOptions = AAOptions.new
        .chartSet(AAChart.new
            .typeSet(AAChartTypeArea) // Chart type: area
            .backgroundColorSet(@"#333333") // Dark background for the chart area
        )
        .titleSet(AATitle.new
            .textSet(@"Speed(km/h)") // Title with HTML
            .alignSet(AAChartAlignTypeLeft) // Align title to the left
            .styleSet(AAStyle.new
                .colorSet(@"#E0E0E3") // Light text color
                .fontSizeSet(@"16px")
            )
        )
        .creditsSet(AACredits.new
            .enabledSet(false) // Disable credits
        )
        .legendSet(AALegend.new
            .enabledSet(false) // Disable legend
        )
        .xAxisSet(AAXAxis.new
            .typeSet(@"datetime") // X-axis type: datetime
            .tickIntervalSet(@(2 * 3600 * 1000)) // Every 2 hours
            .labelsSet(AALabels.new
                .formatSet(@"{value:%H:%M}") // Time format HH:MM
                .styleSet(AAStyle.new
                    .colorSet(@"#E0E0E3")
                )
            )
            .lineColorSet(@"#707073") // Axis line color
            .tickColorSet(@"#707073")
            .gridLineWidthSet(@0) // Hide vertical grid lines
        )
        .yAxisSet(AAYAxis.new
            .oppositeSet(true) // Move y-axis to the right
            .labelsSet(AALabels.new
                .alignSet(@"left") // Labels aligned left (relative to axis)
                .xSet(@-20) // Adjust position slightly left
                .ySet(@-10) // Offset upward by 10px
                .styleSet(AAStyle.new
                    .colorSet(@"#E0E0E3")
                    .fontSizeSet(@"15")
                    .textOverflowSet(@"none") // Prevent text truncation
                )
            )
            .minSet(@0)
            .maxSet(@50)
            .tickIntervalSet(@10)
            .titleSet(AAAxisTitle.new
                .textSet(nil) // No Y-axis title
            )
            .gridLineColorSet(@"#505053") // Lighter gray grid lines
            .gridLineDashStyleSet(AAChartLineDashStyleTypeSolid)
            .plotLinesSet(@[
                AAPlotLinesElement.new
                    .valueSet(@23.5) // Approximate value for the dashed line
                    .colorSet(@"#707073")
                    .dashStyleSet(@"Dash")
                    .widthSet(@1.5)
                    .zIndexSet(@3) // Above grid lines
            ])
        )
        .tooltipSet(AATooltip.new
            .backgroundColorSet(@"rgba(50, 50, 50, 0.85)")
            .styleSet(AAStyle.new
                .colorSet(@"#F0F0F0")
            )
            .formatterSet(@AAJSFunc(function () {
                return `<b>${Highcharts.dateFormat('%H:%M', this.x)}</b><br/>Speed: ${this.y} km/h`;
            })) // Custom formatter as a JS string
        )
      
        .seriesSet(@[
            AASeriesElement.new
                .nameSet(@"Speed")
                .dataSet(@[
                    @[[NSNumber numberWithDouble:[getDateUTC(12, 0) timeIntervalSince1970] * 1000], @5],
                    @[[NSNumber numberWithDouble:[getDateUTC(12, 30) timeIntervalSince1970] * 1000], @21],
                    @[[NSNumber numberWithDouble:[getDateUTC(13, 0) timeIntervalSince1970] * 1000], @8],
                    @[[NSNumber numberWithDouble:[getDateUTC(13, 30) timeIntervalSince1970] * 1000], @33],
                    @[[NSNumber numberWithDouble:[getDateUTC(14, 0) timeIntervalSince1970] * 1000], @9],
                    @[[NSNumber numberWithDouble:[getDateUTC(14, 30) timeIntervalSince1970] * 1000], @18],
                    @[[NSNumber numberWithDouble:[getDateUTC(15, 0) timeIntervalSince1970] * 1000], @7],
                    @[[NSNumber numberWithDouble:[getDateUTC(15, 30) timeIntervalSince1970] * 1000], @28],
                    @[[NSNumber numberWithDouble:[getDateUTC(16, 0) timeIntervalSince1970] * 1000], @8],
                    @[[NSNumber numberWithDouble:[getDateUTC(16, 30) timeIntervalSince1970] * 1000], @15],
                    @[[NSNumber numberWithDouble:[getDateUTC(16, 45) timeIntervalSince1970] * 1000], @8],
                    @[[NSNumber numberWithDouble:[getDateUTC(17, 15) timeIntervalSince1970] * 1000], @48], // Highest peak
                    @[[NSNumber numberWithDouble:[getDateUTC(17, 40) timeIntervalSince1970] * 1000], @8],
                    @[[NSNumber numberWithDouble:[getDateUTC(17, 50) timeIntervalSince1970] * 1000], @18],
                    @[[NSNumber numberWithDouble:[getDateUTC(18, 0) timeIntervalSince1970] * 1000], @7],
                    @[[NSNumber numberWithDouble:[getDateUTC(18, 50) timeIntervalSince1970] * 1000], [NSNull null]], // Null value
                ])
                .lineWidthSet(@2)
                .colorSet((id)AAGradientColor.new
                    .linearGradientSet(AALinearGradient.new
                        .x1Set(@0)
                        .y1Set(@0)
                        .x2Set(@0)
                        .y2Set(@1))
                    .stopsSet(@[
                        @[@0, @"red"], // Start color (orange/yellow) with opacity
                        @[@1, @"rgba(51, 51, 51, 0)"] // End color (transparent towards background)
                    ])
                )
                .markerSet(AAMarker.new
                    .enabledSet(false) // No markers by default
                    .statesSet(AAMarkerStates.new
                        .hoverSet(AAMarkerHover.new
                            .enabledSet(false)
                            .radiusSet(@4)
                        )
                    )
                )
                .fillColorSet((id)AAGradientColor.new
                    .linearGradientSet(AALinearGradient.new
                        .x1Set(@0)
                        .y1Set(@0)
                        .x2Set(@0)
                        .y2Set(@1))
                    .stopsSet(@[
                        @[@0, @"rgba(255, 191, 0, 0.6)"], // Start color (orange/yellow) with opacity
                        @[@1, @"rgba(51, 51, 51, 0)"] // End color (transparent towards background)
                    ])
                )
                .thresholdSet(nil) // Needed for area chart fill to start from bottom
        ]);

    return aaOptions;
}



@end
