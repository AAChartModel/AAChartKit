//
//  EvaluateJSStringFunctionVC.m
//  AAChartKitDemo
//
//  Created by AnAn on 2019/9/22.
//  Copyright © 2019 Danny boy. All rights reserved.
//*************** ...... SOURCE CODE ...... ***************
//***...................................................***
//*** https://github.com/AAChartModel/AAChartKit        ***
//*** https://github.com/AAChartModel/AAChartKit-Swift  ***
//***...................................................***
//*************** ...... SOURCE CODE ...... ***************

/*
 
 * -------------------------------------------------------------------------------
 *
 * 🌕 🌖 🌗 🌘  ❀❀❀   WARM TIPS!!!   ❀❀❀ 🌑 🌒 🌓 🌔
 *
 * Please contact me on GitHub,if there are any problems encountered in use.
 * GitHub Issues : https://github.com/AAChartModel/AAChartKit/issues
 * -------------------------------------------------------------------------------
 * And if you want to contribute for this project, please contact me as well
 * GitHub        : https://github.com/AAChartModel
 * StackOverflow : https://stackoverflow.com/users/7842508/codeforu
 * JianShu       : https://www.jianshu.com/u/f1e6753d4254
 * SegmentFault  : https://segmentfault.com/u/huanghunbieguan
 *
 * -------------------------------------------------------------------------------
 
 */

#import "EvaluateJSStringFunctionVC.h"
#import "AAChartKit.h"

@interface EvaluateJSStringFunctionVC ()<AAChartViewEventDelegate>

@property (nonatomic, strong) AAChartModel *aaChartModel;
@property (nonatomic, strong) AAChartView  *aaChartView;

@end

@implementation EvaluateJSStringFunctionVC

- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor = [UIColor whiteColor];
    
    [self drawChart];
}

- (void)drawChart {
    _aaChartView = [self configureChartView];
    _aaChartView.delegate = self;

    
    if (_sampleChartTypeIndex == 0 || _sampleChartTypeIndex == 1) {
        AAChartModel *aaChartModel = [self configureChartModel];
        [_aaChartView aa_drawChartWithChartModel:aaChartModel];
        
    } else if (_sampleChartTypeIndex == 2 || _sampleChartTypeIndex == 3) {
        AAChartModel *aaChartModel = [self configureStackingColumnMixedLineChart];
        AAOptions *aaOptions = [AAOptionsConstructor configureChartOptionsWithAAChartModel:aaChartModel];
        if (_sampleChartTypeIndex == 2) {
            aaOptions.colors = @[
                AAGradientColor.springGreensColor,
                AAGradientColor.freshPapayaColor,
                AAGradientColor.pixieDustColor,
            ];
        } else if (_sampleChartTypeIndex == 3) {
            aaOptions.plotOptions.column.groupPadding = @0;
            aaOptions.plotOptions.column.borderRadius = @10;
            aaOptions.tooltip.followTouchMove = false;
            aaOptions.xAxis.minRange = @2;
            
            NSDictionary *gradientColorDic1 =
            [AAGradientColor gradientColorWithDirection:AALinearGradientDirectionToBottom
                                       startColorString:@"rgba(138,43,226,1)"
                                         endColorString:@"rgba(30,144,255,1)"];
            
            NSDictionary *gradientColorDic2 =
            [AAGradientColor gradientColorWithDirection:AALinearGradientDirectionToBottom
                                       startColorString:@"#00BFFF"
                                         endColorString:@"#00FA9A"];
            
            aaOptions.colors = @[
                gradientColorDic1,
                gradientColorDic2,
                AAGradientColor.sanguineColor,
            ];
        }
        
        [_aaChartView aa_drawChartWithOptions:aaOptions];
    } else if (_sampleChartTypeIndex == 4) {
        AAChartModel *aaChartModel = [self configureShowTooltipInSpecificPostionChartModel];
        [_aaChartView aa_drawChartWithChartModel:aaChartModel];
    } else if (_sampleChartTypeIndex == 5) {
        AAOptions *aaOptions = [self configurePentagonRadarChart];
        [_aaChartView aa_drawChartWithOptions:aaOptions];
    }
}


