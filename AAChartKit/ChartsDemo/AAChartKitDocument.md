# AAChartKit 2.0


##Features:
1. Support `iOS 7`、`ARC` & `Objective C`.
2. Powerful,support the  `column chart` `bar chart` `line chart` `spline chart` `pie chart` `polar chart` `radar chart` and other graphics.
3. Interactive、Animated,the `animation` is exquisite and deligate.
4. Support `chain programming syntax` like *Masonry* 
5. `AAChartView + AAChartModel = Chart`  In the AAChartKit,it follows a minimalist formula:Chart `view + Chart model = The chart you want`.  

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
##Samples
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









###More graphics

![AAChartKit功能演示.gif](http://upload-images.jianshu.io/upload_images/2412088-7b8595c810fc3bb5.gif?imageMogr2/auto-orient/strip)
