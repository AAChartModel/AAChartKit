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
        case 0: return [self customAreasplineChartTooltipStyleByDivWithCSS];//通过自定义 div 的 css 样式来自定义复杂效果的 tooltip 浮动提示框
        case 1: return [self customTooltipPostionerFunction];//自定义浮动提示框 Positioner 函数
        case 2: return [self fixedTooltipPositionByCustomPositionerFunction];//通过 Positioner 函数来实现一个位置固定的提示框
        case 3: return [self customPlotAreaOutsideComlicatedTooltipStyle];//通过 Positioner 函数来实现绘图区外的复杂浮动提示框样式
        case 4: return [self makePieChartShow0Data];//使饼图显示为 0 的数据
        case 5: return [self customColumnChartBorderStyleAndStatesHoverColor];//自定义📊柱状图的 border 样式和手指或鼠标 hover 时的显示效果

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

//https://github.com/AAChartModel/AAChartKit/issues/970
//通过自定义 div 的 css 样式来自定义复杂效果的 tooltip 浮动提示框
- (AAOptions *)customAreasplineChartTooltipStyleByDivWithCSS {
    AAChartModel *aaChartModel = AAChartModel.new
    .chartTypeSet(AAChartTypeAreaspline)//图表类型
    .colorsThemeSet(@[@"#FFD700"/*(纯金色)*/,@"#ffc069",])//设置主体颜色数组
    .markerSymbolSet(AAChartSymbolTypeCircle)
    .markerSymbolStyleSet(AAChartSymbolStyleTypeBorderBlank)//折线连接点样式为外边缘空白
    .xAxisTickIntervalSet(@3)//x轴刻度点间隔数(设置每隔几个点显示一个 X轴的内容)
    .yAxisGridLineStyleSet([AALineStyle styleWithWidth:@0])//y轴横向分割线宽度(为0即是隐藏分割线)
    .stackingSet(AAChartStackingTypeNormal)
    .categoriesSet(@[
        @"10-01", @"10-02", @"10-03", @"10-04", @"10-05", @"10-06", @"10-07", @"10-08", @"10-09", @"10-10", @"10-11",
        @"10-12", @"10-13", @"10-14", @"10-15", @"10-16", @"10-17", @"10-18", @"10-19", @"10-20", @"10-21", @"10-22",
        @"10-23", @"10-24", @"10-25", @"10-26", @"10-27", @"10-28", @"10-29", @"10-30", @"10-31", @"11-01", @"11-02",
        @"11-03", @"11-04", @"11-05", @"11-06", @"11-07", @"11-08", @"11-09", @"11-10", @"11-11", @"11-12", @"11-13",
        @"11-14", @"11-15", @"11-16", @"11-17", @"11-18", @"11-19", @"11-20", @"11-21", @"11-22", @"11-23", @"11-24",
        @"11-25", @"11-26", @"11-27", @"11-28", @"11-29", @"11-30", @"12-01", @"12-02", @"12-03", @"12-04", @"12-05",
        @"12-06", @"12-07", @"12-08", @"12-09", @"12-10", @"12-11", @"12-12", @"12-13", @"12-14", @"12-15", @"12-16",
        @"12-17", @"12-18", @"12-19", @"12-20", @"12-21", @"12-22", @"12-23", @"12-24", @"12-25", @"12-26", @"12-27",
        @"12-28", @"12-29", @"12-30"
    ])
    .seriesSet(@[
        AASeriesElement.new
        .lineWidthSet(@1.5)
        .fillOpacitySet(@0.4)
        .nameSet(@"黄金上涨")
        .dataSet(@[
            @1.51, @6.70, @0.94, @1.44, @1.60, @1.63, @1.56, @1.91, @2.45, @3.87, @3.24, @4.90, @4.61, @4.10,
            @4.17, @3.85, @4.17, @3.46, @3.46, @3.55, @3.50, @4.13, @2.58, @2.28, @1.51, @12.7, @0.94, @1.44,
            @18.6, @1.63, @1.56, @1.91, @2.45, @3.87, @3.24, @4.90, @4.61, @4.10, @4.17, @3.85, @4.17, @3.46,
            @3.46, @3.55, @3.50, @4.13, @2.58, @2.28, @1.33, @4.68, @1.31, @1.10, @13.9, @1.10, @1.16, @1.67,
            @2.64, @2.86, @3.00, @3.21, @4.14, @4.07, @3.68, @3.11, @3.41, @3.25, @3.32, @3.07, @3.92, @3.05,
            @2.18, @3.24, @3.23, @3.15, @2.90, @1.81, @2.11, @2.43, @5.59, @3.09, @4.09, @6.14, @5.33, @6.05,
            @5.71, @6.22, @6.56, @4.75, @5.27, @6.02, @5.48
                 ]),
        AASeriesElement.new
        .lineWidthSet(@1.5)
        .fillOpacitySet(@0.4)
        .nameSet(@"房价下跌")
        .dataSet(@[
            @1.51, @6.70, @0.94, @1.44, @1.60, @1.63, @1.56, @1.91, @2.45, @3.87, @3.24, @4.90, @4.61, @4.10,
            @4.17, @3.85, @4.17, @3.46, @3.46, @3.55, @3.50, @4.13, @2.58, @2.28, @1.51, @12.7, @0.94, @1.44,
            @18.6, @1.63, @1.56, @1.91, @2.45, @3.87, @3.24, @4.90, @4.61, @4.10, @4.17, @3.85, @4.17, @3.46,
            @3.46, @3.55, @3.50, @4.13, @2.58, @2.28, @1.33, @4.68, @1.31, @1.10, @13.9, @1.10, @1.16, @1.67,
            @2.64, @2.86, @3.00, @3.21, @4.14, @4.07, @3.68, @3.11, @3.41, @3.25, @3.32, @3.07, @3.92, @3.05,
            @2.18, @3.24, @3.23, @3.15, @2.90, @1.81, @2.11, @2.43, @5.59, @3.09, @4.09, @6.14, @5.33, @6.05,
            @5.71, @6.22, @6.56, @4.75, @5.27, @6.02, @5.48
                 ]),
    ]);
    
    
    //https://zhidao.baidu.com/question/301691908.html
    //https://jshare.com.cn/highcharts/hhhhGc
    AAOptions *aaOptions = aaChartModel.aa_toAAOptions;
    aaOptions.tooltip
    .sharedSet(true)
    .useHTMLSet(true)
    .paddingSet(@0)
    .borderWidthSet(@0)
    .formatterSet(@AAJSFunc(function () {
        var box1Text = "&nbsp 2021-" + this.x + this.points[0].series.name + this.y;
        var box2Text = "&nbsp 2021-" + this.x + this.points[1].series.name + this.y;
        
        return '<style>\
        div{margin:0;padding:0}\
        #container{width:300px;height:40px;border:80px;}\
        #container .box1{width:150px;height:40px;float:left;background:red;line-height:40px;color:#fff}\
        #container .box2{width:150px;height:40px;float:right;background:green;line-height:40px;color:#fff}\
        </style>\
        <div id=\"container\">'
        +
        '<div class=\"box1\">' + box1Text + '</div>'
        +
        '<div class=\"box2\">' + box2Text + '</div>'
        +
        '</div>';
    }));
    
    //禁用图例点击事件
     aaOptions.plotOptions.series.events = AAEvents.new
     .legendItemClickSet(@AAJSFunc(function() {
         return false;
     }));
    
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

@end
