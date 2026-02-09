//
//  JSFunctionForAAOptionsVC.m
//  AAChartKitDemo
//

#import "JSFunctionForAAOptionsVC.h"
#import "JSFunctionForAAOptionsComposer.h"

@interface JSFunctionForAAOptionsVC ()

@end

@implementation JSFunctionForAAOptionsVC

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
}

- (id)chartConfigurationWithSelectedIndex:(NSInteger)selectedIndex {
    return [JSFunctionForAAOptionsComposer chartConfigurationWithSelectedIndex:selectedIndex];
}

@end
