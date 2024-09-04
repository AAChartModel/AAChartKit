//
//  AAOptionsWithJSForChartEventsListVC.m
//  AAChartKitDemo
//
//  Created by AnAn on 2024/9/4.
//  Copyright © 2024 An An. All rights reserved.
//

#import "AAOptionsWithJSForChartEventsListVC.h"
#import "JSFunctionForAAChartEventsVC.h"
#import "JSFunctionForAAChartEventsVC2.h"

@interface AAOptionsWithJSForChartEventsListVC ()

@end

@implementation AAOptionsWithJSForChartEventsListVC

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    self.sectionTitleArr = @[
        @"Draw Chart With AAOptions | 通过Options绘图",
        
        @"LineChartOptions--- 通过 Options 绘制折线📈图",
 
    ];
    
    self.chartTypeTitleArr = @[
        /*基础类型图表*/
        @[
            @"generalDrawingChart]; //自由绘图",
            @"advancedTimeLineChart]; //高级时间线图",
            @"configureBlinkMarkerChart]; //配置闪烁的标记点",
            @"configureSpecialStyleMarkerOfSingleDataElementChartWithBlinkEffect]; //配置单个数据元素的特殊样式标记点即闪烁特效",
            @"configureScatterChartWithBlinkEffect]; //配置散点图的闪烁特效",
            @"automaticallyHideTooltipAfterItIsShown]; //图表加载完成后,自动隐藏浮动提示框",
            @"dynamicHeightGridLineAreaChart]; //动态高度网格线的区域填充图",
            @"customizeYAxisPlotLinesLabelBeSpecialStyle]; //自定义 Y 轴轴线上面的标签文字特殊样式",
            @"configureECGStyleChart]; //配置心电图样式的图表",
            
        ],
        
        @[
            @"configureTheSizeOfTheSliceOfDonutAndPieChart",
            @"configurePlotBackgroundClickEvent",
            @"disableHoverEventTooltipEffect",
            @"addClickEventToXAxisLabelAndAccessData",
            @"addClickEventToHighlightXAxisLabel",
            @"addClickEventToXAxisLabelAndAccessDataAndHighlightXAxisLabel",
            @"defaultSelectedAPointForLineChart",
            @"configureBlinkMarkerChart",
            @"toggleDataLabelsOnTouch",
            @"autoCrosshairAndTooltip",
            
        ],
    ];
    
    self.view.backgroundColor = [UIColor whiteColor];
    [self setUpMainTableView];
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    NSUInteger row = (NSUInteger) indexPath.row;
    NSUInteger section = (NSUInteger) indexPath.section;

     switch (section) {
         case 0: {
             JSFunctionForAAChartEventsVC *vc = JSFunctionForAAChartEventsVC.new;
             vc.selectedIndex = row;
             vc.navigationItemTitleArr = self.chartTypeTitleArr[indexPath.section];
             vc.hidesBottomBarWhenPushed = YES;
             [self.navigationController pushViewController:vc animated:YES];
         }
             break;
         
         case 1: {
             JSFunctionForAAChartEventsVC2 *vc = JSFunctionForAAChartEventsVC2.new;
             vc.selectedIndex = row;
             vc.navigationItemTitleArr = self.chartTypeTitleArr[indexPath.section];
             vc.hidesBottomBarWhenPushed = YES;
             [self.navigationController pushViewController:vc animated:YES];
         }
             break;
         
             
         default:
             break;
     }
     
 }

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
