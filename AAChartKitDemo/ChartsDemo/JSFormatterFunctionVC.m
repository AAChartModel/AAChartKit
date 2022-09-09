//
//  SupportJSFunctionVC.m
//  AAChartKitDemo
//
//  Created by AnAn on 2019/4/23.
//  Copyright © 2019 AnAn. All rights reserved.
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

#import "JSFormatterFunctionVC.h"
#import "AADateUTCTool.h"

@implementation JSFormatterFunctionVC

- (void)viewDidLoad {
    [super viewDidLoad];
    // highcharts default colors ["#7cb5ec #434348 #90ed7d #f7a35c #8085e9 #f15c80 #e4d354 #2b908f #f45b5b #91e8e1"]
    // rainbow colors 🌈 [@"#eb2100", @"#eb3600", @"#d0570e", @"#d0a00e", @"#34da62", @"#00e9db", @"#00c0e9", @"#0096f3", @"#33CCFF", @"#33FFCC'];
}

- (id)chartConfigurationWithSelectedIndex:(NSUInteger)selectedIndex {
    switch (self.selectedIndex) {
        case  0: return [self customAreaChartTooltipStyleWithSimpleFormatString];//简单字符串拼接
        case  1: return [self customAreaChartTooltipStyleWithDifferentUnitSuffix];//自定义不同单位后缀
        case  2: return [self customAreaChartTooltipStyleWithColorfulHtmlLabels];//自定义多彩颜色文字
        case  3: return [self customLineChartTooltipStyleWhenValueBeZeroDoNotShow];//值为0时,在tooltip中不显示
        case  4: return [self customStackedAndGroupedColumnChartTooltip];//自定义分组堆积柱状图tooltip内容
        case  5: return [self everySingleColumnHasGrayBackground];//每根棱柱都有白色背景的柱形图
        case  6: return [self everySingleColumnHasWhiteEmptyBorderLineBackground];//每根棱柱都有空心白色边缘线的柱形图
        case  7: return [self colorfulSpecialStyleColumnChart];//温度计🌡风格的彩色棱柱图
        case  8: return [self configureSpecialStyleTrianglePolarChart];//外部显示六边形边框的三角形雷达图
        case  9: return [self customDoubleXAxesChart];//双 X 轴镜像条形图
        case 10: return [self customArearangeChartTooltip];//自定义面积范围图的 tooltip
        case 11: return [self customLineChartOriginalPointPositionByConfiguringXAxisFormatterAndTooltipFormatter];//通过自定义X轴的 labels 的 Formatter 和 tooltip 的 Formatter 来调整折线图的 X 轴左边距
        case 12: return [self customTooltipWhichDataSourceComeFromOutSideRatherThanSeries];//通过来自外部的数据源来自定义 tooltip (而非常规的来自图表的 series)
        case 13: return [self customTooltipPostionerFunction];//自定义浮动提示框 Positioner 函数
        case 14: return [self fixedTooltipPositionByCustomPositionerFunction];//通过 Positioner 函数来实现一个位置固定的提示框
        case 15: return [self customPlotAreaOutsideComlicatedTooltipStyle];//通过 Positioner 函数来实现绘图区外的复杂浮动提示框样式
        case 16: return [self disableColumnChartUnselectEventEffectBySeriesPointEventClickFunction];//通过 Series 的 Point 的选中事件函数来禁用条形图反选效果
        case 17: return [self customAreasplineChartTooltipStyleByDivWithCSS];//通过自定义 div 的 css 样式来自定义复杂效果的 tooltip 浮动提示框
        case 18: return [self makePieChartShow0Data];//使饼图显示为 0 的数据
        case 19: return [self customColumnChartBorderStyleAndStatesHoverColor];//自定义📊柱状图的 border 样式和手指或鼠标 hover 时的显示效果

        default:
            return nil;
    }
}


//https://github.com/AAChartModel/AAChartKit/issues/569
- (AAOptions *)customAreaChartTooltipStyleWithSimpleFormatString {
    AAChartModel *aaChartModel = AAChartModel.new
    .chartTypeSet(AAChartTypeArea)//图表类型
    .titleSet(@"近三个月金价起伏周期图")//图表主标题
    .subtitleSet(@"金价(元/克)")//图表副标题
    .colorsThemeSet(@[@"#FFD700"/*(纯金色)*/,@"#ffc069",@"#06caf4",@"#7dffc0"])//设置主体颜色数组
    .markerSymbolStyleSet(AAChartSymbolStyleTypeBorderBlank)//折线连接点样式为外边缘空白
    .xAxisTickIntervalSet(@15)//x轴刻度点间隔数(设置每隔几个点显示一个 X轴的内容)
    .yAxisGridLineStyleSet([AALineStyle styleWithWidth:@0])//y轴横向分割线宽度(为0即是隐藏分割线)
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
        .nameSet(@"2021")
        .dataSet(@[
            @1.51, @6.70, @0.94, @1.44, @1.60, @1.63, @1.56, @1.91, @2.45, @3.87, @3.24, @4.90, @4.61, @4.10,
            @4.17, @3.85, @4.17, @3.46, @3.46, @3.55, @3.50, @4.13, @2.58, @2.28, @1.51, @12.7, @0.94, @1.44,
            @18.6, @1.63, @1.56, @1.91, @2.45, @3.87, @3.24, @4.90, @4.61, @4.10, @4.17, @3.85, @4.17, @3.46,
            @3.46, @3.55, @3.50, @4.13, @2.58, @2.28, @1.33, @4.68, @1.31, @1.10, @13.9, @1.10, @1.16, @1.67,
            @2.64, @2.86, @3.00, @3.21, @4.14, @4.07, @3.68, @3.11, @3.41, @3.25, @3.32, @3.07, @3.92, @3.05,
            @2.18, @3.24, @3.23, @3.15, @2.90, @1.81, @2.11, @2.43, @5.59, @3.09, @4.09, @6.14, @5.33, @6.05,
            @5.71, @6.22, @6.56, @4.75, @5.27, @6.02, @5.48
                 ])
    ]);
    
    
    
    AAOptions *aaOptions = aaChartModel.aa_toAAOptions;
    AATooltip *tooltip = aaOptions.tooltip;
    tooltip
    .sharedSet(false)
    .useHTMLSet(true)
    .formatterSet(@AAJSFunc(function () {
        return ' 🌕 🌖 🌗 🌘 🌑 🌒 🌓 🌔 <br/> '
        + ' Support JavaScript Function Just Right Now !!! <br/> '
        + ' The Gold Price For <b> '
        +  this.point.series.name
        + '-'
        +  this.x
        + ' </b> Is <b> '
        +  this.y
        + ' </b> Dollars ';
    }))
    .valueDecimalsSet(@2)//设置取值精确到小数点后几位
    .backgroundColorSet(AAColor.blackColor)
    .borderColorSet(AAColor.blackColor)
    .styleSet(AAStyleColorSize(@"#FFD700", 12))
    ;
    return aaOptions;
}

