//
//  AAOptionsWithJSListVC.m
//  AAChartKitDemo
//
//  Created by AnAn on 2026/3/17.
//  Copyright © 2026 An An. All rights reserved.
//

#import "AAOptionsWithJSListVC.h"
#import "JSFunctionForAATooltipVC.h"
#import "JSFunctionForAAAxisVC.h"
#import "JSFunctionForAALegendVC.h"
#import "JSFunctionForAAChartEventsVC.h"

@interface AAOptionsWithJSListVC ()

@end

@implementation AAOptionsWithJSListVC

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.

    self.title = @"AAOptionsWithJS";
    self.sectionTitleArr = @[
        @"JS Function For AATooltip---支持 JS 函数属性",
        @"JS Function For AAAxis Labels---通过 JSFunction 自定义 AAAxis 的 Labels",
        @"JS Function For AALegend Click Events---通过 JSFunction 自定义 Legend  图例的点击事件",
        @"JS Function For AAChartEvents---通过 JSFunction 自定义 AAChartEvents 的事件",
    ];

    self.chartTypeTitleArr = @[
        @[
            @"customAreaChartTooltipStyleWithSimpleFormatString---简单字符串拼接",
            @"customAreaChartTooltipStyleWithDifferentUnitSuffix---自定义不同单位后缀",
            @"customAreaChartTooltipStyleWithColorfulHtmlLabels---自定义多彩颜色文字",
            @"customLineChartTooltipStyleWhenValueBeZeroDoNotShow---值为0时,在tooltip中不显示",
            @"customStackedAndGroupedColumnChartTooltip---自定义分组堆积柱状图tooltip内容",
            @"configureSpecialStyleTrianglePolarChart---外部显示六边形边框的三角形雷达图",
            @"customArearangeChartTooltip---自定义面积范围图的 tooltip",
            @"customLineChartOriginalPointPositionByConfiguringXAxisFormatterAndTooltipFormatter---通过自定义X轴的 labels 的 Formatter 和 tooltip 的 Formatter 来调整折线图的 X 轴左边距",
            @"customTooltipWhichDataSourceComeFromOutSideRatherThanSeries---通过来自外部的数据源来自定义 tooltip (而非常规的来自图表的 series)",
            @"customAreasplineChartTooltipStyleByDivWithCSS---通过自定义 div 的 css 样式来自定义复杂效果的 tooltip 浮动提示框",
        ],
        @[
            @"customYAxisLabels---自定义Y轴文字",
            @"customYAxisLabels2---自定义Y轴文字2",
            @"customAreaChartXAxisLabelsTextUnitSuffix1---自定义X轴文字单位后缀(通过 formatter 函数)",
            @"customAreaChartXAxisLabelsTextUnitSuffix2---自定义X轴文字单位后缀(不通过 formatter 函数)",
            @"configureTheAxesLabelsFormattersOfDoubleYAxesChart---配置双 Y 轴图表的 Y 轴文字标签的 Formatter 函数 示例 1",
            @"configureTheAxesLabelsFormattersOfDoubleYAxesChart2---配置双 Y 轴图表的 Y 轴文字标签的 Formatter 函数 示例 2",
            @"configureTheAxesLabelsFormattersOfDoubleYAxesChart3---配置双 Y 轴图表的 Y 轴文字标签的 Formatter 函数 示例 3",
            @"customColumnChartXAxisLabelsTextByInterceptTheFirstFourCharacters---通过截取前四个字符来自定义 X 轴 labels",
            @"customSpiderChartStyle---自定义蜘蛛🕷🕸图样式",
            @"customizeEveryDataLabelSinglelyByDataLabelsFormatter---通过 DataLabels 的 formatter 函数来实现单个数据标签🏷自定义",
            @"customXAxisLabelsBeImages---自定义 X轴 labels 为一组图片",
            @"loadImageForAATooltip---为自定义 AATooltip 加载图片内容",
        ],
        @[
            @"disableLegendClickEventForNormalChart---禁用普通图表的图例点击事件",
            @"disableLegendClickEventForPieChart---禁用饼图的图例点击事件",
            @"customLegendItemClickEvent---自定义图例点击事件",
        ],
        @[
            @"setCrosshairAndTooltipToTheDefaultPositionAfterLoadingChart---图表加载完成后设置 crosshair 和 tooltip 到默认位置",
            @"generalDrawingChart---普通绘图",
            @"advancedTimeLineChart---高级时间轴绘图",
            @"configureBlinkMarkerChart---配置闪烁特效的 marker 图表",
            @"configureSpecialStyleMarkerOfSingleDataElementChartWithBlinkEffect---配置闪烁特效的 marker 图表2",
            @"configureScatterChartWithBlinkEffect---配置闪烁特效的散点图",
            @"automaticallyHideTooltipAfterItIsShown---在浮动提示框显示后自动隐藏",
            @"dynamicHeightGridLineAreaChart---动态高度的网格线区域填充图",
            @"customizeYAxisPlotLinesLabelBeSpecialStyle---自定义 Y 轴轴线上面的标签文字特殊样式",
            @"configureECGStyleChart---配置心电图样式图表📈",
            @"configureTheSizeOfTheSliceOfDonutAndPieChart---配置环形图和饼图的扇区大小",
            @"configurePlotBackgroundClickEvent---配置绘图区的点击事件",
        ],
    ];

    [self setUpMainTableView];
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    NSUInteger row = (NSUInteger) indexPath.row;
    NSUInteger section = (NSUInteger) indexPath.section;

    switch (section) {
        case 0: {
            JSFunctionForAATooltipVC *vc = JSFunctionForAATooltipVC.new;
            vc.selectedIndex = row;
            vc.navigationItemTitleArr = self.chartTypeTitleArr[section];
            vc.hidesBottomBarWhenPushed = YES;
            [self.navigationController pushViewController:vc animated:YES];
        }
            break;

        case 1: {
            JSFunctionForAAAxisVC *vc = JSFunctionForAAAxisVC.new;
            vc.selectedIndex = row;
            vc.navigationItemTitleArr = self.chartTypeTitleArr[section];
            vc.hidesBottomBarWhenPushed = YES;
            [self.navigationController pushViewController:vc animated:YES];
        }
            break;

        case 2: {
            JSFunctionForAALegendVC *vc = JSFunctionForAALegendVC.new;
            vc.selectedIndex = row;
            vc.navigationItemTitleArr = self.chartTypeTitleArr[section];
            vc.hidesBottomBarWhenPushed = YES;
            [self.navigationController pushViewController:vc animated:YES];
        }
            break;

        case 3: {
            JSFunctionForAAChartEventsVC *vc = JSFunctionForAAChartEventsVC.new;
            vc.selectedIndex = row;
            vc.navigationItemTitleArr = self.chartTypeTitleArr[section];
            vc.hidesBottomBarWhenPushed = YES;
            [self.navigationController pushViewController:vc animated:YES];
        }
            break;

        default:
            break;
    }
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
