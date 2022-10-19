//
//  XAxisYAxisTypeOptionsVC.m
//  AAChartKitDemo
//
//  Created by Admin on 2021/9/16.
//  Copyright © 2021 An An. All rights reserved.
//

#import "XAxisYAxisTypeOptionsVC.h"
#import "AADateUTCTool.h"

@interface XAxisYAxisTypeOptionsVC ()

@end

@implementation XAxisYAxisTypeOptionsVC

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
}

- (id)chartConfigurationWithSelectedIndex:(NSUInteger)selectedIndex {
    switch (self.selectedIndex) {
        case 0: return [self dateTimeTypeStepLineChart];//时间轴类型的阶梯型折线图📈
        case 1: return [self timeDataWithIrregularIntervalsChart];//X 轴时间不连续的折线图
        case 2: return [self logarithmicAxisLineChart];//对数轴折线图📈
        case 3: return [self logarithmicAxisScatterChart];//对数轴散点图
            
        default:
            break;
    }
    return nil;
}

// Refer to the issue https://github.com/AAChartModel/AAChartKit/issues/363
- (AAOptions *)dateTimeTypeStepLineChart {
    AAChartModel *aaChartModel = AAChartModel.new
    .chartTypeSet(AAChartTypeLine)//图形类型
    .animationTypeSet(AAChartAnimationBounce)//图形渲染动画类型为"bounce"
    .titleSet(@"STEP LINE CHART")//图形标题
    .subtitleSet(@"2020/08/08")//图形副标题
    .dataLabelsEnabledSet(NO)//是否显示数字
    .markerSymbolStyleSet(AAChartSymbolStyleTypeBorderBlank)//折线连接点样式
    .markerRadiusSet(@7)//折线连接点半径长度,为0时相当于没有折线连接点
    .seriesSet(@[
        AASeriesElement.new
        .nameSet(@"價格")
        .stepSet(@true)
        .dataSet(@[
            @[AADateUTC(2016, 9 - 1, 2),   @389.00],
            @[AADateUTC(2016, 10 - 1, 4),  @350.10],
            @[AADateUTC(2016, 10 - 1, 4),  @350.10],
            @[AADateUTC(2016, 10 - 1, 17), @389.00],
            @[AADateUTC(2016, 11 - 1, 24), @233.40],
            @[AADateUTC(2016, 11 - 1, 29), @389.00],
            @[AADateUTC(2016, 12 - 1, 20), @233.40],
            @[AADateUTC(2017, 1 - 1, 5),   @389.00],
            @[AADateUTC(2017, 2 - 1, 1),   @233.40],
            @[AADateUTC(2017, 2 - 1, 9),   @389.00],
            @[AADateUTC(2017, 4 - 1, 26),  @233.40],
            @[AADateUTC(2017, 5 - 1, 9),   @389.00],
            @[AADateUTC(2017, 7 - 1, 19),  @291.75],
            @[AADateUTC(2017, 8 - 1, 2),   @389.00],
            @[AADateUTC(2017, 10 - 1, 18), @155.60],
            @[AADateUTC(2017, 10 - 1, 31), @389.00],
            @[AADateUTC(2017, 11 - 1, 21), @194.50],
            @[AADateUTC(2017, 11 - 1, 28), @389.00],
            @[AADateUTC(2017, 11 - 1, 29), @194.50],
            @[AADateUTC(2017, 12 - 1, 13), @389.00],
            @[AADateUTC(2017, 12 - 1, 25), @194.50],
            @[AADateUTC(2018, 1 - 1, 9),   @389.00],
            @[AADateUTC(2018, 2 - 1, 8),   @194.50],
            @[AADateUTC(2018, 2 - 1, 21),  @389.00],
            @[AADateUTC(2018, 3 - 1, 8),   @155.60],
            @[AADateUTC(2018, 3 - 1, 18),  @389.00],
            @[AADateUTC(2018, 6 - 1, 8),   @155.60],
            @[AADateUTC(2018, 6 - 1, 18),  @389.00],
            @[AADateUTC(2018, 7 - 1, 12),  @194.50],
                 ]),
        AASeriesElement.new
        .nameSet(@"PS+")
        .colorSet(@"#FFC535")
        .stepSet(@true)
        .dataSet(@[
            @[AADateUTC(2016, 9 - 1, 2),   @389.00],
            @[AADateUTC(2016, 10 - 1, 4),  @311.20],
            @[AADateUTC(2016, 10 - 1, 4),  @311.20],
            @[AADateUTC(2016, 10 - 1, 17), @389.00],
            @[AADateUTC(2016, 11 - 1, 24), @233.40],
            @[AADateUTC(2016, 11 - 1, 29), @389.00],
            @[AADateUTC(2016, 12 - 1, 20), @233.40],
            @[AADateUTC(2017, 1 - 1, 5),   @389.00],
            @[AADateUTC(2017, 2 - 1, 1),   @194.50],
            @[AADateUTC(2017, 2 - 1, 9),   @389.00],
            @[AADateUTC(2017, 4 - 1, 26),  @194.50],
            @[AADateUTC(2017, 5 - 1, 9),   @389.00],
            @[AADateUTC(2017, 7 - 1, 19),  @194.50],
            @[AADateUTC(2017, 8 - 1, 2),   @389.00],
            @[AADateUTC(2017, 10 - 1, 18), @155.60],
            @[AADateUTC(2017, 10 - 1, 31), @389.00],
            @[AADateUTC(2017, 11 - 1, 21), @155.60],
            @[AADateUTC(2017, 11 - 1, 28), @389.00],
            @[AADateUTC(2017, 11 - 1, 29), @155.60],
            @[AADateUTC(2017, 12 - 1, 13), @389.00],
            @[AADateUTC(2017, 12 - 1, 25), @155.60],
            @[AADateUTC(2018, 1 - 1, 9),   @389.00],
            @[AADateUTC(2018, 2 - 1, 8),   @155.60],
            @[AADateUTC(2018, 2 - 1, 21),  @389.00],
            @[AADateUTC(2018, 3 - 1, 8),   @155.60],
            @[AADateUTC(2018, 3 - 1, 18),  @389.00],
            @[AADateUTC(2018, 6 - 1, 8),   @155.60],
            @[AADateUTC(2018, 6 - 1, 18),  @389.00],
            @[AADateUTC(2018, 7 - 1, 12),  @155.60],
                 ]),
               ]);
    
    AAOptions *aaOptions = aaChartModel.aa_toAAOptions;

    aaOptions.xAxis
    .typeSet(AAChartAxisTypeDatetime)
    .dateTimeLabelFormatsSet(
        AADateTimeLabelFormats.new
                       .monthSet(@"%e.%m.%y"))
    ;

    return aaOptions;
}

