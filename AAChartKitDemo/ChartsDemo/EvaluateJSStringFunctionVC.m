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
        AAChartModel *aaChartModel = [self configureCharModel];
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
    }
}


- (AAChartView *)configureChartView {
    CGFloat chartViewWidth  = self.view.frame.size.width;
    CGFloat chartViewHeight = self.view.frame.size.height;
    AAChartView *aaChartView = [[AAChartView alloc]init];
    aaChartView.frame = CGRectMake(0, 60, chartViewWidth, chartViewHeight);
    aaChartView.delegate = self;
    aaChartView.scrollEnabled = NO;//禁用 AAChartView 滚动效果
    [self.view addSubview:aaChartView];
    //设置 AAChartView 的背景色是否为透明
    aaChartView.isClearBackgroundColor = YES;
    return aaChartView;
}

- (AAChartModel *)configureCharModel {
    return AAChartModel.new
    .chartTypeSet(AAChartTypeLine)//图表类型
    .titleSet(@"")//图表主标题
    .subtitleSet(@"")//图表副标题
    .yAxisLineWidthSet(@0)//Y轴轴线线宽为0即是隐藏Y轴轴线
    .yAxisTitleSet(@"")//设置 Y 轴标题
    .tooltipValueSuffixSet(@"℃")//设置浮动提示框单位后缀
    .yAxisGridLineWidthSet(@0)//y轴横向分割线宽度为0(即是隐藏分割线)
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
    .yAxisTitleSet(@"")
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
    } else {
        [self.aaChartView aa_updateXAxisExtremesWithMin:0 max:4];
        return;
    }
    
    [self.aaChartView aa_evaluateJavaScriptStringFunction:jsStr];
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


@end
