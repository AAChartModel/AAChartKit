//
//  JSFunctionForAATooltipVC2.m
//  AAChartKitDemo
//

#import "JSFunctionForAATooltipVC2.h"
#import "JSFunctionForAATooltipV2Composer.h"

@interface JSFunctionForAATooltipVC2 ()

@end

@implementation JSFunctionForAATooltipVC2

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
}

- (id)chartConfigurationWithSelectedIndex:(NSInteger)selectedIndex {
    return [JSFunctionForAATooltipV2Composer chartConfigurationWithSelectedIndex:(NSUInteger)selectedIndex];
}

@end
