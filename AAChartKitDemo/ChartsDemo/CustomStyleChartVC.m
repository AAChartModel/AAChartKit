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
#import "AAColor.h"
#import "AAGradientColor.h"

@interface CustomStyleChartVC ()

@end

@implementation CustomStyleChartVC

- (void)viewDidLoad {
    [super viewDidLoad];
    
    
    
}

- (AAChartModel *)setUpColorfulChart {
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
    
    AAChartModel *aaChartModel = AAChartModel.new
    .chartTypeSet(AAChartTypeBar)
    .animationTypeSet(AAChartAnimationBounce)
    .titleSet(@"Colorful Chart")
    .subtitleSet(@"use AAColor to get color string")
    .dataLabelEnabledSet(false)
    .categoriesSet(colorsNameArr)
    .colorsThemeSet(colorsArr)
    .stackingSet(AAChartStackingTypePercent)
    .seriesSet(@[AASeriesElement.new
                 .nameSet(@"Tokyo")
                 .dataSet(@[@7.0, @6.9, @9.5, @14.5, @18.2, @21.5, @25.2, @26.5, @23.3, @18.3, @13.9, @9.6])
                 .colorByPointSet(@true)
                 ]);
    
    return aaChartModel;
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
    
    AAChartModel *aaChartModel = AAChartModel.new
    .chartTypeSet(AAChartTypeArea)
    .titleSet(@"Colorful Column Chart")
    .subtitleSet(@"single data array colorful column chart")
    .categoriesSet(gradientColorNamesArr)
    .colorsThemeSet(gradientColorArr)
    .yAxisTitleSet(@"gradient color")
    .stackingSet(AAChartStackingTypeNormal)
    .seriesSet(@[AASeriesElement.new
                 .nameSet(@"ElementOne")
                 .dataSet(@[@3.9, @4.2, @5.7, @8.5, @11.9, @15.2, @17.0, @16.6, @14.2, @10.3, @6.6, @4.8])
                 .colorByPointSet(@true),//When using automatic point colors pulled from the options.colors collection, this option determines whether the chart should receive one color per series or one color per point. Default Value：false.
                 ]
               );
    
    return aaChartModel;
}

- (AAChartModel *)setUpDiscontinuousDataChart {
    NSDictionary *gradientColorDic1 =
    @{@"linearGradient": @{
              @"x1": @0,
              @"y1": @0,
              @"x2": @0,
              @"y2": @1
              },
      @"stops": @[@[@0,@"#8A2BE2"],
                  @[@1,@"#1E90FF"]]//颜色字符串设置支持十六进制类型和 rgba 类型
      };
    
    AAChartModel *aaChartModel = AAChartModel.new
    .chartTypeSet(AAChartTypeColumn)
    .yAxisTitleSet(@"")//设置Y轴标题
    .dataLabelEnabledSet(true)//是否显示值
    .tooltipEnabledSet(true)
    .seriesSet(@[
                 AASeriesElement.new
                 .nameSet(@"所有专业")
                 .dataSet(@[@7.0, @6.9, @9.5, @14.5, @18.2,[NSNull null],[NSNull null],[NSNull null],[NSNull null], @21.5, @25.2, @26.5, @23.3, @18.3, @13.9, @9.6,])
                 .colorSet((id)gradientColorDic1)
                 ])
    ;
    
    return aaChartModel;
}

@end

