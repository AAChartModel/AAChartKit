//
//  AAOptionsListVC.m
//  AAChartKitDemo
//
//  Created by AnAn on 2026/3/17.
//  Copyright © 2026 An An. All rights reserved.
//

#import "AAOptionsListVC.h"
#import "DrawChartWithAAOptionsVC.h"

@interface AAOptionsListVC ()

@end

@implementation AAOptionsListVC

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.

    self.title = @"AAOptions";
    self.sectionTitleArr = @[
        @"Draw Chart With AAOptions---通过Options绘图",
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
    ];

    [self setUpMainTableView];
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    NSUInteger row = (NSUInteger)indexPath.row;

    DrawChartWithAAOptionsVC *vc = DrawChartWithAAOptionsVC.new;
    vc.selectedIndex = row;
    vc.navigationItemTitleArr = self.chartTypeTitleArr[indexPath.section];
    vc.hidesBottomBarWhenPushed = YES;
    [self.navigationController pushViewController:vc animated:YES];
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
