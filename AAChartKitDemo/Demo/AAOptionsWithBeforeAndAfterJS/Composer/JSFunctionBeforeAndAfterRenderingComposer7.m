//
//  JSFunctionBeforeAndAfterRenderingComposer7.m
//  AAChartKitDemo
//
//  Created by AnAn on 2025/10/16.
//  Copyright © 2025 An An. All rights reserved.
//
//  功能说明:
//  实现 Highcharts scrollablePlotArea 遮罩对齐插件
//  解决默认遮罩与 X 轴不对齐的问题,确保遮罩完全覆盖 X 轴轴线

#import "JSFunctionBeforeAndAfterRenderingComposer7.h"
#import "AAChartKit.h"

@implementation JSFunctionBeforeAndAfterRenderingComposer7

+ (AAOptions *)customScrollablePlotAreaMask {
    // ========================================
    // Highcharts 插件: ScrollablePlotArea 遮罩对齐
    // ========================================
    // 功能: 自动调整 scrollablePlotArea 的左右遮罩,使其:
    //   1. 顶部对齐绘图区顶部
    //   2. 底部对齐绘图区底部并覆盖 X 轴轴线
    //   3. 右侧遮罩移动到可见区域右边缘
    // ========================================
    NSString *pluginJS = @AAJSFunc((function (H) {
        /**
         * 对齐 scrollablePlotArea 的遮罩元素
         * @param {Object} chart - Highcharts 图表实例
         * @returns {Boolean} - 是否成功对齐
         */
        function alignScrollableMasks(chart) {
            // 1. 查找所有遮罩元素
            var masks = document.querySelectorAll('.highcharts-scrollable-mask');
            if (!masks.length) return false;
            
            // 2. 获取必要的 DOM 元素
            var xAxis = document.querySelector('.highcharts-xaxis');
            var plot = document.querySelector('.highcharts-plot-background, .highcharts-plot-border');
            if (!xAxis || !plot) return false;
            
            // 3. 计算关键位置参数
            var container = document.querySelector('#container .highcharts-container');
            var plotY = parseFloat(plot.getAttribute('y')) || 0;          // 绘图区顶部 Y 坐标
            var plotX = parseFloat(plot.getAttribute('x')) || 0;          // 绘图区左边 X 坐标
            var plotWidth = parseFloat(plot.getAttribute('width')) || 0;  // 绘图区宽度
            var plotHeight = parseFloat(plot.getAttribute('height')) || 0;// 绘图区高度
            
            // 4. 获取 X 轴线粗细,用于计算遮罩底部位置
            // 因为 SVG stroke 以中心线绘制,需要加上完整的 strokeWidth 才能完全覆盖轴线
            var xAxisLine = document.querySelector('.highcharts-xaxis .highcharts-axis-line');
            var strokeWidth = xAxisLine ? parseFloat(xAxisLine.getAttribute('stroke-width') || 0) : 0;
            
            // 5. 计算遮罩底部位置 = 绘图区底部 + 轴线粗细
            var maskBottom = plotY + plotHeight + strokeWidth;
            
            // 6. 处理每个遮罩元素
            masks.forEach(function(mask, idx) {
                var path = mask.getAttribute('d');
                if (!path || path.length === 0) return;
                
                // 6.1 提取路径中的所有数字坐标
                // 避免使用正则表达式(在 @AAJSFunc 宏中可能有转义问题)
                var numbers = [];
                var temp = '';
                for (var i = 0; i < path.length; i++) {
                    var char = path.charAt(i);
                    if ((char >= '0' && char <= '9') || char === '.') {
                        temp += char;
                    } else {
                        if (temp.length > 0) {
                            numbers.push(parseFloat(temp));
                            temp = '';
                        }
                    }
                }
                if (temp.length > 0) {
                    numbers.push(parseFloat(temp));
                }
                
                if (!numbers || numbers.length === 0) return;
                
                // 6.2 分离 X 和 Y 坐标
                var coords = numbers;
                var xs = coords.filter(function(_, i) { return i % 2 === 0; });
                var ys = coords.filter(function(_, i) { return i % 2 === 1; });
                
                // 6.3 计算遮罩边界
                var bounds = {
                    minX: Math.min.apply(Math, xs),
                    maxX: Math.max.apply(Math, xs),
                    minY: Math.min.apply(Math, ys),
                    maxY: Math.max.apply(Math, ys)
                };
                
                // 6.4 判断是左侧还是右侧遮罩(X < 100 为左侧)
                var isLeftMask = bounds.minX < 100;
                var maskWidth = bounds.maxX - bounds.minX;
                
                // 6.5 解析路径命令结构(M/L/Z)
                // 需要保持原始路径的命令结构,避免多个形状连成一个
                var pathParts = [];
                var j = 0;
                for (var i = 0; i < path.length; i++) {
                    var char = path.charAt(i);
                    if (char === 'M' || char === 'L' || char === 'Z') {
                        pathParts.push({ cmd: char, coordIndex: j });
                        if (char !== 'Z') j++;
                    }
                }
                
                // 6.6 调整坐标
                var newCoords = [];
                for (var i = 0; i < coords.length; i += 2) {
                    var x = coords[i];
                    var y = coords[i + 1];
                    var origY = y;
                    
                    // X 坐标调整: 右侧遮罩移到右边缘
                    if (!isLeftMask) {
                        x = plotX + plotWidth - maskWidth + (x - bounds.minX);
                    }
                    
                    // Y 坐标调整:
                    //   - 顶部对齐绘图区顶部 (plotY)
                    //   - 底部对齐绘图区底部 + 轴线粗细 (maskBottom)
                    if (Math.abs(origY - bounds.minY) < 1) {
                        y = plotY;
                    } else if (Math.abs(origY - bounds.maxY) < 1) {
                        y = maskBottom;
                    }
                    
                    newCoords.push(x);
                    newCoords.push(y);
                }
                
                // 6.7 根据原始路径结构重建路径
                // 保持 M/L/Z 命令顺序,确保多个形状不会连成一个
                var newPath = '';
                var coordIdx = 0;
                for (var i = 0; i < pathParts.length; i++) {
                    var part = pathParts[i];
                    if (part.cmd === 'Z') {
                        newPath += ' Z';
                    } else {
                        var x = newCoords[coordIdx * 2];
                        var y = newCoords[coordIdx * 2 + 1];
                        newPath += (newPath.length > 0 ? ' ' : '') + part.cmd + ' ' + x + ' ' + y;
                        coordIdx++;
                    }
                }
                
                // 6.8 应用新路径
                mask.setAttribute('d', newPath);
            });
            return true;
        }
        
        // 7. 在图表加载时执行对齐
        H.addEvent(H.Chart, 'load', function() {
            var chart = this;
            if (chart.options.chart && chart.options.chart.scrollablePlotArea) {
                setTimeout(function() { 
                    alignScrollableMasks(chart); 
                }, 100);
            }
        });
        
        // 8. 在图表重绘时重新对齐
        H.addEvent(H.Chart, 'redraw', function() {
            var chart = this;
            if (chart.options.chart && chart.options.chart.scrollablePlotArea) {
                setTimeout(function() { 
                    alignScrollableMasks(chart); 
                }, 50);
            }
        });
    }(Highcharts)));
    
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
        [categories addObject:[NSString stringWithFormat:@"类目 %ld", (long)(i + 1)]];
    }
    
    // ========================================
    // 配置图表选项
    // ========================================
    return AAOptions.new
    // 注入插件脚本
    .beforeDrawChartJavaScriptSet(pluginJS)
    // 图表配置
    .chartSet(AAChart.new
              .typeSet(AAChartTypeLine)
              .scrollablePlotAreaSet(AAScrollablePlotArea.new
                                     .minWidthSet(@1500)     // 最小宽度 1500px
                                     .opacitySet(@1)         // 遮罩不透明度
                                     .scrollPositionXSet(@0) // 初始滚动位置
                                     ))
    // 标题
    .titleSet(AATitle.new
              .textSet(@"可滚动图表"))
    // X 轴
    .xAxisSet(AAXAxis.new
              .categoriesSet(categories)
              .lineWidthSet(@5)          // 轴线粗细 (用于测试遮罩覆盖效果)
              .lineColorSet(@"#000000")  // 轴线颜色
              .labelsSet(AALabels.new
                         .rotationSet(@-45)
                         .styleSet(AAStyle.new
                                   .fontSizeSet(@"11px"))))
    // Y 轴
    .yAxisSet(AAYAxis.new
              .titleSet(AATitle.new
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
