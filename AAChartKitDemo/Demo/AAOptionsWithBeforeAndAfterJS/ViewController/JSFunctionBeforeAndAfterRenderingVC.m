//
//  JSFunctionBeforeAndAfterRenderingVC.m
//  AAChartKitDemo
//
//  Created by AnAn on 2025/1/8.
//  Copyright © 2025 An An. All rights reserved.
//

#import "JSFunctionBeforeAndAfterRenderingVC.h"
#import "JSFunctionBeforeAndAfterRenderingComposer.h"
#import "JSFunctionBeforeAndAfterRenderingComposer2.h"
#import "JSFunctionBeforeAndAfterRenderingComposer3.h"
#import "JSFunctionBeforeAndAfterRenderingComposer4.h"
#import "JSFunctionBeforeAndAfterRenderingComposer5.h"
#import "JSFunctionBeforeAndAfterRenderingComposer6.h"
#import "JSFunctionBeforeAndAfterRenderingComposer7.h"

@interface JSFunctionBeforeAndAfterRenderingVC ()

@end

@implementation JSFunctionBeforeAndAfterRenderingVC

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
}

- (id)chartConfigurationWithSelectedIndex:(NSUInteger)selectedIndex {
    switch (selectedIndex) {
        case 0: return [JSFunctionBeforeAndAfterRenderingComposer6 forceStackedBarChart];
        case 1: return [JSFunctionBeforeAndAfterRenderingComposer7 customScrollablePlotAreaMask];
        case 2: return [JSFunctionBeforeAndAfterRenderingComposer2 speedometerChart];
        case 3: return [JSFunctionBeforeAndAfterRenderingComposer3 synchronizedChart];
        case 4: return [JSFunctionBeforeAndAfterRenderingComposer4 customPointerStyleGaugeChart];
        case 5: return [JSFunctionBeforeAndAfterRenderingComposer5 categoryGroupedColumnChart];
        case 6: return [JSFunctionBeforeAndAfterRenderingComposer6 forceStackedBarChart];
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
