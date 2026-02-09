//
//  JSFunctionForAAAxisVC.m
//  AAChartKitDemo
//

#import "JSFunctionForAAAxisVC.h"
#import "JSFunctionForAAAxisComposer.h"

@interface JSFunctionForAAAxisVC ()

@end

@implementation JSFunctionForAAAxisVC

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
}

- (id)chartConfigurationWithSelectedIndex:(NSInteger)selectedIndex {
    return [JSFunctionForAAAxisComposer chartConfigurationWithSelectedIndex:selectedIndex];
}

@end
