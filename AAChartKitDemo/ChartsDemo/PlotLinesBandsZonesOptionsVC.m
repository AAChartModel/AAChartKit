//
//  PlotLinesBandsZonesOptionsVC.m
//  AAChartKitDemo
//
//  Created by Admin on 2021/9/15.
//  Copyright © 2021 An An. All rights reserved.
//

#import "PlotLinesBandsZonesOptionsVC.h"

@interface PlotLinesBandsZonesOptionsVC ()

@end

@implementation PlotLinesBandsZonesOptionsVC

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
}

- (id)chartConfigurationWithSelectedIndex:(NSUInteger)selectedIndex {
    switch (self.selectedIndex) {
        case 0: return [self simpleGaugeChart];//简易仪表图
        case 1: return [self gaugeChartWithPlotBand];//带有颜色标志带的仪表图
        case 2: return [self configureAAPlotBandsForChart];//带有颜色标志带的曲线图
        case 3: return [self configureAAPlotLinesForChart];//带有颜色标志线及文字的折线图表
        case 4: return [self configureAASeriesElementZones];//数据分区 Zones
        case 5: return [self configureAASeriesElementZonesMixedAAPlotLines];//数据分区 Zones 和颜色标志线混合
        case 6: return [self configureXAxisPlotBandAreaMixedColumnChart];//X轴有 plotBand 的区域面积与柱形混合图
        case 7: return [self configureXAxisPlotLinesForChart];//X 轴有 plotLines 的图表
        case 8: return [self configureXAxisPlotLinesForChart2];//X 轴有 plotLines 的图表2

        default:
            break;
    }
    return nil;
}


- (AAOptions *)simpleGaugeChart {
    return AAOptions.new
    .chartSet(AAChart.new
              .typeSet(AAChartTypeGauge))
    .paneSet(AAPane.new
             .startAngleSet(@-150)
             .endAngleSet(@150))
    .yAxisSet(AAYAxis.new
              .minSet(@0)
              .maxSet(@100)
              .plotBandsSet(@[
                  AAPlotBandsElement.new
                  .fromSet(@0)
                  .toSet(@60)
                  .colorSet(AAColor.redColor)
                            ])
              )
    .seriesSet(@[
        AASeriesElement.new
        .dataSet(@[@80])
               ]);
}

- (AAOptions *)gaugeChartWithPlotBand {
    return AAOptions.new
    .chartSet(AAChart.new
              .typeSet(AAChartTypeGauge))
    .titleSet(AATitle.new
              .textSet(@"速度仪"))
    .paneSet(AAPane.new
             .startAngleSet(@-150)
             .endAngleSet(@150))
    .yAxisSet(AAYAxis.new
              .minSet(@0)
              .maxSet(@200)
              .titleSet(AAAxisTitle.new
                        .textSet(@"km/h"))
              .plotBandsSet(@[
                  AAPlotBandsElement.new
                  .fromSet(@0)
                  .toSet(@120)
                  .colorSet(@"#ffc069"),
                  AAPlotBandsElement.new
                  .fromSet(@120)
                  .toSet(@160)
                  .colorSet(@"#fe117c"),
                  AAPlotBandsElement.new
                  .fromSet(@160)
                  .toSet(@200)
                  .colorSet(@"#06caf4"),
                            ])
              )
    .seriesSet(@[
        AASeriesElement.new
        .nameSet(@"Speed")
        .dataSet(@[@80])
               ]);
}

- (AAOptions *)configureAAPlotBandsForChart {
    AACrosshair *aaCrosshair =
    [AACrosshair crosshairWithColor:AAColor.grayColor
                          dashStyle:AAChartLineDashStyleTypeLongDashDotDot
                              width:@1.5];
    
    AAChartModel *aaChartModel = AAChartModel.new
    .chartTypeSet(AAChartTypeSpline)
    .backgroundColorSet(AAColor.whiteColor)
    .categoriesSet(@[@"一月", @"二月", @"三月", @"四月", @"五月", @"六月", @"七月", @"八月", @"九月", @"十月", @"十一月", @"十二月"])
    .markerRadiusSet(@0)
    .yAxisMaxSet(@50)
    .yAxisGridLineStyleSet([AALineStyle styleWithWidth:@0])
    .xAxisCrosshairSet(aaCrosshair)
    .yAxisCrosshairSet(aaCrosshair)
    .legendEnabledSet(false)
    .seriesSet(@[
        AASeriesElement.new
        .nameSet(@"2017")
        .colorSet(AAColor.whiteColor)
        .lineWidthSet(@10)
        .dataSet(@[@7.0, @6.9, @2.5, @14.5, @18.2, @21.5, @5.2, @26.5, @23.3, @45.3, @13.9, @9.6]),
               ]);
    
    AAOptions *aaOptions = aaChartModel.aa_toAAOptions;
    aaOptions.yAxis.gridLineInterpolation = AAChartYAxisGridLineInterpolationTypePolygon;
    
    NSArray *aaPlotBandsArr = @[
        AAPlotBandsElement.new
        .fromSet(@0)
        .toSet(@5)
        .colorSet(@"#BC2B44"),
        AAPlotBandsElement.new
        .fromSet(@5)
        .toSet(@10)
        .colorSet(@"#EC6444"),
        AAPlotBandsElement.new
        .fromSet(@10)
        .toSet(@15)
        .colorSet(@"#f19742"),
        AAPlotBandsElement.new
        .fromSet(@15)
        .toSet(@20)
        .colorSet(@"#f3da60"),
        AAPlotBandsElement.new
        .fromSet(@20)
        .toSet(@25)
        .colorSet(@"#9bd040"),
        AAPlotBandsElement.new
        .fromSet(@25)
        .toSet(@50)
        .colorSet(@"#acf08f"),
    ];
    
    AAYAxis *aaYAxis = aaOptions.yAxis;
    aaYAxis.plotBands = aaPlotBandsArr;
    return aaOptions;
}

