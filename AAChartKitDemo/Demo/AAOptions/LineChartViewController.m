//
//  LineChartViewController.m
//  AAChartKitDemo
//
//  Created by AnAn on 2025/9/1.
//  Copyright © 2025 An An. All rights reserved.
//

#import "LineChartViewController.h"

@interface LineChartViewController ()

@end

@implementation LineChartViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
}


- (id)chartConfigurationWithSelectedIndex:(NSUInteger)selectedIndex {
    switch (self.selectedIndex) {
        case 0: return [self customconnectNullsWithZonesForLineChart];//自定义 connectNulls + zones 实现同一个 line chart 局部断开和局部重连

        default:
            break;
    }
    return nil;
}

//// --- 1. 初始配置 ---
//
//const rawData = [29, 71, null, null, 80, null, null, null, null, 95, 110];
//const maxConnectNulls = 2; // 定义阈值：连续 null 的数量超过这个值，连接线就会被断开。
//
//// --- 2. 核心算法 ---
//
///**
// * 计算需要断开的区间。
// * @param {Array<number|null>} data - 原始数据数组。
// * @param {number} maxNulls - 允许连续 null 的最大数量。
// * @returns {Array<[number, number]>} - 返回一个数组，每个元素代表一个断点区间。
// *   例如: [[4, 9]] 表示索引 4 和索引 9 之间的连接线需要断开。
// *   其中 4 是断点前最后一个有效点的索引，9 是断点后第一个有效点的索引。
// */
//function computeBreaks(data, maxNulls) {
//  const breaks = [];
//  let i = 0;
//  while (i < data.length) {
//    // 跳过有效数据点
//    if (data[i] !== null) {
//      i++;
//      continue;
//    }
//    
//    // 找到一段连续 null 的开始和结束
//    const start = i;
//    while (i < data.length && data[i] === null) {
//      i++;
//    }
//    const end = i - 1;
//    const len = end - start + 1;
//
//    // 如果连续 null 的长度超过了阈值
//    if (len > maxNulls) {
//      const prevValidIndex = start - 1;
//      const nextValidIndex = end + 1;
//      
//      // 必须确保断点两端都有有效的点，才存在一条需要被“切断”的连接线
//      if (prevValidIndex >= 0 && data[prevValidIndex] !== null &&
//        nextValidIndex < data.length && data[nextValidIndex] !== null) {
//        breaks.push([prevValidIndex, nextValidIndex]);
//      }
//    }
//  }
//  return breaks;
//}
//
///**
// * 根据断点区间生成 Highcharts 的 zones 配置。
// * 这是整个方案最核心的逻辑，它巧妙地利用了 Highcharts 的渲染规则。
// *
// * **Highcharts 渲染黄金法则**:
// * 一条线段（从点 A 到点 B）的颜色，由其【终点 B】所在的 Zone 决定。
// *
// * @param {Array<[number, number]>} breaks - computeBreaks 函数返回的断点数组。
// * @returns {Array<object>} - Highcharts series.zones 的配置数组。
// */
//function zonesFromBreaks(breaks) {
//  if (!breaks.length) {
//    return []; // 如果没有需要断开的地方，返回空数组
//  }
//
//  const zones = [];
//
//  // Highcharts 会自动处理第一个 zone 之前的部分（从 x=0 开始），所以我们无需手动定义。
//  
//  breaks.forEach(([prevIndex, nextIndex]) => {
//    // **第 1 步：定义可见区域**
//    // 我们定义一个可见区域，它的终点是断点前的最后一个有效点 (prevIndex)。
//    // 根据黄金法则，任何终点 x <= prevIndex 的线段都会是可见的。
//    // 这就确保了断点前的所有线段都正常显示。
//    zones.push({
//      value: prevIndex
//      // color 属性不写，默认继承 series 的颜色
//    });
//
//    // **第 2 步：定义透明区域**
//    // 紧接着，我们定义一个透明区域，它的终点是断点后的第一个有效点 (nextIndex)。
//    // 这意味着 x > prevIndex 且 x <= nextIndex 的区域都是透明的。
//    // 根据黄金法则，从 prevIndex 到 nextIndex 的这条线段，其终点是 nextIndex，
//    // 恰好落在这个透明区域内，所以这条线段就会变成透明！
//    zones.push({
//      value: nextIndex,
//      color: 'transparent'
//    });
//  });
//
//  // Highcharts 会自动处理最后一个 zone 之后到数据末尾的部分，让它恢复成默认颜色，
//  // 所以我们同样无需手动定义最后一个可见区域。
//  
//  return zones;
//}
//
//// --- 3. 数据处理与图表渲染 ---
//
//// 执行计算，生成 zones
//const breaks = computeBreaks(rawData, maxConnectNulls);
//const zones = zonesFromBreaks(breaks);
//
//// 将原始数据转换为 Highcharts 喜欢的 {x, y} 格式。
//// 明确使用数值 x 轴，可以确保 zone 的边界判断完全精确。
//const dataWithX = rawData.map((y, i) => ({ x: i, y }));
//
//// 渲染图表
//Highcharts.chart('container', {
//  title: {
//    text: 'Zones 精确局部断开（最终推荐方案）'
//  },
//  xAxis: {
//    // 设置刻度间隔为 1，让 x 轴清晰地对应数据索引
//    tickInterval: 1
//  },
//  yAxis: {
//    title: { text: 'Value' }
//  },
//  tooltip: {
//    shared: true
//  },
//  series: [{
//    type: 'line',
//    data: dataWithX,
//    
//    // 全局开启，它会负责连接所有“短”的 null 区间
//    connectNulls: true,
//    
//    // 指定 zones 应用于 x 轴
//    zoneAxis: 'x',
//    
//    // 应用我们精心计算出的 zones 配置
//    zones: zones,
//    
//    marker: {
//      enabled: true, // 显示数据点，便于观察
//      // **关键修复**: 强制指定 marker 的填充色。
//      // 如果不设置，位于断点处（如 x=4）的 marker 颜色会受到后面那条透明线段的影响而变淡。
//      // Highcharts.getOptions().colors[0] 会自动获取当前主题的第一个系列颜色。
//      fillColor: Highcharts.getOptions().colors[0]
//    },
//    states: {
//      hover: {
//        // 悬浮时线宽不变，个人喜好
//        lineWidthPlus: 0
//      }
//    }
//  }]
//});


