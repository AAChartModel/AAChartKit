
![AAChartKit-LOGO](https://github.com/AAChartModel/loadHtmlCssJsDemo-master/blob/master/AAChartKit/IMG_2276(20171115-010154).jpg)

# AAChartKit 2.0
[![Support](https://img.shields.io/badge/support-iOS%206%2B%20-blue.svg?style=flat)](https://www.apple.com/nl/ios/) <br>
[![](https://img.shields.io/badge/license-MIT-brightgreen.svg)](https://github.com/AAChartModel/AAChartKit/blob/master/LICENSE) <br>
[![](https://img.shields.io/badge/language-OC-green.svg)](https://github.com/AAChartModel/AAChartKit)  <br>
[![](https://img.shields.io/badge/support-Animation-yellow.svg)](https://github.com/AAChartModel/AAChartKit-Swift)  <br>
[![](https://img.shields.io/badge/support-Swift-orange.svg)](https://github.com/AAChartModel/AAChartKit-Swift) <br>
[![](https://jaywcjlove.github.io/sb/lang/chinese.svg)](https://github.com/AAChartModel/AAChartKit/blob/master/CHINESE-README.md) <br>
[![](https://jaywcjlove.github.io/sb/lang/english.svg)](https://github.com/AAChartModel/AAChartKit) <br>
[![](https://img.shields.io/badge/Live-ChartsShow-red.svg)](http://htmlpreview.github.io/?https://github.com/AAChartModel/AAChartKit/blob/master/AAChartKitDemo/ChartsDemo/AAChartKitDocumentLive.html)  <br>
### There is the link of Swift version of AAChartKit as follow
#### *https://github.com/AAChartModel/AAChartKit-Swift*

### 中文使用说明书地址

#### *https://github.com/AAChartModel/AAChartKit/blob/master/CHINESE-README.md*

## Preface

 ***AAChartKit*** is object-oriented, a set of easy-to-use, extremely elegant graphics drawing controls,based on the popular open source front-end chart library *Highcharts*.
 
***
## Features

1. Support `iOS 6`、`ARC` & `Objective C`.
2.  Powerful,support the  `column chart`、`bar chart`、`area chart`、`areaspline chart`、`line chart`、`spline chart`、`radar chart`、`polar chart`、`pie chart`、`bubble chart`、`pyramid chart`、`funnel chart`、`columnrange chart`and other graphics.
3. Interactive、animated,the `animation` effect is exquisite 、delicate、 smooth and beautiful.
4. Support `chain programming syntax` like *Masonry* 
5. `AAChartView + AAChartModel = Chart`  In the AAChartKit,it follows a minimalist formula: ` Chart view + Chart model = The chart you want`.  
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
self.aaChartView = [[AAChartView alloc]initWithFrame:CGRectMake(0, 60, chartViewWidth, chartViewHeight)];
self.aaChartView.contentHeight = self.view.frame.size.height-250;
[self.view addSubview:self.aaChartView];
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
4. Draw the chart(This method is called only for the first time after you create an AAChartView instance object) 
```objective-c
//The chart view object calls the instance object of AAChartModel and draws the final graphic
[_aaChartView aa_drawChartWithChartModel:chartModel];
```

5. Only refresh the chart data(This method is recommended to be called for updating the series data dynamically)
```objective-c
//Refresh the chart dynamically only when the series attribute of the AAChartModel object is updated
[_aaChartView aa_onlyRefreshTheChartDataWithChartModelSeries:aaChartModelSeriesArray];
```

6. Refresh the chart(Subsequent refresh options are recommended to call this method after the first drawing of graphics is completed)
```objective-c
//Refresh the chart after the AAChartModel content is updated
[_aaChartView aa_refreshChartWithChartModel:chartModel];
```

## Samples

-  ### line chart

![IMG_1867.JPG](https://github.com/AAChartModel/AAChartKit/blob/master/AAChartKitDemo/ChartsDemo/IMG_1867.JPG)

-  ### column chart

![IMG_1873.JPG](https://github.com/AAChartModel/loadHtmlCssJsDemo-master/blob/master/IMG_1483.JPG)

- ###  bar chart

![IMG_1880.JPG](https://github.com/AAChartModel/AAChartKit/blob/master/AAChartKitDemo/ChartsDemo/IMG_1880.JPG)

- ### special area chart one

![IMG_1869.JPG](https://github.com/AAChartModel/loadHtmlCssJsDemo-master/blob/master/IMG_1482.JPG)

- ### special area chart two

![IMG_1871.JPG](https://github.com/AAChartModel/AAChartKit/blob/master/AAChartKitDemo/ChartsDemo/IMG_1874.JPG)

- ### special area chart three

![IMG_1863.JPG](https://github.com/AAChartModel/loadHtmlCssJsDemo-master/blob/master/PictureResources/屏幕快照%202017-05-06%20下午6.58.15.png)

- ### radar chart

![IMG_1877.JPG](https://github.com/AAChartModel/AAChartKit/blob/master/AAChartKitDemo/ChartsDemo/IMG_1877.JPG)

- ### polar chart

![IMG_1879.JPG](https://github.com/AAChartModel/AAChartKit/blob/master/AAChartKitDemo/ChartsDemo/IMG_1879.JPG)

- ### pie chart

![IMG_1878.JPG](https://github.com/AAChartModel/AAChartKit/blob/master/AAChartKitDemo/ChartsDemo/IMG_1878.JPG)

- ### the oval style column chart

![IMG_1866.JPG](https://github.com/AAChartModel/AAChartKit/blob/master/AAChartKitDemo/ChartsDemo/IMG_1866.JPG)

- ### bubble chart

![IMG_1875.JPG](https://github.com/AAChartModel/AAChartKit/blob/master/AAChartKitDemo/ChartsDemo/IMG_1875.JPG)

- ### mixed chart

![IMG_1882.JPG](https://github.com/AAChartModel/loadHtmlCssJsDemo-master/blob/master/NfAVBj7.png)


## Special instructions

### Special charts in ***AAChartKit***

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
AAPropStatementAndFuncStatement(copy,   AAChartModel, NSString *, title);
AAPropStatementAndFuncStatement(copy,   AAChartModel, NSString *, subtitle);

AAPropStatementAndFuncStatement(copy,   AAChartModel, AAChartSubtitleAlignType, subtitleAlign);
AAPropStatementAndFuncStatement(copy,   AAChartModel, AAChartType,              chartType);
AAPropStatementAndFuncStatement(copy,   AAChartModel, AAChartStackingType,      stacking);
AAPropStatementAndFuncStatement(copy,   AAChartModel, AAChartSymbolType,        symbol);
AAPropStatementAndFuncStatement(assign, AAChartModel, AAChartSymbolStyleType,   symbolStyle);

AAPropStatementAndFuncStatement(copy,   AAChartModel, AAChartZoomType,          zoomType);
AAPropStatementAndFuncStatement(assign, AAChartModel, AAChartAnimation,         animationType);

AAPropStatementAndFuncStatement(strong, AAChartModel, NSNumber *, animationDuration);
AAPropStatementAndFuncStatement(assign, AAChartModel, BOOL,       inverted);
AAPropStatementAndFuncStatement(assign, AAChartModel, BOOL,       xAxisReversed);
AAPropStatementAndFuncStatement(assign, AAChartModel, BOOL,       yAxisReversed);
AAPropStatementAndFuncStatement(assign, AAChartModel, BOOL,       crosshairs);
AAPropStatementAndFuncStatement(assign, AAChartModel, BOOL,       gradientColorEnable);
AAPropStatementAndFuncStatement(assign, AAChartModel, BOOL,       polar);
AAPropStatementAndFuncStatement(assign, AAChartModel, BOOL,       dataLabelEnabled);
AAPropStatementAndFuncStatement(assign, AAChartModel, BOOL,       xAxisLabelsEnabled);
AAPropStatementAndFuncStatement(strong, AAChartModel, NSArray  *, categories);
AAPropStatementAndFuncStatement(strong, AAChartModel, NSNumber *, xAxisGridLineWidth);
AAPropStatementAndFuncStatement(assign, AAChartModel, BOOL,       yAxisLabelsEnabled);
AAPropStatementAndFuncStatement(copy,   AAChartModel, NSString *, yAxisTitle);
AAPropStatementAndFuncStatement(strong, AAChartModel, NSNumber *, yAxisGridLineWidth);

AAPropStatementAndFuncStatement(strong, AAChartModel, NSArray     <NSString *>*, colorsTheme);
AAPropStatementAndFuncStatement(strong, AAChartModel, NSArray  *, series);
AAPropStatementAndFuncStatement(assign, AAChartModel, BOOL,       connectNulls);
AAPropStatementAndFuncStatement(assign, AAChartModel, BOOL,       legendEnabled);

AAPropStatementAndFuncStatement(copy,   AAChartModel, NSString *, backgroundColor);
AAPropStatementAndFuncStatement(assign, AAChartModel, BOOL,       options3dEnable);
AAPropStatementAndFuncStatement(strong, AAChartModel, NSNumber *, options3dAlpha);
AAPropStatementAndFuncStatement(strong, AAChartModel, NSNumber *, options3dBeta);
AAPropStatementAndFuncStatement(strong, AAChartModel, NSNumber *, options3dDepth);

AAPropStatementAndFuncStatement(strong, AAChartModel, NSNumber *, borderRadius);
AAPropStatementAndFuncStatement(strong, AAChartModel, NSNumber *, markerRadius);

AAPropStatementAndFuncStatement(assign, AAChartModel, BOOL,       yAllowDecimals);
AAPropStatementAndFuncStatement(strong, AAChartModel, NSArray  *, yPlotLines);
AAPropStatementAndFuncStatement(strong, AAChartModel, NSNumber *, yMax);
AAPropStatementAndFuncStatement(strong, AAChartModel, NSNumber *, yMin);
AAPropStatementAndFuncStatement(strong, AAChartModel, NSArray  *, yTickPositions);

```


## More graphics

>>> * Note: The following `DEMO picture` is the `GIF dynamic picture` which is the size of *6M* around, if there is no dynamic results because of that the picture resources are not loaded fully, please be patient to the picture resources before the contents of the fully loaded, then you will finally watch more of the dynamic demonstration of the project results.

![image](https://github.com/AAChartModel/AAChartKit/blob/master/AAChartKitDemo/ChartsDemo/AAChartKitShow.gif)


## Created By:

![](https://avatars1.githubusercontent.com/u/16357599?s=40&v=4)An An

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

## LICENSE

![](https://upload.wikimedia.org/wikipedia/commons/thumb/f/f8/License_icon-mit-88x31-2.svg/128px-License_icon-mit-88x31-2.svg.png)
AAChartKit is available under the MIT license. See the [LICENSE](https://github.com/AAChartModel/AAChartKit/blob/master/LICENSE) file for more information.

## Contact

-------------------------------------------------------------------------------
* ❀❀❀   WARM TIPS!!!   ❀❀❀
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
>>>>  * - [ ] Support rendering the polyline straight line chart
>>>>  * - [ ] Support rendering the polyline straight area chart
>>>>  * - [ ] Support rendering the Nightingale rose 🌹chart
>>>>  * - [ ] Support rendering the rectangular tree hierarchy diagrams
>>>>  * - [ ] Support rendering the circular progress bar chart 
>>>>  * - [ ] Support adding clicked event callbacks for graphics