- (AAOptions *)configureValueSegmentChartBasicOptions {
    NSArray *dataArr = @[@[@"2012-01-01",@81],@[@"2012-01-02",@74],@[@"2012-01-03",@35],@[@"2012-01-04",@30],@[@"2012-01-05",@63],@[@"2012-01-06",@95],@[@"2012-01-07",@65],@[@"2012-01-08",@89],@[@"2012-01-09",@102],@[@"2012-01-10",@161],@[@"2012-01-11",@25],@[@"2012-01-12",@86],@[@"2012-01-13",@79],@[@"2012-01-14",@60],@[@"2012-01-15",@70],@[@"2012-01-16",@106],@[@"2012-01-17",@111],@[@"2012-01-18",@193],@[@"2012-01-19",@269],@[@"2012-01-20",@131],@[@"2012-01-21",@21],@[@"2012-01-22",@23],@[@"2012-01-23",@149],@[@"2012-01-24",@49],@[@"2012-01-25",@45],@[@"2012-01-26",@78],@[@"2012-01-27",@67],@[@"2012-01-28",@74],@[@"2012-01-29",@62],@[@"2012-01-30",@66],@[@"2012-01-31",@92],@[@"2012-02-01",@30],@[@"2012-02-02",@26],@[@"2012-02-03",@60],@[@"2012-02-04",@52],@[@"2012-02-05",@84],@[@"2012-02-06",@112],@[@"2012-02-07",@64],@[@"2012-02-08",@34],@[@"2012-02-09",@58],@[@"2012-02-10",@49],@[@"2012-02-11",@73],@[@"2012-02-12",@75],@[@"2012-02-13",@100],@[@"2012-02-14",@125],@[@"2012-02-15",@62],@[@"2012-02-16",@61],@[@"2012-02-17",@34],@[@"2012-02-18",@29],@[@"2012-02-19",@68],@[@"2012-02-20",@73],@[@"2012-02-21",@118],@[@"2012-02-22",@118],@[@"2012-02-23",@73],@[@"2012-02-24",@73],@[@"2012-02-25",@57],@[@"2012-02-26",@57],@[@"2012-02-27",@95],@[@"2012-02-28",@152],@[@"2012-02-29",@118],@[@"2012-03-01",@142],@[@"2012-03-02",@111],@[@"2012-03-03",@68],@[@"2012-03-04",@90],@[@"2012-03-05",@97],@[@"2012-03-06",@63],@[@"2012-03-07",@38],@[@"2012-03-08",@31],@[@"2012-03-09",@65],@[@"2012-03-10",@78],@[@"2012-03-11",@36],@[@"2012-03-12",@62],@[@"2012-03-13",@104],@[@"2012-03-14",@57],@[@"2012-03-15",@64],@[@"2012-03-16",@109],@[@"2012-03-17",@144],@[@"2012-03-18",@61],@[@"2012-03-19",@57],@[@"2012-03-20",@81],@[@"2012-03-21",@105],@[@"2012-03-22",@146],@[@"2012-03-23",@55],@[@"2012-03-24",@56],@[@"2012-03-25",@30],@[@"2012-03-26",@90],@[@"2012-03-27",@112],@[@"2012-03-28",@65],@[@"2012-03-29",@90],@[@"2012-03-30",@76],@[@"2012-03-31",@159],@[@"2012-04-01",@78],@[@"2012-04-02",@103],@[@"2012-04-03",@73],@[@"2012-04-03",@73],@[@"2012-04-04",@73],@[@"2012-04-05",@64],@[@"2012-04-06",@70],@[@"2012-04-07",@71],@[@"2012-04-08",@119],@[@"2012-04-09",@118],@[@"2012-04-10",@138],@[@"2012-04-11",@41],@[@"2012-04-12",@69],@[@"2012-04-13",@81],@[@"2012-04-14",@100],@[@"2012-04-15",@109],@[@"2012-04-16",@84],@[@"2012-04-17",@100],@[@"2012-04-18",@140],@[@"2012-04-19",@98],@[@"2012-04-20",@133],@[@"2012-04-21",@81],@[@"2012-04-22",@102],@[@"2012-04-23",@140],@[@"2012-04-24",@133],@[@"2012-04-25",@32],@[@"2012-04-26",@60],@[@"2012-04-27",@147],@[@"2012-04-28",@164],@[@"2012-04-29",@473],@[@"2012-04-30",@268],@[@"2012-05-01",@208],@[@"2012-05-02",@111],@[@"2012-05-03",@106],@[@"2012-05-04",@100],@[@"2012-05-05",@99],@[@"2012-05-06",@100],@[@"2012-05-07",@100],@[@"2012-05-08",@111],@[@"2012-05-09",@107],@[@"2012-05-10",@129],@[@"2012-05-11",@133],@[@"2012-05-12",@90],@[@"2012-05-13",@96],@[@"2012-05-14",@64],@[@"2012-05-15",@58],@[@"2012-05-16",@58],@[@"2012-05-17",@78],@[@"2012-05-18",@84],@[@"2012-05-19",@143],@[@"2012-05-20",@85],@[@"2012-05-21",@97],@[@"2012-05-22",@109],@[@"2012-05-23",@64],@[@"2012-05-24",@69],@[@"2012-05-25",@63],@[@"2012-05-26",@90],@[@"2012-05-27",@88],@[@"2012-05-28",@133],@[@"2012-05-29",@116],@[@"2012-05-30",@29],@[@"2012-05-31",@64],@[@"2012-06-01",@54],@[@"2012-06-02",@90],@[@"2012-06-03",@112],@[@"2012-06-04",@80],@[@"2012-06-05",@65],@[@"2012-06-06",@98],@[@"2012-06-07",@71],@[@"2012-06-08",@77],@[@"2012-06-09",@91],@[@"2012-06-10",@32],@[@"2012-06-11",@50],@[@"2012-06-12",@58],@[@"2012-06-13",@62],@[@"2012-06-14",@50],@[@"2012-06-15",@22],@[@"2012-06-16",@33],@[@"2012-06-17",@69],@[@"2012-06-18",@137],@[@"2012-06-19",@132],@[@"2012-06-20",@105],@[@"2012-06-21",@112],@[@"2012-06-22",@84],@[@"2012-06-23",@81],@[@"2012-06-24",@95],@[@"2012-06-25",@49],@[@"2012-06-26",@65],@[@"2012-06-27",@55],@[@"2012-06-28",@54],@[@"2012-06-29",@60],@[@"2012-06-30",@46],@[@"2012-07-01",@70],@[@"2012-07-02",@69],@[@"2012-07-03",@59],@[@"2012-07-04",@71],@[@"2012-07-05",@70],@[@"2012-07-06",@59],@[@"2012-07-07",@86],@[@"2012-07-08",@84],@[@"2012-07-09",@64],@[@"2012-07-10",@50],@[@"2012-07-11",@44],@[@"2012-07-12",@46],@[@"2012-07-13",@31],@[@"2012-07-14",@48],@[@"2012-07-15",@53],@[@"2012-07-16",@70],@[@"2012-07-17",@78],@[@"2012-07-18",@71],@[@"2012-07-19",@82],@[@"2012-07-20",@111],@[@"2012-07-21",@131],@[@"2012-07-22",@15],@[@"2012-07-24",@60],@[@"2012-07-25",@72],@[@"2012-07-26",@55],@[@"2012-07-26",@55],@[@"2012-07-27",@50],@[@"2012-07-28",@56],@[@"2012-07-29",@57],@[@"2012-07-30",@30],@[@"2012-07-31",@28],@[@"2012-08-01",@20],@[@"2012-08-02",@17],@[@"2012-08-03",@53],@[@"2012-08-04",@40],@[@"2012-08-05",@48],@[@"2012-08-06",@60],@[@"2012-08-07",@59],@[@"2012-08-08",@68],@[@"2012-08-09",@43],@[@"2012-08-10",@72],@[@"2012-08-11",@80],@[@"2012-08-12",@41],@[@"2012-08-13",@36],@[@"2012-08-14",@62],@[@"2012-08-15",@60],@[@"2012-08-16",@68],@[@"2012-08-17",@83],@[@"2012-08-18",@110],@[@"2012-08-19",@84],@[@"2012-08-20",@92],@[@"2012-08-21",@25],@[@"2012-08-22",@40],@[@"2012-08-23",@74],@[@"2012-08-24",@94],@[@"2012-08-25",@92],@[@"2012-08-26",@117],@[@"2012-08-27",@100],@[@"2012-08-28",@59],@[@"2012-08-29",@84],@[@"2012-08-30",@135],@[@"2012-08-31",@150],@[@"2012-09-01",@128],@[@"2012-09-02",@52],@[@"2012-09-03",@15],@[@"2012-09-04",@22],@[@"2012-09-05",@50],@[@"2012-09-06",@70],@[@"2012-09-07",@77],@[@"2012-09-08",@40],@[@"2012-09-09",@79],@[@"2012-09-10",@96],@[@"2012-09-11",@93],@[@"2012-09-12",@44],@[@"2012-09-13",@28],@[@"2012-09-14",@31],@[@"2012-09-15",@50],@[@"2012-09-16",@65],@[@"2012-09-17",@63],@[@"2012-09-18",@61],@[@"2012-09-19",@56],@[@"2012-09-21",@128],@[@"2012-09-22",@93],@[@"2012-09-23",@85],@[@"2012-09-24",@74],@[@"2012-09-25",@78],@[@"2012-09-26",@26],@[@"2012-09-27",@65],@[@"2012-09-28",@15],@[@"2012-09-29",@24],@[@"2012-09-30",@38],@[@"2012-10-01",@52],@[@"2012-10-02",@78],@[@"2012-10-03",@108],@[@"2012-10-04",@28],@[@"2012-10-05",@41],@[@"2012-10-06",@74],@[@"2012-10-07",@83],@[@"2012-10-08",@123],@[@"2012-10-09",@140],@[@"2012-10-10",@18],@[@"2012-10-11",@73],@[@"2012-10-12",@121],@[@"2012-10-13",@97],@[@"2012-10-14",@40],@[@"2012-10-15",@83],@[@"2012-10-16",@78],@[@"2012-10-17",@23],@[@"2012-10-18",@65],@[@"2012-10-19",@79],@[@"2012-10-20",@139],@[@"2012-10-21",@81],@[@"2012-10-22",@26],@[@"2012-10-23",@54],@[@"2012-10-24",@89],@[@"2012-10-25",@90],@[@"2012-10-26",@163],@[@"2012-10-27",@154],@[@"2012-10-28",@22],@[@"2012-10-29",@59],@[@"2012-10-30",@36],@[@"2012-10-31",@51],@[@"2012-11-01",@67],@[@"2012-11-02",@103],@[@"2012-11-03",@135],@[@"2012-11-04",@20],@[@"2012-11-05",@16],@[@"2012-11-06",@48],@[@"2012-11-07",@80],@[@"2012-11-08",@62],@[@"2012-11-09",@93],@[@"2012-11-10",@82],@[@"2012-11-11",@17],@[@"2012-11-12",@27],@[@"2012-11-13",@30],@[@"2012-11-14",@26],@[@"2012-11-15",@71],@[@"2012-11-16",@92],@[@"2012-11-17",@47],@[@"2012-11-18",@96],@[@"2012-11-19",@55],@[@"2012-11-20",@74],@[@"2012-11-21",@123],@[@"2012-11-22",@156],@[@"2012-11-23",@22],@[@"2012-11-24",@80],@[@"2012-11-25",@133],@[@"2012-11-26",@44],@[@"2012-11-27",@105],@[@"2012-11-28",@151],@[@"2012-11-29",@54],@[@"2012-12-01",@50],@[@"2012-12-02",@96],@[@"2012-12-03",@123],@[@"2012-12-04",@50],@[@"2012-12-05",@64],@[@"2012-12-06",@50],@[@"2012-12-07",@73],@[@"2012-12-08",@53],@[@"2012-12-09",@38],@[@"2012-12-10",@53],@[@"2012-12-11",@86],@[@"2012-12-12",@103],@[@"2012-12-13",@130],@[@"2012-12-14",@107],@[@"2012-12-15",@114],@[@"2012-12-16",@108],@[@"2012-12-17",@45],@[@"2012-12-18",@22],@[@"2012-12-19",@72],@[@"2012-12-20",@121],@[@"2012-12-21",@120],@[@"2012-12-22",@24],@[@"2012-12-23",@36],@[@"2012-12-24",@53],@[@"2012-12-25",@58],@[@"2012-12-26",@67],@[@"2012-12-28",@137],@[@"2012-12-29",@94],@[@"2012-12-30",@38],@[@"2012-12-31",@57],@[@"2013-01-01",@71],@[@"2013-01-02",@27],@[@"2013-01-03",@35],@[@"2013-01-04",@57],@[@"2013-01-05",@79],@[@"2013-01-06",@58],@[@"2013-01-07",@105],@[@"2013-01-08",@124],@[@"2013-01-09",@32],@[@"2013-01-10",@87],@[@"2013-01-11",@232],@[@"2013-01-12",@174],@[@"2013-01-13",@498],@[@"2013-01-14",@184],@[@"2014-01-01",@85],@[@"2014-01-02",@158],@[@"2014-01-03",@74],@[@"2014-01-04",@165],@[@"2014-01-05",@113],@[@"2014-01-06",@190],@[@"2014-01-07",@122],@[@"2014-01-10",@95],@[@"2014-01-11",@159],@[@"2014-01-12",@52],@[@"2014-01-13",@117],@[@"2014-01-14",@113],@[@"2014-01-15",@180],@[@"2014-01-16",@403],@[@"2014-01-17",@209],@[@"2014-01-18",@113],@[@"2014-01-19",@149],@[@"2014-01-21",@68],@[@"2014-01-22",@162],@[@"2014-01-23",@276],@[@"2014-01-24",@195],@[@"2014-01-26",@77],@[@"2014-01-27",@114],@[@"2014-01-28",@67],@[@"2014-01-29",@165],@[@"2014-01-30",@93],@[@"2014-01-31",@188],@[@"2014-02-01",@178],@[@"2014-02-02",@85],@[@"2014-02-05",@119],@[@"2014-02-06",@158],@[@"2014-02-07",@124],@[@"2014-02-08",@84],@[@"2014-02-10",@53],@[@"2014-02-11",@142],@[@"2014-02-12",@150],@[@"2014-02-13",@242],@[@"2014-02-14",@329],@[@"2014-02-15",@429],@[@"2014-02-16",@348],@[@"2014-02-17",@118],@[@"2014-02-18",@98],@[@"2014-02-19",@92],@[@"2014-02-20",@270],@[@"2014-02-21",@311],@[@"2014-02-22",@311],@[@"2014-02-23",@255],@[@"2014-02-24",@313],@[@"2014-02-25",@404],@[@"2014-02-28",@113],@[@"2014-03-01",@68],@[@"2014-03-02",@189],@[@"2014-03-03",@268],@[@"2014-03-04",@67],@[@"2014-03-07",@70],@[@"2014-03-08",@179],@[@"2014-03-09",@127],@[@"2014-03-10",@110],@[@"2014-03-11",@195],@[@"2014-03-13",@69],@[@"2014-03-14",@64],@[@"2014-03-15",@133],@[@"2014-03-16",@145],@[@"2014-03-17",@142],@[@"2014-03-18",@85],@[@"2014-03-19",@73],@[@"2014-03-21",@62],@[@"2014-03-22",@86],@[@"2014-03-23",@186],@[@"2014-03-24",@271],@[@"2014-03-25",@255],@[@"2014-03-26",@331],@[@"2014-03-27",@285],@[@"2014-03-28",@169],@[@"2014-03-29",@63],@[@"2014-03-30",@77],@[@"2014-03-31",@183],@[@"2014-04-01",@147],@[@"2014-04-02",@133],@[@"2014-04-03",@66],@[@"2014-04-04",@91],@[@"2014-04-05",@68],@[@"2014-04-06",@98],@[@"2014-04-07",@135],@[@"2014-04-08",@223],@[@"2014-04-09",@156],@[@"2014-04-10",@246],@[@"2014-04-11",@83],@[@"2014-04-12",@133],@[@"2014-04-13",@212],@[@"2014-04-14",@270],@[@"2014-04-15",@109],@[@"2014-04-16",@90],@[@"2014-04-17",@124],@[@"2014-04-18",@182],@[@"2014-04-19",@84],@[@"2014-04-20",@84],@[@"2014-04-21",@73],@[@"2014-04-22",@85],@[@"2014-04-23",@156],@[@"2014-04-24",@156],@[@"2014-04-25",@163],@[@"2014-04-26",@69],@[@"2014-04-27",@74],@[@"2014-04-28",@83],@[@"2014-04-29",@122],@[@"2014-04-30",@139],@[@"2014-05-01",@156],@[@"2014-05-03",@93],@[@"2014-05-04",@57],@[@"2014-05-05",@54],@[@"2014-05-06",@105],@[@"2014-05-07",@82],@[@"2014-05-08",@104],@[@"2014-05-09",@84],@[@"2014-05-10",@69],@[@"2014-05-12",@74],@[@"2014-05-13",@86],@[@"2014-05-14",@59],@[@"2014-05-15",@122],@[@"2014-05-16",@92],@[@"2014-05-17",@124],@[@"2014-05-18",@171],@[@"2014-05-19",@146],@[@"2014-05-20",@113],@[@"2014-05-21",@170],@[@"2014-05-22",@183],@[@"2014-05-23",@140],@[@"2014-05-24",@104],@[@"2014-05-25",@91],@[@"2014-05-26",@77],@[@"2014-05-27",@107],@[@"2014-05-28",@121],@[@"2014-05-29",@120],@[@"2014-05-30",@192],@[@"2014-05-31",@177],@[@"2014-06-01",@130],@[@"2014-06-02",@90],@[@"2014-06-03",@117],@[@"2014-06-04",@124],@[@"2014-06-05",@157],@[@"2014-06-06",@103],@[@"2014-06-07",@51],@[@"2014-06-08",@70],@[@"2014-06-09",@87],@[@"2014-06-10",@95],@[@"2014-06-11",@74],@[@"2014-06-12",@90],@[@"2014-06-13",@116],@[@"2014-06-14",@165],@[@"2014-06-15",@178],@[@"2014-06-16",@178],@[@"2014-06-17",@104],@[@"2014-06-18",@116],@[@"2014-06-19",@116],@[@"2014-06-20",@84],@[@"2014-06-21",@96],@[@"2014-06-22",@91],@[@"2014-06-23",@115],@[@"2014-06-24",@161],@[@"2014-06-25",@138],@[@"2014-06-26",@163],@[@"2014-06-27",@68],@[@"2014-06-28",@77],@[@"2014-06-29",@161],@[@"2014-06-30",@185],@[@"2014-07-01",@172],@[@"2014-07-02",@80],@[@"2014-07-03",@248],@[@"2014-07-04",@237],@[@"2014-07-05",@165],@[@"2014-07-06",@256],@[@"2014-07-07",@216],@[@"2014-07-08",@134],@[@"2014-07-09",@63],@[@"2014-07-10",@114],@[@"2014-07-11",@77],@[@"2014-07-12",@80],@[@"2014-07-13",@64],@[@"2014-07-14",@156],@[@"2014-07-15",@140],@[@"2014-07-16",@133],@[@"2014-07-17",@186],@[@"2014-07-18",@182],@[@"2014-07-19",@106],@[@"2014-07-20",@119],@[@"2014-07-21",@68],@[@"2014-07-22",@54],@[@"2014-07-23",@82],@[@"2014-07-24",@90],@[@"2014-07-25",@134],@[@"2014-07-26",@188],@[@"2014-07-27",@194],@[@"2014-07-28",@159],@[@"2014-07-29",@159],@[@"2014-07-30",@169],@[@"2014-07-31",@244],@[@"2014-08-01",@199],@[@"2014-08-02",@163],@[@"2014-08-03",@149],@[@"2014-08-05",@80],@[@"2014-08-06",@67],@[@"2014-08-07",@162],@[@"2014-08-08",@140],@[@"2014-08-09",@143],@[@"2014-08-10",@125],@[@"2014-08-11",@76],@[@"2014-08-12",@119],@[@"2014-08-13",@70],@[@"2014-08-14",@104],@[@"2014-08-15",@109],@[@"2014-08-16",@159],@[@"2014-08-17",@124],@[@"2014-08-18",@135],@[@"2014-08-19",@150],@[@"2014-08-20",@164],@[@"2014-08-21",@169],@[@"2014-08-22",@83],@[@"2014-08-23",@155],@[@"2014-08-24",@75],@[@"2014-08-25",@59],@[@"2014-08-26",@78],@[@"2014-08-27",@136],@[@"2014-08-28",@103],@[@"2014-08-29",@104],@[@"2014-08-30",@176],@[@"2014-08-31",@89],@[@"2014-09-01",@127],@[@"2014-09-03",@54],@[@"2014-09-04",@100],@[@"2014-09-05",@140],@[@"2014-09-06",@186],@[@"2014-09-07",@200],@[@"2014-09-08",@61],@[@"2014-09-09",@109],@[@"2014-09-10",@111],@[@"2014-09-11",@114],@[@"2014-09-12",@97],@[@"2014-09-13",@94],@[@"2014-09-14",@66],@[@"2014-09-15",@54],@[@"2014-09-16",@87],@[@"2014-09-17",@80],@[@"2014-09-18",@84],@[@"2014-09-19",@117],@[@"2014-09-20",@168],@[@"2014-09-21",@129],@[@"2014-09-22",@127],@[@"2014-09-23",@64],@[@"2014-09-24",@60],@[@"2014-09-25",@144],@[@"2014-09-26",@170],@[@"2014-09-27",@58],@[@"2014-09-28",@87],@[@"2014-09-29",@70],@[@"2014-09-30",@53],@[@"2014-10-01",@92],@[@"2014-10-02",@78],@[@"2014-10-03",@123],@[@"2014-10-04",@95],@[@"2014-10-05",@54],@[@"2014-10-06",@68],@[@"2014-10-07",@200],@[@"2014-10-08",@314],@[@"2014-10-09",@379],@[@"2014-10-10",@346],@[@"2014-10-11",@233],@[@"2014-10-14",@80],@[@"2014-10-15",@73],@[@"2014-10-16",@76],@[@"2014-10-17",@132],@[@"2014-10-18",@211],@[@"2014-10-19",@289],@[@"2014-10-20",@250],@[@"2014-10-21",@82],@[@"2014-10-22",@99],@[@"2014-10-23",@163],@[@"2014-10-24",@267],@[@"2014-10-25",@353],@[@"2014-10-26",@78],@[@"2014-10-27",@72],@[@"2014-10-28",@88],@[@"2014-10-29",@140],@[@"2014-10-30",@206],@[@"2014-10-31",@204],@[@"2014-11-01",@65],@[@"2014-11-03",@59],@[@"2014-11-04",@150],@[@"2014-11-05",@79],@[@"2014-11-07",@63],@[@"2014-11-08",@93],@[@"2014-11-09",@80],@[@"2014-11-10",@95],@[@"2014-11-11",@59],@[@"2014-11-13",@65],@[@"2014-11-14",@77],@[@"2014-11-15",@143],@[@"2014-11-16",@98],@[@"2014-11-17",@64],@[@"2014-11-18",@93],@[@"2014-11-19",@282],@[@"2014-11-23",@155],@[@"2014-11-24",@94],@[@"2014-11-25",@196],@[@"2014-11-26",@293],@[@"2014-11-27",@83],@[@"2014-11-28",@114],@[@"2014-11-29",@276],@[@"2014-12-01",@54],@[@"2014-12-02",@65],@[@"2014-12-03",@51],@[@"2014-12-05",@62],@[@"2014-12-06",@89],@[@"2014-12-07",@65],@[@"2014-12-08",@82],@[@"2014-12-09",@276],@[@"2014-12-10",@153],@[@"2014-12-11",@52],@[@"2014-12-13",@69],@[@"2014-12-14",@113],@[@"2014-12-15",@82],@[@"2014-12-17",@99],@[@"2014-12-19",@53],@[@"2014-12-22",@103],@[@"2014-12-23",@100],@[@"2014-12-25",@73],@[@"2014-12-26",@155],@[@"2014-12-27",@243],@[@"2014-12-28",@155],@[@"2014-12-29",@125],@[@"2014-12-30",@65],@[@"2015-01-01",@65],@[@"2015-01-02",@79],@[@"2015-01-03",@200],@[@"2015-01-04",@226],@[@"2015-01-05",@122],@[@"2015-01-06",@60],@[@"2015-01-07",@85],@[@"2015-01-08",@190],@[@"2015-01-09",@105],@[@"2015-01-10",@208],@[@"2015-01-11",@59],@[@"2015-01-12",@160],@[@"2015-01-13",@211],@[@"2015-01-14",@265],@[@"2015-01-15",@386],@[@"2015-01-16",@118],@[@"2015-01-17",@89],@[@"2015-01-18",@94],@[@"2015-01-19",@77],@[@"2015-01-20",@113],@[@"2015-01-22",@143],@[@"2015-01-23",@257],@[@"2015-01-24",@117],@[@"2015-01-25",@185],@[@"2015-01-26",@119],@[@"2015-01-28",@65],@[@"2015-01-29",@87],@[@"2015-01-31",@60],@[@"2015-02-01",@108],@[@"2015-02-02",@188],@[@"2015-02-03",@143],@[@"2015-02-05",@62],@[@"2015-02-06",@100],@[@"2015-02-09",@152],@[@"2015-02-10",@166],@[@"2015-02-11",@55],@[@"2015-02-12",@59],@[@"2015-02-13",@175],@[@"2015-02-14",@293],@[@"2015-02-15",@326],@[@"2015-02-16",@153],@[@"2015-02-18",@73],@[@"2015-02-19",@267],@[@"2015-02-20",@183],@[@"2015-02-21",@394],@[@"2015-02-22",@158],@[@"2015-02-23",@86],@[@"2015-02-24",@207]];
    
    NSMutableArray *categories = [NSMutableArray array];
    NSMutableArray *data = [NSMutableArray array];
    [dataArr enumerateObjectsUsingBlock:^(NSArray *  _Nonnull obj, NSUInteger idx, BOOL * _Nonnull stop) {
        NSString *xValue = obj[0];
        [categories addObject:xValue];
        NSNumber *yValue = obj[1];
        [data addObject:yValue];
    }];
    
    AAChartModel *aaChartModel = AAChartModel.new
    .chartTypeSet(AAChartTypeLine)
    .categoriesSet(categories)
    .backgroundColorSet(AAColor.whiteColor)
    .markerRadiusSet(@0)
    .yAxisGridLineStyleSet([AALineStyle styleWithWidth:@0])
    .legendEnabledSet(false)
    .seriesSet(@[
        AASeriesElement.new
        .nameSet(@"2019")
        .fillOpacitySet(@0.5)
        .lineWidthSet(@3)
        .dataSet(data)
        .zIndexSet(@0)
               ]);
    
    AAOptions *aaOptions = aaChartModel.aa_toAAOptions;
    aaOptions.xAxis.labels.enabled = false;
    aaOptions.xAxis.tickWidth = @0;
    aaOptions.plotOptions.series.animation = (id)@(false);//禁用图表的渲染动画效果
    return aaOptions;
}

