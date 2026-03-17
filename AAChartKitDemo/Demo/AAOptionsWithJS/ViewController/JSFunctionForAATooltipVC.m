//
//  JSFunctionForAATooltipVC.m
//  AAChartKitDemo
//

#import "JSFunctionForAATooltipVC.h"
#import "JSFunctionForAATooltipComposer.h"

@interface JSFunctionForAATooltipVC ()

@end

@implementation JSFunctionForAATooltipVC

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
}

- (id)chartConfigurationWithSelectedIndex:(NSInteger)selectedIndex {
    switch (selectedIndex) {
        case 0: return [JSFunctionForAATooltipComposer customAreaChartTooltipStyleWithSimpleFormatString];//简单字符串拼接
        case 1: return [JSFunctionForAATooltipComposer customAreaChartTooltipStyleWithDifferentUnitSuffix];//自定义不同单位后缀
        case 2: return [JSFunctionForAATooltipComposer customAreaChartTooltipStyleWithColorfulHtmlLabels];//自定义多彩颜色文字
        case 3: return [JSFunctionForAATooltipComposer customLineChartTooltipStyleWhenValueBeZeroDoNotShow];//值为0时,在tooltip中不显示
        case 4: return [JSFunctionForAATooltipComposer customStackedAndGroupedColumnChartTooltip];//自定义分组堆积柱状图tooltip内容
        case 5: return [JSFunctionForAATooltipComposer configureSpecialStyleTrianglePolarChart];//外部显示六边形边框的三角形雷达图
        case 6: return [JSFunctionForAATooltipComposer customArearangeChartTooltip];//自定义面积范围图的 tooltip
        case 7: return [JSFunctionForAATooltipComposer customLineChartOriginalPointPositionByConfiguringXAxisFormatterAndTooltipFormatter];//通过自定义X轴的 labels 的 Formatter 和 tooltip 的 Formatter 来调整折线图的 X 轴左边距
        case 8: return [JSFunctionForAATooltipComposer customTooltipWhichDataSourceComeFromOutSideRatherThanSeries];//通过来自外部的数据源来自定义 tooltip (而非常规的来自图表的 series)
        case 9: return [JSFunctionForAATooltipComposer customAreasplineChartTooltipStyleByDivWithCSS];//通过自定义 div 的 css 样式来自定义复杂效果的 tooltip 浮动提示框
        default:
            return nil;
    }
}

@end
