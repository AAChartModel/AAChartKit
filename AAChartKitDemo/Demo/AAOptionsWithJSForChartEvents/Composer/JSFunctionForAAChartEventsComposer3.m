//
//  JSFunctionForAAChartEventsComposer3.m
//  AAChartKitDemo
//
//  Created by AnAn on 2025/10/22.
//  Copyright © 2025 An An. All rights reserved.
//

#import "JSFunctionForAAChartEventsComposer3.h"
#import "AAChartKit.h"

//⚠️: 目前测试发现, Safari 内核的浏览器(包括 iOS 系统上的大部分浏览器)不支持自定义滚动条样式, 仅支持 Chrome 内核的浏览器 ⊙﹏⊙|||.
@implementation JSFunctionForAAChartEventsComposer3

//Highcharts.chart('container', {
//  chart: {
//    scrollablePlotArea: {
//      minWidth: 1200
//    },
//    events: {
//      load: function () {
//        // 在 document head 中插入 CSS（只在图表创建时添加一次）
//        if (!document.getElementById('hc-hide-scrollbar')) {
//          const style = document.createElement('style');
//          style.id = 'hc-hide-scrollbar';
//          style.textContent = `
//            /* WebKit / Blink */
//            .highcharts-scrolling::-webkit-scrollbar { display: none; }
//            /* Firefox */
//            .highcharts-scrolling { scrollbar-width: none; -ms-overflow-style: none; }
//          `;
//          document.head.appendChild(style);
//        }
//      }
//    }
//  },
//  title: { text: '隐藏滚动条（但保持滚动）' },
//  xAxis: { categories: Array.from({length: 50}, (_, i) => 'P' + i) },
//  series: [{ data: Array.from({length: 50}, ()=>Math.random()*100) }]
//});
+ (AAOptions *)hideScrollablePlotAreaScrollbar {
    // ========================================
    // 生成测试数据
    // ========================================
    NSMutableArray *sineData = [NSMutableArray array];
    NSMutableArray *cosineData = [NSMutableArray array];
    NSMutableArray *categories = [NSMutableArray array];
    
    for (NSInteger i = 0; i < 100; i++) {
        // 正弦波数据
        [sineData addObject:@(round(40 * sin((i / 100.0) * M_PI * 6) + 50))];
        // 余弦波数据
        [cosineData addObject:@(round(35 * cos((i / 100.0) * M_PI * 6) + 55))];
        // X 轴分类
        [categories addObject:[NSString stringWithFormat:@"很长的类目文字 %ld", (long)(i + 1)]];
    }
    
    // ========================================
    // 配置图表选项
    // ========================================
    return AAOptions.new
    // 图表配置
    .chartSet(AAChart.new
              .typeSet(AAChartTypeLine)
              .scrollablePlotAreaSet(AAScrollablePlotArea.new
                                     .minWidthSet(@1500)     // 最小宽度 1500px
                                     .opacitySet(@1)         // 遮罩不透明度
                                     .scrollPositionXSet(@0) // 初始滚动位置
                                     )
              .eventsSet(AAChartEvents.new
                         .loadSet(@AAJSFunc(function () {
                             // 在 document head 中插入 CSS（只在图表创建时添加一次）
                             if (!document.getElementById('hc-hide-scrollbar')) {
                               const style = document.createElement('style');
                               style.id = 'hc-hide-scrollbar';
                               style.textContent = `
                                 /* WebKit / Blink */
                                 .highcharts-scrolling::-webkit-scrollbar { display: none; }
                                 /* Firefox */
                                 .highcharts-scrolling { scrollbar-width: none; -ms-overflow-style: none; }
                               `;
                               document.head.appendChild(style);
                             }
                           }))
              ))
    // 标题
    .titleSet(AATitle.new
              .textSet(@"可滚动图表"))
    // X 轴
    .xAxisSet(AAXAxis.new
              .categoriesSet(categories)
              .lineWidthSet(@5)          // 轴线粗细 (用于测试遮罩覆盖效果)
              .lineColorSet(AAColor.greenColor)  // 轴线颜色
              .labelsSet(AALabels.new
                         .rotationSet(@-45)
                         .styleSet(AAStyle.new
                                   .fontSizeSet(@"11px"))))
    // Y 轴
    .yAxisSet(AAYAxis.new
              .titleSet(AAAxisTitle.new
                        .textSet(@"数值")))
    // 数据系列
    .seriesSet(@[
        // 正弦波系列
        AASeriesElement.new
        .nameSet(@"正弦波")
        .dataSet(sineData)
        .colorSet(@"#2196F3")
        .markerSet(AAMarker.new
                   .enabledSet(true)
                   .radiusSet(@4)
                   .fillColorSet(@"#2196F3")
                   .lineWidthSet(@2)
                   .lineColorSet(@"#fff")),
        
        // 余弦波系列
        AASeriesElement.new
        .nameSet(@"余弦波")
        .dataSet(cosineData)
        .colorSet(@"#FF0000")
        .markerSet(AAMarker.new
                   .enabledSet(true)
                   .radiusSet(@4)
                   .fillColorSet(@"#FF0000")
                   .lineWidthSet(@2)
                   .lineColorSet(@"#fff"))
    ])
    // 图例
    .legendSet(AALegend.new
               .enabledSet(true))
    // 版权信息
    .creditsSet(AACredits.new
                .enabledSet(false));
}

