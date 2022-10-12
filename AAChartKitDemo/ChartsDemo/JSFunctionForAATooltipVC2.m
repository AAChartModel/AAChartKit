//
//  JSFunctionForAATooltipVC2.m
//  AAChartKitDemo
//
//  Created by AnAn on 2022/10/9.
//  Copyright © 2022 An An. All rights reserved.
//

#import "JSFunctionForAATooltipVC2.h"

@interface JSFunctionForAATooltipVC2 ()

@end

@implementation JSFunctionForAATooltipVC2

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
}


- (id)chartConfigurationWithSelectedIndex:(NSUInteger)selectedIndex {
    switch (self.selectedIndex) {
        case 0: return [self customColumnChartBorderStyleAndStatesHoverColor];//自定义📊柱状图的 border 样式和手指或鼠标 hover 时的显示效果
        case 1: return [self customTooltipPostionerFunction];//自定义浮动提示框 Positioner 函数
        case 2: return [self fixedTooltipPositionByCustomPositionerFunction];//通过 Positioner 函数来实现一个位置固定的提示框
        case 3: return [self customPlotAreaOutsideComlicatedTooltipStyle];//通过 Positioner 函数来实现绘图区外的复杂浮动提示框样式
        case 4: return [self makePieChartShow0Data];//使饼图显示为 0 的数据
        case 5: return [self customizeTooltipShapeAndShadowBeSpecialStyle];

        default:
            return nil;
    }
}

//https://github.com/AAChartModel/AAChartKit/issues/966
- (AAOptions *)customTooltipPostionerFunction {
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

- (AAOptions *)fixedTooltipPositionByCustomPositionerFunction {
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
- (AAOptions *)customPlotAreaOutsideComlicatedTooltipStyle {
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
    
    CGFloat screenWidth = self.view.frame.size.width;
    
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
- (AAOptions *)makePieChartShow0Data {
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
- (AAOptions *)customColumnChartBorderStyleAndStatesHoverColor {
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
- (AAOptions *)customizeTooltipShapeAndShadowBeSpecialStyle {
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

                      let htmlPoints = ``;

                      points.forEach(function(point) {
                          htmlPoints += `
                              <div>
                                  <span style="color:${point.color}">\u25CF</span> ${point.y}
                              </div>
                          `;
                      });
                      
                      return `
                          <div style="
                              border-radius: 0.5rem 0.5rem 0.5rem 0;
                              background-color: white;
                              box-shadow: #b1c7ff 0px 3px 10px 0px;
                              padding: 0.5rem;
                              line-height: 18px;
                          ">
                              ${htmlPoints}
                          </div>
                      `;
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

@end