//https://github.com/AAChartModel/AAChartKit/issues/647
//https://github.com/AAChartModel/AAChartKit/issues/891
- (AAOptions *)customAreaChartTooltipStyleWithDifferentUnitSuffix {
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
    
    AAChartModel *aaChartModel = AAChartModel.new
    .chartTypeSet(AAChartTypeArea)//图表类型
    .titleSet(@"2014 ~ 2020 汪星人生存指数")//图表主标题
    .subtitleSet(@"数据来源：www.无任何可靠依据.com")//图表副标题
    .colorsThemeSet(@[@"#1e90ff",@"#ef476f",@"#ffd066",@"#04d69f"])
    .markerSymbolStyleSet(AAChartSymbolStyleTypeInnerBlank)//折线连接点样式为内部白色
    .stackingSet(AAChartStackingTypeNormal)
    //    .xAxisTickIntervalSet(@15)//x轴刻度点间隔数(设置每隔几个点显示一个 X轴的内容)
    .yAxisGridLineStyleSet([AALineStyle styleWithWidth:@0])//y轴横向分割线宽度(为0即是隐藏分割线)
    .seriesSet(@[
        AASeriesElement.new
        .lineWidthSet(@6)
        .fillColorSet((id)gradientBlueColorDic)
        .nameSet(@"🐶狗子")
        .dataSet(@[@43934, @52503, @57177, @69658, @97031, @119931, @137133, @154175]),
        AASeriesElement.new
        .lineWidthSet(@6)
        .fillColorSet((id)gradientRedColorDic)
        .nameSet(@"🌲树木")
        .dataSet(@[@24916, @24064, @29742, @29851, @32490, @30282, @38121, @40434]),
    ]);
    
    AAOptions *aaOptions = aaChartModel.aa_toAAOptions;
    aaOptions.tooltip
    .useHTMLSet(true)
    .formatterSet(@AAJSFunc(function () {
        var s = '第' + '<b>' +  this.x + '</b>' + '年' + '<br/>';
        const colorDot1 = '<span style=\"' + 'color:#1e90ff; font-size:13px\"' + '>◉</span> ';
        const colorDot2 = '<span style=\"' + 'color:#ef476f; font-size:13px\"' + '>◉</span> ';
        const s1 = colorDot1  + this.points[0].series.name + ': ' + this.points[0].y + '只' + '<br/>';
        const s2 =  colorDot2 + this.points[1].series.name + ': ' + this.points[1].y + '棵';
        s += s1 + s2;
        return s;
    }))
    ;
    
    //禁用图例点击事件
     aaOptions.plotOptions.series.events = AAEvents.new
     .legendItemClickSet(@AAJSFunc(function() {
         return false;
     }));
    
    return aaOptions;
}