//Highcharts.chart('container', {
//  chart: {
//    scrollablePlotArea: {
//      minWidth: 1200
//    },
//    events: {
//      load: function () {
//        // 检查样式是否已添加，避免重复注入
//        if (!document.getElementById('hc-custom-scrollbar-style')) {
//          const style = document.createElement('style');
//          style.id = 'hc-custom-scrollbar-style';
//          style.textContent = `
//            /* 针对 scrollablePlotArea 的滚动容器 */
//            .highcharts-scrolling::-webkit-scrollbar {
//              height: 8px; /* 水平滚动条高度 */
//            }
//            .highcharts-scrolling::-webkit-scrollbar-track {
//              background: #f2f2f2; /* 滑道颜色 */
//              border-radius: 4px;
//            }
//            .highcharts-scrolling::-webkit-scrollbar-thumb {
//              background: #007bff; /* 滚动条颜色 */
//              border-radius: 4px;
//            }
//            .highcharts-scrolling::-webkit-scrollbar-thumb:hover {
//              background: #0056b3; /* 悬停时颜色 */
//            }
//
//            /* Firefox 支持 */
//            .highcharts-scrolling {
//              scrollbar-color: #007bff #f2f2f2;
//              scrollbar-width: thin;
//            }
//          `;
//          document.head.appendChild(style);
//        }
//      }
//    }
//  },
//
//  title: { text: '自定义滚动条颜色示例' },
//
//  xAxis: {
//    categories: Array.from({ length: 50 }, (_, i) => '点 ' + i)
//  },
//
//  series: [{
//    data: Array.from({ length: 50 }, () => Math.random() * 100)
//  }]
//});
+ (AAOptions *)customScrollablePlotAreaScrollbarColor {
    // ========================================
    // 生成测试数据
    // ========================================
    NSMutableArray *sineData = [NSMutableArray array];
    NSMutableArray *cosineData = [NSMutableArray array];
    NSMutableArray *categories = [NSMutableArray array];
    
    for (NSInteger i = 0; i < 100; i++) {
        // 正弦波数据
        [sineData addObject:@(round(40 * sin((i / 100.0) * M_PI * 6) + 50))];
        // 余弦波数据
        [cosineData addObject:@(round(35 * cos((i / 100.0) * M_PI * 6) + 55))];
        // X 轴分类
        [categories addObject:[NSString stringWithFormat:@"很长的类目文字 %ld", (long)(i + 1)]];
    }
    
    // ========================================
    // 配置图表选项
    // ========================================
    return AAOptions.new
    // 图表配置
    .chartSet(AAChart.new
              .typeSet(AAChartTypeLine)
              .scrollablePlotAreaSet(AAScrollablePlotArea.new
                                     .minWidthSet(@1500)     // 最小宽度 1500px
                                     .opacitySet(@1)         // 遮罩不透明度
                                     .scrollPositionXSet(@0) // 初始滚动位置
                                     )
              .eventsSet(AAChartEvents.new
                         .loadSet(@AAJSFunc(function () {
                             // 检查样式是否已添加，避免重复注入
                             if (!document.getElementById('hc-custom-scrollbar-style')) {
                               const style = document.createElement('style');
                               style.id = 'hc-custom-scrollbar-style';
                               style.textContent = `
                                 /* 针对 scrollablePlotArea 的滚动容器 */
                                 .highcharts-scrolling::-webkit-scrollbar {
                                   height: 8px; /* 水平滚动条高度 */
                                 }
                                 .highcharts-scrolling::-webkit-scrollbar-track {
                                   background: #f2f2f2; /* 滑道颜色 */
                                   border-radius: 4px;
                                 }
                                 .highcharts-scrolling::-webkit-scrollbar-thumb {
                                   background: #007bff; /* 滚动条颜色 */
                                   border-radius: 4px;
                                 }
                                 .highcharts-scrolling::-webkit-scrollbar-thumb:hover {
                                   background: #0056b3; /* 悬停时颜色 */
                                 }

                                 /* Firefox 支持 */
                                 .highcharts-scrolling {
                                   scrollbar-color: #007bff #f2f2f2;
                                   scrollbar-width: thin;
                                 }
                               `;
                               document.head.appendChild(style);
                             }
                           }))
              ))
    // 标题
    .titleSet(AATitle.new
              .textSet(@"可滚动图表"))
    // X 轴
    .xAxisSet(AAXAxis.new
              .categoriesSet(categories)
              .lineWidthSet(@5)          // 轴线粗细 (用于测试遮罩覆盖效果)
              .lineColorSet(AAColor.greenColor)  // 轴线颜色
              .labelsSet(AALabels.new
                         .rotationSet(@-45)
                         .styleSet(AAStyle.new
                                   .fontSizeSet(@"11px"))))
    // Y 轴
    .yAxisSet(AAYAxis.new
              .titleSet(AAAxisTitle.new
                        .textSet(@"数值")))
    // 数据系列
    .seriesSet(@[
        // 正弦波系列
        AASeriesElement.new
        .nameSet(@"正弦波")
        .dataSet(sineData)
        .colorSet(@"#2196F3")
        .markerSet(AAMarker.new
                   .enabledSet(true)
                   .radiusSet(@4)
                   .fillColorSet(@"#2196F3")
                   .lineWidthSet(@2)
                   .lineColorSet(@"#fff")),
        
        // 余弦波系列
        AASeriesElement.new
        .nameSet(@"余弦波")
        .dataSet(cosineData)
        .colorSet(@"#FF0000")
        .markerSet(AAMarker.new
                   .enabledSet(true)
                   .radiusSet(@4)
                   .fillColorSet(@"#FF0000")
                   .lineWidthSet(@2)
                   .lineColorSet(@"#fff"))
    ])
    // 图例
    .legendSet(AALegend.new
               .enabledSet(true))
    // 版权信息
    .creditsSet(AACredits.new
                .enabledSet(false));
}
@end
