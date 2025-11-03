//
//  OfficalSamplesChartProvider.m
//  AAChartKitDemo
//
//  Created by AnAn on 2025/11/3.
//  Copyright © 2025 An An. All rights reserved.
//

#import "OfficalSamplesChartProvider.h"

// 导入相关的 Composer 类
#import "AreaChartOptionsComposer.h"
#import "BarOrColumnChartOptionsComposer.h"
#import "PieChartOptionsComposer.h"

@implementation OfficalSamplesChartProvider

+ (NSArray<AAOptions *> *)officalChartSampleItems {
    NSMutableArray *allItems = [NSMutableArray array];
    [allItems addObjectsFromArray:[self areaChartSamples]];
    [allItems addObjectsFromArray:[self barOrColumnChartSamples]];
    [allItems addObjectsFromArray:[self pieChartSamples]];
    
    return [self processChartOptions:allItems];
}

#pragma mark - Area Chart Samples

+ (NSArray<AAOptions *> *)areaChartSamples {
    return @[
        [AreaChartOptionsComposer basicAreaChart],//基础面积图
        [AreaChartOptionsComposer areaWithNegativeValuesChart],//带有负值的面积图
        [AreaChartOptionsComposer stackedAreaChart],//堆积面积图
        [AreaChartOptionsComposer percentStackedAreaChart],//百分比堆积面积图
        [AreaChartOptionsComposer areaWithMissingPointsChart],//带有缺失点的面积图
        [AreaChartOptionsComposer invertedAreaChart],//翻转面积图
        [AreaChartOptionsComposer areasplineChart],//曲线面积图
        [AreaChartOptionsComposer arearangeChart],//区域范围图
        [AreaChartOptionsComposer arearangeAndLineChart],//区域范围图和折线图混合图
    ];
}

#pragma mark - Bar/Column Chart Samples

+ (NSArray<AAOptions *> *)barOrColumnChartSamples {
    return @[
        [BarOrColumnChartOptionsComposer basicBarChart],//基础柱状图
        [BarOrColumnChartOptionsComposer stackingBarChart],//堆积柱状图
        [BarOrColumnChartOptionsComposer populationPyramidChart],//人口金字塔图
        [BarOrColumnChartOptionsComposer basicColumnChart],//基础条形图
        [BarOrColumnChartOptionsComposer basicColumnChartWithNegativeValue],//带有负值的条形图
        [BarOrColumnChartOptionsComposer basicColumnChartWithStackedDataLabels],//带有数据标签的堆积条形图
        [BarOrColumnChartOptionsComposer basicColumnChartWithStackedDataLabels2],//带有数据标签的堆积条形图2
        [BarOrColumnChartOptionsComposer percentStackedColumnChart],//百分比堆积条形图
        [BarOrColumnChartOptionsComposer columnChartWithRotatedLabels],//带有旋转标签的条形图
        [BarOrColumnChartOptionsComposer columnChartWithNestedColumn],//嵌套条形图
        [BarOrColumnChartOptionsComposer columnRangeChart],//条形范围图
    ];
}

#pragma mark - Pie Chart Samples

+ (NSArray<AAOptions *> *)pieChartSamples {
    return @[
        [PieChartOptionsComposer basicPieChart],//基本饼状图
        [PieChartOptionsComposer basicPieChartWithLegend],//带有图例的基本饼状图
        [PieChartOptionsComposer basicPieChartWithGradientColor],//带有渐变色的基本饼状图
        [PieChartOptionsComposer basicPieChartWithGradientColor2],//带有渐变色的基本饼状图
        [PieChartOptionsComposer basicPieChartWithMonochromeColor],//带有单色的基本饼状图
        [PieChartOptionsComposer customPieChartTitlePosition],//自定义饼状图标题位置
    ];
}

#pragma mark - Helper Methods

+ (NSArray<AAOptions *> *)processChartOptions:(NSArray<AAOptions *> *)options {
    //遍历 options 数组,将其中的每个 AAChartModel 实例转化为 AAOptions 实例
    NSMutableArray *finalItems = [NSMutableArray array];
    for (AAOptions *aaOptions in options) {
        AAOptions *processedOptions = aaOptions;
//        processedOptions.chart.polar = YES;
        [finalItems addObject:processedOptions];
    }
    return [finalItems copy];
}

@end
