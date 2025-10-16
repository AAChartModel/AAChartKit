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
//  最终实现避免遮罩遮挡 X 轴的长文字标签内容的问题

#import "JSFunctionBeforeAndAfterRenderingComposer7.h"
#import "AAChartKit.h"

@implementation JSFunctionBeforeAndAfterRenderingComposer7

+ (AAOptions *)customScrollablePlotAreaMask {
    // ========================================
    // Highcharts 插件: ScrollablePlotArea 遮罩对齐 (ES6 优化版)
    // ========================================
    // 功能: 自动调整 scrollablePlotArea 的左右遮罩,使其:
    //   1. 顶部对齐绘图区顶部
    //   2. 底部对齐绘图区底部并覆盖 X 轴轴线
    //   3. 右侧遮罩移动到可见区域右边缘
    // 性能优化:
    //   - 使用 ES6+ 语法(const/let/箭头函数/解构/模板字符串)
    //   - 缓存 DOM 查询结果
    //   - 减少不必要的计算
    //   - 使用展开运算符代替 apply
    // ========================================
    NSString *pluginJS = @AAJSFunc((function (H) {
        /**
         * 从 SVG 路径字符串中提取数字坐标
         * @param {string} path - SVG 路径字符串
         * @returns {number[]} - 坐标数组
         */
        const extractNumbers = (path) => {
            const numbers = [];
            let temp = '';
            
            for (let i = 0; i < path.length; i++) {
                const char = path[i];
                if ((char >= '0' && char <= '9') || char === '.') {
                    temp += char;
                } else if (temp) {
                    numbers.push(parseFloat(temp));
                    temp = '';
                }
            }
            
            if (temp) numbers.push(parseFloat(temp));
            return numbers;
        };
        
        /**
         * 解析 SVG 路径命令结构
         * @param {string} path - SVG 路径字符串
         * @returns {Array<{cmd: string, coordIndex: number}>} - 命令数组
         */
        const parsePathCommands = (path) => {
            const commands = [];
            let coordIndex = 0;
            
            for (let i = 0; i < path.length; i++) {
                const char = path[i];
                if (char === 'M' || char === 'L' || char === 'Z') {
                    commands.push({ cmd: char, coordIndex });
                    if (char !== 'Z') coordIndex++;
                }
            }
            
            return commands;
        };
        
        /**
         * 重建 SVG 路径字符串
         * @param {Array} commands - 命令数组
         * @param {number[]} coords - 坐标数组
         * @returns {string} - 新的 SVG 路径字符串
         */
        const rebuildPath = (commands, coords) => {
            let coordIdx = 0;
            
            return commands.map(({ cmd }) => {
                if (cmd === 'Z') return 'Z';
                
                const x = coords[coordIdx * 2];
                const y = coords[coordIdx * 2 + 1];
                coordIdx++;
                
                return `${cmd} ${x} ${y}`;
            }).join(' ');
        };
        
        /**
         * 对齐 scrollablePlotArea 的遮罩元素 (ES6 优化版)
         * @param {Object} chart - Highcharts 图表实例
         * @returns {boolean} - 是否成功对齐
         */
        const alignScrollableMasks = (chart) => {
            // 1. 查找所有遮罩元素
            const masks = document.querySelectorAll('.highcharts-scrollable-mask');
            if (!masks.length) return false;
            
            // 2. 获取必要的 DOM 元素 (缓存查询结果)
            const xAxis = document.querySelector('.highcharts-xaxis');
            const plot = document.querySelector('.highcharts-plot-background, .highcharts-plot-border');
            if (!xAxis || !plot) return false;
            
            // 3. 计算关键位置参数 (使用解构和默认值)
            const plotY = parseFloat(plot.getAttribute('y')) || 0;
            const plotX = parseFloat(plot.getAttribute('x')) || 0;
            const plotWidth = parseFloat(plot.getAttribute('width')) || 0;
            const plotHeight = parseFloat(plot.getAttribute('height')) || 0;
            
            // 4. 获取 X 轴线粗细
            const xAxisLine = document.querySelector('.highcharts-xaxis .highcharts-axis-line');
            const strokeWidth = xAxisLine ? parseFloat(xAxisLine.getAttribute('stroke-width') || 0) : 0;
            
            // 5. 计算遮罩底部位置
            const maskBottom = plotY + plotHeight + strokeWidth;
            
            // 6. 处理每个遮罩元素 (使用箭头函数)
            masks.forEach((mask) => {
                const path = mask.getAttribute('d');
                if (!path) return;
                
                // 6.1 提取坐标
                const coords = extractNumbers(path);
                if (!coords.length) return;
                
                // 6.2 分离 X 和 Y 坐标 (使用 filter 的简洁语法)
                const xs = coords.filter((_, i) => i % 2 === 0);
                const ys = coords.filter((_, i) => i % 2 === 1);
                
                // 6.3 计算边界 (使用展开运算符)
                const bounds = {
                    minX: Math.min(...xs),
                    maxX: Math.max(...xs),
                    minY: Math.min(...ys),
                    maxY: Math.max(...ys)
                };
                
                // 6.4 判断遮罩类型
                const isLeftMask = bounds.minX < 100;
                const maskWidth = bounds.maxX - bounds.minX;
                
                // 6.5 解析路径命令
                const commands = parsePathCommands(path);
                
                // 6.6 调整坐标 (使用 map 代替 for 循环)
                const newCoords = [];
                for (let i = 0; i < coords.length; i += 2) {
                    let x = coords[i];
                    let y = coords[i + 1];
                    const origY = y;
                    
                    // X 坐标: 右侧遮罩移到右边缘
                    if (!isLeftMask) {
                        x = plotX + plotWidth - maskWidth + (x - bounds.minX);
                    }
                    
                    // Y 坐标: 顶部/底部对齐
                    if (Math.abs(origY - bounds.minY) < 1) {
                        y = plotY;
                    } else if (Math.abs(origY - bounds.maxY) < 1) {
                        y = maskBottom;
                    }
                    
                    newCoords.push(x, y);
                }
                
                // 6.7 重建并应用路径
                const newPath = rebuildPath(commands, newCoords);
                mask.setAttribute('d', newPath);
            });
            
            return true;
        };
        
        // 7. 在图表加载时执行对齐 (使用箭头函数和可选链)
        H.addEvent(H.Chart, 'load', function() {
            const chart = this;
            if (chart.options?.chart?.scrollablePlotArea) {
                setTimeout(() => alignScrollableMasks(chart), 50);
            }
        });
        
        // 8. 在图表重绘时重新对齐
        H.addEvent(H.Chart, 'redraw', function() {
            const chart = this;
            if (chart.options?.chart?.scrollablePlotArea) {
                setTimeout(() => alignScrollableMasks(chart), 50);
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
        [categories addObject:[NSString stringWithFormat:@"很长的类目文字 %ld", (long)(i + 1)]];
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