- (AAOptions *)configureAAPlotLinesForChart  {
    AAOptions *aaOptions = [self configureValueSegmentChartBasicOptions];

    AAStyle *aaStyle = AAStyle.new
    .colorSet(@"#FFD700")//#FFD700(纯金色)
    .backgroundColorSet(AAColor.blackColor)
    .borderRadiusSet(@"5px")
    .borderSet(@"6px solid #000000")
    .opacitySet(@1.0)
    .fontWeightSet(AAChartFontWeightTypeBold);
    
    AAStyle *aaStyle1 = AAStyle.new
    .colorSet(AAColor.redColor)//#FFD700(纯金色)
    .backgroundColorSet(AAColor.blackColor)
    .borderRadiusSet(@"5px")
    .borderSet(@"2px solid red")
    .opacitySet(@1.0)
    .fontWeightSet(AAChartFontWeightTypeBold)
    .paddingSet(@"6px")
    .fontSizeSet(@"16px");
    
    NSArray *aaPlotLinesArr = @[
        AAPlotLinesElement.new
        .colorSet(@"#ef476f")
        .dashStyleSet(AAChartLineDashStyleTypeLongDashDotDot)
        .widthSet(@(1.5))
        .valueSet(@(50))
        .zIndexSet(@(5)) //层叠,标示线在图表中显示的层叠级别，值越大，显示越向前
        .labelSet(AALabel.new
                  .useHTMLSet(true)
                  .textSet(@"PLOT LINES 000001")
                  .styleSet(aaStyle))
        ,
        AAPlotLinesElement.new
        .colorSet(@"#ef476f")
        .dashStyleSet(AAChartLineDashStyleTypeShortDot)
        .widthSet(@(1.5))
        .valueSet(@(100))
        .zIndexSet(@(5)) //层叠,标示线在图表中显示的层叠级别，值越大，显示越向前
        .labelSet(AALabel.new
                  .useHTMLSet(true)
                  .textSet(@"PLOT LINES 000002")
                  .styleSet(aaStyle))
        ,
        AAPlotLinesElement.new
        .colorSet(@"#ef476f")
        .dashStyleSet(AAChartLineDashStyleTypeShortDashDot)
        .widthSet(@(1.5))
        .valueSet(@(150))
        .zIndexSet(@(5)) //层叠,标示线在图表中显示的层叠级别，值越大，显示越向前
        .labelSet(AALabel.new
                  .useHTMLSet(true)
                  .textSet(@"PLOT LINES 000003")
                  .styleSet(aaStyle))
        ,
        AAPlotLinesElement.new
        .colorSet(@"#ef476f")
        .dashStyleSet(AAChartLineDashStyleTypeDashDot)
        .widthSet(@(1.5))
        .valueSet(@(200))
        .zIndexSet(@(5)) //层叠,标示线在图表中显示的层叠级别，值越大，显示越向前
        .labelSet(AALabel.new
                  .useHTMLSet(true)
                  .textSet(@"PLOT LINES 000004")
                  .styleSet(aaStyle))
        ,
        AAPlotLinesElement.new
        .colorSet(@"#5e5e5e")//颜色值(16进制)
        .dashStyleSet(AAChartLineDashStyleTypeLongDashDot)//样式：Dash,Dot,Solid等,默认Solid
        .widthSet(@(1.5))
        .valueSet(@(300)) //所在位置
        .zIndexSet(@(5)) //层叠,标示线在图表中显示的层叠级别，值越大，显示越向前
        .labelSet(AALabel.new
                  .useHTMLSet(true)
                  .textSet(@"PLOT LINES 000005")
                  .styleSet(aaStyle1))
        ,
    ];
    
    AAYAxis *aaYAxis = aaOptions.yAxis;
    aaYAxis.plotLines = aaPlotLinesArr;
    
    aaOptions.xAxis.plotLines = aaPlotLinesArr;
    
    
    return aaOptions;
}