// --- 1. 初始配置 ---
- (NSArray *)getRawData {
    return @[
        @29, @71,
        [NSNull null], [NSNull null],
        @80,
        [NSNull null], [NSNull null], [NSNull null], [NSNull null],
        @95, @110, @88, @99,
        [NSNull null],
        @123, @145, @167,
        [NSNull null], [NSNull null], [NSNull null], [NSNull null], [NSNull null],
        @188, @199, @123, @145, @167,];
}

- (NSInteger)getMaxConnectNulls {
    return 2; // 定义阈值：连续 null 的数量超过这个值，连接线就会被断开。
}

// --- 2. 核心算法 ---

/**
 * 计算需要断开的区间。
 * @param data - 原始数据数组。
 * @param maxNulls - 允许连续 null 的最大数量。
 * @returns - 返回一个数组，每个元素代表一个断点区间。
 *   例如: @[@[@4, @9]] 表示索引 4 和索引 9 之间的连接线需要断开。
 *   其中 4 是断点前最后一个有效点的索引，9 是断点后第一个有效点的索引。
 */
- (NSArray<NSArray<NSNumber *> *> *)computeBreaks:(NSArray *)data maxNulls:(NSInteger)maxNulls {
    NSMutableArray<NSArray<NSNumber *> *> *breaks = [NSMutableArray array];
    NSInteger i = 0;
    
    while (i < data.count) {
        // 跳过有效数据点
        if (![data[i] isKindOfClass:[NSNull class]]) {
            i++;
            continue;
        }
        
        // 找到一段连续 null 的开始和结束
        NSInteger start = i;
        while (i < data.count && [data[i] isKindOfClass:[NSNull class]]) {
            i++;
        }
        NSInteger end = i - 1;
        NSInteger len = end - start + 1;
        
        // 如果连续 null 的长度超过了阈值
        if (len > maxNulls) {
            NSInteger prevValidIndex = start - 1;
            NSInteger nextValidIndex = end + 1;
            
            // 必须确保断点两端都有有效的点，才存在一条需要被"切断"的连接线
            if (prevValidIndex >= 0 && ![data[prevValidIndex] isKindOfClass:[NSNull class]] &&
                nextValidIndex < data.count && ![data[nextValidIndex] isKindOfClass:[NSNull class]]) {
                [breaks addObject:@[@(prevValidIndex), @(nextValidIndex)]];
            }
        }
    }
    return breaks;
}

/**
 * 根据断点区间生成 Highcharts 的 zones 配置。
 * 这是整个方案最核心的逻辑，它巧妙地利用了 Highcharts 的渲染规则。
 *
 * **Highcharts 渲染黄金法则**:
 * 一条线段（从点 A 到点 B）的颜色，由其【终点 B】所在的 Zone 决定。
 *
 * @param breaks - computeBreaks 函数返回的断点数组。
 * @returns - Highcharts series.zones 的配置数组。
 */
