//
//  SpecialStyleChartOptionsVC.m
//  AAChartKitDemo
//

#import "SpecialStyleChartOptionsVC.h"
#import "SpecialStyleChartOptionsComposer.h"

@implementation SpecialStyleChartOptionsVC

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
}

- (id)chartConfigurationWithSelectedIndex:(NSInteger)selectedIndex {
    switch (selectedIndex) {
        case  0: return [SpecialStyleChartOptionsComposer everySingleColumnHasGrayBackground];//每根棱柱都有白色背景的柱形图
        case  1: return [SpecialStyleChartOptionsComposer everySingleColumnHasWhiteEmptyBorderLineBackground];//每根棱柱都有空心白色边缘线的柱形图
        case  2: return [SpecialStyleChartOptionsComposer colorfulSpecialStyleColumnChart];//温度计🌡风格的彩色棱柱图

        default:
            return nil;
    }
}

@end
