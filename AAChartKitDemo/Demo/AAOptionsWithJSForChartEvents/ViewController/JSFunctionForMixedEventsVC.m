//
//  JSFunctionForMixedEventsVC.m
//  AAChartKitDemo
//
//  Created by AnAn on 2024/9/4.
//  Copyright © 2024 An An. All rights reserved.
//

#import "JSFunctionForMixedEventsVC.h"
#import "JSFunctionForMixedEventsComposer.h"

@interface JSFunctionForMixedEventsVC ()

@end

@implementation JSFunctionForMixedEventsVC

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
}

- (id)chartConfigurationWithSelectedIndex:(NSUInteger)selectedIndex {
    switch (selectedIndex) {
        case 0: return [JSFunctionForMixedEventsComposer disableHoverEventTooltipEffect];
            
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