- (AAOptions *)configureAASeriesElementZones {
    AAOptions *aaOptions = [self configureValueSegmentChartBasicOptions];
    NSArray *seriesArr = aaOptions.series;
    AASeriesElement *aaSeriesElement = seriesArr[0];
    aaSeriesElement.zones = @[
        AAZonesElement.new
        .valueSet(@50)
        .colorSet(@"#ffde33"),
        AAZonesElement.new
        .valueSet(@100)
        .colorSet(@"#ff9933"),
        AAZonesElement.new
        .valueSet(@150)
        .colorSet(@"#cc0033"),
        AAZonesElement.new
        .valueSet(@200)
        .colorSet(@"#660099"),
        AAZonesElement.new
        .valueSet(@300)
        .colorSet(@"#7e0023"),
        
        AAZonesElement.new
        .colorSet(@"#096000"),
    ];
    
    return aaOptions;
}

- (AAOptions *)configureAASeriesElementZonesMixedAAPlotLines {
    AAChartModel *aaChartModel = AAChartModel.new
    .chartTypeSet(AAChartTypeAreaspline)
    .backgroundColorSet(AAColor.whiteColor)
    .categoriesSet(@[@"一月", @"二月", @"三月", @"四月", @"五月", @"六月", @"七月", @"八月", @"九月", @"十月", @"十一月", @"十二月"])
    .markerRadiusSet(@0)
    .yAxisMaxSet(@50)
    .yAxisGridLineStyleSet([AALineStyle styleWithWidth:@0])
    .legendEnabledSet(false)
    .seriesSet(@[
        AASeriesElement.new
        .nameSet(@"2019")
        .fillOpacitySet(@0.5)
        .lineWidthSet(@10)
        .dataSet(@[@7.0, @6.9, @2.5, @14.5, @18.2, @21.5, @5.2, @26.5, @23.3, @45.3, @13.9, @9.6])
        .zonesSet(@[
            AAZonesElement.new
            .valueSet(@12)
            .colorSet(@"#1e90ff"),
            AAZonesElement.new
            .valueSet(@24)
            .colorSet(@"#ef476f"),
            AAZonesElement.new
            .valueSet(@36)
            .colorSet(@"#04d69f"),
            
            AAZonesElement.new
            .colorSet(@"#ffd066"),
                  ]),
               ]);
    //    @[@"#1e90ff",@"#ef476f",@"#ffd066",@"#04d69f",@"#25547c",]
    AAOptions *aaOptions = aaChartModel.aa_toAAOptions;
    
    NSArray *aaPlotLinesArr = @[
        AAPlotLinesElement.new
        .colorSet(@"#1e90ff")//颜色值(16进制)
        .dashStyleSet(AAChartLineDashStyleTypeLongDashDot)//样式：Dash,Dot,Solid等,默认Solid
        .widthSet(@(1)) //标示线粗细
        .valueSet(@(12)) //所在位置
        .zIndexSet(@(1)) //层叠,标示线在图表中显示的层叠级别，值越大，显示越向前
        .labelSet(AALabel.new
                  .textSet(@"PLOT LINES ONE")
                  .styleSet(AAStyleColorSizeWeight(@"#1e90ff", 13, AAChartFontWeightTypeBold)))
        ,
        AAPlotLinesElement.new
        .colorSet(@"#ef476f")
        .dashStyleSet(AAChartLineDashStyleTypeLongDashDot)
        .widthSet(@(1))
        .valueSet(@(24))
        .labelSet(AALabel.new
                  .textSet(@"PLOT LINES TWO")
                  .styleSet(AAStyleColorSizeWeight(@"#ef476f", 13, AAChartFontWeightTypeBold)))
        ,
        AAPlotLinesElement.new
        .colorSet(@"#04d69f")
        .dashStyleSet(AAChartLineDashStyleTypeLongDashDot)
        .widthSet(@(1))
        .valueSet(@(36))
        .labelSet(AALabel.new
                  .textSet(@"PLOT LINES THREE")
                  .styleSet(AAStyleColorSizeWeight(@"#04d69f", 13, AAChartFontWeightTypeBold)))
    ];
    
    AAYAxis *aaYAxis = aaOptions.yAxis;
    aaYAxis.plotLines = aaPlotLinesArr;
    return aaOptions;
}