//X 轴时间不连续的折线图
//https://github.com/AAChartModel/AAChartKit/issues/1220
- (AAOptions *)timeDataWithIrregularIntervalsChart {
    AAChartModel *aaChartModel = AAChartModel.new
    .chartTypeSet(AAChartTypeLine)//图形类型
    .titleSet(@"Snow depth at Vikjafjellet, Norway")//图形标题
    .subtitleSet(@"Irregular time data in AAChartKit")//图形副标题
    .colorsThemeSet(@[@"#fe117c",@"#ffc069",@"#06caf4",])
    .dataLabelsEnabledSet(NO)//是否显示数字
    .markerSymbolStyleSet(AAChartSymbolStyleTypeInnerBlank)//折线连接点样式
    .markerRadiusSet(@7)//折线连接点半径长度,为0时相当于没有折线连接点
    .seriesSet(@[
        AASeriesElement.new
        .nameSet(@"Winter 2014-2015")
        .dataSet(@[
            @[AADateUTC(1970, 10, 25),    @0],
            @[AADateUTC(1970, 11,  6), @0.25],
            @[AADateUTC(1970, 11, 20), @1.41],
            @[AADateUTC(1970, 11, 25), @1.64],
            @[AADateUTC(1971, 0,  4),   @1.6],
            @[AADateUTC(1971, 0, 17),  @2.55],
            @[AADateUTC(1971, 0, 24),  @2.62],
            @[AADateUTC(1971, 1,  4),   @2.5],
            @[AADateUTC(1971, 1, 14),  @2.42],
            @[AADateUTC(1971, 2,  6),  @2.74],
            @[AADateUTC(1971, 2, 14),  @2.62],
            @[AADateUTC(1971, 2, 24),   @2.6],
            @[AADateUTC(1971, 3,  1),  @2.81],
            @[AADateUTC(1971, 3, 11),  @2.63],
            @[AADateUTC(1971, 3, 27),  @2.77],
            @[AADateUTC(1971, 4,  4),  @2.68],
            @[AADateUTC(1971, 4,  9),  @2.56],
            @[AADateUTC(1971, 4, 14),  @2.39],
            @[AADateUTC(1971, 4, 19),   @2.3],
            @[AADateUTC(1971, 5,  4),     @2],
            @[AADateUTC(1971, 5,  9),  @1.85],
            @[AADateUTC(1971, 5, 14),  @1.49],
            @[AADateUTC(1971, 5, 19),  @1.27],
            @[AADateUTC(1971, 5, 24),  @0.99],
            @[AADateUTC(1971, 5, 29),  @0.67],
            @[AADateUTC(1971, 6,  3),  @0.18],
            @[AADateUTC(1971, 6,  4),     @0]
                 ]),
        AASeriesElement.new
        .nameSet(@"Winter 2015-2016")
        .dataSet(@[
            @[AADateUTC(1970, 10,  9),    @0],
            @[AADateUTC(1970, 10, 15), @0.23],
            @[AADateUTC(1970, 10, 20), @0.25],
            @[AADateUTC(1970, 10, 25), @0.23],
            @[AADateUTC(1970, 10, 30), @0.39],
            @[AADateUTC(1970, 11,  5), @0.41],
            @[AADateUTC(1970, 11, 10), @0.59],
            @[AADateUTC(1970, 11, 15), @0.73],
            @[AADateUTC(1970, 11, 20), @0.41],
            @[AADateUTC(1970, 11, 25), @1.07],
            @[AADateUTC(1970, 11, 30), @0.88],
            @[AADateUTC(1971, 0,  5),  @0.85],
            @[AADateUTC(1971, 0, 11),  @0.89],
            @[AADateUTC(1971, 0, 17),  @1.04],
            @[AADateUTC(1971, 0, 20),  @1.02],
            @[AADateUTC(1971, 0, 25),  @1.03],
            @[AADateUTC(1971, 0, 30),  @1.39],
            @[AADateUTC(1971, 1,  5),  @1.77],
            @[AADateUTC(1971, 1, 26),  @2.12],
            @[AADateUTC(1971, 3, 19),   @2.1],
            @[AADateUTC(1971, 4,  9),   @1.7],
            @[AADateUTC(1971, 4, 29),  @0.85],
            @[AADateUTC(1971, 5,  7),     @0]
                 ]),
        AASeriesElement.new
        .nameSet(@"Winter 2016-2017")
        .dataSet(@[
            @[AADateUTC(1970, 9, 15),     @0],
            @[AADateUTC(1970, 9, 31),  @0.09],
            @[AADateUTC(1970, 10,  7), @0.17],
            @[AADateUTC(1970, 10, 10),  @0.1],
            @[AADateUTC(1970, 11, 10),  @0.1],
            @[AADateUTC(1970, 11, 13),  @0.1],
            @[AADateUTC(1970, 11, 16), @0.11],
            @[AADateUTC(1970, 11, 19), @0.11],
            @[AADateUTC(1970, 11, 22), @0.08],
            @[AADateUTC(1970, 11, 25), @0.23],
            @[AADateUTC(1970, 11, 28), @0.37],
            @[AADateUTC(1971, 0, 16),  @0.68],
            @[AADateUTC(1971, 0, 19),  @0.55],
            @[AADateUTC(1971, 0, 22),   @0.4],
            @[AADateUTC(1971, 0, 25),   @0.4],
            @[AADateUTC(1971, 0, 28),  @0.37],
            @[AADateUTC(1971, 0, 31),  @0.43],
            @[AADateUTC(1971, 1,  4),  @0.42],
            @[AADateUTC(1971, 1,  7),  @0.39],
            @[AADateUTC(1971, 1, 10),  @0.39],
            @[AADateUTC(1971, 1, 13),  @0.39],
            @[AADateUTC(1971, 1, 16),  @0.39],
            @[AADateUTC(1971, 1, 19),  @0.35],
            @[AADateUTC(1971, 1, 22),  @0.45],
            @[AADateUTC(1971, 1, 25),  @0.62],
            @[AADateUTC(1971, 1, 28),  @0.68],
            @[AADateUTC(1971, 2,  4),  @0.68],
            @[AADateUTC(1971, 2,  7),  @0.65],
            @[AADateUTC(1971, 2, 10),  @0.65],
            @[AADateUTC(1971, 2, 13),  @0.75],
            @[AADateUTC(1971, 2, 16),  @0.86],
            @[AADateUTC(1971, 2, 19),  @1.14],
            @[AADateUTC(1971, 2, 22),   @1.2],
            @[AADateUTC(1971, 2, 25),  @1.27],
            @[AADateUTC(1971, 2, 27),  @1.12],
            @[AADateUTC(1971, 2, 30),  @0.98],
            @[AADateUTC(1971, 3,  3),  @0.85],
            @[AADateUTC(1971, 3,  6),  @1.04],
            @[AADateUTC(1971, 3,  9),  @0.92],
            @[AADateUTC(1971, 3, 12),  @0.96],
            @[AADateUTC(1971, 3, 15),  @0.94],
            @[AADateUTC(1971, 3, 18),  @0.99],
            @[AADateUTC(1971, 3, 21),  @0.96],
            @[AADateUTC(1971, 3, 24),  @1.15],
            @[AADateUTC(1971, 3, 27),  @1.18],
            @[AADateUTC(1971, 3, 30),  @1.12],
            @[AADateUTC(1971, 4,  3),  @1.06],
            @[AADateUTC(1971, 4,  6),  @0.96],
            @[AADateUTC(1971, 4,  9),  @0.87],
            @[AADateUTC(1971, 4, 12),  @0.88],
            @[AADateUTC(1971, 4, 15),  @0.79],
            @[AADateUTC(1971, 4, 18),  @0.54],
            @[AADateUTC(1971, 4, 21),  @0.34],
            @[AADateUTC(1971, 4, 25),     @0]
                 ]),
               ]);
    
    AAOptions *aaOptions = aaChartModel.aa_toAAOptions;

    aaOptions.xAxis
    .typeSet(AAChartAxisTypeDatetime)
    .dateTimeLabelFormatsSet(AADateTimeLabelFormats.new
                             .monthSet(@"%e. %b")
                             .yearSet(@"%b")
                             );

    return aaOptions;
}

