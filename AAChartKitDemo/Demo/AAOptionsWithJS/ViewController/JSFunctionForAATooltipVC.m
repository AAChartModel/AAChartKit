//
//  JSFunctionForAATooltipVC.m
//  AAChartKitDemo
//

#import "JSFunctionForAATooltipVC.h"
#import "JSFunctionForAATooltipComposer.h"

@interface JSFunctionForAATooltipVC ()

@end

@implementation JSFunctionForAATooltipVC

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
}

- (id)chartConfigurationWithSelectedIndex:(NSInteger)selectedIndex {
    return [JSFunctionForAATooltipComposer chartConfigurationWithSelectedIndex:(NSUInteger)selectedIndex];
}

@end
