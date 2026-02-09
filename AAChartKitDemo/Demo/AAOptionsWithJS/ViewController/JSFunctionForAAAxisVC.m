//
//  JSFunctionForAAAxisVC.m
//  AAChartKitDemo
//

#import "JSFunctionForAAAxisVC.h"
#import "JSFunctionForAAAxisComposer.h"

@interface JSFunctionForAAAxisVC ()

@end

@implementation JSFunctionForAAAxisVC

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
}

- (id)chartConfigurationWithSelectedIndex:(NSInteger)selectedIndex {
    switch (selectedIndex) {
        case 0: return [JSFunctionForAAAxisComposer customYAxisLabels];//自定义Y轴文字
        case 1: return [JSFunctionForAAAxisComposer customYAxisLabels2];//自定义Y轴文字2
        case 2: return [JSFunctionForAAAxisComposer customAreaChartXAxisLabelsTextUnitSuffix1];//自定义X轴文字单位后缀(通过 formatter 函数)
        case 3: return [JSFunctionForAAAxisComposer customAreaChartXAxisLabelsTextUnitSuffix2];//自定义X轴文字单位后缀(不通过 formatter 函数)
        case 4: return [JSFunctionForAAAxisComposer configureTheAxesLabelsFormattersOfDoubleYAxesChart];//配置双 Y 轴图表的 Y 轴文字标签的 Formatter 函数 示例 1
        case 5: return [JSFunctionForAAAxisComposer configureTheAxesLabelsFormattersOfDoubleYAxesChart2];//配置双 Y 轴图表的 Y 轴文字标签的 Formatter 函数 示例 2
        case 6: return [JSFunctionForAAAxisComposer configureTheAxesLabelsFormattersOfDoubleYAxesChart3];//配置双 Y 轴图表的 Y 轴文字标签的 Formatter 函数 示例 3
        case 7: return [JSFunctionForAAAxisComposer customColumnChartXAxisLabelsTextByInterceptTheFirstFourCharacters];//通过截取前四个字符来自定义 X 轴 labels
        case 8: return [JSFunctionForAAAxisComposer customSpiderChartStyle];//自定义蜘蛛🕷🕸图样式
        case 9: return [JSFunctionForAAAxisComposer customizeEveryDataLabelSinglelyByDataLabelsFormatter];//通过 DataLabels 的 formatter 函数来实现单个数据标签🏷自定义
        case 10: return [JSFunctionForAAAxisComposer customXAxisLabelsBeImages];//自定义 X轴 labels 为一组图片
        case 11: return [JSFunctionForAAAxisComposer loadImageForAATooltip];//为自定义 AATooltip 加载图片内容
        default:
            return nil;
    }
}

@end
