//
//  PlotLinesBandsZonesOptionsVC.m
//  AAChartKitDemo
//

#import "PlotLinesBandsZonesOptionsVC.h"
#import "PlotLinesBandsZonesOptionsComposer.h"

@implementation PlotLinesBandsZonesOptionsVC

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
}

- (id)chartConfigurationWithSelectedIndex:(NSInteger)selectedIndex {
    switch (selectedIndex) {
        case 0: return [PlotLinesBandsZonesOptionsComposer simpleGaugeChart];//简易仪表图
        case 1: return [PlotLinesBandsZonesOptionsComposer gaugeChartWithPlotBand];//带有颜色标志带的仪表图
        case 2: return [PlotLinesBandsZonesOptionsComposer configureAAPlotBandsForChart];//带有颜色标志带的曲线图
        case 3: return [PlotLinesBandsZonesOptionsComposer configureAAPlotLinesForChart];//带有颜色标志线及文字的折线图表
        case 4: return [PlotLinesBandsZonesOptionsComposer configureAASeriesElementZones];//数据分区 Zones
        case 5: return [PlotLinesBandsZonesOptionsComposer configureAASeriesElementZonesMixedAAPlotLines];//数据分区 Zones 和颜色标志线混合
        case 6: return [PlotLinesBandsZonesOptionsComposer configureXAxisPlotBandAreaMixedColumnChart];//X轴有 plotBand 的区域面积与柱形混合图
        case 7: return [PlotLinesBandsZonesOptionsComposer configureXAxisPlotLinesForChart];//X 轴有 plotLines 的图表
        case 8: return [PlotLinesBandsZonesOptionsComposer configureXAxisPlotLinesForChart2];//X 轴有 plotLines 的图表2
        case 9: return [PlotLinesBandsZonesOptionsComposer configureGradientPlotBandForChart];//渐变色的 plotBand

        default:
            break;
    }
    return nil;
}

@end