- (NSArray<AAZonesElement *> *)zonesFromBreaks:(NSArray<NSArray<NSNumber *> *> *)breaks {
    if (breaks.count == 0) {
        return @[]; // 如果没有需要断开的地方，返回空数组
    }
    
    NSMutableArray<AAZonesElement *> *zones = [NSMutableArray array];
    
    // Highcharts 会自动处理第一个 zone 之前的部分（从 x=0 开始），所以我们无需手动定义。
    
    for (NSArray<NSNumber *> *breakPair in breaks) {
        NSInteger prevIndex = [breakPair[0] integerValue];
        NSInteger nextIndex = [breakPair[1] integerValue];
        
        // **第 1 步：定义可见区域**
        // 我们定义一个可见区域，它的终点是断点前的最后一个有效点 (prevIndex)。
        // 根据黄金法则，任何终点 x <= prevIndex 的线段都会是可见的。
        // 这就确保了断点前的所有线段都正常显示。
        AAZonesElement *visibleZone = AAZonesElement.new
            .valueSet(@(prevIndex));
        // color 属性不写，默认继承 series 的颜色
        [zones addObject:visibleZone];
        
        // **第 2 步：定义透明区域**
        // 紧接着，我们定义一个透明区域，它的终点是断点后的第一个有效点 (nextIndex)。
        // 这意味着 x > prevIndex 且 x <= nextIndex 的区域都是透明的。
        // 根据黄金法则，从 prevIndex 到 nextIndex 的这条线段，其终点是 nextIndex，
        // 恰好落在这个透明区域内，所以这条线段就会变成透明！
        AAZonesElement *transparentZone = AAZonesElement.new
            .valueSet(@(nextIndex))
            .colorSet(@"transparent");
        [zones addObject:transparentZone];
    }
    
    // Highcharts 会自动处理最后一个 zone 之后到数据末尾的部分，让它恢复成默认颜色，
    // 所以我们同样无需手动定义最后一个可见区域。
    
    return zones;
}

// --- 3. 数据处理与图表渲染 ---
//https://github.com/AAChartModel/AAChartKit/issues/1599
- (AAOptions *)customconnectNullsWithZonesForLineChart {
    // 执行计算，生成 zones
    NSArray *rawData = [self getRawData];
    NSInteger maxConnectNulls = [self getMaxConnectNulls];
    NSArray<NSArray<NSNumber *> *> *breaks = [self computeBreaks:rawData maxNulls:maxConnectNulls];
    NSArray<AAZonesElement *> *zones = [self zonesFromBreaks:breaks];
    
    // 将原始数据转换为 Highcharts 喜欢的 {x, y} 格式。
    // 明确使用数值 x 轴，可以确保 zone 的边界判断完全精确。
    NSMutableArray *dataWithX = [NSMutableArray array];
    for (NSInteger i = 0; i < rawData.count; i++) {
        id yValue = rawData[i];
        if ([yValue isKindOfClass:[NSNull class]]) {
            [dataWithX addObject:@[@(i), [NSNull null]]];
        } else {
            [dataWithX addObject:@[@(i), yValue]];
        }
    }
    
    // 渲染图表
    return AAOptions.new
        .titleSet(AATitle.new
            .textSet(@"Zones 精确局部断开（最终推荐方案）"))
        .xAxisSet(AAXAxis.new
            .tickIntervalSet(@1)) // 设置刻度间隔为 1，让 x 轴清晰地对应数据索引
        .yAxisSet(AAYAxis.new
            .titleSet(AAAxisTitle.new
                .textSet(@"Value")))
        .tooltipSet(AATooltip.new
            .sharedSet(YES))
        .seriesSet(@[
            AASeriesElement.new
                .typeSet(AAChartTypeLine)
                .dataSet(dataWithX)
                .connectNullsSet(@YES) // 全局开启，它会负责连接所有"短"的 null 区间
                .zoneAxisSet(AAChartZoneAxisTypeX) // 指定 zones 应用于 x 轴
                .zonesSet(zones) // 应用我们精心计算出的 zones 配置
                .markerSet(AAMarker.new
                    .enabledSet(YES) // 显示数据点，便于观察
                    .fillColorSet(AAColor.redColor)) // **关键修复**: 强制指定 marker 的填充色
                .statesSet(AAStates.new
                    .hoverSet(AAHover.new
                        .lineWidthPlusSet(@0))) // 悬浮时线宽不变，个人喜好
        ]);
}

@end
