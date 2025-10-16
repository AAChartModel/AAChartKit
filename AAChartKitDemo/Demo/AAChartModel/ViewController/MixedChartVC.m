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
        case 0:  return [MixedChartComposer configureArearangeMixedLineChart];
        case 1:  return [MixedChartComposer configureColumnrangeMixedLineChart];
        case 2:  return [MixedChartComposer configureStackingColumnMixedLineChart];
        case 3:  return [MixedChartComposer configureDashStyleTypeMixedChart];
        case 4:  return [MixedChartComposer configureAllLineDashStyleTypesMixedChart];
        case 5:  return [MixedChartComposer configureNegativeColorMixedColumnChart];
        case 6:  return [MixedChartComposer configureScatterMixedLineChart];
        case 7:  return [MixedChartComposer configureNegativeColorMixedBubbleChart];
        case 8:  return [MixedChartComposer configurePolygonMixedScatterChart];
        case 9:  return [MixedChartComposer configurePolarMixedChart];
        case 10: return [MixedChartComposer configureColumnMixedScatterChart];//柱形图混合散点图
        case 11: return [MixedChartComposer configureNegativeColorMixedAreasplineChart];
        case 12: return [MixedChartComposer configureNegativeColorMixedAreasChart];
        case 13: return [MixedChartComposer configureAreaChartMixedStepAreaChart];
        default:
            break;
    }
    return nil;
}

@end
