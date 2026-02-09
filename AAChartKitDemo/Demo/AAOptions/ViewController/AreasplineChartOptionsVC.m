//
//  AreasplineChartOptionsVC.m
//  AAChartKitDemo
//

#import "AreasplineChartOptionsVC.h"
#import "AreasplineChartOptionsComposer.h"

@implementation AreasplineChartOptionsVC

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
}

- (id)chartConfigurationWithSelectedIndex:(NSInteger)selectedIndex {
    switch (selectedIndex) {
        case 0: return [AreasplineChartOptionsComposer configureComplicatedCustomAreasplineChart];//复杂自定义曲线填充图 1
        case 1: return [AreasplineChartOptionsComposer configureComplicatedCustomAreasplineChart2];//复杂自定义曲线填充图 2
        case 2: return [AreasplineChartOptionsComposer configureComplicatedCustomAreasplineChart3];//复杂自定义曲线填充图 3
        case 3: return [AreasplineChartOptionsComposer fanChart];//折扇图

        default:
            break;
    }
    return nil;
}

@end
