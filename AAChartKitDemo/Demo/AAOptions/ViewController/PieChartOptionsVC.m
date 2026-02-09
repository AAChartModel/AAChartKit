//
//  PieChartOptionsVC.m
//  AAChartKitDemo
//

#import "PieChartOptionsVC.h"
#import "PieChartOptionsComposer.h"

@implementation PieChartOptionsVC

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
}

- (id)chartConfigurationWithSelectedIndex:(NSInteger)selectedIndex {
    switch (selectedIndex) {
        case 0: return [AAPieChartOptionsComposer showPieChartPointNamePointYAndPointPercentForDataLabels];//自定义饼图的标题
        case 1: return [AAPieChartOptionsComposer adjustPieChartTitleAndDataLabelFontStyle];//自定义饼图的标题和 DataLabels
        case 2: return [AAPieChartOptionsComposer adjustPieChartTitleAndDataLabelFontStyle2];//自定义饼图的标题和 DataLabels
        case 3: return [AAPieChartOptionsComposer configurePieChartFormatProperty];//配置饼图的 dataLabels 的 format 属性
        case 4: return [AAPieChartOptionsComposer doubleLayerHalfPieChart];//双层嵌套的玉阕图
        case 5: return [AAPieChartOptionsComposer adjustPieChartDataLabelStyleAndPostion];//调整饼图的 dataLabels 样式及位置使其居中
        case 6: return [AAPieChartOptionsComposer showPieChartPointNamePointYAndPointPercentForDataLabels]; //自定义饼图 dataLabels 显示 point.name, point.x, point.percent

        default:
            break;
    }
    return nil;
}

@end
