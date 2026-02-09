//
//  TooltipOptionsComposer.m
//  AAChartKitDemo
//
//  Created by Admin on 2021/9/16.
//  Copyright © 2021 An An. All rights reserved.
//

#import "TooltipOptionsComposer.h"

@interface TooltipOptionsComposer ()

@end

@implementation TooltipOptionsComposer





//https://github.com/AAChartModel/AAChartKit/issues/199
//https://github.com/AAChartModel/AAChartKit/issues/954
+ (AAOptions *)customTooltipStyleByFormatProperties {
    AAChartModel *aaChartModel = AAChartModel.new
    .chartTypeSet(AAChartTypeArea)//图表类型
    .titleSet(@"近三个月金价起伏周期图")//图表主标题
    .subtitleSet(@"金价(元/克)")//图表副标题
    .colorsThemeSet(@[@"#FFD700"/*(纯金色)*/,@"#ffc069",@"#06caf4",@"#7dffc0"])//设置主体颜色数组
    .markerSymbolStyleSet(AAChartSymbolStyleTypeBorderBlank)//折线连接点样式为外边缘空白
    .xAxisTickIntervalSet(@15)//x轴刻度点间隔数(设置每隔几个点显示一个 X轴的内容)
    .yAxisGridLineStyleSet([AALineStyle styleWithWidth:@0.8])//y轴横向分割线宽度(为0即是隐藏分割线)
    .zoomTypeSet(AAChartZoomTypeX)
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
    
    aaOptions.chart
    .resetZoomButtonSet(AAResetZoomButton.new
                        .themeSet(@{
                            @"style": @{
                                @"display":@"none"//隐藏图表缩放后的默认显示的缩放按钮
                            }
                        }));
    
    /*Custom Tooltip Style --- 自定义图表浮动提示框样式及内容*/
    aaOptions.tooltip
    .useHTMLSet(true)
    .headerFormatSet(@"🌕 🌖 🌗 🌘 🌑 🌒 🌓 🌔 <br>")
    .pointFormatSet(@" Support format properties Just Right Now !!!<br>")
    .footerFormatSet(@"The Gold Price In <b>{series.name}-{point.key}</b> Is &nbsp<b>{point.y}</b>&nbspDollars Per Gram")
    .valueDecimalsSet(@2)//设置取值精确到小数点后几位
    .backgroundColorSet(AAColor.blackColor)
    .borderColorSet(AAColor.blackColor)
    .styleSet(AAStyleColorSize(@"#FFD700", 12))
    ;
        
    return aaOptions;
}

// Chart Sample Online:   https://jshare.com.cn/highcharts/hhhhG1
+ (AAOptions *)customAreaChartTooltipStyleLikeHTMLTable {
    NSString *pointFormat = [NSString stringWithFormat:@"%@%@",
                             @" <tr><td style= \\\"color: {series.color} \\\">{series.name}: </td>",
                             @"<td style= \\\"text-align: right \\\"><b>{point.y * 10000000000} %EUR</b></td></tr>"];
    
    AAChartModel *aaChartModel = AAChartModel.new
    .chartTypeSet(AAChartTypeAreaspline)//图表类型
    .colorsThemeSet(@[@"#04d69f",@"#1e90ff",@"#ef476f",@"#ffd066",])
    .stackingSet(AAChartStackingTypeNormal)
    .yAxisVisibleSet(false)
    .markerRadiusSet(@0)
    .seriesSet(@[
        AASeriesElement.new
        .nameSet(@"TokyoHot")
        .lineWidthSet(@5.0)
        .fillOpacitySet(@0.4)
        .dataSet(@[@0.45, @0.43, @0.50, @0.55, @0.58, @0.62, @0.83, @0.39, @0.56, @0.67, @0.50, @0.34, @0.50, @0.67, @0.58, @0.29, @0.46, @0.23, @0.47, @0.46, @0.38, @0.56, @0.48, @0.36]),
        AASeriesElement.new
        .nameSet(@"BerlinHot")
        .lineWidthSet(@5.0)
        .fillOpacitySet(@0.4)
        .dataSet(@[@0.38, @0.31, @0.32, @0.32, @0.64, @0.66, @0.86, @0.47, @0.52, @0.75, @0.52, @0.56, @0.54, @0.60, @0.46, @0.63, @0.54, @0.51, @0.58, @0.64, @0.60, @0.45, @0.36, @0.67]),
        AASeriesElement.new
        .nameSet(@"LondonHot")
        .lineWidthSet(@5.0)
        .fillOpacitySet(@0.4)
        .dataSet(@[@0.46, @0.32, @0.53, @0.58, @0.86, @0.68, @0.85, @0.73, @0.69, @0.71, @0.91, @0.74, @0.60, @0.50, @0.39, @0.67, @0.55, @0.49, @0.65, @0.45, @0.64, @0.47, @0.63, @0.64]),
        AASeriesElement.new
        .nameSet(@"NewYorkHot")
        .lineWidthSet(@5.0)
        .fillOpacitySet(@0.4)
        .dataSet(@[@0.60, @0.51, @0.52, @0.53, @0.64, @0.84, @0.65, @0.68, @0.63, @0.47, @0.72, @0.60, @0.65, @0.74, @0.66, @0.65, @0.71, @0.59, @0.65, @0.77, @0.52, @0.53, @0.58, @0.53]),
               ]);
    
    AAOptions *aaOptions = aaChartModel.aa_toAAOptions;
    aaOptions.tooltip
    .sharedSet(true)
    .useHTMLSet(true)
    .headerFormatSet(@"<small>{point.key} 摄氏度</small><table>")
    .pointFormatSet(pointFormat)
    .footerFormatSet(@"</table>")
    .valueDecimalsSet(@2)
    ;
    return aaOptions;
}