- (AAChartView *)configureChartView {
    CGFloat chartViewWidth  = self.view.frame.size.width;
    CGFloat chartViewHeight = self.view.frame.size.height - 88;
    AAChartView *aaChartView = [[AAChartView alloc]init];
    aaChartView.frame = CGRectMake(0, 88, chartViewWidth, chartViewHeight);
//    aaChartView.delegate = self;
    aaChartView.scrollEnabled = NO;//禁用 AAChartView 滚动效果
    [self.view addSubview:aaChartView];
    //设置 AAChartView 的背景色是否为透明
    aaChartView.isClearBackgroundColor = YES;
    return aaChartView;
}

- (AAChartModel *)configureChartModel {
    return AAChartModel.new
    .chartTypeSet(AAChartTypeLine)//图表类型
    .yAxisLineWidthSet(@0)//Y轴轴线线宽为0即是隐藏Y轴轴线
    .tooltipValueSuffixSet(@"℃")//设置浮动提示框单位后缀
    .yAxisGridLineStyleSet([AALineStyle styleWithWidth:@0])//y轴横向分割线宽度为0(即是隐藏分割线)
    .yAxisMaxSet(@95)
    .markerRadiusSet(@8)
    .markerSymbolSet(AAChartSymbolTypeCircle)
    .markerSymbolStyleSet(AAChartSymbolStyleTypeInnerBlank)
    .seriesSet(@[
        AASeriesElement.new
        .nameSet(@"2017")
        .lineWidthSet(@5)
        .dataSet(@[@60, @51, @52, @53, @64, @84, @65, @68, @63, @47, @72, @60, @65, @74, @66, @65, @71, @59, @65, @77, @52, @53, @58, @53]),
    ]);
    
}

- (AAChartModel *)configureStackingColumnMixedLineChart {
    NSArray *categories = @[
        @"孤<br>岛<br>危<br>机",
        @"使<br>命<br>召<br>唤",
        @"荣<br>誉<br>勋<br>章",
        @"狙<br>击<br>精<br>英",
        @"神<br>秘<br>海<br>域",
        @"最<br>后<br>生<br>还<br>者",
        @"巫<br>师<br>3<br>狂<br>猎",
        @"对<br>马<br>之<br>魂",
        @"蝙<br>蝠<br>侠<br>阿<br>甘<br>骑<br>士<br> .",
        @"地<br>狱<br>边<br>境",
        @"闪<br>客",
        @"忍<br>者<br>之<br>印"
    ];
    
    return AAChartModel.new
    .chartTypeSet(AAChartTypeColumn)
    .titleSet(@"16年1月-16年11月充值客单分析")
    .subtitleSet(@"BY MICVS")
    .categoriesSet(categories)
    .stackingSet(AAChartStackingTypeNormal)
    .tooltipEnabledSet(false)
    .zoomTypeSet(AAChartZoomTypeX)//‼️ 重要属性,需要支持 X 轴横向滚动
    .seriesSet(@[
        AASeriesElement.new
        .nameSet(@"新用户")
        .dataSet(@[
            @82.89,@67.54,@62.07,@59.43,@67.02,@67.09,@35.66,@71.78,@81.61,@78.85,@79.12,@72.30,
            @82.89,@67.54,@62.07,@59.43,@67.02,@67.09,@35.66,@71.78,@81.61,@78.85,@79.12,@72.30,
            @82.89,@67.54,@62.07,@59.43,@67.02,@67.09,@35.66,@71.78,@81.61,@78.85,@79.12,@72.30,
        ])
        ,
        AASeriesElement.new
        .nameSet(@"老用户")
        .dataSet(@[@198.66,@330.81,@151.95,@160.12,@222.56,@229.05,@128.53,@250.91,@224.47,@473.99,@126.85,@260.50])
        ,
        AASeriesElement.new
        .typeSet(AAChartTypeLine)
        .lineWidthSet(@6)
        .nameSet(@"总量")
        .dataSet(@[@281.55,@398.35,@214.02,@219.55,@289.57,@296.14,@164.18,@322.69,@306.08,@552.84,@205.97,@332.79])
        .markerSet(AAMarker.new
                   .radiusSet(@7)//曲线连接点半径，默认是4
                   .symbolSet(AAChartSymbolTypeCircle)//曲线点类型："circle", "square", "diamond", "triangle","triangle-down"，默认是"circle"
                   .fillColorSet(@"#ffffff")//点的填充色(用来设置折线连接点的填充色)
                   .lineWidthSet(@3)//外沿线的宽度(用来设置折线连接点的轮廓描边的宽度)
                   .lineColorSet(@"")//外沿线的颜色(用来设置折线连接点的轮廓描边颜色，当值为空字符串时，默认取数据点或数据列的颜色)
                   )
        ,
    ]);
}

