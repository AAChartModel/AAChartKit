//
//  JSFunctionForAAChartEventsVC2.m
//  AAChartKitDemo
//
//  Created by AnAn on 2024/9/3.
//  Copyright © 2024 An An. All rights reserved.
//

#import "JSFunctionForAAChartEventsVC2.h"
#import "JSFunctionForAAChartEventsComposer2.h"

@interface JSFunctionForAAChartEventsVC2 ()

@end

@implementation JSFunctionForAAChartEventsVC2

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
}

- (id)chartConfigurationWithSelectedIndex:(NSUInteger)selectedIndex {
    switch (selectedIndex) {
        case 0: return [JSFunctionForAAChartEventsComposer2 configureTheSizeOfTheSliceOfDonutAndPieChart];
        case 1: return [JSFunctionForAAChartEventsComposer2 configurePlotBackgroundClickEvent];
        case 2: return [JSFunctionForAAChartEventsComposer2 disableHoverEventEffect];
        case 3: return [JSFunctionForAAChartEventsComposer2 addClickEventToXAxisLabelAndAccessData];
        case 4: return [JSFunctionForAAChartEventsComposer2 addClickEventToHighlightXAxisLabel];
            
        case 5: return [JSFunctionForAAChartEventsComposer2 addClickEventToXAxisLabelAndAccessDataAndHighlightXAxisLabel];
        case 6: return [JSFunctionForAAChartEventsComposer2 defaultSelectedAPointForLineChart];
        case 7: return [JSFunctionForAAChartEventsComposer2 configureBlinkMarkerChart];
        case 8: return [JSFunctionForAAChartEventsComposer2 toggleDataLabelsOnTouch];
        case 9: return [JSFunctionForAAChartEventsComposer2 autoCrosshairAndTooltip];
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
