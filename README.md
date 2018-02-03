
![AAChartKit-LOGO](https://github.com/AAChartModel/loadHtmlCssJsDemo-master/blob/master/AAChartKit/IMG_2276(20171115-010154).jpg)

# AAChartKit
[![Support](https://img.shields.io/badge/support-iOS%206%2B%20-blue.svg?style=flat)](https://www.apple.com/nl/ios/) <br>
[![](https://img.shields.io/badge/license-MIT-brightgreen.svg)](https://github.com/AAChartModel/AAChartKit/blob/master/LICENSE) <br>
[![](https://img.shields.io/badge/language-OC-green.svg)](https://github.com/AAChartModel/AAChartKit)  <br>
[![](https://img.shields.io/badge/support-Animation-yellow.svg)](https://github.com/AAChartModel/AAChartKit-Swift)  <br>
[![](https://img.shields.io/badge/support-Swift-orange.svg)](https://github.com/AAChartModel/AAChartKit-Swift) <br>
[![](https://jaywcjlove.github.io/sb/lang/chinese.svg)](https://github.com/AAChartModel/AAChartKit/blob/master/CHINESE-README.md) <br>
[![](https://jaywcjlove.github.io/sb/lang/english.svg)](https://github.com/AAChartModel/AAChartKit) <br>
[![](https://img.shields.io/badge/Live-ChartsShow-red.svg)](http://htmlpreview.github.io/?https://github.com/AAChartModel/AAChartKit/blob/master/AAChartKitDemo/ChartsDemo/AAChartKitDocumentLive.html)  <br>

##  [ **中文文档** ](https://github.com/AAChartModel/AAChartKit/blob/master/CHINESE-README.md)  |  [ **English Document** ](https://github.com/AAChartModel/AAChartKit)

### Here's the Swift version of AAChartKit:
#### *https://github.com/AAChartModel/AAChartKit-Swift*

## Preface

 ***AAChartKit*** is the `Objective-C` language version of [AAInfographics](https://github.com/AAChartModel/AAChartKit-Swift) which is an object-oriented set of easy-to-use and extremely elegant chart drawing controls, based on the popular open source front-end chart library *Highcharts*.
 
***
## Features

1. Support `iOS 6`、`ARC` & `Objective C`.
2. Powerful and easy to use. It supports the  `column chart`、`bar chart`、`area chart`、`areaspline chart`、`line chart`、`spline chart`、`radar chart`、`polar chart`、`pie chart`、`bubble chart`、`pyramid chart`、`funnel chart`、`columnrange chart` and `arearange chart` and other graphics.
3. Interactive、animated,the `animation` effect is exquisite, delicate, smooth and beautiful.
4. Support `chain programming syntax` like *Masonry* 
5. `AAChartView + AAChartModel = Chart`  In the AAChartKit,it follows a minimalist formula: ` Chart view + Chart model = The chart you want`.  Just like the another powerful and beautiful charts lib [AAInfographics](https://github.com/AAChartModel/AAChartKit-Swift)
***

## Usage

### Pre-preparation work
1. Drag the folder `AAChartKitLib` into your project.
1. Add the following content into your `.pch` file.
```objective-c
#import "AAGlobalMacro.h"
```

### The offical start of the work 
1. Add the following content into `your view controller` file.
```objective-c
#import "AAChartView.h"
```
2. Creat the instance object of chart view:`AAChartView`
```objective-c
CGFloat chartViewWidth  = self.view.frame.size.width;
CGFloat chartViewHeight = self.view.frame.size.height-250;
_aaChartView = [[AAChartView alloc]init];
_aaChartView.frame = CGRectMake(0, 60, chartViewWidth, chartViewHeight);
//// set the content height of aaChartView
// _aaChartView.contentHeight = chartViewHeight;
[self.view addSubview:_aaChartView];
```
3. Configure the properties of chart model:`AAChartModel`                                          


```objective-c
AAChartModel *aaChartModel= AAObject(AAChartModel)
.chartTypeSet(AAChartTypeColumn)
.titleSet(@"THE HEAT OF PROGRAMMING LANGUAGE")
.subtitleSet(@"Virtual Data")
.categoriesSet(@[@"Java",@"Swift",@"Python",@"Ruby", @"PHP",@"Go",@"C",@"C#",@"C++"])
.yAxisTitleSet(@"Degrees Celsius")
.seriesSet(@[
        AAObject(AASeriesElement)
        .nameSet(@"2017")
        .dataSet(@[@7.0, @6.9, @9.5, @14.5, @18.2, @21.5, @25.2, @26.5, @23.3, @18.3, @13.9, @9.6]),
        AAObject(AASeriesElement)
        .nameSet(@"2018")
        .dataSet(@[@0.2, @0.8, @5.7, @11.3, @17.0, @22.0, @24.8, @24.1, @20.1, @14.1, @8.6, @2.5]),
        AAObject(AASeriesElement)
        .nameSet(@"2019")
        .dataSet(@[@0.9, @0.6, @3.5, @8.4, @13.5, @17.0, @18.6, @17.9, @14.3, @9.0, @3.9, @1.0]),
        AAObject(AASeriesElement)
        .nameSet(@"2020")
        .dataSet(@[@3.9, @4.2, @5.7, @8.5, @11.9, @15.2, @17.0, @16.6, @14.2, @10.3, @6.6, @4.8]),
                 ])
;
```
4. Draw the chart(This method is called only for the first time after you create an AAChartView instance object) 
```objective-c
//The chart view object calls the instance object of AAChartModel and draws the final graphic
[_aaChartView aa_drawChartWithChartModel:aaChartModel];
```

5. Only refresh the chart data(This method is recommended to be called for updating the series data dynamically)
```objective-c
//Refresh the chart dynamically only when the series attribute of the AAChartModel object is updated
[_aaChartView aa_onlyRefreshTheChartDataWithChartModelSeries:aaChartModelSeriesArray];
```

6. Refresh the chart(Subsequent refresh options are recommended to call this method after the first drawing of graphics is completed)
```objective-c
//Refresh the chart after the AAChartModel content is updated
[_aaChartView aa_refreshChartWithChartModel:aaChartModel];
```

## Samples

-  ### line chart

![IMG_1867.JPG](https://github.com/AAChartModel/loadHtmlCssJsDemo-master/blob/master/AAChartKit/LineChart.png)

-  ### column chart

![IMG_1873.JPG](https://github.com/AAChartModel/loadHtmlCssJsDemo-master/blob/master/AAChartKit/ColumnChart.png)

- ###  bar chart

![IMG_1880.JPG](https://github.com/AAChartModel/loadHtmlCssJsDemo-master/blob/master/AAChartKit/BarChart.png)

- ### special area chart one

![IMG_1869.JPG](https://github.com/AAChartModel/loadHtmlCssJsDemo-master/blob/master/IMG_1482.JPG)

- ### special area chart two

![IMG_1871.JPG](https://github.com/AAChartModel/loadHtmlCssJsDemo-master/blob/master/AAChartKit/AreasplineChart.png)

- ### special area chart three

![IMG_1863.JPG](https://github.com/AAChartModel/loadHtmlCssJsDemo-master/blob/master/PictureResources/屏幕快照%202017-05-06%20下午6.58.15.png)

- ### radar chart

![IMG_1877.JPG](https://github.com/AAChartModel/loadHtmlCssJsDemo-master/blob/master/AAChartKit/RadarChart.png)

- ### polar chart

![IMG_1879.JPG](https://github.com/AAChartModel/loadHtmlCssJsDemo-master/blob/master/AAChartKit/PolarChart.png)

- ### pie chart

![IMG_1878.JPG](https://github.com/AAChartModel/loadHtmlCssJsDemo-master/blob/master/AAChartKit/PieChart.png)

- ### bubble chart

![IMG_1875.JPG](https://github.com/AAChartModel/loadHtmlCssJsDemo-master/blob/master/AAChartKit/BubbleChart.png)

- ### scatter chart

![scatter chart](https://github.com/AAChartModel/loadHtmlCssJsDemo-master/blob/master/AAInfographics/ScatterChart.png)

- ### arearange chart

![arearange chart](https://github.com/AAChartModel/loadHtmlCssJsDemo-master/blob/master/AAInfographics/ArearangeChart.png)

- ### step area chart

![step area chart](https://github.com/AAChartModel/loadHtmlCssJsDemo-master/blob/master/AAInfographics/StepAreaChart.png)

- ### mixed chart

![mixed chart](https://github.com/AAChartModel/loadHtmlCssJsDemo-master/blob/master/AAInfographics/MixedChart.png)


## More graphics

>>> * Note: The following `DEMO picture` is a `GIF dynamic picture` which has a size of around *6M*. If you don't see any dynamic preview, then this is because the picture resources were not fully loaded. In such a case please be patient and wait for the contents to finish loading.

![image](https://github.com/AAChartModel/AAChartKit/blob/master/AAChartKitDemo/ChartsDemo/AAChartKitShow.gif)

## Special instructions

### Special charts in ***AAChartKit***

Pie chart and bubble chart are special in AAChartKit,if you want to draw these charts you should do some different things for AAChartModel,for example

- To draw a pie chart,you should configure the properties of `AAChartModel` like this:
```objective-c
   AAChartModel *chartModel= AAObject(AAChartModel)
    .chartTypeSet(AAChartTypePie)
    .titleSet(@"THE HEAT OF PROGRAMMING LANGUAGE")
    .subtitleSet(@"Virtual Data")
    .yAxisTitleSet(@"Degrees Celsius")
    .seriesSet(
               @[AAObject(AASeriesElement)
                 .nameSet(@"Percent")
                 .dataSet(@[
                            @[@"Java"  , @67],
                            @[@"Swift" , @44],
                            @[@"Python", @83],
                            @[@"OC"    , @11],
                            @[@"Ruby"  , @42],
                            @[@"PHP"   , @31],
                            @[@"Go"    , @63],
                            @[@"C"     , @24],
                            @[@"C#"    , @888],
                            @[@"C++"   , @66],
                            ]),
                 ]
               
               )
    ;
```
-  To draw a bubble chart, you should configure the properties of `AAChartModel` like this:


```objective-c
   AAChartModel *chartModel= AAObject(AAChartModel)
    .chartTypeSet(AAChartTypeBubble)
    .titleSet(@"THE HEAT OF PROGRAMMING LANGUAGE")
    .subtitleSet(@"Virtual Data")
    .yAxisTitleSet(@"Degrees Celsius")
    .seriesSet(
               @[
                 AAObject(AASeriesElement)
                 .nameSet(@"2017")
                 .dataSet(
                          @[
                            @[@97, @36, @79],
                            @[@94, @74, @60],
                            @[@68, @76, @58],
                            @[@64, @87, @56],
                            @[@68, @27, @73],
                            @[@74, @99, @42],
                            @[@7,  @93, @87],
                            @[@51, @69, @40],
                            @[@38, @23, @33],
                            @[@57, @86, @31]
                            ]),
                 
                 AAObject(AASeriesElement)
                 .nameSet(@"2018")
                 .dataSet(
                          @[
                            @[@25, @10, @87],
                            @[@2,  @75, @59],
                            @[@11, @54, @8 ],
                            @[@86, @55, @93],
                            @[@5,  @3,  @58],
                            @[@90, @63, @44],
                            @[@91, @33, @17],
                            @[@97, @3,  @56],
                            @[@15, @67, @48],
                            @[@54, @25, @81]
                            ]),
                 
                 AAObject(AASeriesElement)
                 .nameSet(@"2019")
                 .dataSet(
                          @[
                            @[@47, @47, @21],
                            @[@20, @12, @4 ],
                            @[@6,  @76, @91],
                            @[@38, @30, @60],
                            @[@57, @98, @64],
                            @[@61, @17, @80],
                            @[@83, @60, @13],
                            @[@67, @78, @75],
                            @[@64, @12, @10],
                            @[@30, @77, @82]
                            ]),
                 
                 ]
               )
    ;
```
### Supported chart type for now
```objective-c
typedef NSString *AAChartType;
static AAChartType const AAChartTypeColumn      = @"column";      //column chart
static AAChartType const AAChartTypeBar         = @"bar";         //bar chart 
static AAChartType const AAChartTypeArea        = @"area";        //area chart 
static AAChartType const AAChartTypeAreaspline  = @"areaspline";  //areaspline chart
static AAChartType const AAChartTypeLine        = @"line";        //line chart
static AAChartType const AAChartTypeSpline      = @"spline";      //spline chart
static AAChartType const AAChartTypeScatter     = @"scatter";     //scatter chart 
static AAChartType const AAChartTypePie         = @"pie";         //pie chart
static AAChartType const AAChartTypeBubble      = @"bubble";      //bubble chart  
static AAChartType const AAChartTypePyramid     = @"pyramid";     //pyramid chart
static AAChartType const AAChartTypeFunnel      = @"funnel";      //funnel chart
static AAChartType const AAChartTypeColumnrange = @"columnrange"; //columnrange chart
static AAChartType const AAChartTypeArearange   = @"arearange";   //arearange chart
```
### Supported animation type for now
```objective-c
typedef NS_ENUM(NSInteger,AAChartAnimation) {
    AAChartAnimationLinear = 0,
    AAChartAnimationEaseInQuad,
    AAChartAnimationEaseOutQuad,
    AAChartAnimationEaseInOutQuad,
    AAChartAnimationEaseInCubic,
    AAChartAnimationEaseOutCubic,
    AAChartAnimationEaseInOutCubic,
    AAChartAnimationEaseInQuart,
    AAChartAnimationEaseOutQuart,
    AAChartAnimationEaseInOutQuart,
    AAChartAnimationEaseInQuint,
    AAChartAnimationEaseOutQuint,
    AAChartAnimationEaseInOutQuint,
    AAChartAnimationEaseInSine,
    AAChartAnimationEaseOutSine,
    AAChartAnimationEaseInOutSine,
    AAChartAnimationEaseInExpo,
    AAChartAnimationEaseOutExpo,
    AAChartAnimationEaseInOutExpo,
    AAChartAnimationEaseInCirc,
    AAChartAnimationEaseOutCirc,
    AAChartAnimationEaseInOutCirc,
    AAChartAnimationEaseOutBounce,
    AAChartAnimationEaseInBack,
    AAChartAnimationEaseOutBack,
    AAChartAnimationEaseInOutBack,
    AAChartAnimationElastic,
    AAChartAnimationSwingFromTo,
    AAChartAnimationSwingFrom,
    AAChartAnimationSwingTo,
    AAChartAnimationBounce,
    AAChartAnimationBouncePast,
    AAChartAnimationEaseFromTo,
    AAChartAnimationEaseFrom,
    AAChartAnimationEaseTo,
};

```

## AAChartModel:chart attribute list
```objective-c
AAPropStatementAndFuncStatement(copy,   AAChartModel, NSString *, title);//标题内容
AAPropStatementAndFuncStatement(copy,   AAChartModel, NSNumber *, titleFontSize);//Title font size
AAPropStatementAndFuncStatement(copy,   AAChartModel, NSString *, titleFontColor);//Title label font color
AAPropStatementAndFuncStatement(copy,   AAChartModel, NSString *, titleFontWeight);//Title label font weight

AAPropStatementAndFuncStatement(copy,   AAChartModel, NSString *, subtitle);//副标题内容
AAPropStatementAndFuncStatement(copy,   AAChartModel, NSNumber *, subtitleFontSize);//Subtitle font size
AAPropStatementAndFuncStatement(copy,   AAChartModel, NSString *, subtitleFontColor);//Subtitle label font color
AAPropStatementAndFuncStatement(copy,   AAChartModel, NSString *, subtitleFontWeight);//Subtitle label font weight

AAPropStatementAndFuncStatement(strong, AAChartModel, NSArray  *, series);//图表的数据列内容
AAPropStatementAndFuncStatement(strong, AAChartModel, NSArray *,  keys);//Keys support

AAPropStatementAndFuncStatement(copy,   AAChartModel, AAChartSubtitleAlignType, subtitleAlign);//图表副标题文本水平对齐方式。可选的值有 “left”，”center“和“right”。 默认是：center.
AAPropStatementAndFuncStatement(copy,   AAChartModel, AAChartType,              chartType);//图表类型
AAPropStatementAndFuncStatement(copy,   AAChartModel, AAChartStackingType,      stacking);//堆积样式
AAPropStatementAndFuncStatement(copy,   AAChartModel, AAChartSymbolType,        symbol);//折线曲线连接点的类型："circle", "square", "diamond", "triangle","triangle-down"，默认是"circle"
AAPropStatementAndFuncStatement(assign, AAChartModel, AAChartSymbolStyleType,   symbolStyle);
AAPropStatementAndFuncStatement(copy,   AAChartModel, AAChartZoomType,          zoomType);//缩放类型 AAChartZoomTypeX 表示可沿着 x 轴进行手势缩放
AAPropStatementAndFuncStatement(assign, AAChartModel, AAChartAnimation,         animationType);//设置图表的渲染动画类型

AAPropStatementAndFuncStatement(strong, AAChartModel, NSNumber *, animationDuration);//设置图表的渲染动画时长
AAPropStatementAndFuncStatement(assign, AAChartModel, BOOL,       inverted);//x 轴是否垂直
AAPropStatementAndFuncStatement(assign, AAChartModel, BOOL,       xAxisReversed);// x 轴翻转
AAPropStatementAndFuncStatement(assign, AAChartModel, BOOL,       yAxisReversed);//y 轴翻转
AAPropStatementAndFuncStatement(assign, AAChartModel, BOOL,       gradientColorEnabled);//是否要为渐变色
AAPropStatementAndFuncStatement(assign, AAChartModel, BOOL,       polar);//是否极化图形(变为雷达图)
AAPropStatementAndFuncStatement(assign, AAChartModel, BOOL,       dataLabelEnabled);//是否显示数据
AAPropStatementAndFuncStatement(copy,   AAChartModel, NSString *, dataLabelFontColor);//Datalabel font color
AAPropStatementAndFuncStatement(strong, AAChartModel, NSNumber *, dataLabelFontSize);//Datalabel font size
AAPropStatementAndFuncStatement(copy,   AAChartModel, NSString *, dataLabelFontWeight);//Datalabel font weight
AAPropStatementAndFuncStatement(assign, AAChartModel, BOOL,       xAxisLabelsEnabled);//x 轴是否显示数据
AAPropStatementAndFuncStatement(copy,   AAChartModel, NSNumber *, xAxisLabelsFontSize);//xAxis font size
AAPropStatementAndFuncStatement(copy,   AAChartModel, NSString *, xAxisLabelsFontColor);//X-axis label font color
AAPropStatementAndFuncStatement(copy,   AAChartModel, NSString *, xAxisLabelsFontWeight);//X-axis label font weight
AAPropStatementAndFuncStatement(strong, AAChartModel, NSArray  *, categories);//x轴坐标每个点对应的名称
AAPropStatementAndFuncStatement(strong, AAChartModel, NSNumber *, xAxisGridLineWidth);//x 轴网格线的宽度
AAPropStatementAndFuncStatement(strong, AAChartModel, NSNumber *, xAxisTickInterval);//x轴刻度点间隔数(设置每隔几个点显示一个 X轴的内容)

AAPropStatementAndFuncStatement(assign, AAChartModel, BOOL,       xAxisVisible);//x 轴是否可见(默认可见)
AAPropStatementAndFuncStatement(assign, AAChartModel, BOOL,       yAxisVisible);//y 轴是否可见(默认可见)
AAPropStatementAndFuncStatement(assign, AAChartModel, BOOL,       yAxisLabelsEnabled);//y 轴是否显示数据
AAPropStatementAndFuncStatement(copy,   AAChartModel, NSString *, yAxisTitle);//y 轴标题
AAPropStatementAndFuncStatement(copy,   AAChartModel, NSNumber *, yAxisLabelsFontSize);//y y-axis labels font size
AAPropStatementAndFuncStatement(copy,   AAChartModel, NSString *, yAxisLabelsFontColor);//y-axis label font color
AAPropStatementAndFuncStatement(copy,   AAChartModel, NSString *, yAxisLabelsFontWeight);//y-axis label font weight
AAPropStatementAndFuncStatement(strong, AAChartModel, NSNumber *, yAxisGridLineWidth);//y轴网格线的宽度
AAPropStatementAndFuncStatement(strong, AAChartModel, NSArray     <NSString *>*, colorsTheme);//图表主题颜色数组
AAPropStatementAndFuncStatement(copy,   AAChartModel, NSString *, backgroundColor);//图表背景色(必须为十六进制的颜色色值如红色"#FF0000")

AAPropStatementAndFuncStatement(assign, AAChartModel, BOOL,       tooltipEnabled);//是否显示浮动提示框(默认显示)
AAPropStatementAndFuncStatement(copy,   AAChartModel, NSString *, tooltipValueSuffix);//浮动提示框单位后缀
AAPropStatementAndFuncStatement(copy  , AAChartModel, NSString *, tooltipValueString);//The tooltip string
AAPropStatementAndFuncStatement(assign, AAChartModel, BOOL,       tooltipCrosshairs);//是否显示准星线(默认显示)
AAPropStatementAndFuncStatement(assign, AAChartModel, BOOL,       connectNulls);//设置折线是否断点重连(是否连接空值点)
AAPropStatementAndFuncStatement(assign, AAChartModel, BOOL,       legendEnabled);//是否显示图例 lengend(图表底部可点按的圆点和文字)

AAPropStatementAndFuncStatement(assign, AAChartModel, BOOL,       options3dEnabled);//是否 3D 化图形(仅对条形图,柱状图有效)
AAPropStatementAndFuncStatement(strong, AAChartModel, NSNumber *, options3dAlpha);
AAPropStatementAndFuncStatement(strong, AAChartModel, NSNumber *, options3dBeta);
AAPropStatementAndFuncStatement(strong, AAChartModel, NSNumber *, options3dDepth);//3D 图形深度

AAPropStatementAndFuncStatement(strong, AAChartModel, NSNumber *, borderRadius);//柱状图长条图头部圆角半径(可用于设置头部的形状,仅对条形图,柱状图有效)
AAPropStatementAndFuncStatement(strong, AAChartModel, NSNumber *, markerRadius);//折线连接点的半径长度

AAPropStatementAndFuncStatement(assign, AAChartModel, BOOL,       yAxisAllowDecimals);//是否允许 y 轴显示小数
AAPropStatementAndFuncStatement(strong, AAChartModel, NSArray  *, yAxisPlotLines);//y 轴基线的配置
AAPropStatementAndFuncStatement(strong, AAChartModel, NSNumber *, yAxisMax);//y 轴最大值
AAPropStatementAndFuncStatement(strong, AAChartModel, NSNumber *, yAxisMin);//y 轴最小值（设置为0就不会有负数）
AAPropStatementAndFuncStatement(strong, AAChartModel, NSArray  *, yAxisTickPositions);//自定义 y 轴坐标（如：[@(0), @(25), @(50), @(75) , (100)]）
AAPropStatementAndFuncStatement(copy,   AAChartModel, NSString *, zoomResetButtonText); //String to display in 'zoom reset button"

```


## Created By:

![](https://avatars1.githubusercontent.com/u/16357599?s=40&v=4)An An

```java
                         _0_
                       _oo0oo_
                      o8888888o
                      88" . "88
                      (| -_- |)
                      0\  =  /0
                    ___/`---'\___
                  .' \\|     |// '.
                 / \\|||  :  |||// \
                / _||||| -:- |||||- \
               |   | \\\  -  /// |   |
               | \_|  ''\---/''  |_/ |
               \  .-\__  '-'  ___/-. /
             ___'. .'  /--.--\  `. .'___
          ."" '<  `.___\_<|>_/___.' >' "".
         | | :  `- \`.;`\ _ /`;.`/ - ` : | |
         \  \ `_.   \_ __\ /__ _/   .-` /  /
     =====`-.____`.___ \_____/___.-`___.-'=====
                       `=---='
*****************************************************
     ¥¥¥¥¥¥¥¥¥¥¥¥¥¥¥¥¥¥¥¥¥¥¥¥¥¥¥¥¥¥¥¥¥¥¥¥¥¥¥¥¥¥¥
         €€€€€€€€€€€€€€€€€€€€€€€€€€€€€€€€€€
               $$$$$$$$$$$$$$$$$$$$$$$  
                   BUDDHA_BLESS_YOU       
                      AWAY_FROM
                         BUG

```
## Source Code⛓

Language Version | Project Name | Source Code Link |
------------ | ------------- | ------------- |
Objective C | AAChartKit | https://github.com/AAChartModel/AAChartKit |
Swift | AAInfographics | https://github.com/AAChartModel/AAChartKit-Swift |


## LICENSE

![](https://upload.wikimedia.org/wikipedia/commons/thumb/f/f8/License_icon-mit-88x31-2.svg/128px-License_icon-mit-88x31-2.svg.png)
AAChartKit is available under the MIT license. See the [LICENSE](https://github.com/AAChartModel/AAChartKit/blob/master/LICENSE) file for more information.

## Contact

-------------------------------------------------------------------------------
* 💕💕💕❤️❤️   WARM TIPS!!!   ❤️❤️💕💕💕
*
* Please contact me on GitHub,if there are any problems encountered in use.
* GitHub Issues : https://github.com/AAChartModel/AAChartKit/issues
-------------------------------------------------------------------------------
* And if you want to contribute for this project, please contact me as well
* GitHub        : https://github.com/AAChartModel
* StackOverflow : https://stackoverflow.com/users/7842508/codeforu
* JianShu       : http://www.jianshu.com/u/f1e6753d4254
* SegmentFault  : https://segmentfault.com/u/huanghunbieguan
-------------------------------------------------------------------------------

## Postscript

If you want to shrink the size of the `AAChartKit` lib ,you should do something like this:
1. Delete the `.js` file of `AAJSFiles` folder in `AAChartKit`,The names of multiple files that need to be deleted are as follows

* AAHighchartsLibrary.js
* AAHighchartsMore.js
* AAHighcharts-3d.js
* AAFunnel.js

2.Change the content of `AAChartView.html` file 
``` html
<script src="AAHighchartsLibrary.js">
</script>
<script src="AAHighchartsMore.js">
</script>
<script src="AAHighcharts-3d.js">
</script>
<script src="AAFunnel.js">
</script>
```
to be 

``` html
<script src="https://img.hcharts.cn/highcharts/highcharts.js">
</script>
<script src="https://img.hcharts.cn/highcharts/highcharts-more.js">
</script>
```
## To-Do list

>>>>>>  * - [x] Support user to add delegate events after the graphics content loading was completed
>>>>>>  * - [x] Support graphics to refresh global content dynamically
>>>>>>  * - [x] Support graphics to refresh pure data (`series`) content dynamically
>>>>>>  * - [x] Support graphics to refresh pure data in real time and scroll dynamically
>>>>>>  * - [x] Support color layer gradient effects
>>>>>>  * - [x] Support 3D graphics effects, valid only for partial graphics such as `column chart、bar chart、pie charts、scatterplot chart、bubble chart`, etc.
>>>>  * - [ ] Support `CocoaPods`
>>>>  * - [ ] Support `Carthage`
>>>>  * - [ ] Support  code coverage test
>>>>  * - [ ] Support horizontal screen (full screen) effect
>>>>  * - [ ] Support setting graphics rendering animation freely
>>>>  * - [ ] Support rendered graphics to generate image files
>>>>  * - [ ] Support generating image files saved to the system album
>>>>  * - [ ] Support user to configure `AAOptions` model object properties freely
>>>>>>  * - [x] Support stacking the graphics 
>>>>>>  * - [x] Support reversing the graphics axis 
>>>>>>  * - [x] Support rendering scatter chart
>>>>>>  * - [x] Support rendering column range map
>>>>>>  * - [x] Support rendering area range graph
>>>>>>  * - [x] Support rendering the polar chart
>>>>>>  * - [x] Support rendering the step line chart
>>>>>>  * - [x] Support rendering the step area chart
>>>>>>  * - [x] Support rendering the Nightingale rose 🌹chart
>>>>  * - [ ] Support rendering the rectangular tree hierarchy diagrams
>>>>  * - [ ] Support rendering the circular progress bar chart 
>>>>  * - [ ] Support adding clicked event callbacks for graphics
