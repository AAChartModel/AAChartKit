# AAChartKit 2.0

[![Support](https://img.shields.io/badge/support-iOS%206%2B%20-blue.svg?style=flat)](https://www.apple.com/nl/ios/) 
[![](https://img.shields.io/badge/License-MIT-brightgreen.svg)](https://github.com/AAChartModel/AAChartKit/blob/master/AAChartKit/ChartsDemo/LICENSE) 
[![](https://img.shields.io/badge/language-OC-green.svg)](https://github.com/AAChartModel/AAChartKit) 
[![](https://img.shields.io/badge/support-Animation-yellow.svg)](https://github.com/AAChartModel/AAChartKit-Swift) 
[![](https://img.shields.io/badge/support-Swift-orange.svg)](https://github.com/AAChartModel/AAChartKit-Swift) 
[![](https://img.shields.io/badge/Live-ChartsShow-red.svg)](http://htmlpreview.github.io/?https://github.com/AAChartModel/AAChartKit/blob/master/AAChartKit/ChartsDemo/AAChartKitDocumentLive.html) 
### 您所喜爱的`AAChartKit`开源图表库现在更有`swift`版本可供使用,详情请点击以下链接
### 传送门
#### *https://github.com/AAChartModel/AAChartKit-Swift*
***
## 前言
###### AAChartKit项目,是在流行的开源前端图表库*Highcharts*的基础上,封装的面向对象的,一组简单易用,极其精美的图表绘制控件.
1. 适配 `iOS 6`,  支持`ARC`,支持 `OC`语言,配置简单.
2. 功能强大,支持`柱状图`  `条形图`  `折线图`  `填充图` `雷达图` `扇形图` `气泡图`等多种图形
3. `动画`效果细腻精致,流畅优美.
4. 支持类 *Masonry* `链式编程语法`
5. `AAChartView +AAChartModel = Chart`,在 AAChartKit 封装库当中,遵循这样一个极简主义公式:`图表视图控件+图表模型=你想要的图表`.
### *亲爱的,如果您使用时,觉得满意,请赏一颗星星✨,您的鼓励将是我继续努力的一大动力*.
***

## 使用方法

### 准备工作
1. 将项目demo中的文件夹`AAChartKitLib`拖入到所需项目中.
1. 在你的项目的 `.pch` 全局宏定义文件中添加
```objective-c
#import "AAGlobalMacro.h"
```

### 正式开始
1. 在你的视图控制器文件中添加
```objective-c
#import "AAChartView.h"
```
2. 创建视图AAChartView
```objective-c
AAChartView *chartView = [[AAChartView alloc]init];
self.view.backgroundColor = [UIColor whiteColor];
chartView.frame = CGRectMake(0, 60, self.view.frame.size.width, self.view.frame.size.height-220);
chartView.contentHeight =self.view.frame.size.height-220;//设置图表视图的内容高度(默认 contentHeight 和 AAChartView 的高度相同)
[self.view addSubview:chartView];
```
3. 配置视图模型AAChartModel
```objective-c
    AAChartModel *chartModel= AAObject(AAChartModel)
    .chartTypeSet(AAChartTypeColumn)//设置图表的类型(这里以设置的为柱状图为例)
    .titleSet(@"编程语言热度")//设置图表标题
    .subtitleSet(@"虚拟数据")//设置图表副标题
    .categoriesSet(@[@"Java",@"Swift",@"Python",@"Ruby", @"PHP",@"Go",@"C",@"C#",@"C++"])//设置图表横轴的内容
    .yAxisTitleSet(@"摄氏度")//设置图表 y 轴的单位
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
4.  绘制图形(创建 AAChartView 实例对象后,首次绘制图形调用此方法)
```objective-c
[chartView aa_drawChartWithChartModel:chartModel];//图表视图对象调用图表模型对象,绘制最终图形
```
5.  刷新图形(首次绘制图形完成之后,后续刷新均建议调用此方法)

```objective-c
[chartView aa_refreshChartWithChartModel:chartModel];//更新 AAChartModel 内容之后,刷新图表
```

6.  仅仅刷新图形的数据(进行数据的动态更新操作时,建议使用此方法)
```objective-c
[chartView aa_onlyRefreshTheChartDataWithChartModel:chartModel];//仅仅更新 AAChartModel 对象的 series 属性时,动态刷新图表
```

7. 特别说明

AAChartKit 中扇形图、气泡图都归属为特殊类型,所以想要绘制扇形图、气泡图,图表模型 AAChartModel 设置稍有不同,示例如下

- 绘制扇形图,你需要这样配置模型 AAChartModel
```objective-c
AAChartModel *chartModel= AAObject(AAChartModel)
        .chartTypeSet(AAChartTypePie)
        .titleSet(@"编程语言热度")
        .subtitleSet(@"虚拟数据")
        .dataLabelEnabledSet(true)//是否直接显示扇形图数据
        .yAxisTitleSet(@"摄氏度")
        .seriesSet(
                   @[AAObject(AASeriesElement)
                     .nameSet(@"语言热度占比")
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
- 绘制气泡图,你需要这样配置模型 AAChartModel


```objective-c


AAChartModel *chartModel= AAObject(AAChartModel)
        .chartTypeSet(AAChartTypeBubble)
        .titleSet(@"编程语言热度")
        .subtitleSet(@"虚拟数据")
        .yAxisTitleSet(@"摄氏度")
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
                                @[@11, @54, @8],
                                @[@86, @55, @93],
                                @[@5,  @3, @58],
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
8. 当前已支持的图表类型有十种以上,说明如下
```objective-c
typedef NSString *AAChartType;
static AAChartType const AAChartTypeColumn      = @"column";     //柱形图
static AAChartType const AAChartTypeBar         = @"bar";        //条形图
static AAChartType const AAChartTypeArea        = @"area";       //折线区域填充图
static AAChartType const AAChartTypeAreaspline  = @"areaspline"; //曲线区域填充图
static AAChartType const AAChartTypeLine        = @"line";       //折线图
static AAChartType const AAChartTypeSpline      = @"spline";     //曲线图
static AAChartType const AAChartTypeScatter     = @"scatter";    //散点图
static AAChartType const AAChartTypePie         = @"pie";        //扇形图
static AAChartType const AAChartTypeBubble      = @"bubble";     //气泡图
static AAChartType const AAChartTypePyramid     = @"pyramid";    //金字塔图
static AAChartType const AAChartTypeFunnel      = @"funnel";     //漏斗图
static AAChartType const AAChartTypeColumnrange = @"columnrange";//柱形范围图
```

9. 当前已支持的图表渲染动画类型有三十种以上,说明如下
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
###  AAChartModel一些重要属性经过配置之后的图形示例如下
- line chart - 折线图

![IMG_1867.JPG](https://github.com/AAChartModel/AAChartKit/blob/master/AAChartKit/ChartsDemo/IMG_1867.JPG)
- column chart - 柱形图
 
![IMG_1873.JPG](https://github.com/AAChartModel/loadHtmlCssJsDemo-master/blob/master/IMG_1483.JPG)

-   bar chart - 条形图

![IMG_1880.JPG](https://github.com/AAChartModel/AAChartKit/blob/master/AAChartKit/ChartsDemo/IMG_1880.JPG
)

-  special area chart one - 区域填充图一

![IMG_1869.JPG](https://github.com/AAChartModel/loadHtmlCssJsDemo-master/blob/master/IMG_1482.JPG)

-  special area chart two - 区域填充图二

![IMG_1871.JPG](https://github.com/AAChartModel/AAChartKit/blob/master/AAChartKit/ChartsDemo/IMG_1874.JPG)


-  special area chart three - 区域填充图三

![IMG_1863.JPG](https://github.com/AAChartModel/loadHtmlCssJsDemo-master/blob/master/PictureResources/屏幕快照%202017-05-06%20下午6.58.15.png)

-   radar chart - 雷达图

![IMG_1877.JPG](https://github.com/AAChartModel/AAChartKit/blob/master/AAChartKit/ChartsDemo/IMG_1877.JPG
)

-   polar chart - 极地图

![IMG_1879.JPG](https://github.com/AAChartModel/AAChartKit/blob/master/AAChartKit/ChartsDemo/IMG_1879.JPG
)
-   pie chart - 扇形图

![IMG_1878.JPG](https://github.com/AAChartModel/AAChartKit/blob/master/AAChartKit/ChartsDemo/IMG_1878.JPG
)

- the oval style column chart - 头部为椭圆形的柱形图

![IMG_1866.JPG](https://github.com/AAChartModel/AAChartKit/blob/master/AAChartKit/ChartsDemo/IMG_1866.JPG)

- bubble chart - 气泡图

![IMG_1875.JPG](https://github.com/AAChartModel/AAChartKit/blob/master/AAChartKit/ChartsDemo/IMG_1875.JPG
)

- mixed chart - 混合图形

![IMG_1882.JPG](https://github.com/AAChartModel/AAChartKit/blob/master/AAChartKit/ChartsDemo/IMG_1882.JPG)

### AAChartModel 属性配置列表
```objective-c
AAPropStatementAndFuncStatement(copy, AAChartModel, NSString *, title);//标题内容
AAPropStatementAndFuncStatement(copy, AAChartModel, NSString *, subtitle);//副标题内容
AAPropStatementAndFuncStatement(copy, AAChartModel, AAChartSubtitleAlignType, subtitleAlign);//图表副标题文本水平对齐方式。可选的值有 “left”，”center“和“right”。 默认是：center.
AAPropStatementAndFuncStatement(copy, AAChartModel, AAChartType, chartType);//图表类型
AAPropStatementAndFuncStatement(copy, AAChartModel, AAChartStackingType, stacking);//堆积样式
AAPropStatementAndFuncStatement(copy, AAChartModel, AAChartSymbolType, symbol);//折线曲线连接点的类型："circle", "square", "diamond", "triangle","triangle-down"，默认是"circle"
AAPropStatementAndFuncStatement(copy, AAChartModel, AAChartZoomType, zoomType);//缩放类型 AAChartZoomTypeX表示可沿着 x 轴进行手势缩放
AAPropStatementAndFuncStatement(assign, AAChartModel, BOOL, pointHollow);//折线曲线的连接点是否为空心的
AAPropStatementAndFuncStatement(assign, AAChartModel, BOOL, inverted);//x 轴是否垂直
AAPropStatementAndFuncStatement(assign, AAChartModel, BOOL, xAxisReversed);// x 轴翻转
AAPropStatementAndFuncStatement(assign, AAChartModel, BOOL, yAxisReversed);//y 轴翻转
AAPropStatementAndFuncStatement(assign, AAChartModel, BOOL, crosshairs);//是否显示准星线(默认显示)
AAPropStatementAndFuncStatement(assign, AAChartModel, BOOL, gradientColorEnable);//是否要为渐变色
AAPropStatementAndFuncStatement(assign, AAChartModel, BOOL, polar);//是否极化图形(变为雷达图)
AAPropStatementAndFuncStatement(assign, AAChartModel, BOOL, dataLabelEnabled);//是否显示数据
AAPropStatementAndFuncStatement(assign, AAChartModel, BOOL, xAxisLabelsEnabled);//x轴是否显示数据
AAPropStatementAndFuncStatement(strong, AAChartModel, NSArray *, categories);//图表横坐标每个点对应的名称
AAPropStatementAndFuncStatement(strong, AAChartModel, NSNumber *, xAxisGridLineWidth);//x轴网格线的宽度
AAPropStatementAndFuncStatement(assign, AAChartModel, BOOL, yAxisLabelsEnabled);//y轴是否显示数据
AAPropStatementAndFuncStatement(copy,   AAChartModel, NSString *, yAxisTitle);//y轴标题
AAPropStatementAndFuncStatement(strong, AAChartModel, NSNumber *, yAxisGridLineWidth);//y轴网格线的宽度
AAPropStatementAndFuncStatement(strong, AAChartModel, NSArray *, colorsTheme);//图表主题颜色数组
AAPropStatementAndFuncStatement(strong, AAChartModel, NSArray *, series);
AAPropStatementAndFuncStatement(assign, AAChartModel, BOOL, legendEnabled);//是否显示图例
AAPropStatementAndFuncStatement(copy,   AAChartModel, AAChartLegendLayoutType, legendLayout);//图例数据项的布局。布局类型： "horizontal" 或 "vertical" 即水平布局和垂直布局 默认是：horizontal.
AAPropStatementAndFuncStatement(copy,   AAChartModel, AAChartLegendAlignType, legendAlign);//设定图例在图表区中的水平对齐方式，合法值有left，center 和 right。
AAPropStatementAndFuncStatement(copy,   AAChartModel, AAChartLegendVerticalAlignType, legendVerticalAlign);//设定图例在图表区中的垂直对齐方式，合法值有 top，middle 和 bottom。垂直位置可以通过 y 选项做进一步设定。
AAPropStatementAndFuncStatement(copy,   AAChartModel, NSString *, backgroundColor);//图表背景色
AAPropStatementAndFuncStatement(assign, AAChartModel, BOOL, options3dEnable);//是否3D化图形(仅对条形图,柱状图有效)
AAPropStatementAndFuncStatement(strong, AAChartModel, NSNumber *, options3dAlpha);
AAPropStatementAndFuncStatement(strong, AAChartModel, NSNumber *, options3dBeta);
AAPropStatementAndFuncStatement(strong, AAChartModel, NSNumber *, options3dDepth);//3D图形深度
AAPropStatementAndFuncStatement(strong, AAChartModel, NSNumber *, borderRadius);//柱状图长条图头部圆角半径(可用于设置头部的形状,仅对条形图,柱状图有效)
AAPropStatementAndFuncStatement(strong, AAChartModel, NSNumber *, markerRadius);//折线连接点的半径长度

```



### 更多图形效果
>>> * 注意:如下的这幅`DEMO演示图`为大小*6M*左右的`GIF动态图`,如未显示动态效果则说明图片资源未全部加载。请耐心等待至图片资源内容完全加载结束后，即可最终观赏更多的项目的动态演示效果.

![image](https://github.com/AAChartModel/AAChartKit/blob/master/AAChartKit/ChartsDemo/AAChartKitShow.gif)


### 作者
An An 
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

### 许可证
本项目使用 MIT许可证,详情请点击[MIT LICENSE](https://github.com/AAChartModel/AAChartKit/blob/master/AAChartKit/ChartsDemo/LICENSE)

### 附言
在 `AAChartKit` 封装库的初始设计中,为提升`.js`文件的加载速度,故将所依赖的`.js`文件放置在本地.然而由于本项目功能较多,故放置于本地的附加`JavaScript`文件库体积较大,整个`AAJSFiles`文件夹下所有的`.js`文件体积合计共有`5.3M左右`(当然,在项目打包为压缩后的`.ipa`工程安装包文件时,是远小于这个体积的),若对工程文件体积大小较为敏感的使用者,可使用以下建议的替代方案
1.  删除在本`AAChartKit`项目文件中,`AAJSFiles`文件夹下的`5`项`.js`文件.需要被删除的文件名称如下
* AAJQueryLibrary.js 
* AAHighchartsLibrary.js
* AAHighchartsMore.js
* AAHighcharts-3d.js
* AAFunnel.js
2.  将`AAChartView.html`文件中的以下内容
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
替换为
``` html
<script src="https://img.hcharts.cn/jquery/jquery-1.8.3.min.js">
</script>
<script src="https://img.hcharts.cn/highcharts/highcharts.js">
</script>
<script src="https://img.hcharts.cn/highcharts/highcharts-more.js">
</script>
```
即可.

此方案是将原本加载放置在本地的`.js`依赖文件改为了加载放置在网络上的`.js`文件,减小了本地文件大小,但有可能会有一定的网络延迟(`0.5s以内`),所以建议`AAChartKit`用户可根据自己的实际项目的开发需要,酌情选择最终是否使用本替代方案.

### 待办清单
>>>>> * - [x] 支持图形加载完成后用户添加代理事件
>>>>> * - [x] 支持图形动态刷新全局内容
>>>>> * - [x] 支持图形动态刷新纯数据`(series)`内容
>>> * - [ ] 支持图形实时刷新纯数据并动态滚动
>>>>> * - [x] 支持色彩图层渐变效果
>>>>> * - [x] 支持3D图形效果,仅对`柱状图、条形图、扇形图、散点图、气泡图`等部分图形有效
>>> * - [ ] 支持横屏(全屏)效果
>>> * - [ ] 支持自由设置图形渲染动画
>>> * - [ ] 支持已渲染图形生成图片文件
>>> * - [ ] 支持生成图片文件保存至系统相册
>>> * - [ ] 支持用户自由配置`AAOptions`模型对象属性
>>>>> * - [x] 支持图形堆叠
>>>>> * - [x] 支持图形坐标轴反转
>>>>> * - [x] 支持渲染散点图
>>>>> * - [x] 支持渲染柱形范围图
>>>>> * - [x] 支持渲染面积范围图
>>> * - [ ] 支持渲染面积范围均线图
>>>>> * - [x] 支持渲染极地图
>>> * - [ ] 支持渲染折线直方图
>>> * - [ ] 支持渲染折线直方填充图
>>> * - [ ] 支持渲染矩形树状层级关系图
>>> * - [ ] 支持渲染活动刻度仪表图
>>> * - [ ] 支持为图形添加点击事件回调

