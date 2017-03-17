## 使用方法

### 准备工作
1. 将项目demo中的文件夹==AAChartKitFiles==拖入到所需项目中.
1. 在你的项目的 ==pch== 全局宏定义文件中添加
```
#import "AAGlobalMacro.h"
```

### 正式开始
1. 在你的视图控制器文件中添加
```
#import "AAChartView.h"
```
2. 创建视图
```
AAChartView *chartView = [[AAChartView alloc]init];
self.view.backgroundColor = [UIColor whiteColor];
chartView.frame = CGRectMake(0, 60, self.view.frame.size.width, self.view.frame.size.height-220);
[self.view addSubview:chartView];
```
3. 配置视图模型

```
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

```
[chartView aa_drawChartWithChartModel:chartModel];
```