//https://github.com/AAChartModel/AAChartKit/issues/653
- (AAOptions *)customAreaChartTooltipStyleWithColorfulHtmlLabels {
    AAChartModel *aaChartModel = AAChartModel.new
    .chartTypeSet(AAChartTypeAreaspline)//图表类型
    .colorsThemeSet(@[@"#04d69f",@"#1e90ff",@"#ef476f",@"#ffd066",])
    .stackingSet(AAChartStackingTypeNormal)
    .yAxisVisibleSet(false)
    .markerRadiusSet(@0)
    .seriesSet(@[
        AASeriesElement.new
        .nameSet(@"Tokyo Hot")
        .lineWidthSet(@5.0)
        .fillOpacitySet(@0.4)
        .dataSet(@[@0.45, @0.43, @0.50, @0.55, @0.58, @0.62, @0.83, @0.39, @0.56, @0.67, @0.50, @0.34, @0.50, @0.67, @0.58, @0.29, @0.46, @0.23, @0.47, @0.46, @0.38, @0.56, @0.48, @0.36]),
        AASeriesElement.new
        .nameSet(@"Berlin Hot")
        .lineWidthSet(@5.0)
        .fillOpacitySet(@0.4)
        .dataSet(@[@0.38, @0.31, @0.32, @0.32, @0.64, @0.66, @0.86, @0.47, @0.52, @0.75, @0.52, @0.56, @0.54, @0.60, @0.46, @0.63, @0.54, @0.51, @0.58, @0.64, @0.60, @0.45, @0.36, @0.67]),
        AASeriesElement.new
        .nameSet(@"London Hot")
        .lineWidthSet(@5.0)
        .fillOpacitySet(@0.4)
        .dataSet(@[@0.46, @0.32, @0.53, @0.58, @0.86, @0.68, @0.85, @0.73, @0.69, @0.71, @0.91, @0.74, @0.60, @0.50, @0.39, @0.67, @0.55, @0.49, @0.65, @0.45, @0.64, @0.47, @0.63, @0.64]),
        AASeriesElement.new
        .nameSet(@"NewYork Hot")
        .lineWidthSet(@5.0)
        .fillOpacitySet(@0.4)
        .dataSet(@[@0.60, @0.51, @0.52, @0.53, @0.64, @0.84, @0.65, @0.68, @0.63, @0.47, @0.72, @0.60, @0.65, @0.74, @0.66, @0.65, @0.71, @0.59, @0.65, @0.77, @0.52, @0.53, @0.58, @0.53]),
    ]);
    
    AAOptions *aaOptions = aaChartModel.aa_toAAOptions;
    aaOptions.tooltip
    .useHTMLSet(true)
    .formatterSet(@AAJSFunc(function () {
        let wholeContentStr ='<span style=\"' + 'color:lightGray; font-size:13px\"' + '>◉ Time: ' + this.x + ' year</span><br/>';
        const length = this.points.length;
        for (let i = 0; i < length; i++) {
            const thisPoint = this.points[i];
            const yValue = thisPoint.y;
            if (yValue != 0) {
                const spanStyleStartStr = '<span style=\"' + 'color:'+ thisPoint.color + '; font-size:13px\"' + '>◉ ';
                const spanStyleEndStr = '</span> <br/>';
                wholeContentStr += spanStyleStartStr + thisPoint.series.name + ': ' + thisPoint.y + '℃' + spanStyleEndStr;
            }
        }
        return wholeContentStr;
    }))
    .backgroundColorSet(@"#050505")
    .borderColorSet(@"#050505")
    ;
    
    //禁用图例点击事件
     aaOptions.plotOptions.series.events = AAEvents.new
     .legendItemClickSet(@AAJSFunc(function() {
         return false;
     }));
    
    return aaOptions;
}

//https://github.com/AAChartModel/AAChartKit/issues/651
- (AAOptions *)customLineChartTooltipStyleWhenValueBeZeroDoNotShow {
    AAChartModel *aaChartModel = AAChartModel.new
    .chartTypeSet(AAChartTypeLine)//图表类型
    .colorsThemeSet(@[@"red",@"mediumspringgreen",@"deepskyblue",@"sandybrown"])//设置主体颜色数组
    .markerSymbolStyleSet(AAChartSymbolStyleTypeBorderBlank)//折线连接点样式为外边缘空白
    .yAxisGridLineStyleSet([AALineStyle styleWithWidth:@0])//y轴横向分割线宽度(为0即是隐藏分割线)
    .categoriesSet(@[@"临床一期",@"临床二期",@"临床三期",@"临床四期",])
    .markerRadiusSet(@8.0)
    .xAxisCrosshairSet([AACrosshair crosshairWithColor:AAColor.darkGrayColor
                                             dashStyle:AAChartLineDashStyleTypeDashDot
                                                 width:@1])
    .seriesSet(@[
        AASeriesElement.new
        .nameSet(@"上市")
        .dataSet(@[@0,@0,@0,@7]),
        AASeriesElement.new
        .nameSet(@"终止")
        .dataSet(@[@0,@2.5,@5,@5]),
        AASeriesElement.new
        .nameSet(@"无进展")
        .dataSet(@[@0,@2,@0,@1]),
        AASeriesElement.new
        .nameSet(@"进行中")
        .dataSet(@[@3,@3,@2,@2]),
    ]);
    
    
    AAOptions *aaOptions = aaChartModel.aa_toAAOptions;
    aaOptions.tooltip
    .useHTMLSet(true)
    .formatterSet(@AAJSFunc(function () {
        let wholeContentStr = this.points[0].x + '<br/>';
        const length = this.points.length;
        for (let i = 0; i < length; i++) {
            const thisPoint = this.points[i];
            const yValue = thisPoint.y;
            if (yValue != 0) {
                const prefixStr = '<span style=\"' + 'color:'+ thisPoint.color + '; font-size:13px\"' + '>◉ ';
                wholeContentStr += prefixStr + thisPoint.series.name + ': ' + yValue + '<br/>';
            }
        }
        return wholeContentStr;
    }))
    ;
    
    //禁用图例点击事件
     aaOptions.plotOptions.series.events = AAEvents.new
     .legendItemClickSet(@AAJSFunc(function() {
         return false;
     }));
    
    return aaOptions;
}




