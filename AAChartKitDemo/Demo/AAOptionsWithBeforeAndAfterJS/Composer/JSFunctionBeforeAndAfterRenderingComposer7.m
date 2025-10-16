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
        console.log('🔵🔵🔵 Plugin starting to load...');
        console.log('🔵 Highcharts:', H);
        console.log('🔵 H.addEvent:', typeof H.addEvent);
        console.log('🔵 H.Chart:', H.Chart);
        
        function alignScrollableMasks(chart) {
            console.log('🟢🟢🟢 alignScrollableMasks called');
            console.log('🟢 chart:', chart);
            
            var masks = document.querySelectorAll('.highcharts-scrollable-mask');
            console.log('🟢 masks.length:', masks.length);
            if (!masks.length) {
                console.warn('⚠️⚠️⚠️ NO MASKS FOUND!');
                return false;
            }
            
            var xAxis = document.querySelector('.highcharts-xaxis');
            var plot = document.querySelector('.highcharts-plot-background, .highcharts-plot-border');
            console.log('🟢 xAxis:', xAxis);
            console.log('🟢 plot:', plot);
            if (!xAxis || !plot) {
                console.warn('⚠️⚠️⚠️ xAxis or plot not found!');
                return false;
            }
            
            var container = document.querySelector('#container .highcharts-container');
            var plotY = parseFloat(plot.getAttribute('y')) || 0;
            var plotX = parseFloat(plot.getAttribute('x')) || 0;
            var plotWidth = parseFloat(plot.getAttribute('width')) || 0;
            var xAxisY = xAxis.getBoundingClientRect().top - container.getBoundingClientRect().top;
            
            console.log('🟢 plotX:', plotX, 'plotY:', plotY, 'plotWidth:', plotWidth, 'xAxisY:', xAxisY);
            
            masks.forEach(function(mask, idx) {
                console.log('🟡 Processing mask', idx);
                var path = mask.getAttribute('d');
                console.log('🟡 Mask', idx, 'path:', path);
                
                if (!path || path.length === 0) {
                    console.warn('⚠️ Mask', idx, 'has no path data');
                    return;
                }
                
                // 使用 split 和 filter 方法提取数字,避免正则转义问题
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
                
                console.log('🟡 Mask', idx, 'extracted numbers:', numbers);
                
                if (!numbers || numbers.length === 0) {
                    console.warn('⚠️ Mask', idx, 'no coordinates found');
                    return;
                }
                
                var coords = numbers;
                var xs = coords.filter(function(_, i) { return i % 2 === 0; });
                var ys = coords.filter(function(_, i) { return i % 2 === 1; });
                
                console.log('🟡 Mask', idx, 'xs:', xs);
                console.log('🟡 Mask', idx, 'ys:', ys);
                
                var bounds = {
                    minX: Math.min.apply(Math, xs),
                    maxX: Math.max.apply(Math, xs),
                    minY: Math.min.apply(Math, ys),
                    maxY: Math.max.apply(Math, ys)
                };
                
                var isLeftMask = bounds.minX < 100;
                var maskWidth = bounds.maxX - bounds.minX;
                var yOffset = { top: bounds.minY - plotY, bottom: bounds.maxY - xAxisY };
                
                console.log('🟡 Mask', idx, 'bounds:', bounds);
                console.log('🟡 Mask', idx, 'isLeftMask:', isLeftMask, 'maskWidth:', maskWidth);
                console.log('🟡 Mask', idx, 'yOffset:', yOffset);
                console.log('🟡 Mask', idx, 'Original path:', path);
                
                // 解析路径命令,保持 M/L/Z 结构
                var pathParts = [];
                var j = 0;
                for (var i = 0; i < path.length; i++) {
                    var char = path.charAt(i);
                    if (char === 'M' || char === 'L' || char === 'Z') {
                        pathParts.push({ cmd: char, coordIndex: j });
                        if (char !== 'Z') j++;
                    }
                }
                
                console.log('🟡 Mask', idx, 'Path structure:', pathParts.length, 'commands');
                
                // 调整坐标
                var newCoords = [];
                for (var i = 0; i < coords.length; i += 2) {
                    var x = coords[i];
                    var y = coords[i + 1];
                    var origX = x;
                    var origY = y;
                    
                    // 调整 x 坐标 - 右侧遮罩移到右边
                    if (!isLeftMask) {
                        x = plotX + plotWidth - maskWidth + (x - bounds.minX);
                    }
                    
                    // 调整 y 坐标 - 让遮罩顶部对齐绘图区顶部,底部对齐 x 轴底部
                    if (Math.abs(origY - bounds.minY) < 1) {
                        y = plotY;
                    } else if (Math.abs(origY - bounds.maxY) < 1) {
                        y = xAxisY;
                    }
                    
                    newCoords.push(x);
                    newCoords.push(y);
                }
                
                console.log('🟡 Mask', idx, 'New coords:', newCoords);
                
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
                
                console.log('🟡 Mask', idx, 'New path:', newPath);
                
                mask.setAttribute('d', newPath);
                mask.setAttribute('fill', 'red');
                console.log('✅ Mask', idx, 'updated successfully');
            });
            console.log('✅✅✅ All masks processed!');
            return true;
        }
        
        console.log('🔵 Adding load event listener...');
        H.addEvent(H.Chart, 'load', function() {
            console.log('🟡🟡🟡 Chart LOAD event fired!');
            var chart = this;
            console.log('🟡 chart:', chart);
            console.log('🟡 chart.options:', chart.options);
            console.log('🟡 chart.options.chart:', chart.options.chart);
            console.log('🟡 scrollablePlotArea:', chart.options.chart && chart.options.chart.scrollablePlotArea);
            
            if (chart.options.chart && chart.options.chart.scrollablePlotArea) {
                console.log('✅✅✅ scrollablePlotArea detected! Scheduling alignment...');
                setTimeout(function() { 
                    console.log('🟢 Executing alignScrollableMasks from load event...');
                    alignScrollableMasks(chart); 
                }, 100);
            } else {
                console.warn('⚠️⚠️⚠️ NO scrollablePlotArea found in options!');
            }
        });
        
        console.log('🔵 Adding redraw event listener...');
        H.addEvent(H.Chart, 'redraw', function() {
            console.log('🟡 Chart REDRAW event fired');
            var chart = this;
            if (chart.options.chart && chart.options.chart.scrollablePlotArea) {
                setTimeout(function() { 
                    console.log('🟢 Executing alignScrollableMasks from redraw event...');
                    alignScrollableMasks(chart); 
                }, 50);
            }
        });
        
        console.log('✅✅✅ Plugin installation COMPLETE!');
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
    .xAxisSet(AAXAxis.new.categoriesSet(categories).labelsSet(AALabels.new.rotationSet(@-45).styleSet(AAStyle.new.fontSizeSet(@"11px"))))
    .yAxisSet(AAYAxis.new.titleSet(AATitle.new.textSet(@"数值")))
    .seriesSet(@[
        AASeriesElement.new.nameSet(@"正弦波").dataSet(sineData).colorSet(@"#2196F3").markerSet(AAMarker.new.enabledSet(true).radiusSet(@4).fillColorSet(@"#2196F3").lineWidthSet(@2).lineColorSet(@"#fff")),
        AASeriesElement.new.nameSet(@"余弦波").dataSet(cosineData).colorSet(@"#FF0000").markerSet(AAMarker.new.enabledSet(true).radiusSet(@4).fillColorSet(@"#FF0000").lineWidthSet(@2).lineColorSet(@"#fff"))
    ])
    .legendSet(AALegend.new.enabledSet(true))
    .creditsSet(AACredits.new.enabledSet(false));
}

@end
