//
//  JSFunctionForAAPointEventsVC.m
//  AAChartKitDemo
//
//  Created by AnAn on 2024/9/4.
//  Copyright © 2024 An An. All rights reserved.
//

#import "JSFunctionForAAPointEventsVC.h"
#import "JSFunctionForAAPointEventsComposer.h"

@interface JSFunctionForAAPointEventsVC ()

@end

@implementation JSFunctionForAAPointEventsVC

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
}

- (id)chartConfigurationWithSelectedIndex:(NSUInteger)selectedIndex {
    switch (selectedIndex) {
        case 0: return [JSFunctionForAAPointEventsComposer disableColumnChartUnselectEventEffectBySeriesPointEventClickFunction];
        case 1: return [JSFunctionForAAPointEventsComposer customizeCrosshairsStyle];
        case 2: return [JSFunctionForAAPointEventsComposer showTooltipOnlyOnClick];
     
    }
    return nil;
}


@end
