//
//  CustomStyleChartVC.m
//  AAChartKitDemo
//
//  Created by AnAn on 2018/11/13.
//  Copyright © 2018 Danny boy. All rights reserved.
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

#import "CustomStyleChartVC.h"
#import "AAChartKit.h"
#import "AAEasyTool.h"

@interface CustomStyleChartVC ()

@property (nonatomic, strong) AAChartModel *aaChartModel;
@property (nonatomic, strong) AAChartView  *aaChartView;

@end

@implementation CustomStyleChartVC

- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor = [UIColor whiteColor];

    self.aaChartView = [self setUpAAChartView];
    self.aaChartModel = [self setUpAAChartModel];
    [self.aaChartView aa_drawChartWithChartModel:self.aaChartModel];
}

- (AAChartView *)setUpAAChartView {
    CGRect chartViewFrame = CGRectMake(0, 88, self.view.frame.size.width, self.view.frame.size.height - 88);
    AAChartView *aaChartView = [[AAChartView alloc]initWithFrame:chartViewFrame];
    aaChartView.scrollEnabled = NO;
    [self.view addSubview:aaChartView];
    return aaChartView;
}

- (AAChartModel *)setUpAAChartModel {
    switch (self.chartType) {
        case 0: return [self setUpColorfulBarChart];
        case 1: return [self setUpColorfulGradientColorChart];
        case 2: return [self setUpDiscontinuousDataChart];
        case 3: return [self configureMixedLineChart];
        case 4: return [self configureColorfulColumnChart];
        case 5: return [self configureGradientColorBarChart];
        case 6: return [self configureHavePlotLinesChart];
        case 7: return [self configrueWithMinusNumberChart];
        case 8: return [self configureStepLineChart];
        case 9: return [self configureStepAreaChart];
        case 10: return [self configureNightingaleRoseChart];
        case 11: return [self configureCustomSingleDataLabelChart];
        case 12: return [self configureChartWithShadowStyle];
        case 13: return [self configureColorfulGradientAreaChart];
        case 14: return [self configureColorfulGradientSplineChart];
        case 15: return [self configureGradientColorAreasplineChart];
        case 16: return [self configureSpecialStyleMarkerOfSingleDataElementChart];
        case 17: return [self configureSpecialStyleColumnOfSingleDataElementChart];
        case 18: return [self configureAreaChartThreshold];
        default:
            return nil;
    }
}

- (AAChartModel *)setUpColorfulBarChart {
    NSArray *colorsNameArr = @[@"red",
                               @"orange",
                               @"yellow",
                               @"green",
                               @"cyan",
                               @"blue",
                               @"purple",
                               @"gray",
                               @"darkGray",
                               @"lightGray",
                               @"magenta",
                               @"brown",
                               @"black"];
    
    NSArray *colorsArr = @[[AAColor redColor],
                           [AAColor orangeColor],
                           [AAColor yellowColor],
                           [AAColor greenColor],
                           [AAColor cyanColor],
                           [AAColor blueColor],
                           [AAColor purpleColor],
                           [AAColor grayColor],
                           [AAColor darkGrayColor],
                           [AAColor lightGrayColor],
                           [AAColor magentaColor],
                           [AAColor brownColor],
                           [AAColor blackColor]
                           ];
    
    return AAChartModel.new
    .chartTypeSet(AAChartTypeBar)
    .animationTypeSet(AAChartAnimationBounce)
    .titleSet(@"Colorful Chart")
    .subtitleSet(@"use AAColor to get color string")
    .dataLabelsEnabledSet(false)
    .categoriesSet(colorsNameArr)
    .colorsThemeSet(colorsArr)
    .stackingSet(AAChartStackingTypePercent)
    .seriesSet(@[
                 AASeriesElement.new
                 .nameSet(@"Tokyo")
                 .dataSet(@[@7.0, @6.9, @9.5, @14.5, @18.2, @21.5, @25.2, @26.5, @23.3, @18.3, @13.9, @9.6])
                 .colorByPointSet(@true)
                 ]);
}

