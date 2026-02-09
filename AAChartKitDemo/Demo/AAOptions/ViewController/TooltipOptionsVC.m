//
//  TooltipOptionsVC.m
//  AAChartKitDemo
//

#import "TooltipOptionsVC.h"
#import "TooltipOptionsComposer.h"

@implementation TooltipOptionsVC

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
}

- (id)chartConfigurationWithSelectedIndex:(NSInteger)selectedIndex {
    switch (selectedIndex) {
        case 0: return [TooltipOptionsComposer customTooltipStyleByFormatProperties];//通过 tooltip 的 format 属性自定义 tooltip 样式内容
        case 1: return [TooltipOptionsComposer customAreaChartTooltipStyleLikeHTMLTable];//自定义 tooltip 提示框为 HTML 表格样式
        case 2: return [TooltipOptionsComposer customAreasplineChartTooltipContentWithHeaderFormat];//通过 tooltip 的 headerFormat 属性来自定义 曲线填充图的 tooltip
        case 3: return [TooltipOptionsComposer customAreaChartTooltipStyleWithTotalValueHeader];//浮动提示框 header 显示总值信息
        case 4: return [TooltipOptionsComposer customBoxplotTooltipContent];//自定义箱线图的浮动提示框头部内容
        default:
            break;
    }
    return nil;
}

@end
