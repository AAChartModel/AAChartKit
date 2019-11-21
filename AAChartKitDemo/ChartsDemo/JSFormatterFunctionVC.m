//
//  SupportJSFunctionVC.m
//  AAChartKitDemo
//
//  Created by AnAn on 2019/4/23.
//  Copyright © 2019 Danny boy. All rights reserved.
//

#import "JSFormatterFunctionVC.h"
#import "AAChartKit.h"

@interface JSFormatterFunctionVC ()

@property (nonatomic, strong) AAChartModel *chartModel;
@property (nonatomic, strong) AAChartView  *chartView;

@end

@implementation JSFormatterFunctionVC

- (void)viewDidLoad {
    [super viewDidLoad];
    // highcharts default colors ["#7cb5ec #434348 #90ed7d #f7a35c #8085e9 #f15c80 #e4d354 #2b908f #f45b5b #91e8e1"]
    // rainbow colors 🌈 [@"#eb2100", @"#eb3600", @"#d0570e", @"#d0a00e", @"#34da62", @"#00e9db", @"#00c0e9", @"#0096f3", @"#33CCFF", @"#33FFCC'];
    AAChartView *aaChartView = [self configureChartView];
    AAOptions *aaOptions = [self configureChartOptions];
    [aaChartView aa_drawChartWithOptions:aaOptions];
}

- (AAChartView *)configureChartView {
    CGRect frame = CGRectMake(0, 80, self.view.frame.size.width, self.view.frame.size.height-80);
    AAChartView *aaChartView = [[AAChartView alloc]initWithFrame:frame];
    self.view.backgroundColor = [UIColor whiteColor];
    [self.view addSubview:aaChartView];
    
    return aaChartView;
}

- (AAOptions *)configureChartOptions {
    switch (self.selectedIndex) {
        case 0: return [self customAreaChartTooltipStyleWithFormatterFunction1];//简单字符串拼接
        case 1: return [self customAreaChartTooltipStyleWithFormatterFunction2];//自定义不同单位后缀
        case 2: return [self customAreaChartTooltipStyleWithFormatterFunction3];//值为0时,在tooltip中不显示
        case 3: return [self customAreaChartTooltipStyleWithFormatterFunction4];//自定义多彩颜色文字
        case 4: return [self customBoxplotTooltipContent];//不借助JavaScript函数自定义箱线图的浮动提示框头部内容
        case 5: return [self customYAxisLabels];//自定义Y轴文字
        case 6: return [self customStackedAndGroupedColumnChartTooltip];//自定义分组堆积柱状图tooltip内容
        case 7: return [self everySingleColumnHasGrayBackground];//每根棱柱都有白色背景的柱形图
        case 8: return [self everySingleColumnHasWhiteEmptyBorderLineBackground];//每根棱柱都有空心白色边缘线的柱形图
        case 9: return [self colorfulSpecialStyleColumnChart];//温度计🌡风格的彩色棱柱图
        case 10: return [self configureSpecialStyleTrianglePolarChart];//外部显示六边形边框的三角形雷达图
        case 11: return [self customDoubleXAxesChart];//双 X 轴镜像条形图
        case 12: return [self customAreaChartXAxisLabelsTextUnitSuffix];//自定义X轴文字单位后缀
        case 13: return [self customArearangeChartTooltip];//自定义面积范围图的 tooltip
        default:
            return nil;
    }
}

