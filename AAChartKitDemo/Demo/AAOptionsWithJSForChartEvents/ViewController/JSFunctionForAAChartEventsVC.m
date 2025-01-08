//
//  JSFunctionForAAChartEventsVC.m
//  AAChartKitDemo
//
//  Created by AnAn on 2024/9/3.
//  Copyright © 2024 An An. All rights reserved.
//

#import "JSFunctionForAAChartEventsVC.h"
#import "JSFunctionForAAChartEventsComposer.h"
#import "JSFunctionBeforeAndAfterRenderingComposer.h"
#import "JSFunctionBeforeAndAfterRenderingComposer2.h"
#import "JSFunctionBeforeAndAfterRenderingComposer3.h"
#import "JSFunctionBeforeAndAfterRenderingComposer4.h"
#import "JSFunctionBeforeAndAfterRenderingComposer5.h"
#import "JSFunctionBeforeAndAfterRenderingComposer6.h"

@interface JSFunctionForAAChartEventsVC ()

@end

@implementation JSFunctionForAAChartEventsVC

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
}

- (id)chartConfigurationWithSelectedIndex:(NSUInteger)selectedIndex {
    switch (selectedIndex) {
        case 0: return [JSFunctionBeforeAndAfterRenderingComposer speedometerChart]; //图表加载完成后,自动设置默认的十字准星和浮动提示框的位置
        case 1: return [JSFunctionBeforeAndAfterRenderingComposer speedometerWithDualAxesChart]; //自由绘图
        case 2: return [JSFunctionBeforeAndAfterRenderingComposer2 speedometerChart]; //高级时间线图
        case 3: return [JSFunctionBeforeAndAfterRenderingComposer3 synchronizedChart]; //配置闪烁的标记点
        case 4: return [JSFunctionBeforeAndAfterRenderingComposer4 customPointerStyleGaugeChart]; //配置单个数据元素的特殊样式标记点即闪烁特效
        case 5: return [JSFunctionBeforeAndAfterRenderingComposer5 categoryGroupedColumnChart]; //配置散点图的闪烁特效
        case 6: return [JSFunctionBeforeAndAfterRenderingComposer6 forceStackedBarChart]; //图表加载完成后,自动隐藏浮动提示框
        case 7: return [JSFunctionForAAChartEventsComposer dynamicHeightGridLineAreaChart]; //动态高度网格线的区域填充图
        case 8: return [JSFunctionForAAChartEventsComposer customizeYAxisPlotLinesLabelBeSpecialStyle]; //自定义 Y 轴轴线上面的标签文字特殊样式
        case 9: return [JSFunctionForAAChartEventsComposer configureECGStyleChart]; //配置心电图样式的图表
//        case 10: return [self configureTheSizeOfTheSliceOfDonutAndPieChart]; //配置环形图和饼图的扇区大小
//        case 11: return [self configurePlotBackgroundClickEvent]; //配置绘图区的点击事件
////        case 11: return [JSFunctionForAAChartEventsComposer2 defaultSelectedAPointForLineChart];
//        case 11: return [JSFunctionForAAChartEventsComposer2 addClickEventToHighlightXAxisLabel];



    }
    return nil;
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
