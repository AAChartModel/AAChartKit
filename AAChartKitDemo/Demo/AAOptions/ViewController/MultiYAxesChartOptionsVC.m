//
//  MultiYAxesChartOptionsVC.m
//  AAChartKitDemo
//

#import "MultiYAxesChartOptionsVC.h"
#import "MultiYAxesChartOptionsComposer.h"

@implementation MultiYAxesChartOptionsVC

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
}

- (id)chartConfigurationWithSelectedIndex:(NSInteger)selectedIndex {
    switch (selectedIndex) {
        case 0: return [MultiYAxesChartOptionsComposer configureDoubleYAxesAreasplineMixedColumnChart];//双Y轴曲线面积-柱形混合图
        case 1: return [MultiYAxesChartOptionsComposer configureTripleYAxesColumnMixedSplineChart];//三条Y轴柱形-曲线混合图
        case 2: return [MultiYAxesChartOptionsComposer configureDoubleYAxesColumnMixedSplineChart];//双Y轴柱形-曲线混合图
        case 3: return [MultiYAxesChartOptionsComposer configureDoubleYAxesMarketDepthChart];//双Y轴市场深度图
        case 4: return [MultiYAxesChartOptionsComposer configureTheMirrorColumnChart];//正负对称的镜像柱状图
        case 5: return [MultiYAxesChartOptionsComposer configureTheMirrorColumnChartWithNoAnyGap];//没有任何衔接缝隙的镜像柱状图📊
            
        default:
            break;
    }
    return nil;
}

@end
