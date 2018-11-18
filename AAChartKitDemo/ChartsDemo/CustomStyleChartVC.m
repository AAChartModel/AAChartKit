//
//  CustomStyleChartVC.m
//  AAChartKitDemo
//
//  Created by AnAn on 2018/11/13.
//  Copyright © 2018 Danny boy. All rights reserved.
//

#import "CustomStyleChartVC.h"
#import "AAChartKit.h"
#import "AAGradientColor.h"

@interface CustomStyleChartVC ()

@end

@implementation CustomStyleChartVC

- (void)viewDidLoad {
    [super viewDidLoad];
    
    
   
}
    
    - (AAChartModel *)setUpColorfulGradientColorChart {
        NSArray *gradientColorNamesArr = @[
                                           @"oceanBlue",
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
        NSArray *gradientColorArr = @[AAGradientColor.oceanBlue,
                                      AAGradientColor.sanguine,
                                      AAGradientColor.lusciousLime,
                                      AAGradientColor.purpleLake,
                                      AAGradientColor.freshPapaya,
                                      AAGradientColor.ultramarine,
                                      AAGradientColor.pinkSugar,
                                      AAGradientColor.lemonDrizzle,
                                      AAGradientColor.victoriaPurple,
                                      AAGradientColor.springGreens,
                                      AAGradientColor.mysticMauve,
                                      AAGradientColor.reflexSilver,
                                      AAGradientColor.newLeaf,
                                      AAGradientColor.cottonCandy,
                                      AAGradientColor.pixieDust,
                                      AAGradientColor.fizzyPeach,
                                      AAGradientColor.sweetDream,
                                      AAGradientColor.firebrick,
                                      AAGradientColor.wroughtIron,
                                      AAGradientColor.deepSea,
                                      AAGradientColor.coastalBreeze,
                                      AAGradientColor.eveningDelight,
                                      ];
        
        AAChartModel *aaChartModel = AAChartModel.new
        .chartTypeSet(AAChartTypeBar)
        .titleSet(@"Colorful Column Chart")
        .subtitleSet(@"single data array colorful column chart")
        .categoriesSet(gradientColorNamesArr)
        .colorsThemeSet(gradientColorArr)
        .seriesSet(@[AASeriesElement.new
                     .nameSet(@"ElementOne")
                     .dataSet(@[@3.9, @4.2, @5.7, @8.5, @11.9, @15.2, @17.0, @16.6, @14.2, @10.3, @6.6, @4.8])
                     .colorByPointSet((id)@(true)),//When using automatic point colors pulled from the options.colors collection, this option determines whether the chart should receive one color per series or one color per point. Default Value：false.
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