//https://github.com/AAChartModel/AAChartKit/issues/685
- (AAOptions *)customStackedAndGroupedColumnChartTooltip {
    AAChartModel *aaChartModel = AAChartModel.new
    .titleSet(@"Total fruit consumtion, grouped by gender")
    .subtitleSet(@"stacked and grouped")
    .yAxisTitleSet(@"Number of fruits")
    .chartTypeSet(AAChartTypeColumn)
    .legendEnabledSet(false)//隐藏图例(底部可点按的小圆点)
    .stackingSet(AAChartStackingTypeNormal)
    .categoriesSet(@[@"Apples", @"Oranges", @"Pears",@"Grapes",@"Bananas",])
    .dataLabelsEnabledSet(true)
    .seriesSet(@[
        AASeriesElement.new
        .nameSet(@"John")
        .dataSet(@[@5,@3,@4,@7,@2,])
        .stackSet(@"male"),
        AASeriesElement.new
        .nameSet(@"Joe")
        .dataSet(@[@3,@4,@4,@2,@5,])
        .stackSet(@"male"),
        AASeriesElement.new
        .nameSet(@"Jane")
        .dataSet(@[@2,@5,@6,@2,@1,])
        .stackSet(@"female"),
        AASeriesElement.new
        .nameSet(@"Janet")
        .dataSet(@[@3,@0,@4, @4,@3,])
        .stackSet(@"female"),
    ]);
    
    AAOptions *aaOptions = aaChartModel.aa_toAAOptions;
    
    aaOptions.plotOptions.series.states = AAStates.new
    .inactiveSet(AAInactive.new
                 .enabledSet(false));
    
    aaOptions.tooltip
    .sharedSet(false)
    .formatterSet(@AAJSFunc(function () {
        return '<b>'
        + this.x
        + '</b><br/>'
        + this.series.name
        + ': '
        + this.y
        + '<br/>'
        + 'Total: '
        + this.point.stackTotal;
    }
                            ));
    return aaOptions;
}

- (AAOptions *)everySingleColumnHasGrayBackground {
    NSArray *stopsArr = @[@[@0.0, @"#00feff"],//颜色字符串设置支持十六进制类型和 rgba 类型
                          @[@0.5, @"#027eff"],
                          @[@1.0, @"#0286ff"]];
    NSDictionary *gradientColorDic1 =
    [AAGradientColor gradientColorWithDirection:AALinearGradientDirectionToBottom
                                     stopsArray:stopsArr];
    
    AAChartModel *aaChartModel = AAChartModel.new
    .chartTypeSet(AAChartTypeColumn)//图表类型
    .backgroundColorSet(@"#111c4e")
    .xAxisLabelsStyleSet(AAStyleColorSizeWeight(AAColor.whiteColor, 9, AAChartFontWeightTypeBold))
    .categoriesSet(@[
        @"一月", @"二月", @"三月", @"四月", @"五月", @"六月",
        @"七月", @"八月", @"九月", @"十月", @"十一月", @"十二月"
    ])
    .yAxisMaxSet(@260.0)
    .legendEnabledSet(false)
    .yAxisLineWidthSet(@1)
    .seriesSet(@[
        AASeriesElement.new
        .nameSet(@"Tokyo Hot")
        .colorSet(@"rgba(255,255,255,0.3)")
        .enableMouseTrackingSet(@false)
        .dataSet(@[@250.0, @250.0, @250.0, @250.0, @250.0, @250.0, @250.0, @250.0, @250.0, @250.0, @250.0, @250.0,@250.0, @250.0,]),
        AASeriesElement.new
        .nameSet(@"Berlin Hot")
        .colorSet((id)gradientColorDic1)
        .borderRadiusTopLeftSet((id)@"50%")
        .borderRadiusTopRightSet((id)@"50%")
        .dataSet(@[@211, @183, @157, @133, @111, @211, @183, @157, @133,@91, @73, @57, @43, @31, ]),
    ]);
    
    AAOptions *aaOptions = aaChartModel.aa_toAAOptions;
    aaOptions.xAxis
    .lineWidthSet(@1)
    .lineColorSet(@"rgba(255,255,255,0.3)")
    .tickWidthSet(@0)
    .labels.styleSet(AAStyleColor(AAColor.whiteColor));

    aaOptions.yAxis
    .gridLineWidthSet(@0)
    .lineColorSet(@"rgba(255,255,255,0.3)")
    .labels.styleSet(AAStyleColor(AAColor.whiteColor));

    aaOptions.plotOptions
    .seriesSet(AASeries.new
               .borderRadiusTopLeftSet((id)@"50%")
               .borderRadiusTopRightSet((id)@"50%")
               .statesSet(AAStates.new
                          .inactiveSet(AAInactive.new
                                       .enabledSet(false)))
               .animationSet((id)@false)
               )
    .columnSet(AAColumn.new
               .groupingSet(false)
               .borderWidthSet(@0))
    ;
    
    aaOptions.tooltip
    .sharedSet(false)
    .backgroundColorSet((id)gradientColorDic1)
    .styleSet(AAStyleColorSize(AAColor.whiteColor, 12))
    .formatterSet(@AAJSFunc(function () {
        return '<b>'
        + this.x
        + '</b><br/>'
        + this.series.name
        + ': '
        + this.y
    }));
    return aaOptions;
}