- (AAOptions *)customAreaChartTooltipStyleWithFormatterFunction1 {
    AAChartModel *aaChartModel = AAChartModel.new
    .chartTypeSet(AAChartTypeArea)//图表类型
    .titleSet(@"近三个月金价起伏周期图")//图表主标题
    .subtitleSet(@"金价(元/克)")//图表副标题
    .colorsThemeSet(@[@"#FFD700"/*(纯金色)*/,@"#ffc069",@"#06caf4",@"#7dffc0"])//设置主体颜色数组
    .markerSymbolStyleSet(AAChartSymbolStyleTypeBorderBlank)//折线连接点样式为外边缘空白
    .xAxisTickIntervalSet(@15)//x轴刻度点间隔数(设置每隔几个点显示一个 X轴的内容)
    .yAxisTitleSet(@"")//设置 Y 轴标题
    .yAxisGridLineWidthSet(@0.8)//y轴横向分割线宽度(为0即是隐藏分割线)
    .categoriesSet(@[
        @"10-01",@"10-02",@"10-03",@"10-04",@"10-05",@"10-06",@"10-07",@"10-08",@"10-09",@"10-10",@"10-11",
        @"10-12",@"10-13",@"10-14",@"10-15",@"10-16",@"10-17",@"10-18",@"10-19",@"10-20",@"10-21",@"10-22",
        @"10-23",@"10-024",@"10-25",@"10-26",@"10-27",@"10-28",@"10-29",@"10-30",@"10-31",@"11-01",@"11-02",
        @"11-03",@"11-04",@"11-05",@"11-06",@"11-07",@"11-08",@"11-09",@"11-10",@"11-11",@"11-12",@"11-13",
        @"11-14",@"11-15",@"11-16",@"11-17",@"11-18",@"11-19",@"11-20",@"11-21",@"11-22",@"11-23",@"11-024",
        @"11-25",@"11-26",@"11-27",@"11-28",@"11-29",@"11-30",@"12-01",@"12-02",@"12-03",@"12-04",@"12-05",
        @"12-06",@"12-07",@"12-08",@"12-09",@"12-10",@"12-11",@"12-12",@"12-13",@"12-14",@"12-15",@"12-16",
        @"12-17",@"12-18",@"12-19",@"12-20",@"12-21",@"12-22",@"12-23",@"12-024",@"12-25",@"12-26",@"12-27",
        @"12-28",@"12-29",@"12-30"])
    .seriesSet(@[
        AASeriesElement.new
        .lineWidthSet(@1.5)
        .fillOpacitySet(@0.4)
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
    
    
    /*Custom Tooltip Style --- 自定义图表浮动提示框样式及内容*/
    AAOptions *aaOptions = [AAOptionsConstructor configureChartOptionsWithAAChartModel:aaChartModel];
    AATooltip *tooltip = aaOptions.tooltip;
    tooltip
    .useHTMLSet(true)
    .formatterSet(@AAJSFunc(function () {
        return ' 🌕 🌖 🌗 🌘 🌑 🌒 🌓 🌔 <br/> '
        + ' Support JavaScript Function Just Right Now !!! <br/> '
        + ' The Gold Price For <b>2020 '
        +  this.x
        + ' </b> Is <b> '
        +  this.y
        + ' </b> Dollars ';
    }))
    .valueDecimalsSet(@2)//设置取值精确到小数点后几位
    .backgroundColorSet(@"#000000")
    .borderColorSet(@"#000000")
    .styleSet((id)AAStyle.new
              .colorSet(@"#FFD700")
              .fontSizeSet(@"12px")
              )
    ;
    return aaOptions;
}

- (AAOptions *)customAreaChartTooltipStyleWithFormatterFunction2 {
    NSDictionary *gradientColorDic1 =
    [AAGradientColor gradientColorWithDirection:AALinearGradientDirectionToTop
                               startColorString:@"rgba(256,0,0,0.3)"//颜色字符串设置支持十六进制类型和 rgba 类型
                                 endColorString:@"rgba(256,0,0,1.0)"];
    
    NSDictionary *gradientColorDic2 =
    [AAGradientColor gradientColorWithDirection:AALinearGradientDirectionToTop
                               startColorString:@"rgba(0,0,256,0.3)"//颜色字符串设置支持十六进制类型和 rgba 类型
                                 endColorString:@"rgba(0,0,256,1.0)"];
    
    AAChartModel *aaChartModel = AAChartModel.new
    .chartTypeSet(AAChartTypeArea)//图表类型
    .titleSet(@"2014 ~ 2020 汪星人生存指数")//图表主标题
    .subtitleSet(@"数据来源：www.无任何可靠依据.com")//图表副标题
    .markerSymbolStyleSet(AAChartSymbolStyleTypeInnerBlank)//折线连接点样式为内部白色
    .stackingSet(AAChartStackingTypeNormal)
    //    .xAxisTickIntervalSet(@15)//x轴刻度点间隔数(设置每隔几个点显示一个 X轴的内容)
    .yAxisTitleSet(@"")//设置 Y 轴标题
    .yAxisGridLineWidthSet(@0.8)//y轴横向分割线宽度(为0即是隐藏分割线)
    .seriesSet(@[
        AASeriesElement.new
        .lineWidthSet(@1.5)
        .colorSet((id)gradientColorDic1)
        .nameSet(@"🐶狗子")
        .dataSet(@[@43934, @52503, @57177, @69658, @97031, @119931, @137133, @154175]),
        AASeriesElement.new
        .lineWidthSet(@1.5)
        .colorSet((id)gradientColorDic2)
        .nameSet(@"🌲树木")
        .dataSet(@[@24916, @24064, @29742, @29851, @32490, @30282, @38121, @40434]),
    ]);
    /*Custom Tooltip Style --- 自定义图表浮动提示框样式及内容*/
    AAOptions *aaOptions = [AAOptionsConstructor configureChartOptionsWithAAChartModel:aaChartModel];
    aaOptions.tooltip
    .useHTMLSet(true)
    .formatterSet(@AAJSFunc(function () {
        var s = '第' + '<b>' +  this.x + '</b>' + '年' + '<br/>';
        let colorDot1 = '<span style=\"' + 'color:red; font-size:13px\"' + '>◉</span> ';
        let colorDot2 = '<span style=\"' + 'color:blue; font-size:13px\"' + '>◉</span> ';
        let s1 = colorDot1  + this.points[0].series.name + ': ' + this.points[0].y + '只' + '<br/>';
        let s2 =  colorDot2 + this.points[1].series.name + ': ' + this.points[1].y + '棵';
        s += s1 + s2;
        return s;
    }))
    ;
    return aaOptions;
}

- (AAOptions *)customAreaChartTooltipStyleWithFormatterFunction3 {
    AAChartModel *aaChartModel = AAChartModel.new
    .chartTypeSet(AAChartTypeLine)//图表类型
    .titleSet(@"")//图表主标题
    .subtitleSet(@"")//图表副标题
    .colorsThemeSet(@[@"red",@"mediumspringgreen",@"deepskyblue",@"sandybrown"])//设置主体颜色数组
    .markerSymbolStyleSet(AAChartSymbolStyleTypeBorderBlank)//折线连接点样式为外边缘空白
    .yAxisTitleSet(@"")//设置 Y 轴标题
    .yAxisGridLineWidthSet(@0.8)//y轴横向分割线宽度(为0即是隐藏分割线)
    .categoriesSet(@[@"临床一期",@"临床二期",@"临床三期"])
    .markerRadiusSet(@8.0)
    .xAxisCrosshairDashStyleTypeSet(AAChartLineDashStyleTypeDashDot)
    .xAxisCrosshairWidthSet(@1.0)
    .xAxisCrosshairColorSet(AAColor.darkGrayColor)
    .seriesSet(@[
        AASeriesElement.new
        .nameSet(@"上市")
        .dataSet(@[@0,@0,@7]),
        AASeriesElement.new
        .nameSet(@"终止")
        .dataSet(@[@4,@5,@1]),
        AASeriesElement.new
        .nameSet(@"无进展")
        .dataSet(@[@2,@0,@1]),
        AASeriesElement.new
        .nameSet(@"进行中")
        .dataSet(@[@3,@5,@2]),
    ]);
    
    
    /*Custom Tooltip Style --- 自定义图表浮动提示框样式及内容*/
    AAOptions *aaOptions = [AAOptionsConstructor configureChartOptionsWithAAChartModel:aaChartModel];
    aaOptions.tooltip
    .useHTMLSet(true)
    .formatterSet(@AAJSFunc(function () {
        let colorDot0 = '<span style=\"' + 'color:red; font-size:13px\"' + '>◉</span> ';
        let colorDot1 = '<span style=\"' + 'color:mediumspringgreen; font-size:13px\"' + '>◉</span> ';
        let colorDot2 = '<span style=\"' + 'color:deepskyblue; font-size:13px\"' + '>◉</span> ';
        let colorDot3 = '<span style=\"' + 'color:sandybrown; font-size:13px\"' + '>◉</span> ';
        let colorDotArr = [];
        colorDotArr.push(colorDot0);
        colorDotArr.push(colorDot1);
        colorDotArr.push(colorDot2);
        colorDotArr.push(colorDot3);
        let wholeContentString = this.points[0].x + '<br/>';
        for (let i = 0;i < 4;i++) {
            let yValue = this.points[i].y;
            if (yValue != 0) {
                let prefixStr = colorDotArr[i];
                wholeContentString += prefixStr + this.points[i].series.name + ': ' + this.points[i].y + '<br/>';
            }
        }
        return wholeContentString;
    }))
    ;
    return aaOptions;
}

- (AAOptions *)customAreaChartTooltipStyleWithFormatterFunction4 {
    AAChartModel *aaChartModel = AAChartModel.new
    .chartTypeSet(AAChartTypeAreaspline)//图表类型
    .titleSet(@"")//图表主标题
    .subtitleSet(@"")//图表副标题
    .colorsThemeSet(@[@"#04d69f",@"#1e90ff",@"#ef476f",@"#ffd066",])
    .stackingSet(AAChartStackingTypeNormal)
    .yAxisTitleSet(@"")//设置 Y 轴标题
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
    /*Custom Tooltip Style --- 自定义图表浮动提示框样式及内容*/
    AAOptions *aaOptions = [AAOptionsConstructor configureChartOptionsWithAAChartModel:aaChartModel];
    aaOptions.tooltip
    .useHTMLSet(true)
    .formatterSet(@AAJSFunc(function () {
        let colorsArr = [];
        colorsArr.push("mediumspringgreen");
        colorsArr.push("deepskyblue");
        colorsArr.push("red");
        colorsArr.push("sandybrown");
        let wholeContentString ='<span style=\"' + 'color:lightGray; font-size:13px\"' + '>◉ Time: ' + this.x + ' year</span><br/>';
        for (let i = 0;i < 4;i++) {
            let thisPoint = this.points[i];
            let yValue = thisPoint.y;
            if (yValue != 0) {
                let spanStyleStartStr = '<span style=\"' + 'color:'+ colorsArr[i] + '; font-size:13px\"' + '>◉ ';
                let spanStyleEndStr = '</span> <br/>';
                wholeContentString += spanStyleStartStr + thisPoint.series.name + ': ' + thisPoint.y + '℃' + spanStyleEndStr;
            }
        }
        return wholeContentString;
    }))
    .backgroundColorSet(@"#050505")
    .borderColorSet(@"#050505")
    ;
    return aaOptions;
}

- (AAOptions *)customBoxplotTooltipContent {
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
    
    /*Custom Tooltip Style --- 自定义图表浮动提示框样式及内容*/
    AAOptions *aaOptions = [AAOptionsConstructor configureChartOptionsWithAAChartModel:aaChartModel];
    aaOptions.tooltip
    .useHTMLSet(true)
    .headerFormatSet(@"<em>实验号码： {point.key}</em><br/>")
    .pointFormatSet(pointFormatStr)
    .valueDecimalsSet(@2)//设置取值精确到小数点后几位
    .backgroundColorSet(@"#000000")
    .borderColorSet(@"#000000")
    .styleSet((id)AAStyle.new
              .colorSet(@"#1e90ff")
              .fontSizeSet(@"12px")
              )
    ;
    
    return aaOptions;
}

- (AAOptions *)customYAxisLabels {
    AAChartModel *aaChartModel = AAChartModel.new
    .chartTypeSet(AAChartTypeLine)//图表类型
    .titleSet(@"")//图表主标题
    .subtitleSet(@"")//图表副标题
    .colorsThemeSet(@[@"#04d69f",@"#1e90ff",@"#ef476f",@"#ffd066",])
    .markerSymbolStyleSet(AAChartSymbolStyleTypeBorderBlank)//折线连接点样式为内部白色
    .markerRadiusSet(@8)
    .stackingSet(AAChartStackingTypeNormal)
    .yAxisTitleSet(@"")//设置 Y 轴标题
    .seriesSet(@[
        AASeriesElement.new
        .nameSet(@"Tokyo Hot")
        .lineWidthSet(@5.0)
        .fillOpacitySet(@0.4)
        .dataSet( @[@29.9, @71.5, @106.4, @129.2, @144.0, @176.0, @135.6, @148.5, @216.4, @194.1, @95.6, @54.4]),
    ]);
    /*Custom Tooltip Style --- 自定义图表浮动提示框样式及内容*/
    AAOptions *aaOptions = [AAOptionsConstructor configureChartOptionsWithAAChartModel:aaChartModel];
    aaOptions
    .yAxis.labels
    .formatterSet(@AAJSFunc(function () {
        let yValue = this.value;
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
    /*Custom Tooltip Style --- 自定义图表浮动提示框样式及内容*/
    AAOptions *aaOptions = [AAOptionsConstructor configureChartOptionsWithAAChartModel:aaChartModel];
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
    .titleSet(@"")//图表主标题
    .subtitleSet(@"")//图表副标题
    .backgroundColorSet(@"#111c4e")
    .xAxisLabelsFontSizeSet(@9)
    .xAxisLabelsFontWeightSet(AAChartFontWeightTypeBold)
    .categoriesSet(@[@"一月", @"二月", @"三月", @"四月", @"五月", @"六月",
                     @"七月", @"八月", @"九月", @"十月", @"十一月", @"十二月"])
    .yAxisMaxSet(@250.0)
    .yAxisTitleSet(@"")
    .legendEnabledSet(false)
    .yAxisLineWidthSet(@1)
    .stackingSet(AAChartStackingTypeNormal)
    .seriesSet(@[
        AASeriesElement.new
        .nameSet(@"Tokyo Hot")
        .colorSet(@"rgba(255,255,255,0.3)")
        .dataSet(@[@250.0, @250.0, @250.0, @250.0, @250.0, @250.0, @250.0, @250.0, @250.0, @250.0, @250.0, @250.0,]),
        AASeriesElement.new
        .nameSet(@"Berlin Hot")
        .colorSet((id)gradientColorDic1)
        .dataSet( @[@29.9, @71.5, @106.4, @135.6, @148.5, @216.4, @194.1, @95.6, @54.4, @129.2, @144.0, @176.0,]),
    ]);
    /*Custom Tooltip Style --- 自定义图表浮动提示框样式及内容*/
    AAOptions *aaOptions = [AAOptionsConstructor configureChartOptionsWithAAChartModel:aaChartModel];
    aaOptions.xAxis
    .lineWidthSet(@1)
    .lineColorSet(@"rgba(255,255,255,0.3)")
    .tickWidthSet(@0);
    
    aaOptions.yAxis
    .gridLineWidthSet(@0)
    .lineColorSet(@"rgba(255,255,255,0.3)");
    
    aaOptions.plotOptions
    .seriesSet(AASeries.new
               .animationSet((id)@false)
               )
    .columnSet(AAColumn.new
               .groupingSet(false)
               .borderWidthSet(@0)
               .borderRadiusSet(@8)
               )
    ;
    
    aaOptions.tooltip
    .sharedSet(false)
    .backgroundColorSet((id)gradientColorDic1)
    .styleSet((id)AAStyle.new
              .colorSet(@"#FFFFFF")
              .fontSizeSet(@"12px")
              )
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
    .titleSet(@"")//图表主标题
    .subtitleSet(@"")//图表副标题
    .backgroundColorSet(@"#111c4e")
    .xAxisLabelsFontSizeSet(@9)
    .xAxisLabelsFontWeightSet(AAChartFontWeightTypeBold)
    .categoriesSet(@[@"一月", @"二月", @"三月", @"四月", @"五月", @"六月",
                     @"七月", @"八月", @"九月", @"十月", @"十一月", @"十二月"])
    .yAxisMaxSet(@250.0)
    .yAxisTitleSet(@"")
    .legendEnabledSet(false)
    .yAxisLineWidthSet(@1)
    .stackingSet(AAChartStackingTypeNormal)
    .seriesSet(@[
        AASeriesElement.new
        .nameSet(@"Tokyo Hot")
        .colorSet(@"rgba(0,0,0,0)")
        .borderColorSet(AAColor.lightGrayColor)
        .borderWidthSet(@2.0)
        .dataSet(@[@250.0, @250.0, @250.0, @250.0, @250.0, @250.0, @250.0, @250.0, @250.0, @250.0, @250.0, @250.0,]),
        AASeriesElement.new
        .nameSet(@"Berlin Hot")
        .colorSet((id)gradientColorDic1)
        .dataSet( @[ @148.5, @216.4, @194.1, @95.6, @54.4, @129.2, @144.0, @176.0,@29.9, @71.5, @106.4, @135.6,]),
    ]);
    /*Custom Tooltip Style --- 自定义图表浮动提示框样式及内容*/
    AAOptions *aaOptions = [AAOptionsConstructor configureChartOptionsWithAAChartModel:aaChartModel];
    aaOptions.xAxis
    .lineWidthSet(@1)
    .lineColorSet(@"rgba(255,255,255,0.3)")
    .tickWidthSet(@0);
    
    aaOptions.yAxis
    .gridLineWidthSet(@0)
    .lineColorSet(@"rgba(255,255,255,0.3)");
    
    aaOptions.plotOptions
    .seriesSet(AASeries.new
               .animationSet((id)@false)
               )
    .columnSet(AAColumn.new
               .groupingSet(false)
               .borderWidthSet(@0)
               .borderRadiusSet(@8)
               )
    ;
    
    aaOptions.tooltip
    .sharedSet(false)
    .backgroundColorSet(AAColor.darkGrayColor)
    .styleSet((id)AAStyle.new
              .colorSet(@"#FFD700")
              .fontSizeSet(@"12px")
              )
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

- (AAOptions *)colorfulSpecialStyleColumnChart {
    AAChartModel *aaChartModel = AAChartModel.new
    .chartTypeSet(AAChartTypeColumn)//图表类型
    .titleSet(@"")//图表主标题
    .subtitleSet(@"")//图表副标题
    .backgroundColorSet(@"#111c4e")
    .colorsThemeSet(@[@"#eb2100", @"#eb3600", @"#d0570e", @"#d0a00e", @"#34da62", @"#00e9db", @"#00c0e9", @"#0096f3", @"#33CCFF", @"#33FFCC"])
    .xAxisLabelsFontSizeSet(@9)
    .xAxisLabelsFontWeightSet(AAChartFontWeightTypeBold)
    .categoriesSet(@[@"一月", @"二月", @"三月", @"四月", @"五月", @"六月",
                     @"七月", @"八月", @"九月", @"十月", @"十一月", @"十二月"])
    .yAxisMaxSet(@250.0)
    .yAxisTitleSet(@"")
    .legendEnabledSet(false)
    .yAxisLineWidthSet(@1)
    .stackingSet(AAChartStackingTypeNormal)
    .seriesSet(@[
        AASeriesElement.new
        .nameSet(@"Tokyo Hot")
        .colorSet(@"rgba(0,0,0,0)")
        .colorByPointSet(@false)
        .borderWidthSet(@2.0)
        .borderColorSet(@"rgba(255,255,255,0.3)")
        .dataSet(@[@250.0, @250.0, @250.0, @250.0, @250.0, @250.0, @250.0, @250.0, @250.0, @250.0, @250.0, @250.0,]),
        AASeriesElement.new
        .nameSet(@"Berlin Hot")
        .colorByPointSet(@true)
        .dataSet( @[ @148.5, @216.4, @194.1, @95.6, @54.4, @129.2, @144.0, @176.0,@29.9, @71.5, @106.4, @135.6,]),
        AASeriesElement.new
        .typeSet(AAChartTypeScatter)
        .colorByPointSet(@true)
        .markerSet(AAMarker.new
                   .radiusSet(@21))
        .dataSet(@[@0.f, @0.f, @0.f, @0.f, @0.f, @0.f, @0.f, @0.f, @0.f, @0.f, @0.f, @0.f,]),
    ]);
    /*Custom Tooltip Style --- 自定义图表浮动提示框样式及内容*/
    AAOptions *aaOptions = [AAOptionsConstructor configureChartOptionsWithAAChartModel:aaChartModel];
    aaOptions.xAxis
    .lineWidthSet(@1)
    .lineColorSet(@"rgba(255,255,255,0.3)")
    .tickWidthSet(@0);
    
    aaOptions.yAxis
    .gridLineWidthSet(@0)
    .lineColorSet(@"rgba(255,255,255,0.3)");
    
    aaOptions.plotOptions
    .seriesSet(AASeries.new
               .animationSet((id)@false)
               )
    .columnSet(AAColumn.new
               .groupingSet(false)
               .borderWidthSet(@0)
               .borderRadiusSet(@8)
               )
    ;
    
    aaOptions.tooltip
    .sharedSet(false)
    .backgroundColorSet(AAColor.darkGrayColor)
    .styleSet((id)AAStyle.new
              .colorSet(@"#FFD700")
              .fontSizeSet(@"12px")
              )
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

- (AAOptions *)configureSpecialStyleTrianglePolarChart {
    AAChartModel *aaChartModel = AAChartModel.new
    .chartTypeSet(AAChartTypeArea)
    .connectNullsSet(true)
    .titleSet(@"")
    .subtitleSet(@"")
    .yAxisTitleSet(@"")
    .yAxisMaxSet(@13.0)
    .yAxisGridLineWidthSet(@2)
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
    
    AAOptions *aaOptions = [AAOptionsConstructor configureChartOptionsWithAAChartModel:aaChartModel];
    aaOptions.xAxis.lineWidth = @0.0;//避免多边形外环之外有额外套了一层无用的外环
    aaOptions.yAxis.gridLineInterpolation = AAYAxisGridLineInterpolationPolygon;
    aaOptions.yAxis.tickAmount = @8.0;
    aaOptions
    .xAxis.labels
    .formatterSet(@AAJSFunc(function () {
        let categoriesArr = [];
        categoriesArr.push("Swift");
        categoriesArr.push("");
        categoriesArr.push("Ruby");
        categoriesArr.push("");
        categoriesArr.push("Go");
        categoriesArr.push("");
        let thisCategory = categoriesArr[this.value];
        return thisCategory;
    }));
    
    aaOptions.tooltip
    .useHTMLSet(true)
    .formatterSet(@AAJSFunc(function () {
        let categoriesArr = [];
        categoriesArr.push("Swift");
        categoriesArr.push("");
        categoriesArr.push("Ruby");
        categoriesArr.push("");
        categoriesArr.push("Go");
        categoriesArr.push("");
        let thisCategory = categoriesArr[this.x];
        
        return ' 🌕 🌖 🌗 🌘 🌑 🌒 🌓 🌔 <br/> '
        + ' 此处支持使用JavaScript函数来自定义tooltip <br/> '
        + '2020 年编程语言热度  <b> '
        +  thisCategory
        + ' </b> Is <b> '
        +  this.y
        + ' </b> 摄氏度 ';
    }))
    .valueDecimalsSet(@2)//设置取值精确到小数点后几位
    .backgroundColorSet(@"#000000")
    .borderColorSet(@"#000000")
    .styleSet((id)AAStyle.new
              .colorSet(@"#1e90ff")
              .fontSizeSet(@"12px")
              )
    ;
    
    return aaOptions;
}

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
              .typeSet(AAChartTypeBar)
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
                        .textSet(@"收入"))
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
        .dataSet(@[@-1746181, @-1884428, @-2089758, @-2222362, @-2537431, @-2507081, @-2443179,
                   @-2664537, @-3556505, @-3680231, @-3143062, @-2721122, @-2229181, @-2227768,
                   @-2176300, @-1329968, @-836804, @-354784, @-90569, @-28367, @-3878]),
        AASeriesElement.new
        .nameSet(@"Women")
        .colorSet((id)gradientColorDic2)
        .dataSet(@[@1656154, @1787564, @1981671, @2108575, @2403438, @2366003, @2301402, @2519874,
                   @3360596, @3493473, @3050775, @2759560, @2304444, @2426504, @2568938, @1785638,
                   @1447162, @1005011, @330870, @130632, @21208]),
    ])
    ;
    
    return aaOptions;
}

- (AAOptions *)customAreaChartXAxisLabelsTextUnitSuffix {
    NSDictionary *gradientColorDic1 =
    [AAGradientColor gradientColorWithDirection:AALinearGradientDirectionToTop
                               startColorString:@"#7052f4"//颜色字符串设置支持十六进制类型和 rgba 类型
                                 endColorString:@"#00b0ff"];
    
    AAChartModel *aaChartModel = AAChartModel.new
    .chartTypeSet(AAChartTypeArea)//图表类型
    .titleSet(@"Custom X Axis Labels Text")//图表主标题
    .subtitleSet(@"By Using JavaScript Formatter Function")//图表副标题
    .markerSymbolStyleSet(AAChartSymbolStyleTypeBorderBlank)//折线连接点样式为外边缘空白
    .yAxisTitleSet(@"")//设置 Y 轴标题
    .yAxisGridLineWidthSet(@0.8)//y轴横向分割线宽度(为0即是隐藏分割线)
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
    
    
    /*Custom Tooltip Style --- 自定义图表浮动提示框样式及内容*/
    AAOptions *aaOptions = [AAOptionsConstructor configureChartOptionsWithAAChartModel:aaChartModel];
    aaOptions.xAxis.labels
    .formatterSet(@AAJSFunc(function () {
        let xValue = this.value;
        if (xValue%3 == 0) {
            return xValue + " sec"
        } else {
            return "";
        }
    }))
    ;
    
    return aaOptions;
}

- (AAOptions *)customArearangeChartTooltip {
    AAChartModel *aaChartModel = AAChartModel.new
    .chartTypeSet(AAChartTypeArearange)
    .titleSet(@"面积范围均线图")
    .subtitleSet(@"混合图的一种")
    .yAxisGridLineWidthSet(@0)
    .xAxisVisibleSet(false)
    .yAxisTitleSet(@"摄氏度")
    .markerSymbolStyleSet(AAChartSymbolStyleTypeInnerBlank)
    .seriesSet(@[
        AASeriesElement.new
        .nameSet(@"Range")
        .dataSet(@[@[@1246406400000, @14.3, @27.7],
                   @[@1246492800000, @14.5, @27.8],
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

    AAOptions *aaOptions = [AAOptionsConstructor configureChartOptionsWithAAChartModel:aaChartModel];
    aaOptions.tooltip
    .useHTMLSet(true)
    .formatterSet(@AAJSFunc(function () {
        let myPointOptions = this.points[0].point.options;
        let xValue = myPointOptions.x;
        let lowValue = myPointOptions.low;
        let highValue = myPointOptions.high;
        let titleStr = '🌕 this is my custom tooltip description text content <br>';
        let xValueStr = '🌖 this is x value  : ' + xValue + '<br>';
        let lowValueStr = ' 🌗 this is low value  : ' + lowValue + '<br>';
        let highValueStr = '🌘 this is high value : ' + highValue + '<br>';
        let tooltipDescStr =  titleStr + xValueStr + lowValueStr + highValueStr;
        return tooltipDescStr;
    }))
    .backgroundColorSet(@"#000000")
    .borderColorSet(@"#000000")
    .styleSet((id)AAStyle.new
              .colorSet(@"#1e90ff")
              .fontSizeSet(@"12px")
              )
    ;
    
    return aaOptions;
}


@end
