//
//  JSFunctionForAATooltipVC2.m
//  AAChartKitDemo
//

#import "JSFunctionForAATooltipVC2.h"
#import "JSFunctionForAATooltipV2Composer.h"

@interface JSFunctionForAATooltipVC2 ()

@end

@implementation JSFunctionForAATooltipVC2

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
}

- (id)chartConfigurationWithSelectedIndex:(NSInteger)selectedIndex {
    switch (selectedIndex) {
        case 0: return [JSFunctionForAATooltipV2Composer customColumnChartBorderStyleAndStatesHoverColor];//自定义📊柱状图的 border 样式和手指或鼠标 hover 时的显示效果
        case 1: return [JSFunctionForAATooltipV2Composer customTooltipPostionerFunction];//自定义浮动提示框 Positioner 函数
        case 2: return [JSFunctionForAATooltipV2Composer fixedTooltipPositionByCustomPositionerFunction];//通过 Positioner 函数来实现一个位置固定的提示框
        case 3: return [JSFunctionForAATooltipV2Composer customPlotAreaOutsideComlicatedTooltipStyle];//通过 Positioner 函数来实现绘图区外的复杂浮动提示框样式
        case 4: return [JSFunctionForAATooltipV2Composer makePieChartShow0Data];//使饼图显示为 0 的数据
        case 5: return [JSFunctionForAATooltipV2Composer customizeTooltipShapeAndShadowBeSpecialStyle];
        case 6: return [JSFunctionForAATooltipV2Composer specialStyleForAreaChart];//特殊样式的区域图
        default:
            return nil;
    }
}

@end
