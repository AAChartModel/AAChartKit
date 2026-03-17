//
//  OfficialSamplesListVC.m
//  AAChartKitDemo
//
//  Created by AnAn on 2026/3/17.
//  Copyright © 2026 An An. All rights reserved.
//

#import "OfficialSamplesListVC.h"
#import "AABaseChartVC.h"
#import "AreaChartOptionsComposer.h"
#import "BarOrColumnChartOptionsComposer.h"
#import "../OfficialSamples/PieChartOptionsComposer.h"

@interface AAOfficialSamplesChartVC : AABaseChartVC

@property (nonatomic, strong) NSArray<AAOptions *> *chartOptionsArr;

@end

@implementation AAOfficialSamplesChartVC

- (id)chartConfigurationWithSelectedIndex:(NSUInteger)selectedIndex {
    if (selectedIndex >= self.chartOptionsArr.count) {
        return nil;
    }
    return self.chartOptionsArr[selectedIndex];
}

@end

@interface OfficialSamplesListVC ()

@end

@implementation OfficialSamplesListVC

- (void)viewDidLoad {
    [super viewDidLoad];

    self.title = @"Offical Samples";
    self.sectionTitleArr = @[
        @"Official Samples For Area Chart---折线📈填充图官方示例",
        @"Official Samples For Bar or Column Chart---条形图或柱状图📊官方示例",
        @"Official Samples For Pie Chart---饼图🍕官方示例",
    ];

    self.chartTypeTitleArr = @[
        @[
            @"basicAreaChart---基础面积图",
            @"areaWithNegativeValuesChart---带有负值的面积图",
            @"stackedAreaChart---堆积面积图",
            @"percentStackedAreaChart---百分比堆积面积图",
            @"areaWithMissingPointsChart---带有缺失点的面积图",
            @"invertedAreaChart---翻转面积图",
            @"areasplineChart---曲线面积图",
            @"arearangeChart---区域范围图",
            @"arearangeAndLineChart---区域范围图和折线图混合图",
        ],
        @[
            @"basicBarChart---基础柱状图",
            @"stackingBarChart---堆积柱状图",
            @"populationPyramidChart---人口金字塔图",
            @"basicColumnChart---基础条形图",
            @"basicColumnChartWithNegativeValue---带有负值的条形图",
            @"basicColumnChartWithStackedDataLabels---带有数据标签的堆积条形图",
            @"basicColumnChartWithStackedDataLabels2---带有数据标签的堆积条形图2",
            @"percentStackedColumnChart---百分比堆积条形图",
            @"columnChartWithRotatedLabels---带有旋转标签的条形图",
            @"columnChartWithNestedColumn---嵌套条形图",
            @"columnRangeChart---条形范围图",
        ],
        @[
            @"basicPieChart---基本饼状图",
            @"basicPieChartWithLegend---带有图例的基本饼状图",
            @"basicPieChartWithGradientColor---带有渐变色的基本饼状图",
            @"basicPieChartWithGradientColor2---带有渐变色的基本饼状图",
            @"basicPieChartWithMonochromeColor---带有单色的基本饼状图",
            @"customPieChartTitlePosition---自定义饼状图标题位置",
        ],
    ];

    self.view.backgroundColor = UIColor.whiteColor;
    [self setUpMainTableView];
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    NSUInteger row = (NSUInteger)indexPath.row;
    NSUInteger section = (NSUInteger)indexPath.section;

    AAOfficialSamplesChartVC *vc = AAOfficialSamplesChartVC.new;
    vc.selectedIndex = row;
    vc.navigationItemTitleArr = self.chartTypeTitleArr[section];
    vc.chartOptionsArr = [self officialChartOptionsForSection:section];
    vc.hidesBottomBarWhenPushed = YES;
    [self.navigationController pushViewController:vc animated:YES];
}

- (NSArray<AAOptions *> *)officialChartOptionsForSection:(NSUInteger)section {
    switch (section) {
        case 0:
            return @[
                [AreaChartOptionsComposer basicAreaChart],
                [AreaChartOptionsComposer areaWithNegativeValuesChart],
                [AreaChartOptionsComposer stackedAreaChart],
                [AreaChartOptionsComposer percentStackedAreaChart],
                [AreaChartOptionsComposer areaWithMissingPointsChart],
                [AreaChartOptionsComposer invertedAreaChart],
                [AreaChartOptionsComposer areasplineChart],
                [AreaChartOptionsComposer arearangeChart],
                [AreaChartOptionsComposer arearangeAndLineChart],
            ];

        case 1:
            return @[
                [BarOrColumnChartOptionsComposer basicBarChart],
                [BarOrColumnChartOptionsComposer stackingBarChart],
                [BarOrColumnChartOptionsComposer populationPyramidChart],
                [BarOrColumnChartOptionsComposer basicColumnChart],
                [BarOrColumnChartOptionsComposer basicColumnChartWithNegativeValue],
                [BarOrColumnChartOptionsComposer basicColumnChartWithStackedDataLabels],
                [BarOrColumnChartOptionsComposer basicColumnChartWithStackedDataLabels2],
                [BarOrColumnChartOptionsComposer percentStackedColumnChart],
                [BarOrColumnChartOptionsComposer columnChartWithRotatedLabels],
                [BarOrColumnChartOptionsComposer columnChartWithNestedColumn],
                [BarOrColumnChartOptionsComposer columnRangeChart],
            ];

        case 2:
            return @[
                [AAOfficialPieChartOptionsComposer basicPieChart],
                [AAOfficialPieChartOptionsComposer basicPieChartWithLegend],
                [AAOfficialPieChartOptionsComposer basicPieChartWithGradientColor],
                [AAOfficialPieChartOptionsComposer basicPieChartWithGradientColor2],
                [AAOfficialPieChartOptionsComposer basicPieChartWithMonochromeColor],
                [AAOfficialPieChartOptionsComposer customPieChartTitlePosition],
            ];

        default:
            return @[];
    }
}

@end