- (AAChartModel *)setUpColorfulGradientColorChart {
    NSArray *gradientColorNamesArr = @[@"oceanBlue",
                                       @"sanguine",
                                       @"lusciousLime",
                                       @"purpleLake",
                                       @"freshPapaya",
                                       @"ultramarine",
                                       @"pinkSugar",
                                       @"lemonDrizzle",
                                       @"victoriaPurple",
                                       @"springGreens",
                                       @"mysticMauve",
                                       @"reflexSilver",
                                       @"newLeaf",
                                       @"cottonCandy",
                                       @"pixieDust",
                                       @"fizzyPeach",
                                       @"sweetDream",
                                       @"firebrick",
                                       @"wroughtIron",
                                       @"deepSea",
                                       @"coastalBreeze",
                                       @"eveningDelight",
                                       ];
    
    NSArray *gradientColorArr = @[[AAGradientColor oceanBlueColor],
                                  [AAGradientColor sanguineColor],
                                  [AAGradientColor lusciousLimeColor],
                                  [AAGradientColor purpleLakeColor],
                                  [AAGradientColor freshPapayaColor],
                                  [AAGradientColor ultramarineColor],
                                  [AAGradientColor pinkSugarColor],
                                  [AAGradientColor lemonDrizzleColor],
                                  [AAGradientColor victoriaPurpleColor],
                                  [AAGradientColor springGreensColor],
                                  [AAGradientColor mysticMauveColor],
                                  [AAGradientColor reflexSilverColor],
                                  [AAGradientColor newLeafColor],
                                  [AAGradientColor cottonCandyColor],
                                  [AAGradientColor pixieDustColor],
                                  [AAGradientColor fizzyPeachColor],
                                  [AAGradientColor sweetDreamColor],
                                  [AAGradientColor firebrickColor],
                                  [AAGradientColor wroughtIronColor],
                                  [AAGradientColor deepSeaColor],
                                  [AAGradientColor coastalBreezeColor],
                                  [AAGradientColor eveningDelightColor],
                                  ];
    
    return AAChartModel.new
    .chartTypeSet(AAChartTypeBar)
    .titleSet(@"Colorful Column Chart")
    .subtitleSet(@"single data array colorful column chart")
    .categoriesSet(gradientColorNamesArr)
    .colorsThemeSet(gradientColorArr)
    .yAxisTitleSet(@"gradient color")
    .stackingSet(AAChartStackingTypePercent)
    .seriesSet(@[
                 AASeriesElement.new
                 .nameSet(@"ElementOne")
                 .dataSet(@[@3.9, @4.2, @5.7, @8.5, @11.9, @15.2, @17.0, @16.6, @14.2, @10.3, @6.6, @4.8,
                            @3.9, @4.2, @5.7, @8.5, @11.9, @15.2, @17.0, @16.6, @14.2, @10.3,])
                 .colorByPointSet(@true),//When using automatic point colors pulled from the options.colors collection, this option determines whether the chart should receive one color per series or one color per point. Default Value：false.
                 ]);
}

- (AAChartModel *)setUpDiscontinuousDataChart {
    return AAChartModel.new
    .chartTypeSet(AAChartTypeColumn)
    .yAxisTitleSet(@"")//设置Y轴标题
    .dataLabelsEnabledSet(true)//是否显示值
    .tooltipEnabledSet(true)
    .seriesSet(@[
                 AASeriesElement.new
                 .nameSet(@"所有专业")
                 .dataSet(@[@7.0, @6.9, @9.5, @14.5, @18.2,[NSNull null],[NSNull null],[NSNull null],[NSNull null], @21.5, @25.2, @26.5, @23.3, @18.3, @13.9, @9.6,])
                 .colorSet((id)[AAGradientColor deepSeaColor])
                 ]);
}

