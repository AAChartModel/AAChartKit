//
//  ChartRaceWithBarChartVC.m
//  AAChartKitDemo
//
//  Created by AnAn on 2020/6/16.
//  Copyright © 2020 Danny boy. All rights reserved.
//

#import "DataSortingWithAnimationChartVC.h"
#import "AAChartKit.h"
@interface DataSortingWithAnimationChartVC ()

@property (nonatomic, strong) AAChartModel *chartModel;
@property (nonatomic, strong) AAChartView  *chartView;
@property (nonatomic, strong) NSTimer *timer;
@property (nonatomic, assign) int globalInt;

@end

@implementation DataSortingWithAnimationChartVC

//https://jsfiddle.net/gh/get/library/pure/highcharts/highcharts/tree/master/samples/highcharts/demo/column-comparison/
- (AAChartType)configureChartType {
    switch (_chartType) {
        case DataSortingWithAnimationChartVCChartTypeColumn: return AAChartTypeColumn;
        case DataSortingWithAnimationChartVCChartTypeBar: return AAChartTypeBar;
//        case DataSortingWithAnimationChartVCChartTypeArea: return AAChartTypeArea;
//        case DataSortingWithAnimationChartVCChartTypeAreaspline: return AAChartTypeAreaspline;
//        case DataSortingWithAnimationChartVCChartTypeLine: return AAChartTypeLine;
//        case DataSortingWithAnimationChartVCChartTypeSpline: return AAChartTypeSpline;
//        case DataSortingWithAnimationChartVCChartTypeStepLine: return AAChartTypeLine;
//        case DataSortingWithAnimationChartVCChartTypeStepArea: return AAChartTypeArea;
        case DataSortingWithAnimationChartVCChartTypeScatter: return AAChartTypeScatter;
    }
}

- (void)drawChart {
    AAOptions *aaOptions = [self configuraDataSortingChartOptions];
    AAChartView *aaChartView = [self setupChartView];
    self.chartView = aaChartView;
    [aaChartView aa_drawChartWithOptions:aaOptions];
}