- (AAChartModel *)configureShowTooltipInSpecificPostionChartModel {
    return AAChartModel.new
    .chartTypeSet(AAChartTypeLine)//图表类型
    .yAxisLineWidthSet(@0)//Y轴轴线线宽为0即是隐藏Y轴轴线
    .tooltipValueSuffixSet(@"℃")//设置浮动提示框单位后缀
    .yAxisGridLineStyleSet([AALineStyle styleWithWidth:@0])//y轴横向分割线宽度为0(即是隐藏分割线)
    .markerRadiusSet(@8)
    .markerSymbolSet(AAChartSymbolTypeCircle)
    .markerSymbolStyleSet(AAChartSymbolStyleTypeInnerBlank)
    .categoriesSet(@[
        @"一月", @"二月", @"三月", @"四月", @"五月", @"六月",
        @"七月", @"八月", @"九月", @"十月", @"十一月", @"十二月"
                   ])
    .seriesSet(@[
        AASeriesElement.new
        .nameSet(@"2019")
        .lineWidthSet(@5)
        .dataSet(@[@198.66,@330.81,@151.95,@160.12,@222.56,@229.05,@128.53,@250.91,@224.47,@473.99,@126.85,@260.50]),
        AASeriesElement.new
        .typeSet(AAChartTypeLine)
        .lineWidthSet(@6)
        .nameSet(@"2020")
        .dataSet(@[@281.55,@398.35,@214.02,@219.55,@289.57,@296.14,@164.18,@322.69,@306.08,@552.84,@205.97,@332.79])
               ]);
}

