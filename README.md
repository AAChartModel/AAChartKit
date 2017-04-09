# AAChartKit 2.0


## Features:
1. Support `iOS 7`、`ARC` & `Objective C`.
2. Powerful,support the  `column chart` `bar chart` `line chart` `spline chart` `pie chart` `polar chart` `radar chart` and other graphics.
3. Interactive、Animated,the `animation` is exquisite and deligate.
4. Support `chain programming syntax` like *Masonry* 
5. `AAChartView + AAChartModel = Chart`  In the AAChartKit,it follows a minimalist formula: ` Chart view + Chart model = The chart you want`.  

*PORTRAL*
*https://github.com/AAChartModel/AAChartKit*

## Method of use:

### The need of preparation
1. Drag the folder `AAChartKitFiles` into your project.
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

5.Special instructions

Pie chart and bubble chart are special in AAChartKit,if you want to draw These charts,you should do some different things for AAChartModel,for example

- To draw a pie chart,you should config the properties of `AAChartModel` like this:
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
- To draw a  AAChartModel


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
## Samples
- line chart

![IMG_1867.JPG](http://upload-images.jianshu.io/upload_images/2412088-98b871988b57d435.JPG?imageMogr2/auto-orient/strip%7CimageView2/2/w/1240)
- column chart

![IMG_1873.JPG](http://upload-images.jianshu.io/upload_images/2412088-c791a9a5bee44502.JPG?imageMogr2/auto-orient/strip%7CimageView2/2/w/1240)

-  special area chart one 

![IMG_1871.JPG](http://upload-images.jianshu.io/upload_images/2412088-199de612208c6a17.JPG?imageMogr2/auto-orient/strip%7CimageView2/2/w/1240)
-  special area chart two

![IMG_1869.JPG](http://upload-images.jianshu.io/upload_images/2412088-d089326452b19a11.JPG?imageMogr2/auto-orient/strip%7CimageView2/2/w/1240)
-  special area chart three

![IMG_1863.JPG](http://upload-images.jianshu.io/upload_images/2412088-dbbcf79f7946bb96.JPG?imageMogr2/auto-orient/strip%7CimageView2/2/w/1240)

-   stacked polar chart

![IMG_1870.JPG](http://upload-images.jianshu.io/upload_images/2412088-2d08fb7437c80e40.JPG?imageMogr2/auto-orient/strip%7CimageView2/2/w/1240)
-   percent stacked polar chart

![IMG_1868.JPG](http://upload-images.jianshu.io/upload_images/2412088-db06aeb086a41209.JPG?imageMogr2/auto-orient/strip%7CimageView2/2/w/1240)

- the oval style column chart

![IMG_1866.JPG](http://upload-images.jianshu.io/upload_images/2412088-4e2e142fc4bae5c2.JPG?imageMogr2/auto-orient/strip%7CimageView2/2/w/1240)
- the wedge syle column chart

![IMG_1865.JPG](http://upload-images.jianshu.io/upload_images/2412088-aaed41eb3c989d48.JPG?imageMogr2/auto-orient/strip%7CimageView2/2/w/1240)
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

![AAChartKit功能演示.gif](http://upload-images.jianshu.io/upload_images/2412088-7b8595c810fc3bb5.gif?imageMogr2/auto-orient/strip)


# AAChartKit 2.0
###### AAChartKit项目,是在流行的开源前端图表库*Highcharts*的基础上,封装的面向对象的,一组简单易用,极其精美的图表绘制控件.
1. 适配 `iOS 7`,  支持`ARC`,支持 `OC`语言,配置简单.
2. 功能强大,支持`柱状图`  `条形图`  `折线图`  `填充图` `雷达图` `扇形图` `气泡图`等多种图形
3. `动画`效果细腻精致,流畅优美.
4. 支持类 *Masonry* `链式编程语法`
5. `AAChartView +AAChartModel = Chart`,在 AAChartKit 封装库当中,遵循这样一个极简主义公式:`图表视图控件+图表模型=你想要的图表`.
### *亲爱的,如果您使用时,觉得满意,请赏一颗星星✨,您的鼓励将是我继续努力的一大动力*.
 
## 使用方法

### 准备工作
1. 将项目demo中的文件夹`AAChartKitFiles`拖入到所需项目中.
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
4.  绘制图形

```objective-c
[chartView aa_drawChartWithChartModel:chartModel];//图表视图对象调用图表模型对象,绘制最终图形
```
5. 特别说明

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
###  AAChartModel一些重要属性经过配置之后的图形示例如下
- 常规折线图
![image]( https://github.com/AAChartModel/AAChartKit/blob/master/AAChartKit/ChartsDemo/IMG_1867.JPG)
 - 常规柱形图
![image]( https://github.com/AAChartModel/AAChartKit/blob/master/AAChartKit/ChartsDemo/IMG_1873.JPG)

-  y 轴翻转的堆积曲线填充图 
![image]( https://github.com/AAChartModel/AAChartKit/blob/master/AAChartKit/ChartsDemo/IMG_1871.JPG)
-  x 轴直立并且 y 轴翻转的堆积曲线填充图
![image]( https://github.com/AAChartModel/AAChartKit/blob/master/AAChartKit/ChartsDemo/IMG_1869.JPG)
-  x 轴直立并且 y 轴翻转的百分比堆积曲线填充图
![image]( https://github.com/AAChartModel/AAChartKit/blob/master/AAChartKit/ChartsDemo/IMG_1863.JPG)

-   辐射化堆积折线填充图
![image]( https://github.com/AAChartModel/AAChartKit/blob/master/AAChartKit/ChartsDemo/IMG_1870.JPG)
-   辐射化百分比堆积折线填充图
![image]( https://github.com/AAChartModel/AAChartKit/blob/master/AAChartKit/ChartsDemo/IMG_1868.JPG)

- 头部为椭圆形的百分比堆积柱形图
![image]( https://github.com/AAChartModel/AAChartKit/blob/master/AAChartKit/ChartsDemo/IMG_1866.JPG)
- 头部为楔形的百分比堆积条形图
![image]( https://github.com/AAChartModel/AAChartKit/blob/master/AAChartKit/ChartsDemo/IMG_1865.JPG)
### AAChartModel 属性配置列表
```objective-c
AAPropStatementAndFuncStatement(copy, AAChartModel, NSString *, title);//标题内容
AAPropStatementAndFuncStatement(copy, AAChartModel, NSString *, subtitle);//副标题内容

AAPropStatementAndFuncStatement(copy, AAChartModel, NSString *, chartType);//图表类型
AAPropStatementAndFuncStatement(copy, AAChartModel, NSString *, stacking);//堆积样式
AAPropStatementAndFuncStatement(copy, AAChartModel, NSString *, symbol);//曲线点类型："circle", "square", "diamond", "triangle","triangle-down"，默认是"circle"
AAPropStatementAndFuncStatement(copy, AAChartModel, NSString *, zoomType);//缩放类型

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
AAPropStatementAndFuncStatement(copy,   AAChartModel , NSString *, legendLayout);
AAPropStatementAndFuncStatement(copy,   AAChartModel , NSString *, legendAlign);
AAPropStatementAndFuncStatement(copy,   AAChartModel , NSString *, legendVerticalAlign);

AAPropStatementAndFuncStatement(copy,   AAChartModel, NSString *, backgroundColor);//图表背景色
AAPropStatementAndFuncStatement(assign, AAChartModel, BOOL, options3dEnable);//是否3D化图形(仅对条形图,柱状图有效)
AAPropStatementAndFuncStatement(strong, AAChartModel, NSNumber *, options3dAlpha);
AAPropStatementAndFuncStatement(strong, AAChartModel, NSNumber *, options3dBeta);
AAPropStatementAndFuncStatement(strong, AAChartModel, NSNumber *, options3dDepth);//3D图形深度

AAPropStatementAndFuncStatement(strong, AAChartModel, NSNumber *, borderRadius);//柱状图长条图头部圆角半径(可用于设置头部的形状)
AAPropStatementAndFuncStatement(strong, AAChartModel, NSNumber *, markerRadius);//折线连接点的半径长度

```



### 更多图形效果

 ![image](https://github.com/AAChartModel/AAChartKit/blob/master/AAChartKit/ChartsDemo/AAChartKit功能演示.gif)