- (AAChartModel *)configureMixedLineChart {
    return AAChartModel.new
//    .connectNullsSet(true)//设置折线是否断点重连
    .chartTypeSet(AAChartTypeLine)
    .titleSet(@"")
    .subtitleSet(@"虚拟数据")
    .categoriesSet(@[@"Java",@"Swift",@"Python",@"Ruby", @"PHP",@"Go",@"C",@"C#",@"C++",@"Perl",@"R",@"MATLAB",@"SQL"])
    .yAxisTitleSet(@"摄氏度")
    .dataLabelsEnabledSet(true)
    .seriesSet(@[
                 AASeriesElement.new
                 .nameSet(@"本专业")
                 .dataSet(@[@45,@88,@49,@43,@65,@56,@47,@28,@49,@44,@89,@55])
                 .zoneAxisSet(@"x")
                 .colorSet((id)AAGradientColor.freshPapayaColor)
                 .lineWidthSet(@5)
                 .zonesSet(@[@{@"value": @8},
                             @{@"dashStyle": AALineDashStyleTypeDot}
                             ]),
                 AASeriesElement.new
                 .nameSet(@"所有专业")
                 .colorSet((id)AAGradientColor.pixieDustColor)
                 .lineWidthSet(@5)
                 .dataSet(@[[NSNull null],[NSNull null],@100,@109,@89,[NSNull null],[NSNull null],@120,[NSNull null],[NSNull null],[NSNull null],[NSNull null]])
                 ]);
}

- (AAChartModel *)configureColorfulColumnChart {
    return AAChartModel.new
    .chartTypeSet(AAChartTypeColumn)
    .titleSet(@"Colorful Column Chart")
    .subtitleSet(@"single data array colorful column chart")
    .colorsThemeSet([AAEasyTool configureTheRandomColorArrayWithColorNumber:14])
    .easyGradientColorsSet(true)
    .seriesSet(@[
                 AASeriesElement.new
                 .nameSet(@"ElementOne")
                 .dataSet(@[@211,@183,@157,@133,@111,@91,@73,@57,@43,@31,@21,@13,@7,@3])
                 .colorByPointSet(@true),//When using automatic point colors pulled from the options.colors collection, this option determines whether the chart should receive one color per series or one color per point. Default Value：false.
                 ]);
}

- (AAChartModel *)configureGradientColorBarChart {
    return AAChartModel.new
    .chartTypeSet(AAChartTypeBar)
    .titleSet(@"Bar Chart")
    .subtitleSet(@"gradient color bar")
    .borderRadiusSet(@5)
    .xAxisReversedSet(true)
    .seriesSet(@[
                 AASeriesElement.new
                 .nameSet(@"2020")
                 .dataSet(@[@211,@183,@157,@133,@111,@91,@73,@57,@43,@31,@21,@13,@7,@3])
                 .colorSet((id)[AAGradientColor oceanBlueColor]),
                 AASeriesElement.new
                 .nameSet(@"2021")
                 .dataSet(@[@111,@83,@187,@163,@151,@191,@173,@157,@143,@131,@121,@113,@97,@93])
                 .colorSet((id)[AAGradientColor sanguineColor]),
                 ]
               );
}

- (AAChartModel *)configureHavePlotLinesChart {
    NSArray *aaPlotLinesArr = @[
                                AAPlotLinesElement.new
                                .colorSet(@"#FF0000")//颜色值(16进制)
                                .dashStyleSet(AALineDashStyleTypeLongDashDotDot)//样式：Dash,Dot,Solid等,默认Solid
                                .widthSet(@(1)) //标示线粗细
                                .valueSet(@(10)) //所在位置
                                .zIndexSet(@(1)) //层叠,标示线在图表中显示的层叠级别，值越大，显示越向前
                                .labelSet((id)@{@"text":@"标示线1",@"x":@(0),@"style":@{@"color":@"#33bdfd"}})/*这里其实也可以像AAPlotLinesElement这样定义个对象来赋值（偷点懒直接用了字典，最会终转为js代码，可参考https://www.hcharts.cn/docs/basic-plotLines来写字典）*/
                                ,
                                AAPlotLinesElement.new
                                .colorSet(@"#FF0000")
                                .dashStyleSet(AALineDashStyleTypeLongDashDotDot)
                                .widthSet(@(1))
                                .valueSet(@(20))
                                .labelSet((id)@{@"text":@"标示线2",@"x":@(0),@"style":@{@"color":@"#33bdfd"}})
                                ];
    
    return AAChartModel.new
    .chartTypeSet(AAChartTypeArea)
    .markerSymbolSet(AAChartSymbolTypeCircle)
    .titleSet(@"带有数据阈值标志线的区域填充图")
    .markerRadiusSet(@6)//设置折线连接点宽度为0,即是隐藏连接点
    .subtitleSet(@"横屏查看效果更佳")
    .yAxisGridLineWidthSet(@0.5)
    .yAxisTitleSet(@"")
    .markerSymbolStyleSet(AAChartSymbolStyleTypeInnerBlank)
    .dataLabelsEnabledSet(true)
    .yAxisPlotLinesSet(aaPlotLinesArr)
    .seriesSet(@[
                 AASeriesElement.new
                 .nameSet(@"2017")
                 .dataSet(@[@7.0, @6.9, @9.5, @14.5, @18.2, @21.5, @25.2, @26.5, @23.3, @18.3, @13.9, @9.6,])
                 .lineWidthSet(@5)
                 .zonesSet(@[@{@"value": @10,@"color": @"#EA007B"},
                             @{@"value": @20,@"color": @"#FDC20A"},
                             @{@"color": @"#F78320"}]),
                 ])
    ;
}