- (AAOptions *)everySingleColumnHasWhiteEmptyBorderLineBackground {
    NSArray *stopsArr = @[@[@0.0, @"#00feff"],//颜色字符串设置支持十六进制类型和 rgba 类型
                          @[@0.5, @"#027eff"],
                          @[@1.0, @"#0286ff"]];
    NSDictionary *gradientColorDic1 =
    [AAGradientColor gradientColorWithDirection:AALinearGradientDirectionToBottom
                                     stopsArray:stopsArr];
    
    AAChartModel *aaChartModel = AAChartModel.new
    .chartTypeSet(AAChartTypeColumn)//图表类型
    .backgroundColorSet(@"#111c4e")
    .xAxisLabelsStyleSet(AAStyleColorSizeWeight(AAColor.whiteColor, 9, AAChartFontWeightTypeBold))
    .categoriesSet(@[@"一月", @"二月", @"三月", @"四月", @"五月", @"六月",
                     @"七月", @"八月", @"九月", @"十月", @"十一月", @"十二月"])
    .yAxisMaxSet(@260.0)
    .legendEnabledSet(false)
    .yAxisLineWidthSet(@1)
    .seriesSet(@[
        AASeriesElement.new
        .nameSet(@"Tokyo Hot")
        .colorSet(@"rgba(0,0,0,0)")
        .borderColorSet(@"rgba(255,255,255,0.4)")
        .dataSet(@[@250.0, @250.0, @250.0, @250.0, @250.0, @250.0, @250.0, @250.0, @250.0, @250.0, @250.0, @250.0,]),
        AASeriesElement.new
        .nameSet(@"Berlin Hot")
        .colorSet((id)gradientColorDic1)
        .borderWidthSet(@0)
        .dataSet( @[ @148.5, @216.4, @194.1, @95.6, @54.4, @129.2, @144.0, @176.0,@29.9, @71.5, @106.4, @135.6,]),
    ]);
    
    AAOptions *aaOptions = aaChartModel.aa_toAAOptions;
    aaOptions.xAxis
    .lineWidthSet(@1)
    .lineColorSet(@"rgba(255,255,255,0.3)")
    .tickWidthSet(@0)
    .labels.styleSet(AAStyleColor(AAColor.whiteColor));
    
    aaOptions.yAxis
    .gridLineWidthSet(@0)
    .lineColorSet(@"rgba(255,255,255,0.3)")
    .labels.styleSet(AAStyleColor(AAColor.whiteColor));
    
    aaOptions.plotOptions
    .seriesSet(AASeries.new
               .borderRadiusTopLeftSet((id)@"50%")
               .borderRadiusTopRightSet((id)@"50%")
               .animationSet((id)@false)
               .statesSet(AAStates.new
                          .inactiveSet(AAInactive.new
                                       .enabledSet(false))))
    .columnSet(AAColumn.new
               .groupingSet(false))
    ;
    
    aaOptions.tooltip
    .sharedSet(false)
    .backgroundColorSet(AAColor.darkGrayColor)
    .styleSet(AAStyleColorSize(@"#FFD700", 12))
    .formatterSet(@AAJSFunc(function () {
        return '<b>'
        + this.x
        + '</b><br/>'
        + this.series.name
        + ': '
        + this.y
    }));
    return aaOptions;
}

//自定义温度计🌡样式图表
- (AAOptions *)colorfulSpecialStyleColumnChart {
    AAChartModel *aaChartModel = AAChartModel.new
    .chartTypeSet(AAChartTypeColumn)//图表类型
    .backgroundColorSet(@"#111c4e")
    .colorsThemeSet(@[@"#eb2100", @"#eb3600", @"#d0570e", @"#d0a00e", @"#34da62", @"#00e9db", @"#00c0e9", @"#0096f3", @"#33CCFF", @"#33FFCC"])
    .xAxisLabelsStyleSet(AAStyleColorSizeWeight(AAColor.whiteColor, 9, AAChartFontWeightTypeBold))
    .categoriesSet(@[@"一月", @"二月", @"三月", @"四月", @"五月", @"六月",
                     @"七月", @"八月", @"九月", @"十月", @"十一月", @"十二月"])
    .yAxisMaxSet(@260.0)
    .legendEnabledSet(false)
    .yAxisLineWidthSet(@1)
    .seriesSet(@[
        AASeriesElement.new
        .nameSet(@"Tokyo Hot")
        .colorSet(@"rgba(0,0,0,0)")
        .colorByPointSet(@false)
        .enableMouseTrackingSet(@false)
        .borderColorSet(@"rgba(255,255,255,0.4)")
        .dataSet(@[@250.0, @250.0, @250.0, @250.0, @250.0, @250.0, @250.0, @250.0, @250.0, @250.0, @250.0, @250.0,]),
        AASeriesElement.new
        .nameSet(@"Berlin Hot")
        .colorByPointSet(@true)
        .borderWidthSet(@0)
        .dataSet( @[ @148.5, @216.4, @194.1, @95.6, @54.4, @129.2, @144.0, @176.0,@29.9, @71.5, @106.4, @135.6,]),
        AASeriesElement.new
        .typeSet(AAChartTypeScatter)
        .colorByPointSet(@true)
        .enableMouseTrackingSet(@false)
        .markerSet(AAMarker.new
                   .radiusSet(@21))
        .dataSet(@[@0.f, @0.f, @0.f, @0.f, @0.f, @0.f, @0.f, @0.f, @0.f, @0.f, @0.f, @0.f,]),
    ]);
    
    AAOptions *aaOptions = aaChartModel.aa_toAAOptions;
    aaOptions.xAxis
    .lineWidthSet(@1)
    .lineColorSet(@"rgba(255,255,255,0.3)")
    .tickWidthSet(@0)
    .labels.styleSet(AAStyleColor(AAColor.whiteColor));

    aaOptions.yAxis
    .gridLineWidthSet(@0)
    .lineColorSet(@"rgba(255,255,255,0.3)")
    .labels.styleSet(AAStyleColor(AAColor.whiteColor));

    aaOptions.plotOptions
    .seriesSet(AASeries.new
               .borderRadiusTopLeftSet((id)@"50%")
               .borderRadiusTopRightSet((id)@"50%")
               .animationSet((id)@false)
               .statesSet(AAStates.new
                          .inactiveSet(AAInactive.new
                                       .enabledSet(false))))
    .columnSet(AAColumn.new
               .groupingSet(false))
    ;
    
    aaOptions.tooltip
    .sharedSet(false)//这里如果想要 enableMouseTracking 为 false 的 series 不显示 tooltip, shared 必须设置为 true,可能是个小 bug,后面再改吧
    .backgroundColorSet(AAColor.darkGrayColor)
    .styleSet(AAStyleColorSize(@"#FFD700", 12))
    .formatterSet(@AAJSFunc(function () {
        return '<b>'
        + this.x
        + '</b><br/>'
        + this.series.name
        + ': '
        + this.y
    }));
    return aaOptions;
}