- (AAOptions *)configureXAxisPlotBandAreaMixedColumnChart {
    AAChartModel *aaChartModel = AAChartModel.new
    .chartTypeSet(AAChartTypeAreaspline)
    .categoriesSet(@[@"一月", @"二月", @"三月", @"四月", @"五月", @"六月",
                     @"七月", @"八月", @"九月", @"十月", @"十一月", @"十二月"])
    .markerRadiusSet(@8.0)//marker点半径为8个像素
    .markerSymbolStyleSet(AAChartSymbolStyleTypeInnerBlank)//marker点为空心效果
    .markerSymbolSet(AAChartSymbolTypeCircle)//marker点为圆形点○
    .yAxisLineWidthSet(@0)
    .yAxisGridLineStyleSet([AALineStyle styleWithWidth:@0])
    .legendEnabledSet(false)
    .seriesSet(@[
        AASeriesElement.new
        .nameSet(@"New York Hot")
        .lineWidthSet(@5.0)
        .colorSet(@"rgba(220,20,60,1)")//猩红色, alpha 透明度 1
        .dataSet(@[@7.0, @6.9, @2.5, @14.5, @18.2, @21.5, @5.2, @26.5, @23.3, @45.3, @13.9, @9.6]),
        AASeriesElement.new
        .typeSet(AAChartTypeColumn)
        .nameSet(@"Berlin Hot")
        .colorSet(@"#25547c")
        .dataSet(@[@7.0, @6.9, @2.5, @14.5, @18.2, @21.5, @5.2, @26.5, @23.3, @45.3, @13.9, @9.6]),
               ]);
    AAOptions *aaOptions = aaChartModel.aa_toAAOptions;
    
    //  refer to https://api.highcharts.com.cn/highcharts#xAxis.plotBands
    NSArray *aaPlotBandsArr = @[
        AAPlotBandsElement.new
        .fromSet(@-0.25)//值域颜色带X轴起始值
        .toSet(@4.75)//值域颜色带X轴结束值
        .colorSet(@"#ef476f66")//值域颜色带填充色
        .zIndexSet(0),//层叠,标示线在图表中显示的层叠级别，值越大，显示越向前
        AAPlotBandsElement.new
        .fromSet(@4.75)
        .toSet(@8.25)
        .colorSet(@"#ffd06666")
        .zIndexSet(0),
        AAPlotBandsElement.new
        .fromSet(@8.25)
        .toSet(@11.25)
        .colorSet(@"#04d69f66")
        .zIndexSet(0),
    ];
    
    AAXAxis *aaXAxis = aaOptions.xAxis;
    aaXAxis.plotBands = aaPlotBandsArr;
    return aaOptions;
}