- (AAChartModel *)configrueWithMinusNumberChart {
    return AAChartModel.new
    .chartTypeSet(AAChartTypeArea)
    .easyGradientColorsSet(true)
    //.dataLabelsEnabledSet(true)
    .titleSet(@"带有负数的区域填充图")
    .markerRadiusSet(@0)//设置折线连接点宽度为0,即是隐藏连接点
    .subtitleSet(@"横屏查看效果更佳")
    .yAxisGridLineWidthSet(@0)
    .categoriesSet(@[@"Java",@"Swift",@"Python",@"Ruby", @"PHP",@"Go",@"C",@"C#",@"C++",@"HTML",@"CSS",@"Perl",@"R",@"MATLAB",@"SQL"])
    .yAxisTitleSet(@"")
    .colorsThemeSet(@[@"#49C1B6", @"#FDC20A", @"#F78320", @"#068E81", @"#EA007B"])
    .seriesSet(@[
                 AASeriesElement.new
                 .nameSet(@"2017")
                 .dataSet(@[@0, @(-7.5), @(-1.0), @3.7, @0, @(-3), @8, @0,@(-3.6), @4, @(-2), @0]),
                 AASeriesElement.new
                 .nameSet(@"2018")
                 .dataSet(@[@0, @(-2.2), @2, @(-2.2), @0, @(-1.5), @0, @2.4, @(-1), @3, @(-1), @0]),
                 AASeriesElement.new
                 .nameSet(@"2019")
                 .dataSet(@[@0, @2.3, @0, @1.2, @(-1), @3, @0, @(-3.3), @0, @2, @(-0.3), @0]),
                 AASeriesElement.new
                 .nameSet(@"2020")
                 .dataSet(@[@0, @10, @0.13,@2,@0, @2, @0, @3.7, @0, @1, @(-3), @0]),
                 AASeriesElement.new
                 .nameSet(@"2020")
                 .dataSet(@[@0, @(-4.5), @(-0.9), @5.5, @(-1.9), @1.3, @(-2.8), @0, @(-1.7), @0, @3, @0, ]),
                 ]
               )
    ;
}

- (AAChartModel *)configureStepLineChart {
    return AAChartModel.new
    .chartTypeSet(AAChartTypeLine)//图形类型
    .animationTypeSet(AAChartAnimationBounce)//图形渲染动画类型为"bounce"
    .titleSet(@"STEP LINE CHART")//图形标题
    .subtitleSet(@"2020/08/08")//图形副标题
    .dataLabelsEnabledSet(NO)//是否显示数字
    .markerSymbolStyleSet(AAChartSymbolStyleTypeBorderBlank)//折线连接点样式
    .markerRadiusSet(@7)//折线连接点半径长度,为0时相当于没有折线连接点
    .seriesSet(@[
                 AASeriesElement.new
                 .nameSet(@"Berlin")
                 .dataSet(@[@450, @432, @401, @454, @590, @530, @510])
                 .stepSet(@"right"), //折线连接点靠右👉
                 AASeriesElement.new
                 .nameSet(@"New York")
                 .dataSet(@[@220, @282, @201, @234, @290, @430, @410])
                 .stepSet(@"center"),//折线连接点居中
                 AASeriesElement.new
                 .nameSet(@"Tokyo")
                 .dataSet(@[@120, @132, @101, @134, @90, @230, @210])
                 .stepSet(@"left"),//折线连接点靠左边👈
                 ]
               )
    ;
}

