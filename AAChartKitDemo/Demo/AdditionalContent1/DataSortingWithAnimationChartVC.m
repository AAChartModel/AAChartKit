//
//  ChartRaceWithBarChartVC.m
//  AAChartKitDemo
//
//  Created by AnAn on 2020/6/16.
//  Copyright © 2020 AnAn. All rights reserved.
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
 * StackOverflow : https://stackoverflow.com/users/12302132/codeforu
 * JianShu       : https://www.jianshu.com/u/f1e6753d4254
 * SegmentFault  : https://segmentfault.com/u/huanghunbieguan
 *
 * -------------------------------------------------------------------------------
 
 */

#import "DataSortingWithAnimationChartVC.h"
#import "AAChartKit.h"
@interface DataSortingWithAnimationChartVC ()

@property (nonatomic, strong) NSTimer *timer;
@property (nonatomic, assign) int globalInt;

@end

@implementation DataSortingWithAnimationChartVC

- (void)viewWillDisappear:(BOOL)animated {
    [super viewWillDisappear:animated];
    [_timer invalidate];
    _timer = nil;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    
    [self setupTimer];
}

//https://jsfiddle.net/gh/get/library/pure/highcharts/highcharts/tree/master/samples/highcharts/demo/column-comparison/
- (AAChartType)configureChartType {
    switch (self.selectedIndex) {
        case 0: return AAChartTypeColumn;
        case 1: return AAChartTypeBar;
        case 2: return AAChartTypeScatter;
    }
    return nil;
}

- (id)chartConfigurationWithSelectedIndex:(NSUInteger)selectedIndex {
    NSArray *colorArr = @[
        AAGradientColor.oceanBlueColor,
        AAGradientColor.sanguineColor,
        AAGradientColor.lusciousLimeColor,
        AAGradientColor.purpleLakeColor,
        AAGradientColor.freshPapayaColor,
        AAGradientColor.ultramarineColor,
        AAGradientColor.pinkSugarColor,
        AAGradientColor.lemonDrizzleColor,
        AAGradientColor.victoriaPurpleColor,
        AAGradientColor.springGreensColor,
        AAGradientColor.mysticMauveColor,
        AAGradientColor.reflexSilverColor,
        AAGradientColor.neonGlowColor,
        AAGradientColor.berrySmoothieColor,
        AAGradientColor.newLeafColor,
        AAGradientColor.cottonCandyColor,
        AAGradientColor.pixieDustColor,
        AAGradientColor.fizzyPeachColor,
        AAGradientColor.sweetDreamColor,
        AAGradientColor.firebrickColor,
        AAGradientColor.wroughtIronColor,
        AAGradientColor.deepSeaColor,
        AAGradientColor.coastalBreezeColor,
        AAGradientColor.eveningDelightColor,
    ];
    
    AAOptions *aaOptions = AAOptions.new
    .colorsSet(colorArr)
    .chartSet(AAChart.new
              .typeSet([self configureChartType]))
    .titleSet(AATitle.new
              .textSet(@"Popular Gradient Colors In Different Years"))
    .xAxisSet(AAXAxis.new
              .visibleSet(true)
              .reversedSet(true)
              .typeSet(@"category")
              )
    .yAxisSet(AAYAxis.new
              .visibleSet(true)
              .titleSet((id)AATitle.new
                        .textSet(@"Gradient Colors Hot")))
    .legendSet(AALegend.new
               .enabledSet(true)
               .alignSet(AAChartAlignTypeCenter)
               .layoutSet(AAChartLayoutTypeVertical)
               .verticalAlignSet(AAChartVerticalAlignTypeTop)
               .ySet(@10)
               )
    .tooltipSet(AATooltip.new
                .enabledSet(true)
                )
    .plotOptionsSet(AAPlotOptions.new
                    .seriesSet(AASeries.new
                               .dataLabelsSet(AADataLabels.new
                                              .enabledSet(true)
                                              .insideSet(true)//DataLabels是否在内部
                                              .styleSet(AAStyle.new
                                                        .colorSet(AAColor.whiteColor)
                                                        .fontWeightSet(AAChartFontWeightTypeBold)
                                                        .fontSizeSet(@"11px")
                                                        .textOutlineSet(@"none")//文字轮廓描边
                                                        ))
                               ))
    .seriesSet(@[
        AASeriesElement.new
        .nameSet(@"2020 Year")
        .colorByPointSet(@true)
        .dataSortingSet(AADataSorting.new
                        .enabledSet(true)
                        .matchByNameSet(true))
        .dataSet([self randomDataArray])
               ]);
    
    if (aaOptions.chart.type == AAChartTypeColumn) {
        aaOptions.plotOptions
        .columnSet(AAColumn.new
                   .pointPaddingSet(@0)
                   .groupPaddingSet(@0.005))
        .series
        .dataLabels
        .verticalAlignSet(AAChartVerticalAlignTypeBottom)
        ;
    } else if (aaOptions.chart.type == AAChartTypeBar) {
        aaOptions.plotOptions
        .barSet(AABar.new
                .pointPaddingSet(@0)
                .groupPaddingSet(@0.005))
        .series
        .dataLabels
        .alignSet(AAChartAlignTypeLeft)
        ;
    } else if (aaOptions.chart.type == AAChartTypeScatter) {
        aaOptions.plotOptions.series
        .markerSet(AAMarker.new
                   .radiusSet(@15))
        .dataLabels
        .verticalAlignSet(AAChartVerticalAlignTypeMiddle)
        ;
    }
    
    return aaOptions;
}


- (void)setupTimer {
    dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(2 * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
        self->_timer = [NSTimer scheduledTimerWithTimeInterval:2 repeats:YES block:^(NSTimer * _Nonnull timer) {
            [self timerRepeatWork];
        }];
        [self->_timer fire];
    });
}

- (void)timerRepeatWork {
    self.globalInt += 1;
    NSString *year = [NSString stringWithFormat:@"%d Year", 2020 + self.globalInt];
    
    AAOptions *aaOptions = AAOptions.new
    .seriesSet(@[
        AASeriesElement.new
        .nameSet(year)
        .dataSet([self randomDataArray])
               ]);
    
    [self.aaChartView aa_updateChartWithOptions:aaOptions redraw:true];
}

- (NSArray *)randomDataArray {
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
        @"neonGlowColor",
        @"berrySmoothieColor",
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
    
    NSMutableArray *dataArr = [NSMutableArray array];
    [gradientColorNamesArr enumerateObjectsUsingBlock:^(id  _Nonnull obj, NSUInteger idx, BOOL * _Nonnull stop) {
        NSMutableDictionary *dataElementDic = [NSMutableDictionary dictionary];
        dataElementDic[@"name"] = obj;
        dataElementDic[@"y"] = @(arc4random() % 250 + 20);
        [dataArr addObject:dataElementDic];
    }];
    
    NSLog(@"生成的一组假数据为: %@",[AAJsonConverter pureJsonStringWithJsonObject:dataArr]);
    
    return dataArr;
}


@end