//https://github.com/AAChartModel/AAChartKit/issues/1391
//https://stackoverflow.com/questions/46418011/highchart-yaxis-plotlines-label-position
- (AAOptions *)configureXAxisPlotLinesForChart {
    AAChartModel *aaChartModel = AAChartModel.new
            .chartTypeSet(AAChartTypeAreaspline)
            .categoriesSet(@[@"一月", @"二月", @"三月", @"四月", @"五月", @"六月",
                    @"七月", @"八月", @"九月", @"十月", @"十一月", @"十二月"])
            .markerRadiusSet(@8.0)//marker点半径为8个像素
            .markerSymbolStyleSet(AAChartSymbolStyleTypeInnerBlank)//marker点为空心效果
            .markerSymbolSet(AAChartSymbolTypeCircle)//marker点为圆形点○
            .yAxisLineWidthSet(@0)
            .yAxisGridLineStyleSet([AALineStyle styleWithWidth:@0])
            .legendEnabledSet(false)
            .seriesSet(@[
                    AASeriesElement.new
                            .nameSet(@"New York Hot")
                            .lineWidthSet(@5.0)
                            .colorSet(@"#25547c")
                            .dataSet(@[@7.0, @6.9, @2.5, @14.5, @18.2, @21.5, @5.2, @26.5, @23.3, @45.3, @13.9, @9.6]),
            ]);

    AAStyle *aaStyle = AAStyle.new
            .colorSet(AAColor.redColor)
            .backgroundColorSet(AAColor.blackColor)
            .borderRadiusSet(@"5px")
            .borderSet(@"2px solid red")
            .opacitySet(@1.0)
            .fontWeightSet(AAChartFontWeightTypeBold)
            .paddingSet(@"6px")
            .fontSizeSet(@"16px");

    NSArray *aaPlotLinesArr = @[
            AAPlotLinesElement.new
                    .colorSet(@"#1e90ff")//颜色值(16进制)
                    .dashStyleSet(AAChartLineDashStyleTypeLongDashDot)//样式：Dash,Dot,Solid等,默认Solid
                    .widthSet(@(3)) //标示线粗细
                    .valueSet(@(3)) //所在位置
                    .zIndexSet(@(9999)) //层叠,标示线在图表中显示的层叠级别，值越大，显示越向前
                    .labelSet(AALabel.new
                            .useHTMLSet(true)
                            .textSet(@"PLOT LINES ONE")
                            .styleSet(aaStyle))
            ,
            AAPlotLinesElement.new
                    .colorSet(@"#ef476f")
                    .dashStyleSet(AAChartLineDashStyleTypeLongDashDot)
                    .widthSet(@(3))
                    .valueSet(@(6))
                    .zIndexSet(@(9999)) //层叠,标示线在图表中显示的层叠级别，值越大，显示越向前
                    .labelSet(AALabel.new
                            .useHTMLSet(true)
                            .textSet(@"PLOT LINES TWO")
                            .styleSet(aaStyle))
            ,
            AAPlotLinesElement.new
                    .colorSet(@"#04d69f")
                    .dashStyleSet(AAChartLineDashStyleTypeLongDashDot)
                    .widthSet(@(3))
                    .valueSet(@(9))
                    .zIndexSet(@(9999)) //层叠,标示线在图表中显示的层叠级别，值越大，显示越向前
                    .labelSet(AALabel.new
                            .useHTMLSet(true)
                            .textSet(@"PLOT LINES THREE")
                            .styleSet(aaStyle))
    ];

    AAOptions *aaOptions = aaChartModel.aa_toAAOptions;
    aaOptions.xAxis.plotBands = aaPlotLinesArr;

    return aaOptions;
}