- (AAChartModel *)configureStepAreaChart {
    return AAChartModel.new
    .chartTypeSet(AAChartTypeArea)//图形类型
    .animationTypeSet(AAChartAnimationBounce)//图形渲染动画类型为"bounce"
    .easyGradientColorsSet(true)//开启主题渐变色
    .titleSet(@"STEP AREA CHART")//图形标题
    .subtitleSet(@"2020/08/08")//图形副标题
    .dataLabelsEnabledSet(NO)//是否显示数字
    .markerSymbolStyleSet(AAChartSymbolStyleTypeInnerBlank)//折线连接点样式
    .markerRadiusSet(@0)//折线连接点半径长度,为0时相当于没有折线连接点
    .seriesSet(@[
                 AASeriesElement.new
                 .nameSet(@"Berlin")
                 .dataSet(@[@450, @432, @401, @454, @590, @530, @510])
                 .stepSet(@(true))//设置折线样式为直方折线,连接点位置默认靠左👈
                 ,
                 AASeriesElement.new
                 .nameSet(@"New York")
                 .dataSet(@[@220, @282, @201, @234, @290, @430, @410])
                 .stepSet(@(true))//设置折线样式为直方折线,连接点位置默认靠左👈
                 ,
                 AASeriesElement.new
                 .nameSet(@"Tokyo")
                 .dataSet(@[@120, @132, @101, @134, @90, @230, @210])
                 .stepSet(@(true))//设置折线样式为直方折线,连接点位置默认靠左👈
                 ,
                 ]
               )
    ;
}

- (AAChartModel *)configureNightingaleRoseChart {
    return AAChartModel.new
    .titleSet(@"南丁格尔玫瑰图")
    .subtitleSet(@"极地图中的一种")
    .yAxisTitleSet(@"cm")
    .chartTypeSet(AAChartTypeColumn)
    //.xAxisVisibleSet(true)//是否显示最外一层圆环
    //.yAxisVisibleSet(false)//是否显示中间的多个圆环
    .legendEnabledSet(false)//隐藏图例(底部可点按的小圆点)
    .categoriesSet(@[@"一月", @"二月", @"三月", @"四月", @"五月", @"六月", @"七月", @"八月", @"九月", @"十月", @"十一月", @"十二月"])
    .dataLabelsEnabledSet(true)
    .polarSet(true)//极地化图形
    .seriesSet(@[
                 AASeriesElement.new
                 .nameSet(@"东京")
                 .dataSet(@[@7.0, @6.9, @9.5, @9.6, @13.9, @14.5, @18.3, @18.2, @21.5, @25.2, @26.5, @23.3]),
                 ]
               )
    ;
}

