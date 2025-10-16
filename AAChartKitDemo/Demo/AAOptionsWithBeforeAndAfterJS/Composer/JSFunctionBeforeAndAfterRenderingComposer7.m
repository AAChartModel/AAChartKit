//
//  JSFunctionBeforeAndAfterRenderingComposer7.m
//  AAChartKitDemo
//
//  Created by AnAn on 2025/10/16.
//  Copyright © 2025 An An. All rights reserved.
//

#import "JSFunctionBeforeAndAfterRenderingComposer7.h"
#import "AAChartKit.h"

@implementation JSFunctionBeforeAndAfterRenderingComposer7

+ (AAOptions *)customScrollablePlotAreaMask {
    NSString *pluginJS = @AAJSFunc((function (H) {
        function alignScrollableMasks(chart) {
            var masks = document.querySelectorAll('.highcharts-scrollable-mask');
            if (!masks.length) return false;
            
            var xAxis = document.querySelector('.highcharts-xaxis');
            var plot = document.querySelector('.highcharts-plot-background, .highcharts-plot-border');
            if (!xAxis || !plot) return false;
            
            var container = document.querySelector('#container .highcharts-container');
            var plotY = parseFloat(plot.getAttribute('y')) || 0;
            var plotX = parseFloat(plot.getAttribute('x')) || 0;
            var plotWidth = parseFloat(plot.getAttribute('width')) || 0;
            var plotHeight = parseFloat(plot.getAttribute('height')) || 0;
            
            // 获取 x 轴线的粗细,并计算遮罩底部位置
            var xAxisLine = document.querySelector('.highcharts-xaxis .highcharts-axis-line');
            var strokeWidth = xAxisLine ? parseFloat(xAxisLine.getAttribute('stroke-width') || 0) : 0;
            
            // 遮罩底部 = 绘图区底部 + 轴线粗细,确保完全覆盖轴线
            var maskBottom = plotY + plotHeight + strokeWidth;
            
            masks.forEach(function(mask, idx) {
                var path = mask.getAttribute('d');
                if (!path || path.length === 0) return;
                
                // 提取路径中的所有数字坐标
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
                
                var coords = numbers;
                var xs = coords.filter(function(_, i) { return i % 2 === 0; });
                var ys = coords.filter(function(_, i) { return i % 2 === 1; });
                
                var bounds = {
                    minX: Math.min.apply(Math, xs),
                    maxX: Math.max.apply(Math, xs),
                    minY: Math.min.apply(Math, ys),
                    maxY: Math.max.apply(Math, ys)
                };
                
                var isLeftMask = bounds.minX < 100;
                var maskWidth = bounds.maxX - bounds.minX;
                
                // 解析路径命令结构(M/L/Z)
                var pathParts = [];
                var j = 0;
                for (var i = 0; i < path.length; i++) {
                    var char = path.charAt(i);
                    if (char === 'M' || char === 'L' || char === 'Z') {
                        pathParts.push({ cmd: char, coordIndex: j });
                        if (char !== 'Z') j++;
                    }
                }
                
                // 调整坐标
                var newCoords = [];
                for (var i = 0; i < coords.length; i += 2) {
                    var x = coords[i];
                    var y = coords[i + 1];
                    var origY = y;
                    
                    // 右侧遮罩移到右边
                    if (!isLeftMask) {
                        x = plotX + plotWidth - maskWidth + (x - bounds.minX);
                    }
                    
                    // 调整 y 坐标:顶部对齐绘图区顶部,底部对齐绘图区底部
                    if (Math.abs(origY - bounds.minY) < 1) {
                        y = plotY;
                    } else if (Math.abs(origY - bounds.maxY) < 1) {
                        y = maskBottom;
                    }
                    
                    newCoords.push(x);
                    newCoords.push(y);
                }
                
                // 根据原始路径结构重建路径
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
                
                mask.setAttribute('d', newPath);
            });
            return true;
        }
        
        H.addEvent(H.Chart, 'load', function() {
            var chart = this;
            if (chart.options.chart && chart.options.chart.scrollablePlotArea) {
                setTimeout(function() { 
                    alignScrollableMasks(chart); 
                }, 100);
            }
        });
        
        H.addEvent(H.Chart, 'redraw', function() {
            var chart = this;
            if (chart.options.chart && chart.options.chart.scrollablePlotArea) {
                setTimeout(function() { 
                    alignScrollableMasks(chart); 
                }, 50);
            }
        });
    }(Highcharts)));
    
    NSMutableArray *sineData = [NSMutableArray array];
    NSMutableArray *cosineData = [NSMutableArray array];
    NSMutableArray *categories = [NSMutableArray array];
    for (NSInteger i = 0; i < 100; i++) {
        [sineData addObject:@(round(40 * sin((i / 100.0) * M_PI * 6) + 50))];
        [cosineData addObject:@(round(35 * cos((i / 100.0) * M_PI * 6) + 55))];
        [categories addObject:[NSString stringWithFormat:@"类目 %ld", (long)(i + 1)]];
    }
    
    return AAOptions.new
    .beforeDrawChartJavaScriptSet(pluginJS)
    .chartSet(AAChart.new.typeSet(AAChartTypeLine).scrollablePlotAreaSet(AAScrollablePlotArea.new.minWidthSet(@1500).opacitySet(@1).scrollPositionXSet(@0)))
    .titleSet(AATitle.new.textSet(@"可滚动图表"))
    .xAxisSet(AAXAxis.new
              .categoriesSet(categories)
              .lineWidthSet(@5)
              .lineColorSet(@"#000000")
              .labelsSet(AALabels.new.rotationSet(@-45).styleSet(AAStyle.new.fontSizeSet(@"11px"))))
    .yAxisSet(AAYAxis.new.titleSet(AATitle.new.textSet(@"数值")))
    .seriesSet(@[
        AASeriesElement.new.nameSet(@"正弦波").dataSet(sineData).colorSet(@"#2196F3").markerSet(AAMarker.new.enabledSet(true).radiusSet(@4).fillColorSet(@"#2196F3").lineWidthSet(@2).lineColorSet(@"#fff")),
        AASeriesElement.new.nameSet(@"余弦波").dataSet(cosineData).colorSet(@"#FF0000").markerSet(AAMarker.new.enabledSet(true).radiusSet(@4).fillColorSet(@"#FF0000").lineWidthSet(@2).lineColorSet(@"#fff"))
    ])
    .legendSet(AALegend.new.enabledSet(true))
    .creditsSet(AACredits.new.enabledSet(false));
}

@end
