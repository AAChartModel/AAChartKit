//
//  SpecialChartVC.m
//  AAChartKitDemo
//
//  Created by AnAn on 2025/6/11.
//  Copyright © 2025 An An. All rights reserved.
//

#import "SpecialChartVC.h"
#import "SpecialChartComposer.h"

@interface SpecialChartVC ()

@end

@implementation SpecialChartVC

- (void)viewDidLoad {
    [super viewDidLoad];
    
}

- (id)chartConfigurationWithSelectedIndex:(NSUInteger)selectedIndex {
    switch (selectedIndex) {
        case 0: return [SpecialChartComposer pieChart];
        case 1: return [SpecialChartComposer bubbleChart];
        case 2: return [SpecialChartComposer bubbleChart];
        case 3: return [SpecialChartComposer scatterChart];
        case 4: return [SpecialChartComposer arearangeChart];
        case 5: return [SpecialChartComposer areaslinerangeChart];
        case 6: return [SpecialChartComposer columnpyramidChart];

        case 7: return [SpecialChartComposer columnrangeChart];
        case 8: return [SpecialChartComposer boxplotChart];
        case 9: return [SpecialChartComposer waterfallChart];
        case 10: return [SpecialChartComposer pyramidChart];
        case 11: return [SpecialChartComposer funnelChart];
        case 12: return [SpecialChartComposer errorBarChart];
        case 13: return [SpecialChartComposer gaugeChart];
        case 14: return [SpecialChartComposer polygonChart];

        default:
            break;
    }
    return nil;
}

@end
