//
//  AAChartModelListVC.m
//  AAChartKitDemo
//
//  Created by AnAn on 2024/9/6.
//  Copyright © 2024 An An. All rights reserved.
//

#import "AAChartModelListVC.h"
#import "BasicChartVC.h"
#import "SpecialChartVC.h"
#import "CustomStyleChartVC.h"
#import "MixedChartVC.h"
#import "CustomStyleForScatterChartVC.h"
#import "CustomStyleForBubbleChartVC.h"
#import "CustomTableViewCell.h"
#import "AAEasyTool.h"

@interface AAChartModelListVC ()

@end

@implementation AAChartModelListVC

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    self.title = @"AAChartModel";
    
    self.sectionTitleArr = @[
        @"Basic Type---基础类型",
        @"Special Type---特别类型",
        @"Custom Style---自定义风格样式图表",
        @"Mixed Type Chart---混合图表",
        @"Scatter Chart With Custom Style | 一些自定义风格样式散点图",
        @"Bubble Chart With Custom Style | 一些自定义风格样式气泡图",
    ];
    
    self.chartTypeTitleArr = @[
        /*Basic Type*/
        @[
            @"Column Chart---柱形图",
            @"Bar Chart---条形图",
            @"Area Chart---折线填充图",
            @"Areaspline Chart---曲线填充图",
            @"Line Chart---折线图",
            @"Spline Chart---曲线图",
            @"Step Line Chart---直方折线图",
            @"Step Area Chart---直方折线填充图",
            @"Scatter Chart---散点图"
        ],
        /*Special Type*/
        @[
            @"Pie Chart---扇形图",
            @"Bubble Chart---气泡图",
            @"Packed Bubble Chart---紧凑气泡图",
            @"Scatter Chart---散点图",
            @"Area Range Chart---折线区域面积图",
            @"Area Spline range Chart---曲线区域面积图",
            @"Column Pyramid Chart---柱形金字塔图",
            @"Column Range Chart---柱形范围图",
            @"Box Plot Chart---箱线图",
            @"Water Fall---瀑布图",
            @"Pyramid Chart---金字塔图",
            @"Funnel Chart---漏斗图",
            @"Error Bar Chart---误差图",
            @"Gauge Chart---仪表盘图",
            @"Polygon Chart---多边形图",
        ],
        /*Custom Style*/
        @[
            @"Colorful Column Chart---多彩条形图",
            @"Colorful Gradient Color Chart---多彩颜色渐变条形图",
            @"Discontinuous Data Chart---数值不连续的图表",
            @"Mixed Line Chart---虚实线混合折线图",
            @"Colorful Column Chart---多彩柱形图",
            @"Gradient Color Bar Chart---颜色渐变条形图",
            @"configureXAxisHaveAAZonesElementChart--- X 轴阈值分割区",
            @"configureYAxisHaveAAZonesElementChart--- Y 轴带有阈值分割区",
            @"Step Line Chart---直方折线图",
            @"Step Area Chart---直方折线填充图",
            @"Nightingale Rose Chart---南丁格尔玫瑰图",
            @"Specific Data Customize Datalabel---指定 data 元素自定义 Datalabel",
            @"Chart With Shadow Style---带有阴影效果の图表",
            @"Colorful gradient Areaspline Chart---多层次渐变区域填充图",
            @"Colorful gradient Spline Chart---多层次渐变曲线图",
            @"Gradient Color Areaspline Chart---半透明渐变效果区域填充图",
            @"Special Style Marker Of Single Data Element Chart---指定单个数据元素的 Marker 为特殊样式",
            @"Special Style Column Of Single Data Element Chart---指定单个数据元素的 Column 为特殊样式",
            @"configure Area Chart Threshold---自定义阈值",
            @"custom Scatter Chart Marker Symbol Content---自定义散点图的标志点内容",
            @"custom Line Chart Marker Symbol Content---自定义折线图的标志点内容",
            @"Area Chart with minus---带有负数的区域填充图",
            @"splineChartHoverLineWithNoChangeAndCustomMarkerStatesHoverStyle---曲线图禁用选中变粗&&自定义选中后的 marker 样式",
            @"Pentagon Radar Chart---五角形雷达图",
            @"Hexagon Radar Chart---六角形雷达图",
            @"adjustYAxisMaxAndMinValues---调整 X 轴和 Y 轴最大值",
            @"custom Special Style DataLabel Of Single Data Element Chart---指定单个数据元素的 DataLabel 为特殊样式",
            @"custom Bar Chart Hover Color and Select Color---自定义条形图手指滑动颜色和单个长条被选中颜色",
            @"custom Line Chart Chart Hover And Select Halo Style---自定义直线图手指略过和选中的 Halo 样式",
            @"custom Spline Chart Marker States Hover Style---自定义曲线图手指略过时的 Marker 样式",
            @"customNormalStackingChartDataLabelsContentAndStyle---自定义堆积柱状图 DataLabels 的内容及样式",
            @"upsideDownPyramidChart---倒立的金字塔图",
            @"doubleLayerPieChart---双层嵌套扇形图",
            @"doubleLayerDoubleColorsPieChart---双层嵌套双颜色主题扇形图",
            @"disableSomeOfLinesMouseTrackingEffect---针对部分数据列关闭鼠标或手指跟踪行为",
            @"configureColorfulShadowChart---彩色阴影效果的曲线图",
            @"configureColorfulDataLabelsStepLineChart---彩色 DataLabels 的直方折线图",
            @"configureColorfulGradientColorAndColorfulDataLabelsStepAreaChart---彩色渐变效果且彩色 DataLabels 的直方折线填充图",
            @"disableSplineChartMarkerHoverEffect---禁用曲线图的手指滑动 marker 点的光圈变化放大的效果",
            @"configureMaxAndMinDataLabelsForChart---为图表最大值最小值添加 DataLabels 标记",
            @"customVerticalXAxisCategoriesLabelsByHTMLBreakLineTag---通过 HTML 的换行标签来实现图表的 X 轴的 分类文字标签的换行效果",
            @"noMoreGroupingAndOverlapEachOtherColumnChart---不分组的相互重叠柱状图📊",
            @"noMoreGroupingAndNestedColumnChart---不分组的嵌套柱状图📊",
            @"topRoundedCornersStackingColumnChart---顶部为圆角的堆积柱状图📊",
            @"freeStyleRoundedCornersStackingColumnChart---各个圆角自由独立设置的堆积柱状图📊",
            @"customColumnChartBorderStyleAndStatesHoverColor---自定义柱状图 border 样式及手指掠过图表 series 元素时的柱形颜色",
            @"customLineChartWithColorfulMarkersAndLines---彩色连接点和连接线的折线图📈",
            @"customLineChartWithColorfulMarkersAndLines2---彩色连接点和连接线的多组折线的折线图📈",
            @"drawLineChartWithPointsCoordinates---通过点坐标来绘制折线图",
            @"configureSpecialStyleColumnForNegativeDataMixedPositiveData---为正负数混合的柱形图自定义特殊样式效果",
            @"configureMultiLevelStopsArrGradientColorAreasplineMixedLineChart---多层次半透明渐变效果的曲线填充图混合折线图📈",
            @"connectNullsForSingleAASeriesElement---为单个 AASeriesElement 单独设置是否断点重连",
            @"lineChartsWithLargeDifferencesInTheNumberOfDataInDifferentSeriesElement---测试有多组数据时, 数据量较大时, 不同组数据量差距较大时的折线图📈",
            @"customAreasplineChartWithColorfulGradientColorZones---彩色渐变区域填充图📈",
            @"noMoreGroupingAndNestedColumnClickedChangeColorChart---不分组的嵌套柱状图,点击后变色📊",
            @"noMoreGroupingAndNestedColumnClickedChangeColorChart2---不分组的嵌套柱状图,点击后变色📊2"
        ],
        /*Mixed Type Chart*/
        @[
            @"Arearange Mixed Line---面积范围均线图",
            @"Columnrange Mixed Line---柱形范围图混合折线图",
            @"Stacking Column Mixed Line---堆积柱形图混合折线图",
            @"Dash Style Types Mixed---多种类型曲线混合图",
            @"All Line Dash Style Types Mixed Chart---所有类型曲线混合图",
            @"Negative Color Mixed Column Chart---基准线以下异色混合柱状图📊",
            @"scatterMixedLine---散点图混合折线图",
            @"Negative Color Mixed Bubble Chart---基准线以下异色混合气泡图",
            @"Polygon Mixed Scatter---多边形混合散点图",
            @"Polar Chart Mixed---极地混合图",
            @"configure Column Mixed Scatter Chart---柱形图混合散点图",
            @"Negative Color Mixed Areaspline chart---基准线以下异色混合曲线填充图",
            @"Negative Color Mixed Area chart---基准线以下异色混合直线填充图",
            @"Area Chart Mixed Step Area Chart---折线填充和直方折线填充混合图"
        ],
        
        /*Custom Style For Scatter Chart*/
        @[
            @"customScatterChartMarkerSymbolContent---自定义散点图的标志点内容",
            @"drawLineMixedScatterChartWithPointsCoordinates2---通过点坐标绘制折线混合散点图",
        ],
        /*Custom Style For Bubble Chart*/
        @[
            @"negativeColorMixedBubbleChart---基准线以下异色混合气泡图",
            @"showAARadialGradientPositionAllEnumValuesWithBubbleChart---气泡图径向渐变位置枚举示例",
        ],
    ];
    
    if (@available(iOS 13.0, *)) {
        self.view.backgroundColor = UIColor.systemBackgroundColor;
    } else {
        self.view.backgroundColor = [UIColor whiteColor];
    }
    [self setUpMainTableView];
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    CustomTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"CustomTableViewCell"];
    cell.accessoryType = UITableViewCellAccessoryDisclosureIndicator;

    cell.numberLabel.text = [NSString stringWithFormat:@"%ld", indexPath.row + 1];
    cell.numberLabel.layer.masksToBounds = true;
    cell.numberLabel.layer.cornerRadius = 10;
    UIColor *numBgColor = [AAEasyTool colorWithHexString:@[@"#5470c6",
                                                           @"#91cc75",
                                                           @"#fac858",
                                                           @"#ee6666",
                                                           @"#73c0de",
                                                           @"#3ba272",
                                                           @"#fc8452",
                                                           @"#9a60b4",
                                                           @"#ea7ccc"][indexPath.section % 9]];
    cell.numberLabel.backgroundColor = numBgColor;
    cell.numberLabel.textColor = UIColor.whiteColor;

    NSString *textStr = self.chartTypeTitleArr[(NSUInteger)indexPath.section][(NSUInteger)indexPath.row];
    NSArray<NSString *> *textStrArr = [textStr componentsSeparatedByString:@"---"];
    cell.titleLabel.text = textStrArr.firstObject;
    cell.subtitleLabel.text = textStrArr.count > 1 ? textStrArr[1] : @"";

    if (@available(iOS 13.0, *)) {
        cell.titleLabel.textColor = UIColor.labelColor;
        cell.subtitleLabel.textColor = UIColor.tertiaryLabelColor;
        cell.backgroundColor = (indexPath.row % 2 == 0)
            ? UIColor.systemBackgroundColor
            : UIColor.secondarySystemBackgroundColor;
    } else {
        cell.titleLabel.textColor = UIColor.blackColor;
        cell.subtitleLabel.textColor = UIColor.grayColor;
        cell.backgroundColor = (indexPath.row % 2 == 0)
            ? [AAEasyTool colorWithHexString:@"#FFF0F5"]
            : UIColor.whiteColor;
    }

    return cell;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    [tableView deselectRowAtIndexPath:indexPath animated:YES];
    NSUInteger row = (NSUInteger) indexPath.row;
    NSUInteger section = (NSUInteger) indexPath.section;

     switch (section) {
         case 0: {
             BasicChartVC *vc = BasicChartVC.new;
             vc.chartType = row;
             vc.hidesBottomBarWhenPushed = YES;
             [self.navigationController pushViewController:vc animated:YES];
         }
             break;

         case 1: {
             SpecialChartVC *vc = SpecialChartVC.new;
             vc.selectedIndex = row;
             vc.navigationItemTitleArr = self.chartTypeTitleArr[section];
             vc.hidesBottomBarWhenPushed = YES;
             [self.navigationController pushViewController:vc animated:YES];
         }
             break;

         case 2: {
             CustomStyleChartVC *vc = CustomStyleChartVC.new;
             vc.selectedIndex = row;
             vc.navigationItemTitleArr = self.chartTypeTitleArr[section];
             vc.hidesBottomBarWhenPushed = YES;
             [self.navigationController pushViewController:vc animated:YES];
         }
             break;

         case 3: {
             MixedChartVC *vc = MixedChartVC.new;
             vc.selectedIndex = row;
             vc.navigationItemTitleArr = self.chartTypeTitleArr[section];
             vc.hidesBottomBarWhenPushed = YES;
             [self.navigationController pushViewController:vc animated:YES];
         }
             break;

         case 4: {
             CustomStyleForScatterChartVC *vc = CustomStyleForScatterChartVC.new;
             vc.selectedIndex = row;
             vc.navigationItemTitleArr = self.chartTypeTitleArr[section];
             vc.hidesBottomBarWhenPushed = YES;
             [self.navigationController pushViewController:vc animated:YES];
         }
             break;
                         
         case 5: {
             CustomStyleForBubbleChartVC *vc = CustomStyleForBubbleChartVC.new;
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