- (AAOptions *)configuraDataSortingChartOptions {
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


- (AAChartView *)setupChartView {
    CGRect chartViewFrame = CGRectMake(0,
                                       88,
                                       self.view.frame.size.width,
                                       self.view.frame.size.height - 88);
    AAChartView *aaChartView = [[AAChartView alloc]initWithFrame:chartViewFrame];
    self.view.backgroundColor = [UIColor whiteColor];
    [self.view addSubview:aaChartView];
    
    return aaChartView;
}

- (void)setupTimer {
    dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(2 * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
        _timer = [NSTimer scheduledTimerWithTimeInterval:2 repeats:YES block:^(NSTimer * _Nonnull timer) {
            [self timerRepeatWork];
        }];
         [_timer fire];
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
    
    [self.chartView aa_updateChartWithOptions:aaOptions redraw:true];
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

- (void)viewWillDisappear:(BOOL)animated {
    [super viewWillDisappear:animated];
    [_timer invalidate];
    _timer = nil;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    
    [self drawChart];
    [self setupTimer];
    
    NSDictionary *dataPrev = @{
        @"2016": @[
                @[@"South Korea", @0],
                @[@"Japan", @0],
                @[@"Australia", @0],
                @[@"Germany", @11],
                @[@"Russia", @24],
                @[@"China", @38],
                @[@"Great Britain", @29],
                @[@"United States", @46]
        ],
        @"2012": @[
                @[@"South Korea", @13],
                @[@"Japan", @0],
                @[@"Australia", @0],
                @[@"Germany", @0],
                @[@"Russia", @22],
                @[@"China", @51],
                @[@"Great Britain", @19],
                @[@"United States", @36]
        ],
        @"2008": @[
                @[@"South Korea", @0],
                @[@"Japan", @0],
                @[@"Australia", @0],
                @[@"Germany", @13],
                @[@"Russia", @27],
                @[@"China", @32],
                @[@"Great Britain", @9],
                @[@"United States", @37]
        ],
        @"2004": @[
                @[@"South Korea", @0],
                @[@"Japan", @5],
                @[@"Australia", @16],
                @[@"Germany", @0],
                @[@"Russia", @32],
                @[@"China", @28],
                @[@"Great Britain", @0],
                @[@"United States", @36]
        ],
        @"2000": @[
                @[@"South Korea", @0],
                @[@"Japan", @0],
                @[@"Australia", @9],
                @[@"Germany", @20],
                @[@"Russia", @26],
                @[@"China", @16],
                @[@"Great Britain", @0],
                @[@"United States", @44]
        ]
    };
    
    NSDictionary *data = @{
        @"2016": @[
                @[@"South Korea", @0],
                @[@"Japan", @0],
                @[@"Australia", @0],
                @[@"Germany", @17],
                @[@"Russia", @19],
                @[@"China", @26],
                @[@"Great Britain", @27],
                @[@"United States", @46]
        ],
        @"2012": @[
                @[@"South Korea", @13],
                @[@"Japan", @0],
                @[@"Australia", @0],
                @[@"Germany", @0],
                @[@"Russia", @24],
                @[@"China", @38],
                @[@"Great Britain", @29],
                @[@"United States", @46]
        ],
        @"2008": @[
                @[@"South Korea", @0],
                @[@"Japan", @0],
                @[@"Australia", @0],
                @[@"Germany", @16],
                @[@"Russia", @22],
                @[@"China", @51],
                @[@"Great Britain", @19],
                @[@"United States", @36]
        ],
        @"2004": @[
                @[@"South Korea", @0],
                @[@"Japan", @16],
                @[@"Australia", @17],
                @[@"Germany", @0],
                @[@"Russia", @27],
                @[@"China", @32],
                @[@"Great Britain", @0],
                @[@"United States", @37]
        ],
        @"2000": @[
                @[@"South Korea", @0],
                @[@"Japan", @0],
                @[@"Australia", @16],
                @[@"Germany", @13],
                @[@"Russia", @32],
                @[@"China", @28],
                @[@"Great Britain", @0],
                @[@"United States", @36]
        ]
    };
    
    NSDictionary *countries = @[
        @{
            @"name": @"South Korea",
            @"flag": @197582,
            @"color": @"rgb(201, @36, @39)"
        }, @{
            @"name": @"Japan",
            @"flag": @197604,
            @"color": @"rgb(201, @36, @39)"
        }, @{
            @"name": @"Australia",
            @"flag": @197507,
            @"color": @"rgb(0, @82, @180)"
        }, @{
            @"name": @"Germany",
            @"flag": @197571,
            @"color": @"rgb(0, @0, @0)"
        }, @{
            @"name": @"Russia",
            @"flag": @197408,
            @"color": @"rgb(240, @240, @240)"
        }, @{
            @"name": @"China",
            @"flag": @197375,
            @"color": @"rgb(255, @217, @68)"
        }, @{
            @"name": @"Great Britain",
            @"flag": @197374,
            @"color": @"rgb(0, @82, @180)"
        }, @{
            @"name": @"United States",
            @"flag": @197484,
            @"color": @"rgb(215, @0, @38)"
        }];
    
    NSMutableArray *flagArr = [NSMutableArray array];
    for (NSDictionary *element in countries) {
        [flagArr addObject:element[@"flag"]];
    }
    
    NSString *imageLinkStr = @"<span><img src=\"https://image.flaticon.com/icons/svg/197/ + output + .svg\" style=\"width: 30px; height: 30px;\"/><br></span>";
    
    NSString *formatter = (@AAJSFunc((
    function () {
        var value = this.value,
        var countries = [{
        name: 'South Korea',
        flag: 197582,
        color: 'rgb(201, 36, 39)'
        }, {
        name: 'Japan',
        flag: 197604,
        color: 'rgb(201, 36, 39)'
        }, {
        name: 'Australia',
        flag: 197507,
        color: 'rgb(0, 82, 180)'
        }, {
        name: 'Germany',
        flag: 197571,
        color: 'rgb(0, 0, 0)'
        }, {
        name: 'Russia',
        flag: 197408,
        color: 'rgb(240, 240, 240)'
        }, {
        name: 'China',
        flag: 197375,
        color: 'rgb(255, 217, 68)'
        }, {
        name: 'Great Britain',
        flag: 197374,
        color: 'rgb(0, 82, 180)'
        }, {
        name: 'United States',
        flag: 197484,
        color: 'rgb(215, 0, 38)'
        }];
        var output;
        
        countries.forEach(function (country) {
            if (country.name === value) {
                output = country.flag;
            }
        });
        
        return '<span><img src="https://image.flaticon.com/icons/svg/197/' + output + '.svg" style="width: 30px; height: 30px;"/><br></span>';
    })
                                     ));
    formatter = [formatter stringByReplacingOccurrencesOfString:@"((" withString:@"("];
    formatter = [formatter stringByReplacingOccurrencesOfString:@"))" withString:@")"];
    
    
    AAOptions *aaOptions = AAOptions.new
    .chartSet(AAChart.new
              .typeSet(AAChartTypeColumn))
    .titleSet(AATitle.new
              .textSet(@"Summer Olympics 2016 - Top 5 countries by Gold medals"))
    .xAxisSet(AAXAxis.new
              .visibleSet(true)
              .maxSet(@4)
              .labelsSet(AALabels.new
                         .useHTMLSet(true)
                         .formatterSet(formatter)))
    .yAxisSet(AAYAxis.new
              .visibleSet(true)
              .titleSet((id)AATitle.new
                        .textSet(@"Gold medals")))
    .legendSet(AALegend.new
               .enabledSet(true)
               .alignSet(AAChartTitleAlignTypeRight)
               .layoutSet(@"vertical")
               .verticalAlignSet(@"top")
               .ySet(@25)
               )
    .tooltipSet(AATooltip.new
                .enabledSet(true)
                )
    .seriesSet(@[@{
                     @"name": @"2016",
                     @"id": @"main",
                     @"dataSorting": @{
                             @"enabled": @true,
                             @"matchByName": @true
                     },
                     @"data": @[]
    }])
    ;
    
}


@end