//https://github.com/AAChartModel/AAChartKit/issues/987
//headerFormat 参考链接: https://api.highcharts.com.cn/highcharts#tooltip.headerFormat
// \<span> 标签🏷 参考链接: https://www.w3school.com.cn/tags/tag_span.asp
+ (AAOptions *)customAreasplineChartTooltipContentWithHeaderFormat {
    AAChartModel *aaChartModel = AAChartModel.new
    .chartTypeSet(AAChartTypeAreaspline)//图表类型
    .colorsThemeSet(@[@"#04d69f",@"#1e90ff",@"#ef476f",@"#ffd066",])
    .stackingSet(AAChartStackingTypeNormal)
    .markerRadiusSet(@0)
    .categoriesSet(@[
        @"01", @"02", @"03", @"04", @"05", @"06", @"07", @"08", @"09", @"10",
        @"11", @"12", @"13", @"14", @"15", @"16", @"17", @"18", @"19", @"20",
        @"21", @"22", @"23", @"24", @"25", @"26", @"27", @"28", @"29", @"30",
        @"31"
                   ])
    .yAxisVisibleSet(false)
    .markerRadiusSet(@0)
    .seriesSet(@[
        AASeriesElement.new
        .nameSet(@"客流")
        .lineWidthSet(@5.0)
        .fillOpacitySet(@0.4)
        .dataSet(@[
            @26, @27, @53, @41, @35, @55, @33, @42, @33, @63,
            @40, @43, @36, @0,  @0,  @0,  @0,  @0,  @0,  @0,
            @0,  @0,  @0,  @0,  @0,  @0,  @0,  @0,  @0,  @0,
            @0
                 ]),
               ]);
    
    NSString *title = @"<span style=""color:red;font-size:17px;font-weight:bold;"">客流</span><br>";
    NSString *week = @"周一";
    NSString *time = [NSString stringWithFormat:@"时间: 8.{point.x} (%@)<br>",week];
    NSString *headerFormat = [NSString stringWithFormat:@"%@%@",title,time];
    
    AAOptions *aaOptions = aaChartModel.aa_toAAOptions;
    aaOptions.tooltip
    .useHTMLSet(true)
    .headerFormatSet(headerFormat)
    .styleSet(AAStyleColorSize(AAColor.whiteColor, 14))
    .backgroundColorSet(@"#050505")
    .borderColorSet(@"#050505")
    ;
    
    //禁用图例点击事件
    aaOptions.plotOptions.series.events = AASeriesEvents.new
    .legendItemClickSet(@AAJSFunc(function() {
        return false;
    }));
    
    return aaOptions;
}


