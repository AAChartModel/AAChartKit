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
    switch (selectedIndex) {
        case 0: return [JSFunctionForAAOptionsComposer customDoubleXAxesChart];
        case 1: return [JSFunctionForAAOptionsComposer disableColumnChartUnselectEventEffectBySeriesPointEventClickFunction];
        case 2: return [JSFunctionForAAOptionsComposer customizeEveryDataLabelSinglelyByDataLabelsFormatter];
        case 3: return [JSFunctionForAAOptionsComposer configureColorfulDataLabelsForPieChart];
        case 4: return [JSFunctionForAAOptionsComposer customizeCrosshairsStyle];
        default:
            return nil;
    }
}

@end
