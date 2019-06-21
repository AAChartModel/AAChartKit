//
//  SupportJSFunctionVC.m
//  AAChartKitDemo
//
//  Created by AnAn on 2019/4/23.
//  Copyright © 2019 Danny boy. All rights reserved.
//

#import "SupportJSFunctionVC.h"
#import "AAChartKit.h"

@interface SupportJSFunctionVC ()
    
@property (nonatomic, strong) AAChartModel *chartModel;
@property (nonatomic, strong) AAChartView  *chartView;
    
@end

@implementation SupportJSFunctionVC

- (void)viewDidLoad {
    [super viewDidLoad];
    
    AAChartView *aaChartView = [self configureChartView];
    AAOptions *aaOptions = [self configureChartOptions];
    [aaChartView aa_drawChartWithOptions:aaOptions];
}

- (AAChartView *)configureChartView {
    CGRect frame = CGRectMake(0, 30, self.view.frame.size.width, self.view.frame.size.height-30);
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
                 .dataSet(
                          @[@1.51, @6.7, @0.94, @1.44, @1.6, @1.63, @1.56, @1.91, @2.45, @3.87, @3.24, @4.90, @4.61, @4.10,
                            @4.17, @3.85, @4.17, @3.46, @3.46, @3.55, @3.50, @4.13, @2.58, @2.28,@1.51, @12.7, @0.94, @1.44,
                            @18.6, @1.63, @1.56, @1.91, @2.45, @3.87, @3.24, @4.90, @4.61, @4.10, @4.17, @3.85, @4.17, @3.46,
                            @3.46, @3.55, @3.50, @4.13, @2.58, @2.28,@1.33, @4.68, @1.31, @1.10, @13.9, @1.10, @1.16, @1.67,
                            @2.64, @2.86, @3.00, @3.21, @4.14, @4.07, @3.68, @3.11, @3.41, @3.25, @3.32, @3.07, @3.92, @3.05,
                            @2.18, @3.24,@3.23, @3.15, @2.90, @1.81, @2.11, @2.43, @5.59, @3.09, @4.09, @6.14, @5.33, @6.05,
                            @5.71, @6.22, @6.56, @4.75, @5.27, @6.02, @5.48])
                 ]
               );
    
    
    /*Custom Tooltip Style --- 自定义图表浮动提示框样式及内容*/
    AAOptions *aaOptions = [AAOptionsConstructor configureChartOptionsWithAAChartModel:aaChartModel];
    AATooltip *tooltip = aaOptions.tooltip;
    tooltip
    .useHTMLSet(true)
    .formatterSet(@AAJSFunc(function () {
        return ' 🌕 🌖 🌗 🌘🌑 🌒 🌓 🌔 <br/> '
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
    [AAGradientColor configureGradientColorWithDirection:AALinearGradientDirectionToTop
                                        startColorString:@"rgba(256,0,0,0.3)"//颜色字符串设置支持十六进制类型和 rgba 类型
                                          endColorString:@"rgba(256,0,0,1.0)"];
    
    NSDictionary *gradientColorDic2 =
    [AAGradientColor configureGradientColorWithDirection:AALinearGradientDirectionToTop
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
                 ]
               );
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
    .xAxisCrosshairDashStyleTypeSet(AALineDashStyleTypeDashDot)
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
                 ]
               );
    
    
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
    .markerSymbolStyleSet(AAChartSymbolStyleTypeInnerBlank)//折线连接点样式为内部白色
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
                 ]
               );
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
    .seriesSet(
               @[
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
                 ]
               );

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



@end