//五边形雷达图
- (AAOptions *)configurePentagonRadarChart {
    AALineStyle *gridLineStyle = [AALineStyle styleWithWidth:@1];
    
    AACrosshair *crosshair =
    [AACrosshair crosshairWithColor:AAColor.whiteColor
                          dashStyle:AAChartLineDashStyleTypeLongDashDotDot
                              width:@1.5];
    
    AAChartModel *aaChartModel = AAChartModel.new
    .chartTypeSet(AAChartTypeArea)
    .backgroundColorSet(AAColor.whiteColor)
    .categoriesSet(@[@"孤岛危机",@"美国末日",@"使命召唤",@"荣誉勋章",@"死亡搁浅"])
    .markerRadiusSet(@0)
    .polarSet(true)
    .legendEnabledSet(false)
    .tooltipEnabledSet(false)
    .xAxisGridLineStyleSet(gridLineStyle)
    .yAxisGridLineStyleSet(gridLineStyle)
    .xAxisCrosshairSet(crosshair)
    .yAxisCrosshairSet(crosshair)
    .yAxisMaxSet(@25)
    .yAxisTickPositionsSet(@[@5,@10,@15,@20,@25,])
    .seriesSet(@[
        AASeriesElement.new
        .colorSet(AAColor.whiteColor)
        .fillOpacitySet(@0.01)
        .dataLabelsSet(AADataLabels.new
                       .colorSet(AARgbaColor(30, 144, 255, 1.0)))
        .dataSet(@[@17.0, @16.9, @12.5,]),
               ]);
    
    AAOptions *aaOptions = [AAOptionsConstructor configureChartOptionsWithAAChartModel:aaChartModel];
    aaOptions.chart.marginLeft = @40;
    aaOptions.chart.marginRight = @40;
    
    aaOptions.yAxis.gridLineInterpolation = AAYAxisGridLineInterpolationPolygon;
    
    aaOptions.xAxis.lineWidth = @0;//避免多边形外环之外有额外套了一层无用的外环
    aaOptions.yAxis.plotBands = @[
        AAPlotBandsElement.new
        .fromSet(@0)
        .toSet(@5)
        .colorSet(AARgbaColor(255, 215, 0, 1.0)),
        AAPlotBandsElement.new
        .fromSet(@5)
        .toSet(@10)
        .colorSet(AARgbaColor(255, 215, 0, 0.8)),
        AAPlotBandsElement.new
        .fromSet(@10)
        .toSet(@15)
        .colorSet(AARgbaColor(255, 215, 0, 0.6)),
        AAPlotBandsElement.new
        .fromSet(@15)
        .toSet(@20)
        .colorSet(AARgbaColor(255, 215, 0, 0.4)),
        AAPlotBandsElement.new
        .fromSet(@20)
        .toSet(@25)
        .colorSet(AARgbaColor(255, 215, 0, 0.2)),
        
    ];
    
    aaOptions.xAxis.gridLineColor = AARgbaColor(255, 215, 0, 0.6);
    aaOptions.yAxis.gridLineColor = AARgbaColor(255, 215, 0, 1.0);
    
    AASeriesElement *element = aaOptions.series[0];
    element.dataSet(@[@17.0, @16.9, @12.5, @14.5, @18.2,])
    .dataLabelsSet(AADataLabels.new
                   .colorSet(AARgbaColor(255, 215, 0, 1.0)))
    ;
    return aaOptions;
}

#pragma mark -- AAChartView delegate
- (void)aaChartViewDidFinishLoad:(AAChartView *)aaChartView {
    NSLog(@"🔥🔥🔥🔥🔥 AAChartView content did finish load!!!");
    
    NSString *jsStr;
    if (self.sampleChartTypeIndex == 0) {
        jsStr = [self configureMaxMiniDataLabelJSFunctionString];
    } else if (self.sampleChartTypeIndex == 1) {
        jsStr = [self configureFirstSecondThirdDataLabelJSFunctionString];
    } else if (self.sampleChartTypeIndex == 2) {
        jsStr = [self configureFirstSecondThirdStackLabelJSFunctionString];
    } else if (self.sampleChartTypeIndex == 3) {
        [self.aaChartView aa_updateXAxisExtremesWithMin:0 max:6];
        return;
    } else if (self.sampleChartTypeIndex == 4) {
        jsStr = [self configureShowTooltipInSpecificPostionJSFunctionString];
    } else if (self.sampleChartTypeIndex == 5) {
        //在 aaChartViewDidFinishLoad 代理方法中注入自定义事件的 JavaScript 函数
        jsStr = [self configureAddEventForXAxisLabelsGroupElementJSFunctionString];
    }

    [self.aaChartView aa_evaluateJavaScriptStringFunction:jsStr];
}

- (void)aaChartView:(AAChartView *)aaChartView moveOverEventWithMessage:(AAMoveOverEventMessageModel *)message {
    NSDictionary *messageDic = @{
        @"category":message.category,
        @"index":@(message.index),
        @"name":message.name,
        @"offset":message.offset,
        @"x":message.x,
        @"y":message.y
    };
    
    NSString *str1 = [NSString stringWithFormat:@"👌👌👌👌 selected point series element name: %@\n",
                      message.name];
    NSString *str2 = [NSString stringWithFormat:@"user finger moved over!!!,get the move over event message: %@",
                      messageDic];
    NSLog(@"%@%@",str1, str2);
}

//在 didReceiveScriptMessage 代理方法中获得点击 X轴的文字🏷标签的回调
- (void)aaChartView:(AAChartView *)aaChartView didReceiveScriptMessage:(WKScriptMessage *)message {
        NSLog(@"📀📀📀📀📀 您选中的游戏名称是: 【%@】",message.body);
}

