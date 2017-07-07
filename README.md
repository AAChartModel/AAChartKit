# AAChartKit 2.0
#### An elegant and friendly chart library for iOS developer
[![Support](https://img.shields.io/badge/support-iOS%206%2B%20-blue.svg?style=flat)](https://www.apple.com/nl/ios/) 
[![](https://img.shields.io/badge/License-MIT-brightgreen.svg)](https://github.com/AAChartModel/AAChartKit/blob/master/AAChartKit/ChartsDemo/LICENSE) 
[![](https://img.shields.io/badge/language-OC-green.svg)](https://github.com/AAChartModel/AAChartKit) 
[![](https://img.shields.io/badge/support-Animation-yellow.svg)](https://github.com/AAChartModel/AAChartKit-Swift) 
[![](https://img.shields.io/badge/support-Swift-orange.svg)](https://github.com/AAChartModel/AAChartKit-Swift) 
[![](https://img.shields.io/badge/Live-ChartsShow-red.svg)](http://htmlpreview.github.io/?https://github.com/AAChartModel/AAChartKit/blob/master/AAChartKit/ChartsDemo/AAChartKitDocumentLive.html) 
### There is the link of Swift version of AAChartKit as follow
https://github.com/AAChartModel/AAChartKit-Swift

### 中文使用说明书地址

https://github.com/AAChartModel/AAChartKit/blob/master/CHINESE-README.md

***
## Features:
1. Support `iOS 6`、`ARC` & `Objective C`.
2. Powerful,support the  `column chart` `bar chart` `line chart` `spline chart` `pie chart` `polar chart` `radar chart` and other graphics.
3. Interactive、animated,the `animation` is exquisite and deligate.
4. Support `chain programming syntax` like *Masonry* 
5. `AAChartView + AAChartModel = Chart`  In the AAChartKit,it follows a minimalist formula: ` Chart view + Chart model = The chart you want`.  
***
 

## Method of use:

### The need of preparation
1. Drag the folder `AAChartKitLib` into your project.
1. Add the following content into your `.pch` file.
```objective-c
#import "AAGlobalMacro.h"
```

### The offical start of the work 
1.Add the following content into `your view controller` file.
```objective-c
#import "AAChartView.h"
```
2.Creat the object of chart view:`AAChartView`
```objective-c
AAChartView *chartView = [[AAChartView alloc]init];
self.view.backgroundColor = [UIColor whiteColor];
chartView.frame = CGRectMake(0, 60, self.view.frame.size.width, self.view.frame.size.height-220);
chartView.contentHeight =self.view.frame.size.height-220; 
[self.view addSubview:chartView];
```
3.Configure the properties of chart model:`AAChartModel`                                          


```objective-c
    AAChartModel *chartModel= AAObject(AAChartModel)
    .chartTypeSet(AAChartTypeColumn)
    .titleSet(@"THE HEAT OF PROGRAMMING LANGUAGE")
    .subtitleSet(@"Virtual Data")
    .categoriesSet(@[@"Java",@"Swift",@"Python",@"Ruby", @"PHP",@"Go",@"C",@"C#",@"C++"])
    .yAxisTitleSet(@"Degrees Celsius")
    .seriesSet(@[
                 AAObject(AASeriesElement)
                 .nameSet(@"2017")
                 .dataSet(@[@45,@56,@34,@43,@65,@56,@47,@28,@49]),
                 
                 AAObject(AASeriesElement)
                 .nameSet(@"2018")
                 .dataSet(@[@11,@12,@13,@14,@15,@16,@17,@18,@19]),
                 
                 AAObject(AASeriesElement)
                 .nameSet(@"2019")
                 .dataSet(@[@31,@22,@33,@54,@35,@36,@27,@38,@39]),
                 
                 AAObject(AASeriesElement)
                 .nameSet(@"2020")
                 .dataSet(@[@21,@22,@53,@24,@65,@26,@37,@28,@49]),
                 ])
    ;
```
4.Draw the chart 


```objective-c
[chartView aa_drawChartWithChartModel:chartModel]; 
```

5.Refresh the chart 
```objective-c
[chartView aa_refreshChartWithChartModel:chartModel];
```
6.Special instructions

Pie chart and bubble chart are special in AAChartKit,if you want to draw these charts,you should do some different things for AAChartModel,for example

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
-  To draw a bubble chart,you should configure the properties of `AAChartModel` like this:


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
                            @[@2, @75, @59],
                            @[@11, @54, @8],
                            @[@86, @55, @93],
                            @[@5, @3, @58],
                            @[@90, @63, @44],
                            @[@91, @33, @17],
                            @[@97, @3, @56],
                            @[@15, @67, @48],
                            @[@54, @25, @81]
                            ]),
                 
                 AAObject(AASeriesElement)
                 .nameSet(@"2019")
                 .dataSet(
                          @[
                            @[@47, @47, @21],
                            @[@20, @12, @4],
                            @[@6, @76, @91],
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
7. Supported chart type for now 
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
```
8. Supported animation type for now
```objective-c
typedef NS_ENUM(NSInteger,AAChartAnimationType){
    AAChartAnimationTypeLinear =0,
    AAChartAnimationTypeSwing,
    AAChartAnimationTypeEaseInQuad,
    AAChartAnimationTypeEaseOutQuad,
    AAChartAnimationTypeEaseInOutQuad,
    AAChartAnimationTypeEaseInCubic,
    AAChartAnimationTypeEaseOutCubic,
    AAChartAnimationTypeEaseInOutCubic,
    AAChartAnimationTypeEaseInQuart,
    AAChartAnimationTypeEaseOutQuart,
    AAChartAnimationTypeEaseInOutQuart,
    AAChartAnimationTypeEaseInQuint,
    AAChartAnimationTypeEaseOutQuint,
    AAChartAnimationTypeEaseInOutQuint,
    AAChartAnimationTypeEaseInExpo,
    AAChartAnimationTypeEaseOutExpo,
    AAChartAnimationTypeEaseInOutExpo,
    AAChartAnimationTypeEaseInSine,
    AAChartAnimationTypeEaseOutSine,
    AAChartAnimationTypeEaseInOutSine,
    AAChartAnimationTypeEaseInCirc,
    AAChartAnimationTypeEaseOutCirc,
    AAChartAnimationTypeEaseInOutCirc,
    AAChartAnimationTypeEaseInElastic,
    AAChartAnimationTypeEaseOutElastic,
    AAChartAnimationTypeEaseInOutElastic,
    AAChartAnimationTypeEaseInBack,
    AAChartAnimationTypeEaseOutBack,
    AAChartAnimationTypeEaseInOutBack,
    AAChartAnimationTypeEaseInBounce,
    AAChartAnimationTypeEaseOutBounce,
    AAChartAnimationTypeEaseInOutBounce,
};

```
## Samples
- line chart

![IMG_1867.JPG](https://github.com/AAChartModel/AAChartKit/blob/master/AAChartKit/ChartsDemo/IMG_1867.JPG)
- column chart

![IMG_1873.JPG](https://github.com/AAChartModel/loadHtmlCssJsDemo-master/blob/master/IMG_1483.JPG)

-   bar chart

![IMG_1880.JPG](https://github.com/AAChartModel/AAChartKit/blob/master/AAChartKit/ChartsDemo/IMG_1880.JPG
)

-  special area chart one 

![IMG_1869.JPG](https://github.com/AAChartModel/loadHtmlCssJsDemo-master/blob/master/IMG_1482.JPG)
-  special area chart two
![IMG_1871.JPG](https://github.com/AAChartModel/AAChartKit/blob/master/AAChartKit/ChartsDemo/IMG_1874.JPG)


-  special area chart three

![IMG_1863.JPG](https://github.com/AAChartModel/AAChartKit/blob/master/AAChartKit/ChartsDemo/IMG_1863.JPG)

-   radar chart

![IMG_1877.JPG](https://github.com/AAChartModel/AAChartKit/blob/master/AAChartKit/ChartsDemo/IMG_1877.JPG
)

-   polar chart

![IMG_1879.JPG](https://github.com/AAChartModel/AAChartKit/blob/master/AAChartKit/ChartsDemo/IMG_1879.JPG
)
-   pie chart

![IMG_1878.JPG](https://github.com/AAChartModel/AAChartKit/blob/master/AAChartKit/ChartsDemo/IMG_1878.JPG
)

- the oval style column chart

![IMG_1866.JPG](https://github.com/AAChartModel/AAChartKit/blob/master/AAChartKit/ChartsDemo/IMG_1866.JPG)
- bubble chart

![IMG_1875.JPG](https://github.com/AAChartModel/AAChartKit/blob/master/AAChartKit/ChartsDemo/IMG_1875.JPG
)

- mixed chart
![IMG_1882.JPG](https://github.com/AAChartModel/AAChartKit/blob/master/AAChartKit/ChartsDemo/IMG_1882.JPG)
### AAChartModel:chart attribute list
```objective-c
AAPropStatementAndFuncStatement(copy, AAChartModel, NSString *, title);
AAPropStatementAndFuncStatement(copy, AAChartModel, NSString *, subtitle);

AAPropStatementAndFuncStatement(copy, AAChartModel, NSString *, chartType);
AAPropStatementAndFuncStatement(copy, AAChartModel, NSString *, stacking);
AAPropStatementAndFuncStatement(copy, AAChartModel, NSString *, symbol); 
AAPropStatementAndFuncStatement(copy, AAChartModel, NSString *, zoomType);

AAPropStatementAndFuncStatement(assign, AAChartModel, BOOL, inverted);
AAPropStatementAndFuncStatement(assign, AAChartModel, BOOL, xAxisReversed);
AAPropStatementAndFuncStatement(assign, AAChartModel, BOOL, yAxisReversed);
AAPropStatementAndFuncStatement(assign, AAChartModel, BOOL, crosshairs);
AAPropStatementAndFuncStatement(assign, AAChartModel, BOOL, gradientColorEnable);
AAPropStatementAndFuncStatement(assign, AAChartModel, BOOL, polar);
AAPropStatementAndFuncStatement(assign, AAChartModel, BOOL, dataLabelEnabled);
AAPropStatementAndFuncStatement(assign, AAChartModel, BOOL, xAxisLabelsEnabled);
AAPropStatementAndFuncStatement(strong, AAChartModel, NSArray *, categories);
AAPropStatementAndFuncStatement(strong, AAChartModel, NSNumber *, xAxisGridLineWidth);
AAPropStatementAndFuncStatement(assign, AAChartModel, BOOL, yAxisLabelsEnabled);
AAPropStatementAndFuncStatement(copy,   AAChartModel, NSString *, yAxisTitle);
AAPropStatementAndFuncStatement(strong, AAChartModel, NSNumber *, yAxisGridLineWidth);

AAPropStatementAndFuncStatement(strong, AAChartModel, NSArray *, colorsTheme);
AAPropStatementAndFuncStatement(strong, AAChartModel, NSArray *, series);

AAPropStatementAndFuncStatement(assign, AAChartModel, BOOL, legendEnabled);
AAPropStatementAndFuncStatement(copy,   AAChartModel , NSString *, legendLayout);
AAPropStatementAndFuncStatement(copy,   AAChartModel , NSString *, legendAlign);
AAPropStatementAndFuncStatement(copy,   AAChartModel , NSString *, legendVerticalAlign);

AAPropStatementAndFuncStatement(copy,   AAChartModel, NSString *, backgroundColor);
AAPropStatementAndFuncStatement(assign, AAChartModel, BOOL, options3dEnable);
AAPropStatementAndFuncStatement(strong, AAChartModel, NSNumber *, options3dAlpha);
AAPropStatementAndFuncStatement(strong, AAChartModel, NSNumber *, options3dBeta);
AAPropStatementAndFuncStatement(strong, AAChartModel, NSNumber *, options3dDepth);

AAPropStatementAndFuncStatement(strong, AAChartModel, NSNumber *, borderRadius);
AAPropStatementAndFuncStatement(strong, AAChartModel, NSNumber *, markerRadius);

```









### More graphics

![image](https://github.com/AAChartModel/AAChartKit/blob/master/AAChartKit/ChartsDemo/AAChartKitShow.gif)


### Created By:

An An

```java

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
*******************************************************
     ¥¥¥¥¥¥¥¥¥¥¥¥¥¥¥¥¥¥¥¥¥¥¥¥¥¥¥¥¥¥¥¥¥¥¥¥¥¥¥¥¥¥¥
         €€€€€€€€€€€€€€€€€€€€€€€€€€€€€€€€€€
               $$$$$$$$$$$$$$$$$$$$$$$  
                   BUDDHA_BLESS_YOU       
                      AWAY_FROM
                         BUG

```

### LICENSE

AAChartKit is Copyright (c) 2017 An An and released as open source under the attached [MIT LICENSE](https://github.com/AAChartModel/AAChartKit/blob/master/AAChartKit/ChartsDemo/LICENSE).

### Postscript
If you want to shrink the size of the `AAChartKit` lib ,you should do something like this:
1. Delete the `.js` file of `AAJSFiles` folder in `AAChartKit`,The names of multiple files that need to be deleted are as follows

* AAJQueryLibrary.js 
* AAHighchartsLibrary.js
* AAHighchartsMore.js
* AAHighcharts-3d.js
* AAFunnel.js

2.Change the content of `AAChartView.html` file 
``` html
<script src="AAJQueryLibrary.js">
</script>
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
<script src="https://img.hcharts.cn/jquery/jquery-1.8.3.min.js">
</script>
<script src="https://img.hcharts.cn/highcharts/highcharts.js">
</script>
<script src="https://img.hcharts.cn/highcharts/highcharts-more.js">
</script>
```

