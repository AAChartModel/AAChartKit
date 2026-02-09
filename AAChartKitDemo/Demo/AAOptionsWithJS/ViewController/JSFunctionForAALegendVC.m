//
//  JSFunctionForAALegendVC.m
//  AAChartKitDemo
//

#import "JSFunctionForAALegendVC.h"
#import "JSFunctionForAALegendComposer.h"

@interface JSFunctionForAALegendVC ()

@end

@implementation JSFunctionForAALegendVC

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
}

- (id)chartConfigurationWithSelectedIndex:(NSInteger)selectedIndex {
    return [JSFunctionForAALegendComposer chartConfigurationWithSelectedIndex:selectedIndex];
}

@end