//https://github.com/AAChartModel/AAChartKit/issues/1125
+ (AAOptions *)customAreaChartTooltipStyleWithTotalValueHeader {
    NSArray *goldStopsArr = @[
        @[@0.0, AARgbaColor(255, 215, 0, 1.0)],//颜色字符串设置支持十六进制类型和 rgba 类型
        @[@0.6, AARgbaColor(255, 215, 0, 0.2)],
        @[@1.0, AARgbaColor(255, 215, 0, 0.0)]
    ];
    AAGradientColor *gradientGoldColorDic =
    [AAGradientColor gradientColorWithDirection:AALinearGradientDirectionToBottom
                                     stopsArray:goldStopsArr];
    
    
    NSArray *greenStopsArr = @[
        @[@0.0, AARgbaColor(50, 205, 50, 1.0)],//颜色字符串设置支持十六进制类型和 rgba 类型
        @[@0.6, AARgbaColor(50, 205, 50, 0.2)],
        @[@1.0, AARgbaColor(50, 205, 50, 0.0)]
    ];
    AAGradientColor *gradientGreenColorDic =
    [AAGradientColor gradientColorWithDirection:AALinearGradientDirectionToBottom
                                     stopsArray:greenStopsArr];
    
    AAChartModel *aaChartModel = AAChartModel.new
    .chartTypeSet(AAChartTypeArea)//图表类型
    .titleSet(@"2021 年 10 月上海市猫与狗生存调查")//图表主标题
    .subtitleSet(@"数据来源：www.无任何可靠依据.com")//图表副标题
    .colorsThemeSet(@[
        AARgbaColor(255, 215, 0, 1.0),
        AARgbaColor(50, 205, 50, 1.0),
                    ])
    .markerSymbolStyleSet(AAChartSymbolStyleTypeInnerBlank)//折线连接点样式为内部白色
    .stackingSet(AAChartStackingTypeNormal)
    .yAxisGridLineStyleSet([AALineStyle styleWithWidth:@0])//y轴横向分割线宽度(为0即是隐藏分割线)
    .categoriesSet(@[
        @"10-01",@"10-02",@"10-03",@"10-04",@"10-05",@"10-06",@"10-07",@"10-08",])
    .seriesSet(@[
        AASeriesElement.new
        .lineWidthSet(@6)
        .fillColorSet((id)gradientGoldColorDic)
        .nameSet(@"🐶狗")
        .dataSet(@[@43934, @52503, @57177, @69658, @97031, @119931, @137133, @154175]),
        AASeriesElement.new
        .lineWidthSet(@6)
        .fillColorSet((id)gradientGreenColorDic)
        .nameSet(@"🐱猫")
        .dataSet(@[@24916, @24064, @29742, @29851, @32490, @30282, @38121, @40434]),
    ]);
    
    AAOptions *aaOptions = aaChartModel.aa_toAAOptions;
    aaOptions.tooltip
    .useHTMLSet(true)
    .headerFormatSet(@"狗和猫的总数为:{point.total}<br/>")
    ;
    
    return aaOptions;
}

+ (AAOptions *)customBoxplotTooltipContent {
    AAChartModel *aaChartModel = AAChartModel.new
    .chartTypeSet(AAChartTypeBoxplot)
    .titleSet(@"箱线图")
    .subtitleSet(@"虚拟数据")
    .yAxisTitleSet(@"摄氏度")
    .yAxisVisibleSet(true)
    .seriesSet(@[
        AASeriesElement.new
        .nameSet(@"观测值")
        .lineWidthSet(@1.8)
        .fillColorSet((id)AAGradientColor.deepSeaColor)
        .dataSet(@[
            @[@760, @801, @848, @895, @965],
            @[@733, @853, @939, @980, @1080],
            @[@714, @762, @817, @870, @918],
            @[@724, @802, @806, @871, @950],
            @[@834, @836, @864, @882, @910]
        ]),
    ]);
    
    //    https://jshare.com.cn/demos/hhhhiQ
    //    https://jsfiddle.net/gh/get/library/pure/highcharts/highcharts/tree/master/samples/highcharts/tooltip/footerformat/
    //pointFormat: '' + // eslint-disable-line no-dupe-keys
    
    NSString *str1 = @"<span style=""color:{point.color}"">◉</span> <b> {series.name}</b><br/>";
    NSString *str2 = @"最大值: {point.high}<br/>";
    NSString *str3 = @"Q2: {point.q3}<br/>";
    NSString *str4 = @"中位数: {point.median}<br/>";
    NSString *str5 = @"Q1: {point.q1}<br/>";
    NSString *str6 = @"最小值: {point.low}<br/>";
    NSString *pointFormatStr = [NSString stringWithFormat:@"%@%@%@%@%@%@",str1,str2,str3,str4,str5,str6];
    
    
    AAOptions *aaOptions = aaChartModel.aa_toAAOptions;
    aaOptions.tooltip
    .useHTMLSet(true)
    .headerFormatSet(@"<em>实验号码： {point.key}</em><br/>")
    .pointFormatSet(pointFormatStr)
    .valueDecimalsSet(@2)//设置取值精确到小数点后几位
    .backgroundColorSet(AAColor.blackColor)
    .borderColorSet(AAColor.blackColor)
    .styleSet(AAStyleColorSize(@"#1e90ff", 12))
    ;
    
    return aaOptions;
}


@end
