//
//  XAxisYAxisTypeOptionsVC.m
//  AAChartKitDemo
//

#import "XAxisYAxisTypeOptionsVC.h"
#import "XAxisYAxisTypeOptionsComposer.h"

@implementation XAxisYAxisTypeOptionsVC

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
}

- (id)chartConfigurationWithSelectedIndex:(NSInteger)selectedIndex {
    switch (selectedIndex) {
        case 0: return [XAxisYAxisTypeOptionsComposer dateTimeTypeStepLineChart];//时间轴类型的阶梯型折线图📈
        case 1: return [XAxisYAxisTypeOptionsComposer timeDataWithIrregularIntervalsChart];//X 轴时间不连续的折线图
        case 2: return [XAxisYAxisTypeOptionsComposer logarithmicAxisLineChart];//对数轴折线图📈
        case 3: return [XAxisYAxisTypeOptionsComposer logarithmicAxisScatterChart];//对数轴散点图
        case 4: return [XAxisYAxisTypeOptionsComposer dashedAxisAndCustomAxisTitlePositionLineChart];//虚线轴 + 自定义轴标题位置折线图
        case 5: return [XAxisYAxisTypeOptionsComposer dashedAxisAndCustomAxisTitlePositionLineChart2];//虚线轴 + 自定义轴标题位置折线图2

        default:
            break;
    }
    return nil;
}

@end
