//
//  JSFunctionForAALegendVC.m
//  AAChartKitDemo
//

#import "JSFunctionForAALegendVC.h"
#import "JSFunctionForAALegendComposer.h"

@interface JSFunctionForAALegendVC ()

@end

@implementation JSFunctionForAALegendVC

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
}

- (id)chartConfigurationWithSelectedIndex:(NSInteger)selectedIndex {
    switch (selectedIndex) {
        case 0: return [JSFunctionForAALegendComposer disableLegendClickEventForNormalChart];//禁用普通图表的图例点击事件
        case 1: return [JSFunctionForAALegendComposer disableLegendClickEventForPieChart];//禁用饼图的图例点击事件
        case 2: return [JSFunctionForAALegendComposer customLegendItemClickEvent];//自定义图例点击事件
        default:
            return nil;
    }
}

@end
