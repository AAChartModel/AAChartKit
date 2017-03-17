## 使用方法

### 准备工作
1. 将项目demo中的文件夹*AAChartKitFiles*拖入到所需项目中.
1. 在你的项目的 *.pch* 全局宏定义文件中添加
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
[chartView aa_drawChartWithChartModel:chartModel];
```
### AAChartModel 属性配置
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