//https://github.com/AAChartModel/AAChartKit/issues/704
- (AAOptions *)configureSpecialStyleTrianglePolarChart {
    AAChartModel *aaChartModel = AAChartModel.new
    .chartTypeSet(AAChartTypeArea)
    .connectNullsSet(true)
    .yAxisMaxSet(@13.0)
    .yAxisGridLineStyleSet([AALineStyle styleWithWidth:@2])
    //    .categoriesSet(@[@"Java", @"Swift",@"C", @"C#", @"C++", @"Perl",])
    .markerRadiusSet(@0)
    .polarSet(true)//是否极化图形
    .seriesSet(@[
        AASeriesElement.new
        .dataSet(@[@15.0,@15.0,@15.0,@15.0,@15.0,@15.0,]),
        AASeriesElement.new
        .dataSet(@[@9.0,@9.0,@9.0,@9.0,@9.0,@9.0,]),
        AASeriesElement.new
        .dataSet(@[@6.0,@6.0,@6.0,@6.0,@6.0,@6.0,]),
        AASeriesElement.new
        .dataSet(@[@3.0,@3.0,@3.0,@3.0,@3.0,@3.0,]),
    ])
    .seriesSet(@[
        AASeriesElement.new
        .nameSet(@"2020")
        .colorSet((id)AAGradientColor.deepSeaColor)
        .dataSet(@[@9.9,NSNull.null, @9.9,NSNull.null,@9.9, NSNull.null, ]),
    ])
    ;
    
    NSArray *categoryArr = @[@"Java", @"",@"C", @"", @"C++", @"",];
    NSString *categoryJSArrStr = [categoryArr aa_toJSArray];
    
    NSString *tooltipFormatter = [NSString stringWithFormat:(@AAJSFunc(function () {
        return  'The value for <b>' + %@[this.x] +
        '</b> is <b>' + this.y + '</b> ' + "℃";
    })),categoryJSArrStr];
    
    NSString *xAxisLabelsFormatter = [NSString stringWithFormat:(@AAJSFunc(function () {
        return %@[this.value];
    })),categoryJSArrStr];
    
    AAOptions *aaOptions = aaChartModel.aa_toAAOptions;
    
    aaOptions.tooltip
    .useHTMLSet(true)
    .sharedSet(false)
    .formatterSet(tooltipFormatter)
    .valueDecimalsSet(@2)//设置取值精确到小数点后几位
    .backgroundColorSet(AAColor.blackColor)
    .borderColorSet(AAColor.blackColor)
    .styleSet(AAStyleColorSize(@"#1e90ff", 12))
    ;
    
    aaOptions.xAxis.lineWidth = @0.0;//避免多边形外环之外有额外套了一层无用的外环
    aaOptions.yAxis.gridLineInterpolation = AAChartYAxisGridLineInterpolationTypePolygon;
    aaOptions.yAxis.tickAmount = @8.0;
    aaOptions
    .xAxis.labels
    .formatterSet(xAxisLabelsFormatter);
    
    return aaOptions;
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

//https://github.com/AAChartModel/AAChartKit/issues/781
- (AAOptions *)customArearangeChartTooltip {
    AAChartModel *aaChartModel = AAChartModel.new
    .chartTypeSet(AAChartTypeColumnrange)
    .titleSet(@"面积范围图")
    .yAxisGridLineStyleSet([AALineStyle styleWithWidth:@0])
    .xAxisVisibleSet(false)
    .yAxisTitleSet(@"摄氏度")
    .markerSymbolStyleSet(AAChartSymbolStyleTypeInnerBlank)
    .seriesSet(@[
        AASeriesElement.new
        .nameSet(@"Range")
        .dataSet(@[
            @[@1246406400000, NSNull.null, NSNull.null],
            @[@1246492800000, NSNull.null, NSNull.null],
            @[@1246579200000, @15.5, @29.6],
            @[@1246665600000, @16.7, @30.7],
            @[@1246752000000, @16.5, @25.0],
            @[@1246838400000, @17.8, @25.7],
            @[@1246924800000, @13.5, @24.8],
            @[@1247011200000, @10.5, @21.4],
            @[@1247097600000, @9.2,  @23.8],
            @[@1247184000000, @11.6, @21.8],
            @[@1247270400000, @10.7, @23.7],
            @[@1247356800000, @11.0, @23.3],
            @[@1247443200000, @11.6, @23.7],
            @[@1247529600000, @11.8, @20.7],
            @[@1247616000000, @12.6, @22.4],
            @[@1247702400000, @13.6, @19.6],
            @[@1247788800000, @11.4, @22.6],
            @[@1247875200000, @13.2, @25.0],
            @[@1247961600000, @14.2, @21.6],
            @[@1248048000000, @13.1, @17.1],
            @[@1248134400000, @12.2, @15.5],
            @[@1248220800000, @12.0, @20.8],
            @[@1248307200000, @12.0, @17.1],
            @[@1248393600000, @12.7, @18.3],
            @[@1248480000000, @12.4, @19.4],
            @[@1248566400000, @12.6, @19.9],
            @[@1248652800000, @11.9, @20.2],
            @[@1248739200000, @11.0, @19.3],
            @[@1248825600000, @10.8, @17.8],
            @[@1248912000000, @11.8, @18.5],
            @[@1248998400000, @10.8, @16.1],
        ])
        .colorSet(@"#ff0066")
        .fillOpacitySet(@0.6)
        .lineWidthSet(@0),
    ]);

    AAOptions *aaOptions = aaChartModel.aa_toAAOptions;
    aaOptions.tooltip
    .useHTMLSet(true)
    .formatterSet(@AAJSFunc(function () {
        const myPointOptions = this.points[0].point.options;
        const xValue = myPointOptions.x;
        const lowValue = myPointOptions.low;
        const highValue = myPointOptions.high;
        const titleStr = '🌕 this is my custom tooltip description text content <br>';
        const xValueStr = '🌖 this is x value  : ' + xValue + '<br>';
        const lowValueStr = ' 🌗 this is low value  : ' + lowValue + '<br>';
        const highValueStr = '🌘 this is high value : ' + highValue + '<br>';
        const tooltipDescStr =  titleStr + xValueStr + lowValueStr + highValueStr;
        return tooltipDescStr;
    }))
    .backgroundColorSet(AAColor.blackColor)
    .borderColorSet(AAColor.blackColor)
    .styleSet(AAStyleColorSize(@"#1e90ff", 12))
    ;
    
    return aaOptions;
}

//https://github.com/AAChartModel/AAChartKit/issues/577
//https://github.com/AAChartModel/AAChartKit/issues/937
- (AAOptions *)customLineChartOriginalPointPositionByConfiguringXAxisFormatterAndTooltipFormatter {
    AAChartModel *aaChartModel = AAChartModel.new
    .chartTypeSet(AAChartTypeLine)//图表类型
    .titleSet((@"Custom Line Chart Original Point Position"))//图表主标题
    .colorsThemeSet(@[@"#fe117c",@"#ffc069",@"#06caf4",@"#7dffc0"])//设置主题颜色数组
    .tooltipValueSuffixSet(@"℃")//设置浮动提示框单位后缀
    .yAxisTitleSet(@"℃")//设置 Y 轴标题
    .yAxisLineWidthSet(@1)//Y轴轴线线宽为0即是隐藏Y轴轴线
    .yAxisGridLineStyleSet([AALineStyle styleWithWidth:@0])//y轴横向分割线宽度为0(即是隐藏分割线)
    .markerSymbolStyleSet(AAChartSymbolStyleTypeBorderBlank)
    .seriesSet(@[
        AASeriesElement.new
        .nameSet(@"2017")
        .dataSet(@[@7.0, @6.9, @9.5, @14.5, @18.2, @21.5,]),
        AASeriesElement.new
        .nameSet(@"2018")
        .dataSet(@[@0.2, @0.8, @5.7, @11.3, @17.0, @22.0, ]),
        AASeriesElement.new
        .nameSet(@"2019")
        .dataSet(@[@0.9, @0.6, @3.5, @8.4, @13.5, @17.0, ]),
        AASeriesElement.new
        .nameSet(@"2020")
        .dataSet(@[@3.9, @4.2, @5.7, @8.5, @11.9, @15.2, ]),
    ]);
    
    AAOptions *aaOptions = aaChartModel.aa_toAAOptions;

    NSArray *categoryArr = @[
        @"Jan", @"Feb", @"Mar", @"Apr", @"May", @"Jun",
        @"July", @"Aug", @"Spe", @"Oct", @"Nov", @"Dec"
    ];
    
    NSString *categoryJSArrStr = [categoryArr aa_toJSArray];
    
    NSString *tooltipFormatter = [NSString stringWithFormat:(@AAJSFunc(function () {
        return  'The value for <b>' + %@[this.x] +
        '</b> is <b>' + this.y + '</b> ' + "℃";
    })),categoryJSArrStr];
    
    NSString *xAxisLabelsFormatter = [NSString stringWithFormat:(@AAJSFunc(function () {
        return %@[this.value];
    })),categoryJSArrStr];
    
    //tooltip 的共享(.sharedSet(true))与非共享(.sharedSet(false))时,部分值的取值方式不同,
    //参见https://github.com/AAChartModel/AAChartKit/issues/781#issuecomment-555852813
    aaOptions.tooltip
    .useHTMLSet(true)
    .formatterSet(tooltipFormatter);
    
    aaOptions.xAxis.labels
    .formatterSet(xAxisLabelsFormatter);
    
    return aaOptions;
}

//https://github.com/AAChartModel/AAChartKit/issues/826
- (AAOptions *)customTooltipWhichDataSourceComeFromOutSideRatherThanSeries {
    AAChartModel *aaChartModel = AAChartModel.new
    .chartTypeSet(AAChartTypeColumn)//图表类型
    .yAxisLineWidthSet(@1)//Y轴轴线线宽为0即是隐藏Y轴轴线
    .yAxisGridLineStyleSet([AALineStyle styleWithWidth:@1])//y轴横向分割线宽度为1(为0即是隐藏分割线)
    .colorsThemeSet(@[@"#FFD700"/*纯金色*/])
    .categoriesSet(@[@"一月", @"二月", @"三月", @"四月", @"五月", @"六月",
    @"七月", @"八月", @"九月", @"十月", @"十一月", @"十二月"])
    .yAxisMaxSet(@110)
    .seriesSet(@[
        AASeriesElement.new
        .nameSet(@"2017")
        .dataSet(@[@55, @55, @55, @55, @55, @55, @55, @55, @55, @55, @55, @55, ]),
    ]);
    
    
    NSArray *看近时长数组 = @[@70, @69, @95, @14, @18, @21, @25, @26, @23, @18, @13, @96];
    NSArray *看中时长数组 = @[@20, @80, @57, @11, @17, @22, @24, @24, @20, @14, @86, @25];
    NSArray *看远时长数组 = @[@90, @60, @35, @84, @13, @17, @18, @17, @14, @90, @39, @10];
    NSMutableArray *总时长数组 = [NSMutableArray array];
    for (NSUInteger i = 0; i < 12; i++) {
        NSNumber *单个总时长 = @(
          [看近时长数组[i] floatValue]
        + [看中时长数组[i] floatValue]
        + [看远时长数组[i] floatValue]
        );
        
        [总时长数组 addObject:单个总时长];
    }
    
    NSArray *有效时长数组 = @[@39, @42, @57, @85, @19, @15, @17, @16, @14, @13, @66, @48];
    
    NSArray *切换次数数组 = @[
        @(arc4random() % 10), @(arc4random() % 10), @(arc4random() % 10),
        @(arc4random() % 10), @(arc4random() % 10), @(arc4random() % 10),
        @(arc4random() % 10), @(arc4random() % 10), @(arc4random() % 10),
        @(arc4random() % 10), @(arc4random() % 10), @(arc4random() % 10),
    ];
    
    NSArray *停止次数数组 = @[
        @(arc4random() % 10), @(arc4random() % 10), @(arc4random() % 10),
        @(arc4random() % 10), @(arc4random() % 10), @(arc4random() % 10),
        @(arc4random() % 10), @(arc4random() % 10), @(arc4random() % 10),
        @(arc4random() % 10), @(arc4random() % 10), @(arc4random() % 10),
    ];
    
    NSArray *干预次数数组 = @[
        @(arc4random() % 10), @(arc4random() % 10), @(arc4random() % 10),
        @(arc4random() % 10), @(arc4random() % 10), @(arc4random() % 10),
        @(arc4random() % 10), @(arc4random() % 10), @(arc4random() % 10),
        @(arc4random() % 10), @(arc4random() % 10), @(arc4random() % 10),
    ];
    
    NSString *总时长JS数组 = [总时长数组 aa_toJSArray];
    NSString *有效时长JS数组 = [有效时长数组 aa_toJSArray];
    NSString *看近时长JS数组 = [看近时长数组 aa_toJSArray];
    NSString *看中时长JS数组 = [看中时长数组 aa_toJSArray];
    NSString *看远时长JS数组 = [看远时长数组 aa_toJSArray];
    NSString *切换次数JS数组 = [切换次数数组 aa_toJSArray];
    NSString *停止次数JS数组 = [停止次数数组 aa_toJSArray];
    NSString *干预次数JS数组 = [干预次数数组 aa_toJSArray];


    NSString *jsFormatterStr = [NSString stringWithFormat:@AAJSFunc(
function () {
    const 总时长数组 = %@;
    const 有效时长数组 = %@;
    const 看近时长数组 = %@;
    const 看中时长数组 = %@;
    const 看远时长数组 = %@;
    const 切换次数数组 = %@;
    const 停止次数数组 = %@;
    const 干预次数数组 = %@;
    const 时间单位后缀 = "min<br/>";
    const 频率单位后缀 = "次<br/>";

    const selectedSeries = this.points[0];
    const pointIndex = selectedSeries.point.index;
    const 单个总时长字符串 = "总时长: &nbsp &nbsp" + 总时长数组[pointIndex] + 时间单位后缀;
    const 单个有效时长字符串 = "有效时长: &nbsp" + 有效时长数组[pointIndex] + 时间单位后缀;
    const 单个看近时长字符串 = "看近时长: &nbsp" + 看近时长数组[pointIndex] + 时间单位后缀;
    const 单个看中时长字符串 = "看中时长: &nbsp" + 看中时长数组[pointIndex] + 时间单位后缀;
    const 单个看远时长字符串 = "看远时长: &nbsp" + 看远时长数组[pointIndex] + 时间单位后缀;
    const 单个切换次数字符串 = "切换次数: &nbsp" + 切换次数数组[pointIndex] + 频率单位后缀;
    const 单个停止次数字符串 = "停止次数: &nbsp" + 停止次数数组[pointIndex] + 频率单位后缀;
    const 单个干预次数字符串 = "干预次数: &nbsp" + 干预次数数组[pointIndex] + 频率单位后缀;

    const wholeContentStr =  单个总时长字符串 + 单个有效时长字符串 + 单个看近时长字符串 + 单个看中时长字符串 + 单个看远时长字符串 + 单个切换次数字符串 + 单个停止次数字符串 + 单个干预次数字符串;

    return wholeContentStr;
    }),总时长JS数组, 有效时长JS数组, 看近时长JS数组, 看中时长JS数组, 看远时长JS数组, 切换次数JS数组, 停止次数JS数组, 干预次数JS数组];
    
    AAOptions *aaOptions = aaChartModel.aa_toAAOptions;

    aaOptions.tooltip
    //‼️以 this.point.index 这种方式获取选中的点的索引必须设置 tooltip 的 shared 为 false
    //‼️共享时是 this.points (由多个 point 组成的 points 数组)
    //‼️非共享时是 this.point 单个 point 对象
    .sharedSet(true)
    .useHTMLSet(true)
    .formatterSet(jsFormatterStr)
    .backgroundColorSet(AAColor.blackColor)//黑色背景色
    .borderColorSet(@"#FFD700")//边缘颜色纯金色
    .styleSet(AAStyleColorSize(@"#FFD700", 12))//文字颜色纯金色
    ;

    return aaOptions;
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