#pragma mark -- Configure JavaScript function string

- (NSString *)configureMaxMiniDataLabelJSFunctionString {
    //refer to highcharts sample  https://jshare.com.cn/hcharts.cn/hhhhov
    NSString *jsFunctionStr =
    @AAJSFunc((
function render(aaGlobalChart, point, text) {
    return aaGlobalChart.renderer
    .label(text
           + ': '
           + point.y, point.plotX
           + aaGlobalChart.plotLeft
           - 20,
           
           point.plotY
           + aaGlobalChart.plotTop - 45,
           
           'callout', point.plotX
           + aaGlobalChart.plotLeft,
           
           point.plotY
           + aaGlobalChart.plotTop)
    .css({
        color: '#FFFFFF',
        align: 'center',
    })
    .attr({
        fill: 'rgba(0, 0, 0, 0.75)',
        padding: 8,
        r: 5,
        zIndex: 6
    }).add();
}
               
function renderMinMaxLabel(aaGlobalChart) {
    var min = 1000,
    max = 0,
    pointsToShow = [0, 0],
    points = aaGlobalChart.series[0].points;
    Highcharts.each(points,
    function(p) {
        if (p.y > max) {
            pointsToShow[0] = p.index;
            max = p.y;
        }
        if (p.y < min) {
            pointsToShow[1] = p.index;
            min = p.y;
        }
    });
    var maxValuePoint = points[pointsToShow[0]];
    var minValuePoint = points[pointsToShow[1]];
    render(aaGlobalChart, maxValuePoint, 'Max Value');
    render(aaGlobalChart, minValuePoint, 'Min Value');
}

    renderMinMaxLabel(aaGlobalChart);));
    
    return jsFunctionStr;
}

- (NSString *)configureFirstSecondThirdDataLabelJSFunctionString {
    NSInteger firstMaxNumberIndex = 5;
    NSInteger secondMaxNumberIndex = 19;
    NSInteger thirdMaxNumberIndex = 13;
    
    NSString *jsStr =
    @AAJSFunc((
              function render(aaGlobalChart, point, text) {
                  return aaGlobalChart.renderer.label(text + ': ' + point.y,  point.plotX + aaGlobalChart.plotLeft -20 , point.plotY + aaGlobalChart.plotTop - 45, 'callout', point.plotX + aaGlobalChart.plotLeft, point.plotY + aaGlobalChart.plotTop)
                  .css({
                  color: '#FFFFFF',
                  align: 'center',
                  })
                  .attr({
                  fill: 'rgba(0, 0, 0, 0.75)',
                  padding: 8,
                  r: 5,
                  zIndex: 6
                  })
                  .add();
              }
              
              function renderFirstSecondThirdLabel(aaGlobalChart) {
                  var points = aaGlobalChart.series[0].points;
                  render(aaGlobalChart, points[firstMaxNumberIndex], '第一名');
                  render(aaGlobalChart, points[secondMaxNumberIndex], '第二名');
                  render(aaGlobalChart, points[thirdMaxNumberIndex], '第三名');
              }
              
              renderFirstSecondThirdLabel(aaGlobalChart);));
    
    NSString * firstMaxNumberIndexStr = [NSString stringWithFormat:@"%ld",(long)firstMaxNumberIndex];
    NSString * secondMaxNumberIndexStr = [NSString stringWithFormat:@"%ld",(long)secondMaxNumberIndex];
    NSString * thirdMaxNumberIndexStr = [NSString stringWithFormat:@"%ld",(long)thirdMaxNumberIndex];
    
   jsStr = [jsStr stringByReplacingOccurrencesOfString:@"firstMaxNumberIndex" withString:firstMaxNumberIndexStr];
   jsStr = [jsStr stringByReplacingOccurrencesOfString:@"secondMaxNumberIndex" withString:secondMaxNumberIndexStr];
   jsStr = [jsStr stringByReplacingOccurrencesOfString:@"thirdMaxNumberIndex" withString:thirdMaxNumberIndexStr];
    return jsStr;
}

