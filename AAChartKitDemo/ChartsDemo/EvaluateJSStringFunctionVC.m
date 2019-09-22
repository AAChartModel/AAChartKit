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
    
    [self configureChartView];
    [self configureCharModel];
    [_aaChartView aa_drawChartWithChartModel:_aaChartModel];
    _aaChartView.delegate = self;

}


- (void)configureChartView {
    CGFloat chartViewWidth  = self.view.frame.size.width;
    CGFloat chartViewHeight = self.view.frame.size.height;
    _aaChartView = [[AAChartView alloc]init];
    _aaChartView.frame = CGRectMake(0, 60, chartViewWidth, chartViewHeight);
    _aaChartView.delegate = self;
    _aaChartView.scrollEnabled = NO;//禁用 AAChartView 滚动效果
    [self.view addSubview:_aaChartView];
    //设置 AAChartView 的背景色是否为透明
    _aaChartView.isClearBackgroundColor = YES;
}

- (void)configureCharModel {
    if (_sampleChartTypeIndex == 2) {
        _aaChartModel = [self configureStackingColumnMixedLineChart];
        return;
    }
    
    _aaChartModel = AAChartModel.new
    .chartTypeSet(AAChartTypeLine)//图表类型
    .titleSet(@"")//图表主标题
    .subtitleSet(@"")//图表副标题
    .yAxisLineWidthSet(@0)//Y轴轴线线宽为0即是隐藏Y轴轴线
    .colorsThemeSet(@[@"#fe117c",@"#ffc069",@"#06caf4",@"#7dffc0"])//设置主体颜色数组
    .yAxisTitleSet(@"")//设置 Y 轴标题
    .tooltipValueSuffixSet(@"℃")//设置浮动提示框单位后缀
    .backgroundColorSet(@"#4b2b7f")
    .yAxisGridLineWidthSet(@0)//y轴横向分割线宽度为0(即是隐藏分割线)
    .touchEventEnabledSet(true)//支持用户点击事件
    .markerSymbolSet(AAChartSymbolTypeCircle)
    .markerSymbolStyleSet(AAChartSymbolStyleTypeInnerBlank)
    .seriesSet(@[
                 AASeriesElement.new
                 .nameSet(@"2017")
                 .dataSet(@[@29.9, @71.5, @106.4, @129.2, @144.0, @176.0, @135.6, @148.5, @216.4, @194.1, @95.6, @54.4]),
                 ]
               );
    
}

- (AAChartModel *)configureStackingColumnMixedLineChart {
    NSArray *categories =
    @[@"孤<br>岛<br>危<br>机",
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
      @"忍<br>者<br>之<br>印"];
    
    return AAChartModel.new
    .chartTypeSet(AAChartTypeColumn)
    .titleSet(@"16年1月-16年11月充值客单分析")
    .subtitleSet(@"BY MICVS")
    .yAxisTitleSet(@"")
    .categoriesSet(categories)
    .stackingSet(AAChartStackingTypeNormal)
    .seriesSet(@[
                 AASeriesElement.new
                 .nameSet(@"新用户")
                 .colorSet((id)AAGradientColor.mysticMauveColor)
                 .dataSet(@[@82.89,@67.54,@62.07,@59.43,@67.02,@67.09,@35.66,@71.78,@81.61,@78.85,@79.12,@72.30])
                 .dataLabelsSet(AADataLabels.new
                                .enabledSet(YES)
                                .styleSet(AAStyle.new
                                          .colorSet(@"#000000")
                                          .fontSizeSet(@"11px")
                                          )
                                )
                 ,
                 AASeriesElement.new
                 .nameSet(@"老用户")
                 .colorSet((id)AAGradientColor.deepSeaColor)
                 .dataSet(@[@198.66,@330.81,@151.95,@160.12,@222.56,@229.05,@128.53,@250.91,@224.47,@473.99,@126.85,@260.50])
                 .dataLabelsSet(AADataLabels.new
                                .enabledSet(YES)
                                .styleSet(AAStyle.new
                                          .colorSet(@"#000000")
                                          .fontSizeSet(@"11px")
                                          )
                                )
                 ,
                 AASeriesElement.new
                 .typeSet(AAChartTypeLine)
                 .lineWidthSet(@5)
                 .nameSet(@"总量")
                 .colorSet((id)AAGradientColor.sanguineColor)
                 .dataSet(@[@281.55,@398.35,@214.02,@219.55,@289.57,@296.14,@164.18,@322.69,@306.08,@552.84,@205.97,@332.79])
                 .dataLabelsSet(AADataLabels.new
                                .enabledSet(YES)
                                .styleSet(AAStyle.new
                                          .colorSet(@"#000000")
                                          .fontSizeSet(@"15px")
                                          .fontWeightSet(AAChartFontWeightTypeBold)
                                          )
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
    } else {
        jsStr = [self configureFirstSecondThirdStackLabelJSFunctionString];
    }
    
    [self.aaChartView aa_evaluateJavaScriptStringFunction:jsStr];
}

#pragma mark -- Configure JavaScript function string

- (NSString *)configureMaxMiniDataLabelJSFunctionString {
    //refer to highcharts sample  https://jshare.com.cn/hcharts.cn/hhhhov
    NSString *jsFunctionStr =
    @AAJSFunc((
               function render(aaGlobalChart, point, text) {
        return aaGlobalChart.renderer.label(text + ': ' + point.y, point.plotX + aaGlobalChart.plotLeft - 20, point.plotY + aaGlobalChart.plotTop - 45, 'callout', point.plotX + aaGlobalChart.plotLeft, point.plotY + aaGlobalChart.plotTop).css({
        color: '#FFFFFF',
        align: 'center',
        }).attr({
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
                   render(aaGlobalChart, points[pointsToShow[0]], 'Max');
                   render(aaGlobalChart, points[pointsToShow[1]], 'Min');
               }
               
               renderMinMaxLabel(aaGlobalChart);));
    
    return jsFunctionStr;
}

- (NSString *)configureFirstSecondThirdDataLabelJSFunctionString {
    NSInteger firstMaxNumberIndex = 8;
    NSInteger secondMaxNumberIndex = 9;
    NSInteger thirdMaxNumberIndex = 5;
    
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