- (AAChartModel*)configureCustomSingleDataLabelChart {
    NSArray *dataArr =
    @[AADataElement.new
      .dataLabelsSet(AADataLabels.new
                     .enabledSet(true)
                     .styleSet(AAStyle.new
                               .fontSizeSet(@"20px")
                               .fontWeightSet(AAChartFontWeightTypeBold)
                               .colorSet(AAColor.redColor)
                               .textOutlineSet(@"1px 1px contrast")
                               )
                     .formatSet(@"{y} 美元🇺🇸💲")
                     .xSet(@3)
                     .verticalAlignSet(AALegendVerticalAlignTypeMiddle)
                     )
      .ySet(@7.0),
      @14.5,
      @18.2,
      @21.5,
      @25.2,
      AADataElement.new
      .dataLabelsSet(AADataLabels.new
                     .enabledSet(true)
                     .styleSet(AAStyle.new
                               .fontSizeSet(@"20px")
                               .fontWeightSet(AAChartFontWeightTypeBold)
                               .colorSet(AAColor.blueColor)
                               .textOutlineSet(@"0.5px 0.5px contrast")
                               )
                     .formatSet(@"{y} 英镑🇬🇧£")
                     .xSet(@3)
                     .verticalAlignSet(AALegendVerticalAlignTypeMiddle)
                     )
      .ySet(@26.5),
      @23.3,
      @18.3,
      @13.9,
      @9.6,
      AADataElement.new
      .dataLabelsSet(AADataLabels.new
                     .enabledSet(true)
                     .styleSet(AAStyle.new
                               .fontSizeSet(@"20px")
                               .fontWeightSet(AAChartFontWeightTypeBold)
                               .colorSet(AAColor.greenColor)
                               .textOutlineSet(@"1px 1px contrast")
                               )
                     .formatSet(@"{y} 日元🇯🇵￥")
                     .xSet(@3)
                     .verticalAlignSet(AALegendVerticalAlignTypeMiddle)
                     )
      .ySet(@6.9),
      ];
    
    
    return AAChartModel.new
    .titleSet(@"单独自定义某个指定数据元素的DataLabel")
    .subtitleSet(@"")
    .colorsThemeSet(@[AAGradientColor.mysticMauveColor])
    .seriesSet(@[
                 AASeriesElement.new
                 .nameSet(@"货币")
                 .dataSet(dataArr),
                 ]
               )
    ;
}

- (AAChartModel *)configureChartWithShadowStyle {
    return AAChartModel.new
    .titleSet(@"")
    .subtitleSet(@"")
    .yAxisVisibleSet(false)
    .chartTypeSet(AAChartTypeSpline)
    .legendEnabledSet(false)//隐藏图例(底部可点按的小圆点)
    .categoriesSet(@[@"一月", @"二月", @"三月", @"四月", @"五月", @"六月", @"七月", @"八月", @"九月", @"十月", @"十一月", @"十二月"])
    .markerSymbolStyleSet(AAChartSymbolStyleTypeInnerBlank)
    .markerRadiusSet(@8.0)
    .seriesSet(@[
                 AASeriesElement.new
                 .nameSet(@"Tokoyo")
                 .lineWidthSet(@8.0)
                 .dataSet(@[@7.0, @6.9, @2.5, @14.5, @18.2, @21.5, @5.2, @26.5, @23.3, @45.3, @13.9, @9.6])
                 .shadowSet(AAShadow.new
                            .offsetXSet(@15.0)
                            .offsetYSet(@15.0)
                            .opacitySet(@0.2)
                            .widthSet(@8.0)
                            .colorSet(AAColor.redColor)
                            ),
                 ]
               )
    ;
}

- (AAChartModel *)configureColorfulGradientAreaChart {
    NSDictionary *gradientColorDic1 =
    @{@"linearGradient": @{
              @"x1": @0,
              @"y1": @0,
              @"x2": @1,
              @"y2": @0
              },
      @"stops": @[@[@0.0, @"#febc0f"],
                  @[@0.5, @"#FF14d4"],
                  @[@1.0, @"#0bf8f5"]]//颜色字符串设置支持十六进制类型和 rgba 类型
      };
    
    return AAChartModel.new
    .chartTypeSet(AAChartTypeAreaspline)
    .titleSet(@"")
    .subtitleSet(@"")
    .categoriesSet(@[@"一月", @"二月", @"三月", @"四月", @"五月", @"六月",
                     @"七月", @"八月", @"九月", @"十月", @"十一月", @"十二月"])
    .yAxisTitleSet(@"")
    .backgroundColorSet(@"#FFFFFF")
    .markerRadiusSet(@0)
    .yAxisLineWidthSet(@0)
    .yAxisGridLineWidthSet(@0)
    .legendEnabledSet(false)
    .easyGradientColorsSet(true)
    .seriesSet(@[
                 AASeriesElement.new
                 .nameSet(@"Tokyo Hot")
                 .colorSet((id)gradientColorDic1)
                 .dataSet(@[@7.0, @6.9, @2.5, @14.5, @18.2, @21.5, @5.2, @26.5, @23.3, @45.3, @13.9, @9.6]),
                 ]
               );
}

