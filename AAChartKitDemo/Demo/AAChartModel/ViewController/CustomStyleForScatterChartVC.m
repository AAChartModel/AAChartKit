//
//  CustomStyleForScatterChartVC.m
//  AAChartKitDemo
//
//  Created by AnAn on 2024/9/6.
//  Copyright © 2024 An An. All rights reserved.
//

#import "CustomStyleForScatterChartVC.h"
#import "CustomStyleForScatterChartComposer.h"

@interface CustomStyleForScatterChartVC ()

@end

@implementation CustomStyleForScatterChartVC

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
}

- (id)chartConfigurationWithSelectedIndex:(NSUInteger)selectedIndex {
    switch (selectedIndex) {
        case 0:  return [CustomStyleForScatterChartComposer customScatterChartMarkerSymbolContent];
        case 1:  return [CustomStyleForScatterChartComposer drawLineMixedScatterChartWithPointsCoordinates2];
            
        default:
            break;
    }
    return nil;
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
