//
//  XAxisYAxisLabelsOptionsVC.m
//  AAChartKitDemo
//

#import "XAxisYAxisLabelsOptionsVC.h"
#import "XAxisYAxisLabelsOptionsComposer.h"

@implementation XAxisYAxisLabelsOptionsVC

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
}

- (id)chartConfigurationWithSelectedIndex:(NSInteger)selectedIndex {
    switch (selectedIndex) {
        case 0: return [XAxisYAxisLabelsOptionsComposer configureXAxisLabelsFontColorWithHTMLString];//通过HTML字符串自定义X轴文字颜色
        case 1: return [XAxisYAxisLabelsOptionsComposer configureXAxisLabelsFontColorAndFontSizeWithHTMLString];//通过HTML字符串自定义X轴文字颜色和字体大小
        case 2: return [XAxisYAxisLabelsOptionsComposer customXAxisLabelsBeImages];//自定义曲线面积图 X 轴 labels 为一组图片🖼
        case 3: return [XAxisYAxisLabelsOptionsComposer configureYAxisLabelsNumericSymbolsMagnitudeOfAerasplineChart];//自定义 Y 轴的 Labels 国际单位符基数及国际单位符

        default:
            break;
    }
    return nil;
}

@end