- (NSString *)configureFirstSecondThirdStackLabelJSFunctionString {
    NSInteger firstMaxNumberIndex = 9;
    NSInteger secondMaxNumberIndex = 1;
    NSInteger thirdMaxNumberIndex = 11;
    
    NSString *jsStr =
    @AAJSFunc((
               function render(aaGlobalChart, point, text,colorIndex) {
                   var colorsArray = ["#1e90ff","#ef476f","#ffd066",];
                   var colorHexString = colorsArray[colorIndex];
                   return aaGlobalChart.renderer.label('   '+text,  point.plotX + aaGlobalChart.plotLeft -20 , point.plotY + aaGlobalChart.plotTop - 60, 'callout', point.plotX + aaGlobalChart.plotLeft, point.plotY + aaGlobalChart.plotTop)
                   .css({
                   color: '#FFFFFF',
                   align: 'center',
                   weight: 'bold',
                   })
                   .attr({
                   fill: colorHexString,
                   padding: 8,
                   r: 5,
                   zIndex: 6
                   })
                   .add();
               }
               function renderFirstSecondThirdLabel(aaGlobalChart) {
                   var points = aaGlobalChart.series[0].points;
                   render(aaGlobalChart, points[\(firstMaxNumberIndex)], '第一名',0);
                   render(aaGlobalChart, points[\(secondMaxNumberIndex)], '第二名',1);
                   render(aaGlobalChart, points[\(thirdMaxNumberIndex)], '第三名',2);
               }
               
               renderFirstSecondThirdLabel(aaGlobalChart);
               ));
    
    NSString * firstMaxNumberIndexStr = [NSString stringWithFormat:@"%ld",(long)firstMaxNumberIndex];
    NSString * secondMaxNumberIndexStr = [NSString stringWithFormat:@"%ld",(long)secondMaxNumberIndex];
    NSString * thirdMaxNumberIndexStr = [NSString stringWithFormat:@"%ld",(long)thirdMaxNumberIndex];
    
    jsStr = [jsStr stringByReplacingOccurrencesOfString:@"firstMaxNumberIndex" withString:firstMaxNumberIndexStr];
    jsStr = [jsStr stringByReplacingOccurrencesOfString:@"secondMaxNumberIndex" withString:secondMaxNumberIndexStr];
    jsStr = [jsStr stringByReplacingOccurrencesOfString:@"thirdMaxNumberIndex" withString:thirdMaxNumberIndexStr];
    return jsStr;
}

//参考动态刷新在线实例 https://jshare.com.cn/demos/hhhhDv
//参考 chart.tooltip.refresh() 报错问题 https://blog.csdn.net/u013025674/article/details/96289674?utm_medium=distribute.pc_relevant.none-task-blog-BlogCommendFromMachineLearnPai2-13.nonecase&depth_1-utm_source=distribute.pc_relevant.none-task-blog-BlogCommendFromMachineLearnPai2-13.nonecase
- (NSString *)configureShowTooltipInSpecificPostionJSFunctionString {
    return @AAJSFunc((
       function activeLastPointToolip(chart) {
           let point0 = chart.series[0].points[0];
           let point1 = chart.series[1].points[0];
           let twoSeriesPoints = [point0,point1];
           chart.tooltip.refresh(twoSeriesPoints);
       }
       activeLastPointToolip(aaGlobalChart);
                          ));;
}

//【案例分享】Highcharts 坐标轴标签点击高亮: https://blog.jianshukeji.com/highcharts/highlight-label-by-click.html
// 实现方法是找到轴标签 DOM，然后手动添加点击事件并处理。其中 x 轴标签的 DOM 是 axis.labelGroup.element, 添加事件我们用 Highcharts.addEvent，

//配置将要注入的自定义事件的 JavaScript 函数
- (NSString *)configureAddEventForXAxisLabelsGroupElementJSFunctionString {
    return @AAJSFunc((Highcharts.addEvent(aaGlobalChart.xAxis[0].labelGroup.element, 'click', e => {
        let category = e.target.innerHTML;
        window.webkit.messageHandlers.customevent.postMessage(category);
    });));
}

@end
