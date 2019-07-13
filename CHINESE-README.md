
![AAChartKit-LOGO](https://raw.githubusercontent.com/AAChartModel/loadHtmlCssJsDemo-master/master/AAChartKit/AAChartKit-Logo.png)
# AAChartKit 3.0

[![Support](https://img.shields.io/badge/support-iOS%206%2B%20-blue.svg?style=flat)](https://www.apple.com/nl/ios/)</br>
[![](https://img.shields.io/badge/license-MIT-brightgreen.svg)](https://github.com/AAChartModel/AAChartKit/blob/master/LICENSE)</br>
[![](https://img.shields.io/badge/language-OC-green.svg)](https://github.com/AAChartModel/AAChartKit)</br>
[![](https://img.shields.io/badge/support-Animation-yellow.svg)](https://github.com/AAChartModel/AAChartKit-Swift)</br>
[![](https://img.shields.io/badge/support-Swift-orange.svg)](https://github.com/AAChartModel/AAChartKit-Swift)</br>
[![](https://jaywcjlove.github.io/sb/lang/chinese.svg)](https://github.com/AAChartModel/AAChartKit/blob/master/CHINESE-README.md)</br>
[![](https://jaywcjlove.github.io/sb/lang/english.svg)](https://github.com/AAChartModel/AAChartKit)</br>
[![](https://img.shields.io/badge/Live-ChartsShow-red.svg)](http://htmlpreview.github.io/?https://github.com/AAChartModel/AAChartKit/blob/master/AAChartKitDemo/ChartsDemo/AAChartKitDocumentLive.html)</br>
[![Average time to resolve an issue](http://isitmaintained.com/badge/resolution/AAChartModel/AAChartKit.svg)](http://isitmaintained.com/project/AAChartModel/AAChartKit "Average time to resolve an issue") <br>
[![Percentage of issues still open](http://isitmaintained.com/badge/open/AAChartModel/AAChartKit.svg)](http://isitmaintained.com/project/AAChartModel/AAChartKit "Percentage of issues still open")

## [ **English Document 🇬🇧** ](https://github.com/AAChartModel/AAChartKit)  |  [ **简体中文文档 🇨🇳** ](https://github.com/AAChartModel/AAChartKit/blob/master/CHINESE-README.md)| [ **繁體中文文檔 🇭🇰** ](https://github.com/AAChartModel/AAChartKit/blob/master/TRADITIONAL-CHINESE-README.md)
### 您所喜爱的 ***AAChartKit*** 开源图表库现在更有`swift`版本可供使用,详情请点击以下链接
### 传送门
#### *https://github.com/AAChartModel/AAChartKit-Swift*

## 前言

 ***AAChartKit*** 项目,是[AAInfographics](https://github.com/AAChartModel/AAChartKit-Swift)的 `Objective-C` 语言版本,是在流行的开源前端图表库*Highcharts*的基础上,封装的面向对象的,一组简单易用,极其精美的图表绘制控件.可能是这个星球上 UI 最精致的第三方 iOS 开源图表库了(✟我以无神论者的名义向上帝起誓🖐,我真的没有在说鬼话✟)
 
 ## 功能特性
 
 ***

* 🎂        环境友好,兼容性强. 适配 `iOS 6 +`,  支持`ARC`,支持 `Objective-C`语言,配置简单.同时更有 Swift 版本[AAInfographics](https://github.com/AAChartModel/AAChartKit-Swift)可供使用.
* 🚀        功能强大,类型多样 -. 支持`柱状图` 、`条形图` 、`折线图` 、`曲线图` 、`折线填充图` 、`曲线填充图`、`雷达图`、`极地图`、`扇形图`、`气泡图`、`散点图`、`区域范围图`、`柱形范围图`、`面积范围图`、`面积范围均线图`、`直方折线图`、`直方折线填充图`、`箱线图`、`瀑布图`、`热力图`、`桑基图`、`金字塔图`、`漏斗图`、等二十几种类型的图形,不可谓之不多.
* 🎮        交互式图形动画 . 有着清晰和充满细节的用户交互方式,与此同时,图形渲染`动画`效果细腻精致,流畅优美.有三十多种以上渲染动画效果可供选择,用户可自由设置渲染图形时的动画时间和动画类型,关于图形渲染动画类型,具体参见[ AAChartKit 动画类型](https://github.com/AAChartModel/AAChartKit/blob/master/CHINESE-README.md#当前已支持的图表渲染动画类型有三十种以上说明如下).
* 👌        支持手势缩放 .支持图表的手势缩放和拖动阅览,手势缩放类型具体参见[ AAChartKit 手势缩放类型](https://github.com/AAChartModel/AAChartKit/blob/master/CHINESE-README.md#当前已支持的图表手势缩放类型共有三种说明如下),默认禁用手势缩放功能.
* 🦋        极简主义 . `AAChartView + AAChartModel = Chart`,在 ***AAChartKit*** 图表框架当中,遵循这样一个极简主义公式:`图表视图控件 + 图表模型 = 你想要的图表`.同另一款强大而又精美的图表库[AAInfographics](https://github.com/AAChartModel/AAChartKit-Swift)完全一致.
* ⛓        链式编程语法 . 支持类 *Masonry* `链式编程语法`,一行代码即可配置完成 `AAChartModel`模型对象实例.
* 🎈        简洁清晰,轻便易用 . 最少仅仅需要 **五行代码** 即可完成整个图表的绘制工作(使用链式编程语法配置 `AAChartModel` 实例对象时,无论你写多少行代码,理论上只能算作是一行). 😜😜😜
* 🖱        支持图表的[用户点击事件及单指滑动事件](https://github.com/AAChartModel/AAChartKit/blob/master/CHINESE-README.md#支持监听用户点击事件及单指滑动事件),可在此基础上实现双表联动乃至多表联动,以及其他更多更复杂的自定义用户交互效果.

***

## 真机美图
| Column Chart 柱状图 | Column Range Chart 条形范围图 | Area Chart 区域填充图 |
| :----:  | :----: | :----: |
| ![image1](https://raw.githubusercontent.com/AAChartModel/loadHtmlCssJsDemo-master/master/AAChartKit/BeautyAppreciation/ColumnChart.png) | ![image1](https://raw.githubusercontent.com/AAChartModel/loadHtmlCssJsDemo-master/master/AAChartKit/BeautyAppreciation/BarChart.png) | ![image1](https://raw.githubusercontent.com/AAChartModel/loadHtmlCssJsDemo-master/master/AAChartKit/BeautyAppreciation/AreaChart.png) |

| Line Chart 折线图 | Step Area Chart 直方折线填充图 | Step Line Chart 直方折线图 |
| :----:  | :----: | :----: |
| ![image1](https://raw.githubusercontent.com/AAChartModel/loadHtmlCssJsDemo-master/master/AAChartKit/BeautyAppreciation/LineChart.png) | ![image1](https://raw.githubusercontent.com/AAChartModel/loadHtmlCssJsDemo-master/master/AAChartKit/BeautyAppreciation/StepAreaChart.png) | ![image1](https://raw.githubusercontent.com/AAChartModel/loadHtmlCssJsDemo-master/master/AAChartKit/BeautyAppreciation/StepLineChart.png) |

| Spline Chart 曲线图| Areaspline Chart 曲线填充图 | Stacked Polar Chart 堆积填充图 |
| :----:  | :----: | :----: |
| ![image1](https://raw.githubusercontent.com/AAChartModel/Gallery/master/AAChartKit/splineChart.png) | ![image1](https://raw.githubusercontent.com/AAChartModel/Gallery/master/AAChartKit/areasplineChart.png) | ![image1](https://raw.githubusercontent.com/AAChartModel/Gallery/master/AAChartKit/percentStackingAreasplineChart.png) |

| Bubble Chart 折线图 | Arearange Average Value Chart 范围均线图 | Column Mixed Line Chart 双Y轴柱形折线混合图 |
| :----:  | :----: | :----: |
| ![image1](https://raw.githubusercontent.com/AAChartModel/Gallery/master/AAInfographics/BubbleChart.png) | ![image1](https://raw.githubusercontent.com/AAChartModel/Gallery/master/AAInfographics/ArearangeAverageValueChart.png) | ![image1](https://raw.githubusercontent.com/AAChartModel/Gallery/master/AAInfographics/ColumnMixedLineChart.png) |

| Scatter Chart 散点图 | Boxplot  Chart 箱线图 | Mirror Column Chart 镜像图 |
| :----:  | :----: | :----: |
| ![image1](https://raw.githubusercontent.com/AAChartModel/Gallery/master/AAChartKit/scatterChart.png) | ![image1](https://raw.githubusercontent.com/AAChartModel/Gallery/master/AAChartKit/boxplotChart.png) | ![image1](https://raw.githubusercontent.com/AAChartModel/Gallery/master/AAChartKit/MirrorColumnChart.png) |

## 使用前安装

### CocoaPods 安装 (推荐)
1. 在 `Podfile` 中添加以下内容
 ```ruby
 pod 'AAChartKit', :git => 'https://github.com/AAChartModel/AAChartKit.git'
 ```

2. 执行  `pod install`  或  `pod update`。


### 手动安装
1. 将项目`Demo`中的文件夹`AAChartKitLib`拖入到所需项目中.
1. 在你的项目的 `.pch` 全局宏定义文件中添加
```objective-c
#import "AAGlobalMacro.h"
```

## 正式开始使用
1. 在你的`ViewController`视图控制器文件中添加
```objective-c
#import "AAChartKit.h"
```
2. 创建视图`AAChartView`
```objective-c
CGFloat chartViewWidth  = self.view.frame.size.width;
CGFloat chartViewHeight = self.view.frame.size.height-250;
_aaChartView = [[AAChartView alloc]init];
_aaChartView.frame = CGRectMake(0, 60, chartViewWidth, chartViewHeight);
////禁用 AAChartView 滚动效果(默认不禁用)
//self.aaChartView.scrollEnabled = NO;
////设置图表视图的内容高度(默认 contentHeight 和 AAChartView 的高度相同)
//_aaChartView.contentHeight = chartViewHeight;
[self.view addSubview:_aaChartView];
```
3. 配置视图模型`AAChartModel`
```objective-c
AAChartModel *aaChartModel= AAObject(AAChartModel)
.chartTypeSet(AAChartTypeLine)//设置图表的类型(这里以设置的为折线图为例)
.titleSet(@"编程语言热度")//设置图表标题
.subtitleSet(@"虚拟数据")//设置图表副标题
.categoriesSet(@[@"Java",@"Swift",@"Python",@"Ruby", @"PHP",@"Go",@"C",@"C#",@"C++"])//图表横轴的内容
.yAxisTitleSet(@"摄氏度")//设置图表 y 轴的单位
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
4.  绘制图形(创建 `AAChartView` 实例对象后,首次绘制图形调用此方法)
```objective-c
/*图表视图对象调用图表模型对象,绘制最终图形*/
[_aaChartView aa_drawChartWithChartModel:aaChartModel];
```
🌹🌹🌹 好了,至此,有关于绘制图形的任务,一切皆已经搞定!!! 你将得到你想要的任意图形!!!🌈🌈🌈

### 更新图形内容
如果你需要更新图表内容,你应该阅读以下内容,根据你的实际需要,选择调用适合你的函数

*  仅仅刷新图形的数据(进行数据的动态更新操作时,建议使用此方法)
```objective-c
/*仅仅更新 AAChartModel 对象的 series 属性时,动态刷新图表*/
[_aaChartView aa_onlyRefreshTheChartDataWithChartModelSeries:aaChartModelSeriesArray];
```

*  刷新图形除数据属性 `series` 以外的其他属性(首次绘制图形完成之后,后续刷新图表的属性均建议调用此方法 注意:仅仅刷新图形数据,则建议使用上面的👆`aa_onlyRefreshTheChartDataWithChartModelSeries`方法)
```objective-c
/*更新 AAChartModel 内容之后,刷新图表*/
[_aaChartView aa_refreshChartWithChartModel:aaChartModel];
```

##  `AAChartModel`一些重要属性经过配置之后的图形示例如下

-  ### line chart - 折线图

![IMG_1867.JPG](https://raw.githubusercontent.com/AAChartModel/loadHtmlCssJsDemo-master/master/AAChartKit/LineChart.png)

-  ### column chart - 柱状图

![IMG_1873.JPG](https://raw.githubusercontent.com/AAChartModel/loadHtmlCssJsDemo-master/master/AAChartKit/ColumnChart.png)

- ###  bar chart - 条形图

![IMG_1880.JPG](https://raw.githubusercontent.com/AAChartModel/loadHtmlCssJsDemo-master/master/AAChartKit/BarChart.png)

- ### special area chart one - 折线区域填充图

![IMG_1869.JPG](https://raw.githubusercontent.com/AAChartModel/loadHtmlCssJsDemo-master/master/IMG_1482.JPG)

- ### special area chart two - 带有负数的曲线区域填充图

![IMG_1871.JPG](https://raw.githubusercontent.com/AAChartModel/loadHtmlCssJsDemo-master/master/AAInfographics/AreaChartOne.png)

- ### special area chart three - 堆积状态的折线区域填充图

![IMG_1863.JPG](https://raw.githubusercontent.com/AAChartModel/loadHtmlCssJsDemo-master/master/PictureResources/屏幕快照%202017-05-06%20下午6.58.15.png)

- ### radar chart - 多组数据的雷达图

![IMG_1877.JPG](https://raw.githubusercontent.com/AAChartModel/loadHtmlCssJsDemo-master/master/AAChartKit/RadarChart.png)

- ### polar chart - 极地图

![IMG_1879.JPG](https://raw.githubusercontent.com/AAChartModel/loadHtmlCssJsDemo-master/master/AAChartKit/PolarChart.png)

- ### pie chart - 环形图(中间为空的扇形图)

![IMG_1878.JPG](https://raw.githubusercontent.com/AAChartModel/loadHtmlCssJsDemo-master/master/AAChartKit/PieChart.png)

- ### bubble chart - 气泡图

![IMG_1875.JPG](https://raw.githubusercontent.com/AAChartModel/loadHtmlCssJsDemo-master/master/AAChartKit/BubbleChart.png)

- ### scatter chart - 散点图

![scatter chart](https://raw.githubusercontent.com/AAChartModel/loadHtmlCssJsDemo-master/master/AAInfographics/ScatterChart.png)

- ### arearange chart - 区域范围填充图

![arearange chart](https://raw.githubusercontent.com/AAChartModel/loadHtmlCssJsDemo-master/master/AAInfographics/ArearangeChart.png)

- ### step area chart - 直方区域填充图

![step area chart](https://raw.githubusercontent.com/AAChartModel/loadHtmlCssJsDemo-master/master/AAInfographics/StepAreaChart.png)

- ### mixed chart - 混合图形(折线图&柱形范围图)

![mixed chart](https://raw.githubusercontent.com/AAChartModel/loadHtmlCssJsDemo-master/master/AAInfographics/MixedChart.png)


### 更多图形效果
 注意:如下的这幅`DEMO演示图`为大小*6M*左右的`GIF动态图`,如未显示动态效果则说明图片资源未全部加载。请耐心等待至图片资源内容完全加载结束后，即可最终观赏更多的项目的动态演示效果.

![AAChartKit-Live](https://raw.githubusercontent.com/AAChartModel/Gallery/master/AAChartKit/AAChartKit-Live.gif)

## 特别说明

### 支持监听用户点击事件及单指滑动事件

  可通过给 AAChartView 示例对象设置代理方法,来实现监听用户的点击事件和单指滑动事件
 ```objective-c
  //设置 AAChartView 事件代理
  self.aaChartView.delegate = self;
  
  //支持用户点击事件
  self.aaChartModel.touchEventEnabledSet(true)

  //实现对 AAChartView 事件代理的监听
  #pragma mark -- AAChartView delegate
  - (void)aaChartView:(AAChartView *)aaChartView moveOverEventWithMessage:(AAMoveOverEventMessageModel *)message {
  NSLog(@"🚀selected point series element name: %@",message.name);
  }
  ```

  在监听用户交互事件时,获取的事件信息`AAMoveOverEventMessageModel`共包含以下内容
  ```objective-c
  @interface AAMoveOverEventMessageModel : NSObject
  
  @property (nonatomic, copy)   NSString *name; 
  @property (nonatomic, strong) NSNumber *x; 
  @property (nonatomic, strong) NSNumber *y;
  @property (nonatomic, copy)   NSString *category;
  @property (nonatomic, strong) NSDictionary *offset;
  @property (nonatomic, assign) NSUInteger index;
  
  @end
  ```


### 支持通过`JavaScript` 函数来自定义 `AATooltip`视图显示效果
有时系统默认的 `tooltip` 浮动提示框的显示效果无法满足使用者的特殊自定义要求,此时可以通过添加 `AATooltip` 的 `headerFormat` 和 `pointFormat`字符串属性来自定义浮动提示框的显示内容,如仍旧不能满足需求,更可以通过 `AATooltip` 的 `formatter` 函数来实现视图的特殊定制化
例如,如下配置 `AATooltip` 实例对象属性
```objective-c
    /*Custom Tooltip Style --- 自定义图表浮动提示框样式及内容*/
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
              .fontSizeSet(@"12px"))
    ;
```
即可完成图表的浮动提示框的特殊定制化.得到的浮动提示框的视觉效果图如下👇
![Custom Tooltip Style](https://user-images.githubusercontent.com/16357599/56589690-543c5880-6618-11e9-9d18-6bc0fe2fa53f.png)

### 支持添加值域分割功能

* 添加颜色带🎀值域分割
![plotBandsChart](https://raw.githubusercontent.com/AAChartModel/Gallery/master/AAChartKit/plotBandsChart.png)


* 添加颜色线🧶值域分割
![plotLinesChart](https://raw.githubusercontent.com/AAChartModel/Gallery/master/AAChartKit/plotLinesChart.png)


  
### 当前已支持的图表类型有十种以上,说明如下
```objective-c
typedef NSString *AAChartType;

AACHARTKIT_EXTERN AAChartType const AAChartTypeColumn;          //柱形图
AACHARTKIT_EXTERN AAChartType const AAChartTypeBar;             //条形图
AACHARTKIT_EXTERN AAChartType const AAChartTypeArea;            //折线区域填充图
AACHARTKIT_EXTERN AAChartType const AAChartTypeAreaspline;      //曲线区域填充图
AACHARTKIT_EXTERN AAChartType const AAChartTypeLine;            //折线图
AACHARTKIT_EXTERN AAChartType const AAChartTypeSpline;          //曲线图
AACHARTKIT_EXTERN AAChartType const AAChartTypeScatter;         //散点图
AACHARTKIT_EXTERN AAChartType const AAChartTypePie;             //扇形图
AACHARTKIT_EXTERN AAChartType const AAChartTypeBubble;          //气泡图
AACHARTKIT_EXTERN AAChartType const AAChartTypePyramid;         //金字塔图
AACHARTKIT_EXTERN AAChartType const AAChartTypeFunnel;          //漏斗图
AACHARTKIT_EXTERN AAChartType const AAChartTypeColumnrange;     //柱形范围图
AACHARTKIT_EXTERN AAChartType const AAChartTypeArearange;       //区域折线范围图
AACHARTKIT_EXTERN AAChartType const AAChartTypeAreasplinerange; //区域曲线范围图
AACHARTKIT_EXTERN AAChartType const AAChartTypeBoxplot;         //箱线图
AACHARTKIT_EXTERN AAChartType const AAChartTypeWaterfall;       //瀑布图
AACHARTKIT_EXTERN AAChartType const AAChartTypePolygon;         //多边形图

```


### 当前已支持的图表手势缩放类型共有三种,说明如下
```objective-c
typedef NSString *AAChartZoomType;

AACHARTKIT_EXTERN AAChartZoomType const AAChartZoomTypeNone; //禁用手势缩放功能(默认禁用手势缩放)
AACHARTKIT_EXTERN AAChartZoomType const AAChartZoomTypeX;    //支持图表 X轴横向缩放
AACHARTKIT_EXTERN AAChartZoomType const AAChartZoomTypeY;    //支持图表 Y轴纵向缩放
AACHARTKIT_EXTERN AAChartZoomType const AAChartZoomTypeXY;   //支持图表等比例缩放
```
NOTE:例如,设置了`AAChartModel`的缩放属性`zoomType`为`AAChartZoomTypeX`,并且将图表进行了手势放大之后,这时候如果想要左右滑动图表,可以使用 **双指点按** 屏幕中的`AAChartView`视图区域进行 **左右拖动** 即可.同时屏幕的右上角会自动出现一个标题为 **"恢复缩放"** 的按钮,点击恢复缩放,图表大小和位置将会回归到原初的样式.

### 当前已支持的图表渲染动画类型有三十种以上,说明如下
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

以下是**AAChartKit**其中十种图表渲染动画类型

| Back      | Bounce    | Circ      | Cubic     | Elastic   |
|:---------:|:---------:|:---------:|:---------:|:---------:|
| ![][1]    | ![][2]    | ![][3]    | ![][4]    | ![][5]    |


| Expo      | Quad      | Quart     | Quint     | Sine      |
|:---------:|:---------:|:---------:|:---------:|:---------:|
| ![][6]    | ![][7]    | ![][8]    | ![][9]    | ![][10]   |



### `AAChartModel` 属性配置列表
```objective-c
AAPropStatementAndPropSetFuncStatement(copy,   AAChartModel, NSString *, title) //标题文本内容
AAPropStatementAndPropSetFuncStatement(strong, AAChartModel, NSNumber *, titleFontSize) //标题字体尺寸大小
AAPropStatementAndPropSetFuncStatement(copy,   AAChartModel, NSString *, titleFontColor) //标题字体颜色
AAPropStatementAndPropSetFuncStatement(copy,   AAChartModel, NSString *, titleFontWeight) //标题字体粗细

AAPropStatementAndPropSetFuncStatement(copy,   AAChartModel, NSString *, subtitle) //副标题文本内容
AAPropStatementAndPropSetFuncStatement(strong, AAChartModel, NSNumber *, subtitleFontSize) //副标题字体尺寸大小
AAPropStatementAndPropSetFuncStatement(copy,   AAChartModel, NSString *, subtitleFontColor) //副标题字体颜色
AAPropStatementAndPropSetFuncStatement(copy,   AAChartModel, NSString *, subtitleFontWeight) //副标题字体粗细

AAPropStatementAndPropSetFuncStatement(copy,   AAChartModel, NSString *, backgroundColor) //图表背景色(必须为十六进制的颜色色值如红色"#FF0000")
AAPropStatementAndPropSetFuncStatement(strong, AAChartModel, NSArray     <NSString *>*, colorsTheme) //图表主题颜色数组
AAPropStatementAndPropSetFuncStatement(strong, AAChartModel, NSArray     <NSString *>*, categories) //x轴坐标每个点对应的名称(注意:这个不是用来设置 X 轴的值,仅仅是用于设置 X 轴文字内容的而已)
AAPropStatementAndPropSetFuncStatement(strong, AAChartModel, NSArray  *, series) //图表的数据列内容

AAPropStatementAndPropSetFuncStatement(copy,   AAChartModel, AAChartSubtitleAlignType, subtitleAlign) //图表副标题文本水平对齐方式。可选的值有 “left”，”center“和“right”。 默认是：center.
AAPropStatementAndPropSetFuncStatement(copy,   AAChartModel, AAChartType,              chartType) //图表类型
AAPropStatementAndPropSetFuncStatement(copy,   AAChartModel, AAChartStackingType,      stacking) //堆积样式
AAPropStatementAndPropSetFuncStatement(copy,   AAChartModel, AAChartSymbolType,        markerSymbol) //折线曲线连接点的类型："circle", "square", "diamond", "triangle","triangle-down"，默认是"circle"
AAPropStatementAndPropSetFuncStatement(assign, AAChartModel, AAChartSymbolStyleType,   markerSymbolStyle) 
AAPropStatementAndPropSetFuncStatement(copy,   AAChartModel, AAChartZoomType,          zoomType) //缩放类型 AAChartZoomTypeX 表示可沿着 x 轴进行手势缩放
AAPropStatementAndPropSetFuncStatement(assign, AAChartModel, AAChartAnimation,         animationType) //设置图表的渲染动画类型
AAPropStatementAndPropSetFuncStatement(strong, AAChartModel, NSNumber *, animationDuration) //设置图表的渲染动画时长(动画单位为毫秒)

AAPropStatementAndPropSetFuncStatement(assign, AAChartModel, BOOL,       inverted) //x 轴是否垂直,默认为否
AAPropStatementAndPropSetFuncStatement(assign, AAChartModel, BOOL,       gradientColorsThemeEnabled) //是否将常规主题颜色数组 colorsTheme 自动转换为半透明渐变效果的颜色数组(设置后就不用自己再手动去写渐变色字典,相当于是设置渐变色的一个快捷方式,当然了,如果需要细致地自定义渐变色效果,还是需要自己手动配置渐变颜色字典内容,具体方法参见图表示例中的`颜色渐变条形图`示例代码),默认为否
AAPropStatementAndPropSetFuncStatement(assign, AAChartModel, BOOL,       polar) //是否极化图形(变为雷达图),默认为否

AAPropStatementAndPropSetFuncStatement(assign, AAChartModel, BOOL,       dataLabelEnabled) //是否显示数据,默认为否
AAPropStatementAndPropSetFuncStatement(copy,   AAChartModel, NSString *, dataLabelFontColor) //Datalabel font color
AAPropStatementAndPropSetFuncStatement(strong, AAChartModel, NSNumber *, dataLabelFontSize) //Datalabel font size
AAPropStatementAndPropSetFuncStatement(copy,   AAChartModel, NSString *, dataLabelFontWeight) //Datalabel font weight


AAPropStatementAndPropSetFuncStatement(assign, AAChartModel, BOOL,       xAxisVisible) //x 轴是否可见(默认可见)
AAPropStatementAndPropSetFuncStatement(assign, AAChartModel, BOOL,       xAxisReversed) // x 轴翻转,默认为否

AAPropStatementAndPropSetFuncStatement(assign, AAChartModel, BOOL,       xAxisLabelsEnabled) //x 轴是否显示文字
AAPropStatementAndPropSetFuncStatement(strong, AAChartModel, NSNumber *, xAxisLabelsFontSize) //x 轴文字字体大小
AAPropStatementAndPropSetFuncStatement(copy,   AAChartModel, NSString *, xAxisLabelsFontColor) //x 轴文字字体颜色
AAPropStatementAndPropSetFuncStatement(copy,   AAChartModel, AAChartFontWeightType, xAxisLabelsFontWeight) //x 轴文字字体粗细

AAPropStatementAndPropSetFuncStatement(strong, AAChartModel, NSNumber *, xAxisGridLineWidth) //x 轴网格线的宽度
AAPropStatementAndPropSetFuncStatement(strong, AAChartModel, NSNumber *, xAxisTickInterval) //x轴刻度点间隔数(设置每隔几个点显示一个 X轴的内容)

AAPropStatementAndPropSetFuncStatement(strong, AAChartModel, NSNumber *, xAxisCrosshairWidth) //设置 x 轴准星线的宽度
AAPropStatementAndPropSetFuncStatement(copy,   AAChartModel, NSString *, xAxisCrosshairColor) //设置 x 轴准星线的颜色
AAPropStatementAndPropSetFuncStatement(assign, AAChartModel, AALineDashSyleType,   xAxisCrosshairDashStyleType) //设置 x 轴准星线的线条样式类型


AAPropStatementAndPropSetFuncStatement(assign, AAChartModel, BOOL,       yAxisVisible) //y 轴是否可见(默认可见)
AAPropStatementAndPropSetFuncStatement(assign, AAChartModel, BOOL,       yAxisReversed) //y 轴翻转,默认为否

AAPropStatementAndPropSetFuncStatement(assign, AAChartModel, BOOL,       yAxisLabelsEnabled) //y 轴是否显示文字
AAPropStatementAndPropSetFuncStatement(strong, AAChartModel, NSNumber *, yAxisLabelsFontSize) //y 轴文字字体大小
AAPropStatementAndPropSetFuncStatement(copy,   AAChartModel, NSString *, yAxisLabelsFontColor) //y 轴文字字体颜色
AAPropStatementAndPropSetFuncStatement(copy,   AAChartModel, AAChartFontWeightType , yAxisLabelsFontWeight) //y 轴文字字体粗细

AAPropStatementAndPropSetFuncStatement(copy,   AAChartModel, NSString *, yAxisTitle) //y 轴标题
AAPropStatementAndPropSetFuncStatement(strong, AAChartModel, NSNumber *, yAxisLineWidth) //y y-axis line width
AAPropStatementAndPropSetFuncStatement(strong, AAChartModel, NSNumber *, yAxisGridLineWidth) //y轴网格线的宽度
AAPropStatementAndPropSetFuncStatement(assign, AAChartModel, BOOL,       yAxisAllowDecimals) //是否允许 y 轴显示小数
AAPropStatementAndPropSetFuncStatement(strong, AAChartModel, NSArray  *, yAxisPlotLines) //y 轴基线的配置
AAPropStatementAndPropSetFuncStatement(strong, AAChartModel, NSNumber *, yAxisMax) //y 轴最大值
AAPropStatementAndPropSetFuncStatement(strong, AAChartModel, NSNumber *, yAxisMin) //y 轴最小值（设置为0就不会有负数）
AAPropStatementAndPropSetFuncStatement(strong, AAChartModel, NSNumber *, yAxisTickInterval) 
AAPropStatementAndPropSetFuncStatement(strong, AAChartModel, NSArray  *, yAxisTickPositions) //自定义 y 轴坐标（如：[@(0), @(25), @(50), @(75) , (100)]）

AAPropStatementAndPropSetFuncStatement(strong, AAChartModel, NSNumber *, yAxisCrosshairWidth) //设置 y 轴准星线的宽度
AAPropStatementAndPropSetFuncStatement(copy,   AAChartModel, NSString *, yAxisCrosshairColor) //设置 y 轴准星线的颜色
AAPropStatementAndPropSetFuncStatement(assign, AAChartModel, AALineDashSyleType,   yAxisCrosshairDashStyleType) //设置 y 轴准星线的线条样式类型


AAPropStatementAndPropSetFuncStatement(assign, AAChartModel, BOOL,       tooltipEnabled) //是否显示浮动提示框(默认显示)
AAPropStatementAndPropSetFuncStatement(assign, AAChartModel, BOOL,       tooltipShared)//是否多组数据共享一个浮动提示框
AAPropStatementAndPropSetFuncStatement(copy,   AAChartModel, NSString *, tooltipValueSuffix) //浮动提示框单位后缀

AAPropStatementAndPropSetFuncStatement(assign, AAChartModel, BOOL,       connectNulls) //设置折线是否断点重连(是否连接空值点)
AAPropStatementAndPropSetFuncStatement(assign, AAChartModel, BOOL,       legendEnabled) //是否显示图例 lengend(图表底部可点按的圆点和文字)
AAPropStatementAndPropSetFuncStatement(strong, AAChartModel, NSNumber *, borderRadius) //柱状图长条图头部圆角半径(可用于设置头部的形状,仅对条形图,柱状图有效)
AAPropStatementAndPropSetFuncStatement(strong, AAChartModel, NSNumber *, markerRadius) //折线连接点的半径长度
AAPropStatementAndPropSetFuncStatement(copy,   AAChartModel, NSString *, zoomResetButtonText)  //String to display in 'zoom reset button"


```

## 作者
![](https://avatars1.githubusercontent.com/u/16357599?s=40&v=4)An An
``` java
 "CODE IS FAR AWAY FROM BUG WITH THE ANIMAL PROTECTING"
 *          %%       %%
 *         ##       ##
 *       ┏-##┓　  ┏-##┓
 *    ┏_┛ ┻---━┛_┻━━┓
 *    ┃　　　        ┃　　　　 
 *    ┃　　 ━　      ┃　　　 
 *    ┃ @^　  @^    ┃　　 
 *    ┃　　　　　　  ┃
 *    ┃　　 ┻　　　 ┃
 *    ┃_　　　　　 _┃
 *     ┗━┓　　　┏━┛
 *    　　┃　　　┃神兽保佑
 *    　　┃　　　┃永无BUG！
 *    　　┃　　　┗━━━┓----|
 *    　　┃　　　　　　　  ┣┓}}}
 *    　　┃　　　　　　　  ┏┛
 *    　　┗┓&&&┓-┏&&&┓┏┛-|
 *    　　　┃┫┫　 ┃┫┫
 *    　　　┗┻┛　 ┗┻┛
 *
 *
 "CODE IS FAR AWAY FROM BUG WITH THE ANIMAL PROTECTING"
 ```
 
 
 ## 源代码⛓
 语言版本 |  项目名称 | 源代码链接|
 ------------ | ------------- | ------------- |
 Swift | AAInfographics | https://github.com/AAChartModel/AAChartKit-Swift |
 Objective C | AAChartKit | https://github.com/AAChartModel/AAChartKit |
 

## 许可证

![](https://upload.wikimedia.org/wikipedia/commons/thumb/f/f8/License_icon-mit-88x31-2.svg/128px-License_icon-mit-88x31-2.svg.png)

本项目 ***AAChartKit*** 使用 `MIT许可证`,详情请点击[MIT LICENSE](https://github.com/AAChartModel/AAChartKit/blob/master/LICENSE)

## 联系方式

-------------------------------------------------------------------------------
*  🌕 🌖 🌗 🌘     暖心提示   🌑 🌒 🌓 🌔
*
* 如果有任何使用上的问题,随时欢迎您在 GitHub 上向我提 issue.
* GitHub Issues : https://github.com/AAChartModel/AAChartKit/issues
-------------------------------------------------------------------------------
*  如果您想参与到此项目的开源活动中来,也同样随时欢迎您联系我
* GitHub        : https://github.com/AAChartModel
* StackOverflow : https://stackoverflow.com/users/7842508/codeforu
* JianShu       : http://www.jianshu.com/u/f1e6753d4254
* SegmentFault  : https://segmentfault.com/u/huanghunbieguan
-------------------------------------------------------------------------------

## 附言

在 ***AAChartKit*** 封装库的初始设计中,为提升`.js`文件的加载速度,故将所依赖的`.js`文件放置在本地.然而由于本项目功能较多,故放置于本地的附加`JavaScript`文件库体积较大,整个`AAJSFiles`文件夹下所有的`.js`文件体积合计共有`250KB左右`(当然,在项目打包为压缩后的`.ipa`工程安装包文件时,是远小于这个体积的),若对工程文件体积大小较为敏感的使用者,可使用以下建议的替代方案
1.  删除在本 ***AAChartKit*** 项目文件中,`AAJSFiles`文件夹下的`4`项`.js`文件.需要被删除的文件名称如下
* AAHighchartsLib.js
* AAHighchartsMore.js
* AAFunnel.js
2.  将`AAChartView.html`文件中的以下内容
``` html
<script src="AAHighchartsLib.js">
</script>
<script src="AAHighchartsMore.js">
</script>
<script src="AAFunnel.js">
</script>
```
替换为
``` html
<script src="https://img.hcharts.cn/highcharts/highcharts.js">
</script>
<script src="https://img.hcharts.cn/highcharts/highcharts-more.js">
</script>
<script src="https://img.hcharts.cn/highcharts/modules/funnel.js">
</script>
```
即可.

此方案是将原本加载放置在本地的`.js`依赖文件改为了加载放置在网络上的`.js`文件,减小了本地文件大小,但有可能会有一定的网络延迟(`0.5s以内`),所以建议 ***AAChartKit*** 用户可根据自己的实际项目的开发需要,酌情选择最终是否使用本替代方案.

## 待办清单

 - [x] 支持图形加载完成后用户添加代理事件
 - [x] 支持图形动态刷新全局内容
 - [x] 支持图形动态刷新纯数据`(series)`内容
 - [ ] 支持图形实时刷新纯数据并动态滚动
 - [x] 支持色彩图层渐变效果
 - [x] 支持3D图形效果,仅对`柱状图`、`条形图`、`扇形图`、`散点图`、`气泡图`等部分图形有效
 - [x] 支持使用`CocoaPods` 导入
 - [ ] 支持使用`Carthage` 导入
 - [x] 支持横屏(全屏)效果
 - [x] 支持自由设置图形渲染动画
 - [x] 支持用户自由配置`AAOptions`模型对象属性
 - [x] 支持图形堆叠
 - [x] 支持图形坐标轴反转
 - [x] 支持渲染散点图
 - [x] 支持渲染柱形范围图
 - [x] 支持渲染面积范围图
 - [x] 支持渲染面积范围均线图
 - [x] 支持渲染极地图
 - [x] 支持渲染折线直方图
 - [x] 支持渲染折线直方填充图
 - [x] 支持渲染南丁格尔🌹玫瑰图
 - [x] 支持渲染活动刻度仪表图
 - [x] 支持为图形添加点击事件回调
 - [ ] 支持代码覆盖率测试




[1]:  https://raw.githubusercontent.com/adad184/MMTweenAnimation/master/Images/1.gif
[2]:  https://raw.githubusercontent.com/adad184/MMTweenAnimation/master/Images/2.gif
[3]:  https://raw.githubusercontent.com/adad184/MMTweenAnimation/master/Images/3.gif
[4]:  https://raw.githubusercontent.com/adad184/MMTweenAnimation/master/Images/4.gif
[5]:  https://raw.githubusercontent.com/adad184/MMTweenAnimation/master/Images/5.gif
[6]:  https://raw.githubusercontent.com/adad184/MMTweenAnimation/master/Images/6.gif
[7]:  https://raw.githubusercontent.com/adad184/MMTweenAnimation/master/Images/7.gif
[8]:  https://raw.githubusercontent.com/adad184/MMTweenAnimation/master/Images/8.gif
[9]:  https://raw.githubusercontent.com/adad184/MMTweenAnimation/master/Images/9.gif
[10]: https://raw.githubusercontent.com/adad184/MMTweenAnimation/master/Images/10.gif
