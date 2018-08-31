
![AAChartKit-LOGO](https://github.com/AAChartModel/loadHtmlCssJsDemo-master/blob/master/AAChartKit/AAChartKit-Logo.png)
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
### 您所喜愛的 ***AAChartKit*** 開源 iOS 圖表框架現在更有`swift`版本可供使用,詳情請點擊以下鏈接
### 傳送門
#### *https://github.com/AAChartModel/AAChartKit-Swift*

## 前言

 ***AAChartKit*** 項目,是[AAInfographics](https://github.com/AAChartModel/AAChartKit-Swift)的 `Objective-C` 語言版本,是在流行的開源前端圖表庫*Highcharts*的基礎上,封裝的面向對象的,一組簡單易用,極其精美的圖表繪制控件.可能是這個星球上 UI 最精致的第三方数据可视化開源 iOS 圖表框架了(✟我以無神論者的名義向上帝起誓🖐,我真的沒有在說鬼話✟)
 
 ## 功能特性
 
 ***

* 🎂   環境友好,兼容性強 . 適配 `iOS 6 +`,  支持`ARC`,支持 `Objective-C`語言,配置簡單.同時更有 Swift 版本[AAInfographics](https://github.com/AAChartModel/AAChartKit-Swift)可供使用.
* 🚀   功能強大,類型多樣 . 支持`柱狀圖` 、`條形圖` 、`折線圖` 、`曲線圖` 、`折線填充圖` 、`曲線填充圖`、`雷達圖`、`極地圖`、`扇形圖`、`氣泡圖`、`散點圖`、`區域範圍圖`、`柱形範圍圖`、`面積範圍圖`、`面積範圍均線圖`、`直方折線圖`、`直方折線填充圖`、`箱線圖`、`瀑布圖`、`熱力圖`、`桑基圖`、`金字塔圖`、`漏鬥圖`、等二十幾種類型的圖形,不可謂之不多.
* 🎮    交互式圖形動畫 . 有著清晰和充滿細節的用戶交互方式,與此同時,圖形渲染`動畫`效果細膩精致,流暢優美.有三十多種以上渲染動畫效果可供選擇,用戶可自由設置渲染圖形時的動畫時間和動畫類型,關於圖形渲染動畫類型,具體參見[ AAChartKit 動畫類型](https://github.com/AAChartModel/AAChartKit/blob/master/TRADITIONAL-CHINESE-README.md#當前已支持的圖表渲染動畫類型有三十種以上說明如下).
* 👌   支持手勢縮放 .支持圖表的手勢縮放和拖動閱覽,手勢縮放類型具體參見[ AAChartKit 手勢縮放類型](https://github.com/AAChartModel/AAChartKit/blob/master/TRADITIONAL-CHINESE-README.md#當前已支持的圖表手勢縮放類型共有三種說明如下),默認禁用手勢縮放功能.
* 🦋   極簡主義 . `AAChartView + AAChartModel = Chart`,在 ***AAChartKit*** 圖表框架當中,遵循這樣一個極簡主義公式:`圖表視圖控件 + 圖表模型 = 你想要的圖表`.同另一款強大、精美而又易用的开源 iOS 圖表框架[AAInfographics](https://github.com/AAChartModel/AAChartKit-Swift)完全一致.
* ⛓.  鏈式編程語法 . 支持類 *Masonry* `鏈式編程語法`,一行代碼即可配置完成 `AAChartModel`模型對象實例.
* 🎈   簡潔清晰,輕便易用 . 最少僅僅需要 **五行代碼** 即可完成整個圖表的繪制工作(使用鏈式編程語法配置 `AAChartModel` 實例對象時,無論你寫多少行代碼,理論上只能算作是一行). 😜😜😜

***

## 真機美圖
| Column Chart 柱狀圖 | Column Range Chart 條形範圍圖 | Area Chart 區域填充圖 |
| :----:  | :----: | :----: |
| ![image1](https://github.com/AAChartModel/loadHtmlCssJsDemo-master/blob/master/AAChartKit/BeautyAppreciation/ColumnChart.png) | ![image1](https://github.com/AAChartModel/loadHtmlCssJsDemo-master/blob/master/AAChartKit/BeautyAppreciation/BarChart.png) | ![image1](https://github.com/AAChartModel/loadHtmlCssJsDemo-master/blob/master/AAChartKit/BeautyAppreciation/AreaChart.png) |

| Line Chart 折線圖 | Step Area Chart 直方折線填充圖 | Step Line Chart 直方折線圖 |
| :----:  | :----: | :----: |
| ![image1](https://github.com/AAChartModel/loadHtmlCssJsDemo-master/blob/master/AAChartKit/BeautyAppreciation/LineChart.png) | ![image1](https://github.com/AAChartModel/loadHtmlCssJsDemo-master/blob/master/AAChartKit/BeautyAppreciation/StepAreaChart.png) | ![image1](https://github.com/AAChartModel/loadHtmlCssJsDemo-master/blob/master/AAChartKit/BeautyAppreciation/StepLineChart.png) |

| Spline Chart 曲線圖| Areaspline Chart 曲線填充圖 | Stacked Polar Chart 堆積填充圖 |
| :----:  | :----: | :----: |
| ![image1](https://github.com/AAChartModel/loadHtmlCssJsDemo-master/blob/master/AAChartKit/BeautyAppreciation/SplineChart.png) | ![image1](https://github.com/AAChartModel/loadHtmlCssJsDemo-master/blob/master/AAChartKit/BeautyAppreciation/AreasplineChart.png) | ![image1](https://github.com/AAChartModel/loadHtmlCssJsDemo-master/blob/master/AAChartKit/BeautyAppreciation/StackedPolarChart.png) |

## 使用方法

### 準備工作
1. 將項目`Demo`中的文件夾`AAChartKitLib`拖入到所需項目中.
1. 在你的項目的 `.pch` 全局宏定義文件中添加
```objective-c
#import "AAGlobalMacro.h"
```

### 正式開始
1. 在你的視圖控制器文件中添加
```objective-c
#import "AAChartKit.h"
```
2. 創建視圖`AAChartView`
```objective-c
CGFloat chartViewWidth  = self.view.frame.size.width;
CGFloat chartViewHeight = self.view.frame.size.height-250;
_aaChartView = [[AAChartView alloc]init];
_aaChartView.frame = CGRectMake(0, 60, chartViewWidth, chartViewHeight);
////禁用 AAChartView 滾動效果(默認不禁用)
//self.aaChartView.scrollEnabled = NO;
////設置圖表視圖的內容高度(默認 contentHeight 和 AAChartView 的高度相同)
//_aaChartView.contentHeight = chartViewHeight;
[self.view addSubview:_aaChartView];
```
3. 配置視圖模型`AAChartModel`
```objective-c
AAChartModel *aaChartModel= AAObject(AAChartModel)
.chartTypeSet(AAChartTypeColumn)//設置圖表的類型(這裏以設置的為柱狀圖為例)
.titleSet(@"編程語言熱度")//設置圖表標題
.subtitleSet(@"虛擬數據")//設置圖表副標題
.categoriesSet(@[@"Java",@"Swift",@"Python",@"Ruby", @"PHP",@"Go",@"C",@"C#",@"C++"])//圖表橫軸的內容
.yAxisTitleSet(@"攝氏度")//設置圖表 y 軸的單位
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
4.  繪制圖形(創建 `AAChartView` 實例對象後,首次繪制圖形調用此方法)
```objective-c
/*圖表視圖對象調用圖表模型對象,繪制最終圖形*/
[_aaChartView aa_drawChartWithChartModel:aaChartModel];
```

🌹🌹🌹 好了,至此,有關於繪制圖形的任務,壹切皆已經搞定!!! 妳將得到妳想要的任意圖形!!!🌈🌈🌈

### 更新圖形內容
如果妳需要更新圖表內容,妳應該閱讀以下內容,根據妳的實際需要,選擇調用適合妳的函數

*  僅僅刷新圖形的數據(進行數據的動態更新操作時,建議使用此方法)
```objective-c
/*僅僅更新 AAChartModel 對象的 series 屬性時,動態刷新圖表*/
[_aaChartView aa_onlyRefreshTheChartDataWithChartModelSeries:aaChartModelSeriesArray];
```

*  刷新圖形除數據屬性 `series` 以外的其他屬性(首次繪制圖形完成之後,後續刷新圖表的屬性均建議調用此方法 註意:僅僅刷新圖形數據,則建議使用上面的👆`aa_onlyRefreshTheChartDataWithChartModelSeries`方法)
```objective-c
/*更新 AAChartModel 內容之後,刷新圖表*/
[_aaChartView aa_refreshChartWithChartModel:aaChartModel];
```

##  `AAChartModel`一些重要屬性經過配置之後的圖形示例如下

-  ### line chart - 折線圖

![IMG_1867.JPG](https://github.com/AAChartModel/loadHtmlCssJsDemo-master/blob/master/AAChartKit/LineChart.png)

-  ### column chart - 柱狀圖

![IMG_1873.JPG](https://github.com/AAChartModel/loadHtmlCssJsDemo-master/blob/master/AAChartKit/ColumnChart.png)

- ###  bar chart - 條形圖

![IMG_1880.JPG](https://github.com/AAChartModel/loadHtmlCssJsDemo-master/blob/master/AAChartKit/BarChart.png)

- ### special area chart one - 折線區域填充圖

![IMG_1869.JPG](https://github.com/AAChartModel/loadHtmlCssJsDemo-master/blob/master/IMG_1482.JPG)

- ### special area chart two - 帶有負數的曲線區域填充圖

![IMG_1871.JPG](https://github.com/AAChartModel/loadHtmlCssJsDemo-master/blob/master/AAInfographics/AreaChartOne.png)

- ### special area chart three - 堆積狀態的折線區域填充圖

![IMG_1863.JPG](https://github.com/AAChartModel/loadHtmlCssJsDemo-master/blob/master/PictureResources/屏幕快照%202017-05-06%20下午6.58.15.png)

- ### radar chart - 多組數據的雷達圖

![IMG_1877.JPG](https://github.com/AAChartModel/loadHtmlCssJsDemo-master/blob/master/AAChartKit/RadarChart.png)

- ### polar chart - 極地圖

![IMG_1879.JPG](https://github.com/AAChartModel/loadHtmlCssJsDemo-master/blob/master/AAChartKit/PolarChart.png)

- ### pie chart - 環形圖(中間為空的扇形圖)

![IMG_1878.JPG](https://github.com/AAChartModel/loadHtmlCssJsDemo-master/blob/master/AAChartKit/PieChart.png)

- ### bubble chart - 氣泡圖

![IMG_1875.JPG](https://github.com/AAChartModel/loadHtmlCssJsDemo-master/blob/master/AAChartKit/BubbleChart.png)

- ### scatter chart - 散點圖

![scatter chart](https://github.com/AAChartModel/loadHtmlCssJsDemo-master/blob/master/AAInfographics/ScatterChart.png)

- ### arearange chart - 區域範圍填充圖

![arearange chart](https://github.com/AAChartModel/loadHtmlCssJsDemo-master/blob/master/AAInfographics/ArearangeChart.png)

- ### step area chart - 直方區域填充圖

![step area chart](https://github.com/AAChartModel/loadHtmlCssJsDemo-master/blob/master/AAInfographics/StepAreaChart.png)

- ### mixed chart - 混合圖形(折線圖&柱形範圍圖)

![mixed chart](https://github.com/AAChartModel/loadHtmlCssJsDemo-master/blob/master/AAInfographics/MixedChart.png)


### 更多圖形效果
 註意:如下的這幅`DEMO演示圖`為大小*6M*左右的`GIF動態圖`,如未顯示動態效果則說明圖片資源未全部加載。請耐心等待至圖片資源內容完全加載結束後，即可最終觀賞更多的項目的動態演示效果.

![AAChartKit-Live](https://github.com/AAChartModel/Gallery/blob/master/AAChartKit/AAChartKit-Live.gif)

## 特別說明

### 特殊類型圖表配置

***AAChartKit*** 中`扇形圖`、`氣泡圖`都歸屬為特殊類型,所以想要繪制`扇形圖`、`氣泡圖`,圖表模型 `AAChartModel` 設置稍有不同,示例如下

- 繪制扇形圖,你需要這樣配置模型 `AAChartModel`
```objective-c
AAChartModel *chartModel= AAObject(AAChartModel)
        .chartTypeSet(AAChartTypePie)
        .titleSet(@"編程語言熱度")
        .subtitleSet(@"虛擬數據")
        .dataLabelEnabledSet(true)//是否直接顯示扇形圖數據
        .yAxisTitleSet(@"攝氏度")
        .seriesSet(
                   @[AAObject(AASeriesElement)
                     .nameSet(@"語言熱度占比")
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
- 繪制氣泡圖,你需要這樣配置模型 `AAChartModel`


```objective-c


AAChartModel *chartModel= AAObject(AAChartModel)
        .chartTypeSet(AAChartTypeBubble)
        .titleSet(@"編程語言熱度")
        .subtitleSet(@"虛擬數據")
        .yAxisTitleSet(@"攝氏度")
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

***NOTE:*** 關於更多類型特殊圖表的 `AAChartModel`實例對象屬性配置,詳情請見 ***AAChartKit*** 工程 `Demo` 中的`SpecialChartVC.m`文件內容,查看文件內容詳情請點擊[這裏](https://github.com/AAChartModel/AAChartKit/blob/master/AAChartKitDemo/ChartsDemo/SpecialChartVC.m),您也可以選擇下載 `Demo` 後,在  `Xcode` 中查看 ***AAChartKit*** 的`SpecialChartVC.m`內容
  
### 當前已支持的圖表類型有十種以上,說明如下
```objective-c
typedef NSString *AAChartType;

AACHARTKIT_EXTERN AAChartType const AAChartTypeColumn;          //柱形圖
AACHARTKIT_EXTERN AAChartType const AAChartTypeBar;             //條形圖
AACHARTKIT_EXTERN AAChartType const AAChartTypeArea;            //折線區域填充圖
AACHARTKIT_EXTERN AAChartType const AAChartTypeAreaspline;      //曲線區域填充圖
AACHARTKIT_EXTERN AAChartType const AAChartTypeLine;            //折線圖
AACHARTKIT_EXTERN AAChartType const AAChartTypeSpline;          //曲線圖
AACHARTKIT_EXTERN AAChartType const AAChartTypeScatter;         //散點圖
AACHARTKIT_EXTERN AAChartType const AAChartTypePie;             //扇形圖
AACHARTKIT_EXTERN AAChartType const AAChartTypeBubble;          //氣泡圖
AACHARTKIT_EXTERN AAChartType const AAChartTypePyramid;         //金字塔圖
AACHARTKIT_EXTERN AAChartType const AAChartTypeFunnel;          //漏鬥圖
AACHARTKIT_EXTERN AAChartType const AAChartTypeColumnrange;     //柱形範圍圖
AACHARTKIT_EXTERN AAChartType const AAChartTypeArearange;       //區域折線範圍圖
AACHARTKIT_EXTERN AAChartType const AAChartTypeAreasplinerange; //區域曲線範圍圖
AACHARTKIT_EXTERN AAChartType const AAChartTypeBoxplot;         //箱線圖
AACHARTKIT_EXTERN AAChartType const AAChartTypeWaterfall;       //瀑布圖
AACHARTKIT_EXTERN AAChartType const AAChartTypePolygon;         //多邊形圖

```

### 當前已支持的圖表手勢縮放類型共有三種,說明如下
```objective-c
typedef NSString *AAChartZoomType;

AACHARTKIT_EXTERN AAChartZoomType const AAChartZoomTypeNone; //禁用手勢縮放功能(默認禁用手勢縮放)
AACHARTKIT_EXTERN AAChartZoomType const AAChartZoomTypeX;    //支持圖表 X軸橫向縮放
AACHARTKIT_EXTERN AAChartZoomType const AAChartZoomTypeY;    //支持圖表 Y軸縱向縮放
AACHARTKIT_EXTERN AAChartZoomType const AAChartZoomTypeXY;   //支持圖表等比例縮放
```
NOTE:例如,設置了`AAChartModel`的縮放屬性`zoomType`為`AAChartZoomTypeX`,並且將圖表進行了手勢放大之後,這時候如果想要左右滑動圖表,可以使用 **雙指點按** 屏幕中的`AAChartView`視圖區域進行 **左右拖動** 即可.同時屏幕的右上角會自動出現一個標題為 **"恢復縮放"** 的按鈕,點擊恢復縮放,圖表大小和位置將會回歸到原初的樣式.

### 當前已支持的圖表渲染動畫類型有三十種以上,說明如下
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

似下是**AAChartKit**其中拾種圖表渲染動畫類型

| Back      | Bounce    | Circ      | Cubic     | Elastic   |
|:---------:|:---------:|:---------:|:---------:|:---------:|
| ![][1]    | ![][2]    | ![][3]    | ![][4]    | ![][5]    |


| Expo      | Quad      | Quart     | Quint     | Sine      |
|:---------:|:---------:|:---------:|:---------:|:---------:|
| ![][6]    | ![][7]    | ![][8]    | ![][9]    | ![][10]   |

### `AAChartModel` 屬性配置列表
```objective-c
AAPropSetFuncImplementation(AAChartModel, NSString *, title);//標題內容
AAPropSetFuncImplementation(AAChartModel, NSNumber *, titleFontSize);//Title label font size
AAPropSetFuncImplementation(AAChartModel, NSString *, titleFontWeight);//Title label font weight
AAPropSetFuncImplementation(AAChartModel, NSString *, titleFontColor);//Title label font color

AAPropSetFuncImplementation(AAChartModel, NSString *, subtitle);//副標題內容
AAPropSetFuncImplementation(AAChartModel, NSNumber *, subtitleFontSize);//Subtitle label font size
AAPropSetFuncImplementation(AAChartModel, NSString *, subtitleFontWeight);//Subtitle label font weight
AAPropSetFuncImplementation(AAChartModel, NSString *, subtitleFontColor);//Subtitle flabel font color

AAPropSetFuncImplementation(AAChartModel, NSArray  *, series);//圖表的數據列內容
AAPropSetFuncImplementation(AAChartModel, NSArray  *, keys);//Key support

AAPropSetFuncImplementation(AAChartModel, AAChartSubtitleAlignType, subtitleAlign);//圖表副標題文本水平對齊方式。可選的值有 “left”，”center“和“right”。 默認是：center.
AAPropSetFuncImplementation(AAChartModel, AAChartType,              chartType);//圖表類型
AAPropSetFuncImplementation(AAChartModel, AAChartStackingType,      stacking);//堆積樣式
AAPropSetFuncImplementation(AAChartModel, AAChartSymbolType,        symbol);//折線曲線連接點的類型："circle", "square", "diamond", "triangle","triangle-down"，默認是"circle"
AAPropSetFuncImplementation(AAChartModel, AAChartSymbolStyleType,   symbolStyle);
AAPropSetFuncImplementation(AAChartModel, AAChartZoomType,          zoomType);//縮放類型 AAChartZoomTypeX 表示可沿著 x 軸進行手勢縮放
AAPropSetFuncImplementation(AAChartModel, AAChartAnimation,         animationType);//設置圖表的渲染動畫類型

AAPropSetFuncImplementation(AAChartModel, NSNumber *, animationDuration);//設置圖表的渲染動畫時長(動畫單位為毫秒)
AAPropSetFuncImplementation(AAChartModel, BOOL,       inverted);//x 軸是否垂直
AAPropSetFuncImplementation(AAChartModel, BOOL,       xAxisReversed);// x 軸翻轉
AAPropSetFuncImplementation(AAChartModel, BOOL,       yAxisReversed);//y 軸翻轉
AAPropSetFuncImplementation(AAChartModel, BOOL,       gradientColorEnabled);//是否要為漸變色
AAPropSetFuncImplementation(AAChartModel, BOOL,       polar);//是否極化圖形(變為雷達圖)
AAPropSetFuncImplementation(AAChartModel, BOOL,       dataLabelEnabled);//是否顯示數據
AAPropSetFuncImplementation(AAChartModel, NSString *, dataLabelFontColor);//Datalabel font color
AAPropSetFuncImplementation(AAChartModel, NSNumber *, dataLabelFontSize);//Datalabel font size
AAPropSetFuncImplementation(AAChartModel, NSString *, dataLabelFontWeight);//Datalabel font weight

AAPropSetFuncImplementation(AAChartModel, BOOL,       xAxisLabelsEnabled);//x 軸是否顯示數據
AAPropSetFuncImplementation(AAChartModel, NSNumber *, xAxisLabelsFontSize);//x-axis labels font size
AAPropSetFuncImplementation(AAChartModel, NSString *, xAxisLabelsFontWeight);//x-axis fonto weight
AAPropSetFuncImplementation(AAChartModel, NSString *, xAxisLabelsFontColor);//x-axis fonto color
AAPropSetFuncImplementation(AAChartModel, NSArray  *, categories);//圖表橫坐標每個點對應的名稱
AAPropSetFuncImplementation(AAChartModel, NSNumber *, xAxisGridLineWidth);//x 軸網格線的寬度
AAPropSetFuncImplementation(AAChartModel, NSNumber *, xAxisTickInterval);//x軸刻度點間隔數(設置每隔幾個點顯示一個 X軸的內容)

AAPropSetFuncImplementation(AAChartModel, BOOL,       xAxisVisible);//x 軸是否可見(默認可見)
AAPropSetFuncImplementation(AAChartModel, BOOL,       yAxisVisible);//y 軸是否可見(默認可見)
AAPropSetFuncImplementation(AAChartModel, BOOL,       yAxisLabelsEnabled);//y 軸是否顯示數據
AAPropSetFuncImplementation(AAChartModel, NSString *, yAxisTitle);//y 軸標題
AAPropSetFuncImplementation(AAChartModel, NSNumber *, yAxisLabelsFontSize);//y-axis labels font size
AAPropSetFuncImplementation(AAChartModel, NSString *, yAxisLabelsFontWeight);//y-axis fonto weight
AAPropSetFuncImplementation(AAChartModel, NSString *, yAxisLabelsFontColor);//y-axis fonto color
AAPropSetFuncImplementation(AAChartModel, NSNumber *, yAxisGridLineWidth);//y軸網格線的寬度
AAPropSetFuncImplementation(AAChartModel, NSArray     <NSString *>*, colorsTheme);//圖表主題顏色數組
AAPropSetFuncImplementation(AAChartModel, NSString *, backgroundColor);//圖表背景色(必須為十六進制的顏色色值如紅色"#FF0000")

AAPropSetFuncImplementation(AAChartModel, BOOL,       tooltipEnabled);//是否顯示浮動提示框(默認顯示)
AAPropSetFuncImplementation(AAChartModel, NSString *, tooltipValueSuffix);//浮動提示框單位後綴
AAPropSetFuncImplementation(AAChartModel, NSString *, tooltipValueString);//Tooltip string
AAPropSetFuncImplementation(AAChartModel, BOOL,       tooltipCrosshairs);//是否顯示準星線(默認顯示)
AAPropSetFuncImplementation(AAChartModel, BOOL,       connectNulls);//設置折線是否斷點重連(是否連接空值點)
AAPropSetFuncImplementation(AAChartModel, BOOL,       legendEnabled);//是否顯示圖例 lengend(圖表底部可點按的圓點和文字)

AAPropSetFuncImplementation(AAChartModel, BOOL,       options3dEnabled);//是否 3D 化圖形(僅對條形圖,柱狀圖有效)
AAPropSetFuncImplementation(AAChartModel, NSNumber *, options3dAlpha);
AAPropSetFuncImplementation(AAChartModel, NSNumber *, options3dBeta);
AAPropSetFuncImplementation(AAChartModel, NSNumber *, options3dDepth);//3D 圖形深度

AAPropSetFuncImplementation(AAChartModel, NSNumber *, borderRadius);//柱狀圖長條圖頭部圓角半徑(可用於設置頭部的形狀,僅對條形圖,柱狀圖有效)
AAPropSetFuncImplementation(AAChartModel, NSNumber *, markerRadius);//折線連接點的半徑長度

AAPropSetFuncImplementation(AAChartModel, BOOL,       yAxisAllowDecimals);//是否允許 y 軸顯示小數
AAPropSetFuncImplementation(AAChartModel, NSArray  *, yAxisPlotLines);//y 軸基線的配置
AAPropSetFuncImplementation(AAChartModel, NSNumber *, yAxisMax);//y 軸最大值
AAPropSetFuncImplementation(AAChartModel, NSNumber *, yAxisMin);//y 軸最小值（設置為0就不會有負數）
AAPropSetFuncImplementation(AAChartModel, NSArray  *, yAxisTickPositions);//自定義 y 軸坐標（如：[@(0), @(25), @(50), @(75) , (100)]）
AAPropSetFuncImplementation(AAChartModel, NSString *, zoomResetButtonText); //String to display in 'zoom reset button"


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
 *    　　┃　　　┃神獸保佑
 *    　　┃　　　┃永無BUG！
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
 
 
 ## 源代碼⛓
 語言版本 |  項目名稱 | 源代碼鏈接|
 ------------ | ------------- | ------------- |
 Swift | AAInfographics | https://github.com/AAChartModel/AAChartKit-Swift |
 Objective C | AAChartKit | https://github.com/AAChartModel/AAChartKit |
 

## 許可證

![](https://upload.wikimedia.org/wikipedia/commons/thumb/f/f8/License_icon-mit-88x31-2.svg/128px-License_icon-mit-88x31-2.svg.png)

本項目 ***AAChartKit*** 使用 `MIT許可證`,詳情請點擊[MIT LICENSE](https://github.com/AAChartModel/AAChartKit/blob/master/LICENSE)

## 聯系方式

-------------------------------------------------------------------------------
*  🌕 🌖 🌗 🌘     暖心提示   🌑 🌒 🌓 🌔
*
* 如果有任何使用上的問題,隨時歡迎您在 GitHub 上向我提 issue.
* GitHub Issues : https://github.com/AAChartModel/AAChartKit/issues
-------------------------------------------------------------------------------
*  如果您想參與到此項目的開源活動中來,也同樣隨時歡迎您聯系我
* GitHub        : https://github.com/AAChartModel
* StackOverflow : https://stackoverflow.com/users/7842508/codeforu
* JianShu       : http://www.jianshu.com/u/f1e6753d4254
* SegmentFault  : https://segmentfault.com/u/huanghunbieguan
-------------------------------------------------------------------------------

## 附言

在 ***AAChartKit*** 数据可视化图形框架的初始設計中,為提升`.js`文件的加載速度,故將所依賴的`.js`文件放置在本地.然而由於本項目功能較多,故放置於本地的附加`JavaScript`文件庫體積較大,整個`AAJSFiles`文件夾下所有的`.js`文件體積合計共有`250KB左右`(當然,在項目打包為壓縮後的`.ipa`工程安裝包文件時,是遠小於這個體積的),若對工程文件體積大小較為敏感的使用者,可使用以下建議的替代方案
1.  刪除在本 ***AAChartKit*** 項目文件中,`AAJSFiles`文件夾下的`4`項`.js`文件.需要被刪除的文件名稱如下
* AAHighchartsLib.js
* AAHighchartsMore.js
* AAHighcharts-3d.js
* AAFunnel.js
2.  將`AAChartView.html`文件中的以下內容
``` html
<script src="AAHighchartsLib.js">
</script>
<script src="AAHighchartsMore.js">
</script>
<script src="AAHighcharts-3d.js">
</script>
<script src="AAFunnel.js">
</script>
```
替換為
``` html
<script src="https://img.hcharts.cn/highcharts/highcharts.js">
</script>
<script src="https://img.hcharts.cn/highcharts/highcharts-more.js">
</script>
```
即可.

此方案是將原本加載放置在本地的`.js`依賴文件改為了加載放置在網絡上的`.js`文件,減小了本地文件大小,但有可能會有一定的網絡延遲(`0.5s以內`),所以建議 ***AAChartKit*** 用戶可根據自己的實際項目的開發需要,酌情選擇最終是否使用本替代方案.

## 待辦清單

 - [x] 支持圖形加載完成後用戶添加代理事件
 - [x] 支持圖形動態刷新全局內容
 - [x] 支持圖形動態刷新純數據`(series)`內容
 - [ ] 支持圖形實時刷新純數據並動態滾動
 - [x] 支持色彩圖層漸變效果
 - [x] 支持3D圖形效果,僅對`柱狀圖`、`條形圖`、`扇形圖`、`散點圖`、`氣泡圖`等部分圖形有效
 - [ ] 支持代碼覆蓋率測試
 - [ ] 支持使用`CocoaPods` 導入
 - [ ] 支持使用`Carthage` 導入
 - [x] 支持橫屏(全屏)效果
 - [x] 支持自由設置圖形渲染動畫
 - [ ] 支持已渲染圖形生成圖片文件
 - [ ] 支持生成圖片文件保存至系統相冊
 - [x] 支持用戶自由配置`AAOptions`模型對象屬性
 - [x] 支持圖形堆疊
 - [x] 支持圖形坐標軸反轉
 - [x] 支持渲染散點圖
 - [x] 支持渲染柱形範圍圖
 - [x] 支持渲染面積範圍圖
 - [x] 支持渲染面積範圍均線圖
 - [x] 支持渲染極地圖
 - [x] 支持渲染折線直方圖
 - [x] 支持渲染折線直方填充圖
 - [x] 支持渲染南丁格爾🌹玫瑰圖
 - [ ] 支持渲染矩形樹狀層級關系圖
 - [ ] 支持渲染活動刻度儀表圖
 - [ ] 支持為圖形添加點擊事件回調
 
 
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