//https://github.com/AAChartModel/AAChartKit/issues/1391
//https://stackoverflow.com/questions/46418011/highchart-yaxis-plotlines-label-position
- (AAOptions *)configureXAxisPlotLinesForChart2 {
    AAChartModel *aaChartModel = AAChartModel.new
            .chartTypeSet(AAChartTypeAreaspline)
            .categoriesSet(@[@"一月", @"二月", @"三月", @"四月", @"五月", @"六月",
                    @"七月", @"八月", @"九月", @"十月", @"十一月", @"十二月"])
            .markerRadiusSet(@8.0)//marker点半径为8个像素
            .markerSymbolStyleSet(AAChartSymbolStyleTypeInnerBlank)//marker点为空心效果
            .markerSymbolSet(AAChartSymbolTypeCircle)//marker点为圆形点○
            .yAxisLineWidthSet(@0)
            .yAxisGridLineStyleSet([AALineStyle styleWithWidth:@0])
            .legendEnabledSet(false)
            .seriesSet(@[
                    AASeriesElement.new
                            .nameSet(@"New York Hot")
                            .lineWidthSet(@5.0)
                            .colorSet(@"#25547c")
                            .dataSet(@[@7.0, @6.9, @2.5, @14.5, @18.2, @21.5, @5.2, @26.5, @23.3, @45.3, @13.9, @9.6]),
            ]);


    AAStyle *aaStyle = AAStyle.new
            .colorSet(AAColor.redColor)
            .backgroundColorSet(AAColor.blackColor)
            .borderRadiusSet(@"5px")
            .borderSet(@"2px solid red")
            .opacitySet(@1.0)
            .fontWeightSet(AAChartFontWeightTypeBold)
            .paddingSet(@"6px")
            .fontSizeSet(@"16px");

    NSArray *aaPlotLinesArr = @[
            AAPlotLinesElement.new
                    .colorSet(@"#1e90ff")//颜色值(16进制)
                    .dashStyleSet(AAChartLineDashStyleTypeLongDashDot)//样式：Dash,Dot,Solid等,默认Solid
                    .widthSet(@(3)) //标示线粗细
                    .valueSet(@(3)) //所在位置
                    .zIndexSet(@(9999)) //层叠,标示线在图表中显示的层叠级别，值越大，显示越向前
                    .labelSet(AALabel.new
                            .useHTMLSet(true)
                            .rotationSet(@0)
                            .xSet(@-15)
                            .textSet(@"孤<br>岛<br>危<br>机")
                            .styleSet(aaStyle))
            ,
            AAPlotLinesElement.new
                    .colorSet(@"#ef476f")
                    .dashStyleSet(AAChartLineDashStyleTypeLongDashDot)
                    .widthSet(@(3))
                    .valueSet(@(6))
                    .zIndexSet(@(9999)) //层叠,标示线在图表中显示的层叠级别，值越大，显示越向前
                    .labelSet(AALabel.new
                            .useHTMLSet(true)
                            .rotationSet(@0)
                            .xSet(@-15)
                            .textSet(@"使<br>命<br>召<br>唤")
                            .styleSet(aaStyle))
            ,
            AAPlotLinesElement.new
                    .colorSet(@"#04d69f")
                    .dashStyleSet(AAChartLineDashStyleTypeLongDashDot)
                    .widthSet(@(3))
                    .valueSet(@(9))
                    .zIndexSet(@(9999)) //层叠,标示线在图表中显示的层叠级别，值越大，显示越向前
                    .labelSet(AALabel.new
                            .useHTMLSet(true)
                            .rotationSet(@0)
                            .xSet(@-15)
                            .textSet(@"最<br>后<br>生<br>还<br>者")
                            .styleSet(aaStyle))
    ];

    AAOptions *aaOptions = aaChartModel.aa_toAAOptions;
    aaOptions.xAxis.plotBands = aaPlotLinesArr;

    return aaOptions;
}


@end