- (AAOptions *)logarithmicAxisLineChart {
    return AAOptions.new
    .titleSet(AATitle.new
              .textSet(@"Logarithmic Axis Chart"))
    .chartSet(AAChart.new
              .typeSet(AAChartTypeLine))
    .xAxisSet(AAXAxis.new
              .typeSet(AAChartAxisTypeLogarithmic)
              .gridLineWidthSet(@0.6))
    .yAxisSet(AAYAxis.new
              .typeSet(AAChartAxisTypeLogarithmic)
              .minorTickIntervalSet(@0.1))
    .tooltipSet(AATooltip.new
                .enabledSet(true)
                .headerFormatSet(@"<b>{series.name}</b><br />")
                .pointFormatSet(@"x = {point.x}, y = {point.y}"))
    .seriesSet(@[
        AASeriesElement.new
        .nameSet(@"Tokyo Hot")
        .dataSet(@[@1, @2, @4, @8, @16, @32, @64, @128, @256, @512])
               ]);
}

- (AAOptions *)logarithmicAxisScatterChart {
    AAMarker *aaMarker = AAMarker.new
    .radiusSet(@8)
    .symbolSet(AAChartSymbolTypeCircle)
    .fillColorSet(AAColor.whiteColor)
    .lineWidthSet(@3)
    .lineColorSet(AAColor.redColor);
    
    NSArray *scatterData = @[
        @[@550, @870], @[@738, @362], @[@719, @711], @[@547, @665], @[@595, @197], @[@332, @144],
        @[@581, @555], @[@196, @862], @[@6,   @837], @[@400, @924], @[@888, @148], @[@785, @730],
        @[@374, @358], @[@440,  @69], @[@704, @318], @[@646, @506], @[@238, @662], @[@233,  @56],
        @[@622, @572], @[@563, @903], @[@744, @672], @[@904, @646], @[@390, @325], @[@536, @491],
        @[@676, @186], @[@467, @145], @[@790, @114], @[@437, @793], @[@853, @243], @[@947, @196],
        @[@395, @728], @[@527, @148], @[@516, @675], @[@632, @562], @[@52,  @552], @[@605, @580],
        @[@790, @865], @[@156, @87],  @[@584, @290], @[@339, @921], @[@383, @633], @[@106, @373],
        @[@762, @863], @[@424, @149], @[@608, @959], @[@574, @711], @[@468, @664], @[@268,  @77],
        @[@894, @850], @[@171, @102], @[@203, @565], @[@592, @549], @[@86,  @486], @[@526, @244],
        @[@323, @575], @[@488, @842], @[@401, @618], @[@148,  @43], @[@828, @314], @[@554, @711],
        @[@685, @868], @[@387, @435], @[@469, @828], @[@623, @506], @[@436, @184], @[@450, @156],
        @[@805, @517], @[@465, @997], @[@728, @802], @[@231, @438], @[@935, @438], @[@519, @856],
        @[@378, @579], @[@73,  @765], @[@223, @219], @[@359, @317], @[@686, @742], @[@17,  @790],
        @[@20,   @35], @[@410, @644], @[@984, @325], @[@503, @882], @[@900, @187], @[@578, @968],
        @[@27,  @718], @[@355, @704], @[@395, @332], @[@641, @548], @[@964, @374], @[@215, @472],
        @[@323,  @66], @[@882, @542], @[@671, @327], @[@650, @193], @[@828, @632], @[@760, @929],
        @[@607, @335], @[@928, @826], @[@462, @598], @[@631, @411]
    ];
    
    return AAOptions.new
    .titleSet(AATitle.new
              .textSet(@"Logarithmic Axis Scatter Chart"))
    .chartSet(AAChart.new
              .typeSet(AAChartTypeScatter))
    .xAxisSet(AAXAxis.new
              .typeSet(AAChartAxisTypeLogarithmic)
              .minSet(@1)
              .maxSet(@1000)
              .endOnTickSet(true)
              .tickIntervalSet(@1)
              .minorTickIntervalSet(@0.1)
              .gridLineWidthSet(@1))
    .yAxisSet(AAYAxis.new
              .typeSet(AAChartAxisTypeLogarithmic)
              .minSet(@1)
              .maxSet(@1000)
              .tickIntervalSet(@1)
              .minorTickIntervalSet(@0.1)
              .gridLineWidthSet(@1)
              .titleSet((id)NSNull.null))
    .seriesSet(@[
        AASeriesElement.new
        .markerSet(aaMarker)
        .dataSet(scatterData)
               ]);
}

@end
