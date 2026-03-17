//
//  DrawChartWithAAOptionsVC.m
//  AAChartKitDemo
//

#import "DrawChartWithAAOptionsVC.h"
#import "DrawChartWithAAOptionsComposer.h"

@implementation DrawChartWithAAOptionsVC

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
}

- (id)chartConfigurationWithSelectedIndex:(NSInteger)selectedIndex {
    switch (selectedIndex) {
        case 0:  return [DrawChartWithAAOptionsComposer configureTheAAOptionsOfAreaChart];
        case 1:  return [DrawChartWithAAOptionsComposer configureTheAAOptionsOfSpecialNestedColumnChart];
        case 2:  return [DrawChartWithAAOptionsComposer configureTheNoGapColunmChart];
        case 3:  return [DrawChartWithAAOptionsComposer adjustChartLeftAndRightMargin];
        case 4:  return [DrawChartWithAAOptionsComposer configureChartWithBackgroundImage];
        case 5:  return [DrawChartWithAAOptionsComposer adjustChartSeriesDataAccuracy];
        case 6:  return [DrawChartWithAAOptionsComposer customStyleStackedColumnChart];
        case 7:  return [DrawChartWithAAOptionsComposer disableChartAnimation];//禁用图表的渲染动画效果
        case 8:  return [DrawChartWithAAOptionsComposer customChartLengendItemStyle];//自定义图表的 legend 图例样式
        case 9:  return [DrawChartWithAAOptionsComposer configure_DataLabels_XAXis_YAxis_Legend_Style];//配置DataLabels、XAXis、YAxis、Legend等图表元素样式
        case 10: return [DrawChartWithAAOptionsComposer customChartStyleWhenNoData];//数据为空的情况下,配置图表的 x 轴 y 轴等样式
        case 11: return [DrawChartWithAAOptionsComposer customChartStyleWhenEveryDataValueIsZero];//所有数据都为 0 的情况下, 配置图表的 x 轴 y 轴等样式
        case 12: return [DrawChartWithAAOptionsComposer disableSpineChartHoverAnimationEffect];//禁用手指点击曲线或者掠过曲线后,曲线变粗的动画效果
        case 13: return [DrawChartWithAAOptionsComposer yAxisOnTheRightSideChart];//y轴在右侧的图表
        case 14: return [DrawChartWithAAOptionsComposer configureBoxplotChartWithSpecialStyle];//配置箱线图特殊样式
        case 15: return [DrawChartWithAAOptionsComposer toFixHighchartsWithAThickLineAt0ValuesTheLineIsHalfHidden];//修复 Highcharts 在数值为 0 的时候,线条会变粗,但是却被遮挡一半的问题
        case 16: return [DrawChartWithAAOptionsComposer clipForAASeriesElement];//修复线条贴边时,但是却被遮挡一半的问题
            
        default:
            break;
    }
    return nil;
}

@end
