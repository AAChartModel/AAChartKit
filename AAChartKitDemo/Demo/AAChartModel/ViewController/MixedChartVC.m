//
//  MixedChartVC.m
//  AAChartKitDemo
//
//  Created by AnAn on 2025/6/11.
//  Copyright © 2025 An An. All rights reserved.
//

#import "MixedChartVC.h"
#import "MixedChartComposer.h"

@interface MixedChartVC ()

@end

@implementation MixedChartVC

- (void)viewDidLoad {
    [super viewDidLoad];
    
}

- (id)chartConfigurationWithSelectedIndex:(NSUInteger)selectedIndex {
    switch (selectedIndex) {
        case 0:  return [MixedChartComposer arearangeMixedLineChart];
        case 1:  return [MixedChartComposer columnrangeMixedLineChart];
        case 2:  return [MixedChartComposer stackingColumnMixedLineChart];
        case 3:  return [MixedChartComposer dashStyleTypeMixedChart];
        case 4:  return [MixedChartComposer allLineDashStyleTypesMixedChart];
        case 5:  return [MixedChartComposer negativeColorMixedColumnChart];
        case 6:  return [MixedChartComposer scatterMixedLineChart];
        case 7:  return [MixedChartComposer negativeColorMixedBubbleChart];
        case 8:  return [MixedChartComposer polygonMixedScatterChart];
        case 9:  return [MixedChartComposer polarMixedChart];
        case 10: return [MixedChartComposer columnMixedScatterChart];//柱形图混合散点图
        case 11: return [MixedChartComposer negativeColorMixedAreasplineChart];
        case 12: return [MixedChartComposer negativeColorMixedAreasChart];
        case 13: return [MixedChartComposer areaChartMixedStepAreaChart];
        default:
            break;
    }
    return nil;
}

@end
