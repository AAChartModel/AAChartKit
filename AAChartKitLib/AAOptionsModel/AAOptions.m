//
//  AAOptions.m
//  AAChartKit
//
//  Created by An An on 17/1/4.
//  Copyright © 2017年 An An. All rights reserved.
//  source code ----*** https://github.com/AAChartModel/AAChartKit ***--- source code
//

#import "AAOptions.h"

@implementation AAOptions

AAPropSetFuncImplementation(AAOptions, AAChart *, chart);
AAPropSetFuncImplementation(AAOptions, AATitle *, title);
AAPropSetFuncImplementation(AAOptions, AASubtitle *, subtitle);
AAPropSetFuncImplementation(AAOptions, AAXAxis *, xAxis);
AAPropSetFuncImplementation(AAOptions, AAYAxis *, yAxis);
AAPropSetFuncImplementation(AAOptions, AATooltip *, tooltip);
AAPropSetFuncImplementation(AAOptions, AAPlotOptions *, plotOptions);
AAPropSetFuncImplementation(AAOptions, NSArray *, series);
AAPropSetFuncImplementation(AAOptions, AALegend *, legend);
AAPropSetFuncImplementation(AAOptions, NSArray *, colors);
AAPropSetFuncImplementation(AAOptions, BOOL , gradientColorEnable);
AAPropSetFuncImplementation(AAOptions, NSDictionary *, drilldown);

@end
