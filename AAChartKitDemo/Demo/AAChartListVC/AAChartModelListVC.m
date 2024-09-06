//
//  AAChartModelListVC.m
//  AAChartKitDemo
//
//  Created by AnAn on 2024/9/6.
//  Copyright © 2024 An An. All rights reserved.
//

#import "AAChartModelListVC.h"
#import "CustomStyleForScatterChartVC.h"
#import "CustomStyleForBubbleChartVC.h"

@interface AAChartModelListVC ()

@end

@implementation AAChartModelListVC

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    self.sectionTitleArr = @[
        @"Scatter Chart With Custom Style | 一些自定义风格样式散点图",
        @"Bubble Chart With Custom Style | 一些自定义风格样式气泡图",
    ];
    
    self.chartTypeTitleArr = @[
        
        /*Custom Style For Scatter Chart*/
        @[
            @"customScatterChartMarkerSymbolContent",
            @"drawLineMixedScatterChartWithPointsCoordinates2",
        ],
        /*Custom Style For Bubble Chart*/
        @[
            @"negativeColorMixedBubbleChart",
            @"showAARadialGradientPositionAllEnumValuesWithBubbleChart",
        ],
    ];
    
    self.view.backgroundColor = [UIColor whiteColor];
    [self setUpMainTableView];
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    NSUInteger row = (NSUInteger) indexPath.row;
    NSUInteger section = (NSUInteger) indexPath.section;

     switch (section) {
         case  0: {
             CustomStyleForScatterChartVC *vc = CustomStyleForScatterChartVC.new;
             vc.selectedIndex = row;
             vc.navigationItemTitleArr = self.chartTypeTitleArr[section];
             vc.hidesBottomBarWhenPushed = YES;
             [self.navigationController pushViewController:vc animated:YES];
         }
             break;
                         
         case 1: {
             CustomStyleForBubbleChartVC *vc = CustomStyleForBubbleChartVC.new;
             vc.selectedIndex = row;
             vc.navigationItemTitleArr = self.chartTypeTitleArr[section];
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
