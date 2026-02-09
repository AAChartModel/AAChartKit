//
//  DataLabelsOptionsVC.m
//  AAChartKitDemo
//

#import "DataLabelsOptionsVC.h"
#import "DataLabelsOptionsComposer.h"

@implementation DataLabelsOptionsVC

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
}

- (id)chartConfigurationWithSelectedIndex:(NSInteger)selectedIndex {
    switch (selectedIndex) {
        case 0: return [DataLabelsOptionsComposer adjustChartDataLabelsStyle];//自定义DataLabels样式
        case 1: return [DataLabelsOptionsComposer customizeEveryDataLabelBySinglely];//单独自定义指定的data的DataLabels样式
        case 2: return [DataLabelsOptionsComposer configureStackingColumnChartDataLabelsOverflow];//允许DataLabels文字溢出绘图区
        case 3: return [DataLabelsOptionsComposer configureReversedBarChartDataLabelsStyle];//调整Y轴倒转的条形图的DataLabels风格样式
        case 4: return [DataLabelsOptionsComposer configureColumnChartDataLabelsLayout];//配置柱状图📊的 dataLabels 布局

        default:
            break;
    }
    return nil;
}

@end