- (AAChartModel *)configureColorfulGradientSplineChart {
    NSDictionary *gradientColorDic1 =
    @{@"linearGradient": @{
              @"x1": @0,
              @"y1": @0,
              @"x2": @1,
              @"y2": @0
              },
      @"stops": @[@[@0.00, @"#febc0f"],
                  @[@0.25, @"#FF14d4"],
                  @[@0.50, @"#0bf8f5"],
                  @[@0.75, @"#F33c52"],
                  @[@1.00, @"#1904dd"],
                  ]//颜色字符串设置支持十六进制类型和 rgba 类型
      };
    
    return AAChartModel.new
    .chartTypeSet(AAChartTypeSpline)
    .titleSet(@"")
    .subtitleSet(@"")
    .categoriesSet(@[@"一月", @"二月", @"三月", @"四月", @"五月", @"六月",
                     @"七月", @"八月", @"九月", @"十月", @"十一月", @"十二月"])
    .yAxisTitleSet(@"")
    .markerRadiusSet(@0)
    .yAxisLineWidthSet(@0)
    .yAxisGridLineWidthSet(@0)
    .legendEnabledSet(false)
    .easyGradientColorsSet(true)
    .seriesSet(@[
                 AASeriesElement.new
                 .nameSet(@"Tokyo Hot")
                 .lineWidthSet(@13)
                 .colorSet((id)gradientColorDic1)
                 .dataSet(@[@7.0, @6.9, @2.5, @14.5, @18.2, @21.5, @5.2, @26.5, @23.3, @45.3, @13.9, @9.6]),
                 ]
               );
}


- (AAChartModel *)configureGradientColorAreasplineChart {
    NSDictionary *gradientColorDic1 =
    [AAGradientColor gradientColorWithDirection:AALinearGradientDirectionToBottom
                               startColorString:@"rgba(255,20,147,1)"//深粉色, alpha 透明度 1
                                 endColorString:@"rgba(255,20,147,0.3)"];//热情的粉红, alpha 透明度 0.3
    
    return AAChartModel.new
    .chartTypeSet(AAChartTypeAreaspline)
    .titleSet(@"")
    .subtitleSet(@"")
    .categoriesSet(@[@"一月", @"二月", @"三月", @"四月", @"五月", @"六月",
                     @"七月", @"八月", @"九月", @"十月", @"十一月", @"十二月"])
    .yAxisTitleSet(@"")
    .markerRadiusSet(@8.0)//marker点半径为8个像素
    .markerSymbolStyleSet(AAChartSymbolStyleTypeInnerBlank)//marker点为空心效果
    .markerSymbolSet(AAChartSymbolTypeCircle)//marker点为圆形点○
    .yAxisLineWidthSet(@0)
    .yAxisGridLineWidthSet(@0)
    .legendEnabledSet(false)
    .easyGradientColorsSet(true)
    .seriesSet(@[
                 AASeriesElement.new
                 .nameSet(@"Tokyo Hot")
                 .lineWidthSet(@5.0)
                 .colorSet(@"rgba(220,20,60,1)")//猩红色, alpha 透明度 1
                 .fillColorSet((id)gradientColorDic1)
                 .dataSet(@[@7.0, @6.9, @2.5, @14.5, @18.2, @21.5, @5.2, @26.5, @23.3, @45.3, @13.9, @9.6]),
                 ]
               );
}

