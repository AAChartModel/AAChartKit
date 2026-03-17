//
//  AAOptionsListVC.m
//  AAChartKitDemo
//
//  Created by AnAn on 2026/3/17.
//  Copyright © 2026 An An. All rights reserved.
//

#import "AAOptionsListVC.h"
#import "DrawChartWithAAOptionsVC.h"
#import "PieChartOptionsVC.h"
#import "PolarChartOptionsVC.h"
#import "MultiYAxesChartOptionsVC.h"
#import "PlotLinesBandsZonesOptionsVC.h"
#import "AreasplineChartOptionsVC.h"
#import "TooltipOptionsVC.h"
#import "DataLabelsOptionsVC.h"
#import "XAxisYAxisLabelsOptionsVC.h"
#import "XAxisYAxisTypeOptionsVC.h"

@interface AAOptionsListVC ()

@end

@implementation AAOptionsListVC

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.

    self.title = @"AAOptions";
    self.sectionTitleArr = @[
        @"Draw Chart With AAOptions---通过Options绘图",
        @"Pie Chart Options---通过 AAOptions 自定义饼图",
        @"Polar Chart Options---通过 AAOptions 自定义极地图",
        @"Multi YAxes Chart Options---通过 AAOptions 自定义多 Y 轴图表",
        @"Plot Lines Bands Zones Options---颜色线-颜色带-值颜色分区图表",
        @"Areaspline Chart Options---通过 AAOptions 自定义曲线区域面积图",
        @"Tooltip Options---通过 AAOptions 自定义 tooltip 浮动提示框",
        @"DataLabels Options---通过 AAOptions 自定义 DataLabels 数据标签",
        @"X Axis Y Axis Labels Options---通过 AAOptions 自定义 X 轴 Y 轴的文字标签",
        @"X Axis Y Axis Type Options---通过 AAOptions 自定义 X 轴 Y 轴的轴类型",
    ];

    self.chartTypeTitleArr = @[
        @[
            @"configureTheAAOptionsOfAreaChart---绘制legend居顶部的区域填充图",
            @"configureTheAAOptionsOfSpecialNestedColumnChart---绘制嵌套的柱状图",
            @"configureTheNoGapColumnChart---缝隙很小的柱状图",
            @"adjustChartLeftAndRightMargin---调整图表的左右边距",
            @"configureChartWithBackgroundImage---设置图表绘图区的背景图片",
            @"Adjust Data Accuracy---调整数据精度",
            @"Custom Style Stacked Column---自定义堆积柱状图",
            @"Disable Animation ---禁用动画效果",
            @"Custom Legend Item Style---自定义图例样式",
            @"configure_DataLabels_XAXis_YAxis_Legend_Style---配置DataLabels、XAXis、YAxis、Legend等图表元素样式",
            @"custom Chart Style When No Data---数据为空的情况下,配置图表的 x 轴 y 轴等样式",
            @"custom Chart Style When Every Data Value Is 0---所有数据都为 0 的情况下, 配置图表的 x 轴 y 轴等样式",
            @"disable Spline Chart Hover Animation Effect---禁用手指点击曲线或者掠过曲线后,曲线变粗的动画效果",
            @"yAxisOnTheRightSideChart---y轴在右侧的图表",
            @"configureBoxplotChartWithSpecialStyle---配置盒须图特殊样式",
            @"toFixHighchartsWithAThickLineAt0ValuesTheLineIsHalfHidden---修复 Highcharts 在数值为 0 的时候,线条会变粗,但是却被遮挡一半的问题",
            @"clipForAASeriesElement---修复线条贴边时,但是却被遮挡一半的问题"
        ],
        @[
            @"configurePieChartTitle---自定义饼图的标题",
            @"adjustPieChartTitleAndDataLabelFontStyle---自定义饼图的标题和 DataLabels",
            @"adjustPieChartTitleAndDataLabelFontStyle2---自定义饼图的标题和 DataLabels",
            @"configurePieChartFormatProperty---配置饼图的 dataLabels 的 format 属性",
            @"doubleLayerHalfPieChart---双层嵌套的玉阕图",
            @"adjustPieChartDataLabelStyleAndPostion---调整饼图的 dataLabels 样式及位置使其居中",
            @"showPieChartPointNamePointYAndPointPercentForDataLabels---自定义饼图 dataLabels 显示 point.name, point.x, point.percent",
        ],
        @[
            @"configureThePolygonPolarChart---简单的多边形雷达图",
            @"adjustGroupPaddingForPolarChart---调整柱状极地图的 GroupPadding",
            @"configureTriangleRadarChart---带有颜色标志带的三角形雷达图",
            @"configureQuadrangleRadarChart---带有颜色标志带的四角形雷达图",
            @"configurePentagonRadarChart---带有颜色标志带的五角形雷达图",
            @"configureHexagonRadarChart---带有颜色标志带的六角形雷达图",
            @"configureSpiderWebRadarChart---带有颜色标志带的🕸蜘蛛网状雷达图",
            @"radarChartWithCategories---五边形雷达图示例(带有类别文字)",
        ],
        @[
            @"configureDoubleYAxesAreasplineMixedColumnChart---双Y轴曲线面积-柱形混合图",
            @"configureTripleYAxesColumnMixedSplineChart---三条Y轴柱形-曲线混合图",
            @"configureDoubleYAxesColumnMixedSplineChart---双Y轴柱形-曲线混合图",
            @"configureDoubleYAxesMarketDepthChart---双Y轴市场深度图",
            @"Mirror Column Chart ---镜像效果的柱状图📊",
            @"Mirror Column Chart With No Any Gap---没有任何衔接缝隙的镜像柱状图📊",
        ],
        @[
            @"simpleGaugeChart---简易仪表图",
            @"gaugeChartWithPlotBand---带有颜色标志带的仪表图",
            @"configureAAPlotBandsForChart---带有颜色标志带的曲线图",
            @"configureAAPlotLinesForChart---带有颜色标志线及文字的折线图表",
            @"configureAASeriesElementZones---数据分区 Zones",
            @"configureAASeriesElementZonesMixedAAPlotLines---数据分区 Zones 和颜色标志线混合",
            @"configureXAxisPlotBandAreaMixedColumnChart---X轴有 plotBand 的区域面积与柱形混合图",
            @"configureXAxisPlotLinesForChart---X 轴有 plotLines 的图表",
            @"configureXAxisPlotLinesForChart2---X 轴有 plotLines 的图表2",
            @"configureGradientPlotBandForChart---渐变色的 plotBand",
        ],
        @[
            @"configureComplicatedCustomAreasplineChart---复杂自定义曲线填充图 1",
            @"configureComplicatedCustomAreasplineChart2---复杂自定义曲线填充图 2",
            @"configureComplicatedCustomAreasplineChart3---复杂自定义曲线填充图 3",
            @"fanChart---折扇图",
        ],
        @[
            @"customTooltipStyleByFormatProperties---通过 tooltip 的 format 属性自定义 tooltip 样式内容",
            @"customAreaChartTooltipStyleLikeHTMLTable---自定义 tooltip 提示框为 HTML 表格样式",
            @"customAreasplineChartTooltipContentWithHeaderFormat---通过 tooltip 的 headerFormat 属性来自定义 曲线填充图的 tooltip",
            @"customAreaChartTooltipStyleWithTotalValueHeader---浮动提示框 header 显示总值信息",
            @"customBoxplotTooltipContent---自定义箱线图的浮动提示框头部内容",
        ],
        @[
            @"adjustChartDataLabelsStyle---自定义DataLabels样式",
            @"customizeEveryDataLabelBySinglely---单独自定义指定的data的DataLabels样式",
            @"configureStackingColumnChartDataLabelsOverflow---允许DataLabels文字溢出绘图区",
            @"configureReversedBarChartDataLabelsStyle---调整Y轴倒转的条形图的DataLabels风格样式",
            @"configureColumnChartDataLabelsLayout---配置柱状图📊的 dataLabels 布局",
        ],
        @[
            @"configureXAxisLabelsFontColorWithHTMLString---通过HTML字符串自定义X轴文字颜色",
            @"configureXAxisLabelsFontColorAndFontSizeWithHTMLString---通过HTML字符串自定义X轴文字颜色和字体大小",
            @"customXAxisLabelsBeImages---自定义曲线面积图 X 轴 labels 为一组图片🖼",
            @"configureYAxisLabelsNumericSymbolsMagnitudeOfAerasplineChart---自定义 Y 轴的 Labels 国际单位符基数及国际单位符",
        ],
        @[
            @"dateTimeTypeStepLineChart---时间轴类型的阶梯型折线图📈",
            @"timeDataWithIrregularIntervalsChart---X 轴时间不连续的折线图",
            @"logarithmicAxisLineChart---对数轴折线图📈",
            @"logarithmicAxisScatterChart---对数轴散点图",
            @"dashedAxisAndCustomAxisTitlePositionLineChart---虚线轴 + 自定义轴标题位置折线图",
            @"dashedAxisAndCustomAxisTitlePositionLineChart2---虚线轴 + 自定义轴标题位置折线图2",
        ],
    ];

    [self setUpMainTableView];
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    NSUInteger row = (NSUInteger)indexPath.row;
    NSUInteger section = (NSUInteger)indexPath.section;

    switch (section) {
        case 0: {
            DrawChartWithAAOptionsVC *vc = DrawChartWithAAOptionsVC.new;
            vc.selectedIndex = row;
            vc.navigationItemTitleArr = self.chartTypeTitleArr[section];
            vc.hidesBottomBarWhenPushed = YES;
            [self.navigationController pushViewController:vc animated:YES];
        }
            break;

        case 1: {
            PieChartOptionsVC *vc = PieChartOptionsVC.new;
            vc.selectedIndex = row;
            vc.navigationItemTitleArr = self.chartTypeTitleArr[section];
            vc.hidesBottomBarWhenPushed = YES;
            [self.navigationController pushViewController:vc animated:YES];
        }
            break;

        case 2: {
            PolarChartOptionsVC *vc = PolarChartOptionsVC.new;
            vc.selectedIndex = row;
            vc.navigationItemTitleArr = self.chartTypeTitleArr[section];
            vc.hidesBottomBarWhenPushed = YES;
            [self.navigationController pushViewController:vc animated:YES];
        }
            break;

        case 3: {
            MultiYAxesChartOptionsVC *vc = MultiYAxesChartOptionsVC.new;
            vc.selectedIndex = row;
            vc.navigationItemTitleArr = self.chartTypeTitleArr[section];
            vc.hidesBottomBarWhenPushed = YES;
            [self.navigationController pushViewController:vc animated:YES];
        }
            break;

        case 4: {
            PlotLinesBandsZonesOptionsVC *vc = PlotLinesBandsZonesOptionsVC.new;
            vc.selectedIndex = row;
            vc.navigationItemTitleArr = self.chartTypeTitleArr[section];
            vc.hidesBottomBarWhenPushed = YES;
            [self.navigationController pushViewController:vc animated:YES];
        }
            break;

        case 5: {
            AreasplineChartOptionsVC *vc = AreasplineChartOptionsVC.new;
            vc.selectedIndex = row;
            vc.navigationItemTitleArr = self.chartTypeTitleArr[section];
            vc.hidesBottomBarWhenPushed = YES;
            [self.navigationController pushViewController:vc animated:YES];
        }
            break;

        case 6: {
            TooltipOptionsVC *vc = TooltipOptionsVC.new;
            vc.selectedIndex = row;
            vc.navigationItemTitleArr = self.chartTypeTitleArr[section];
            vc.hidesBottomBarWhenPushed = YES;
            [self.navigationController pushViewController:vc animated:YES];
        }
            break;

        case 7: {
            DataLabelsOptionsVC *vc = DataLabelsOptionsVC.new;
            vc.selectedIndex = row;
            vc.navigationItemTitleArr = self.chartTypeTitleArr[section];
            vc.hidesBottomBarWhenPushed = YES;
            [self.navigationController pushViewController:vc animated:YES];
        }
            break;

        case 8: {
            XAxisYAxisLabelsOptionsVC *vc = XAxisYAxisLabelsOptionsVC.new;
            vc.selectedIndex = row;
            vc.navigationItemTitleArr = self.chartTypeTitleArr[section];
            vc.hidesBottomBarWhenPushed = YES;
            [self.navigationController pushViewController:vc animated:YES];
        }
            break;

        case 9: {
            XAxisYAxisTypeOptionsVC *vc = XAxisYAxisTypeOptionsVC.new;
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