- (AAChartModel *)configureSpecialStyleMarkerOfSingleDataElementChart {
    NSDictionary *gradientColorDic1 =
    @{@"linearGradient": @{
              @"x1": @0,
              @"y1": @0,
              @"x2": @1,
              @"y2": @0
              },
      @"stops": @[@[@0.00, @"#febc0f"],
                  @[@0.25, @"#FF14d4"],
                  @[@0.50, @"#0bf8f5"],
                  @[@0.75, @"#F33c52"],
                  @[@1.00, @"#1904dd"],
                  ]//颜色字符串设置支持十六进制类型和 rgba 类型
      };

    AADataElement *singleSpecialData = AADataElement.new
    .markerSet(AAMarker.new
               .radiusSet(@8)//曲线连接点半径
               .symbolSet(AAChartSymbolTypeCircle)//曲线点类型："circle", "square", "diamond", "triangle","triangle-down"，默认是"circle"
               .fillColorSet(@"#FFFFFF")//点的填充色(用来设置折线连接点的填充色)
               .lineWidthSet(@5)//外沿线的宽度(用来设置折线连接点的轮廓描边的宽度)
               .lineColorSet(@"#FF0000")//外沿线的颜色(用来设置折线连接点的轮廓描边颜色，当值为空字符串时，默认取数据点或数据列的颜色)
               )
    .ySet(@26.5);

    return AAChartModel.new
    .chartTypeSet(AAChartTypeSpline)
    .titleSet(@"")
    .backgroundColorSet(@"#4b2b7f")
    .yAxisTitleSet(@"")//设置Y轴标题
    .dataLabelsEnabledSet(false)//是否显示值
    .tooltipEnabledSet(true)
    .markerRadiusSet(@0)
    .xAxisVisibleSet(false)
    .yAxisVisibleSet(false)
    .seriesSet(@[
                 AASeriesElement.new
                 .nameSet(@"Virtual Data")
                 .lineWidthSet(@6)
                 .dataSet(@[@7.0, @6.9, @2.5, @14.5, @18.2, singleSpecialData, @5.2, @26.5, @23.3, @45.3, @13.9, @9.6])
                 .colorSet((id)gradientColorDic1)
                 ]);
}

- (AAChartModel *)configureSpecialStyleColumnOfSingleDataElementChart {
    AADataElement *singleSpecialData = AADataElement.new
    .colorSet((id)AAGradientColor.freshPapayaColor)
    .ySet(@49.5);
    
    return AAChartModel.new
    .chartTypeSet(AAChartTypeColumn)
    .titleSet(@"")
    .yAxisTitleSet(@"")//设置Y轴标题
    .dataLabelsEnabledSet(false)//是否显示值
    .tooltipEnabledSet(false)
    .markerRadiusSet(@0)
    .xAxisVisibleSet(false)
    .yAxisVisibleSet(false)
    .seriesSet(@[
                 AASeriesElement.new
                 .nameSet(@"Virtual Data")
                 .lineWidthSet(@6)
                 .dataSet(@[@7.0, @6.9, @2.5, @14.5, @18.2, singleSpecialData, @5.2, @26.5, @23.3, @26.5, @13.9, @9.6])
                 .colorSet((id)AAGradientColor.oceanBlueColor)
                 ]);
}

- (AAChartModel *)configureAreaChartThreshold {
    NSDictionary *gradientColorDic1 =
    [AAGradientColor gradientColorWithDirection:AALinearGradientDirectionToBottom
                               startColorString:@"rgba(30, 144, 255,1)"//DodgerBlue, alpha 透明度 1
                                 endColorString:@"rgba(30, 144, 255,0.1)"];//DodgerBlue, alpha 透明度 0.1
    return AAChartModel.new
    .chartTypeSet(AAChartTypeArea)
    .titleSet(@"")
    .yAxisTitleSet(@"")//设置Y轴标题
    .yAxisGridLineWidthSet(@0)
    .categoriesSet(@[@"一月", @"二月", @"三月", @"四月", @"五月", @"六月",
                     @"七月", @"八月", @"九月", @"十月", @"十一月", @"十二月"])
    .dataLabelsEnabledSet(false)//是否显示值
    .markerRadiusSet(@8)
    .markerSymbolSet(AAChartSymbolTypeCircle)
    .markerSymbolStyleSet(AAChartSymbolStyleTypeInnerBlank)
    .legendEnabledSet(false)
    .seriesSet(@[
                 AASeriesElement.new
                 .thresholdSet(@(-200))
                 .dataSet(@[@106.4, @129.2, @269.9, @-100.5, @144.0, @176.0, @135.6, @148.5, @216.4, @194.1, @95.6, @54.4])
                 .lineWidthSet(@6)
                 .colorSet(@"rgba(30, 144, 255,1)")
                 .fillColorSet((id)gradientColorDic1)
                 ]);
}

@end

