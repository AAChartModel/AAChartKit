//
//  AAOptions.m
//  AAChartKit
//
//  Created by An An on 17/1/4.
//  Copyright © 2017年 An An. All rights reserved.
//

#import "AAOptions.h"
#import "AAChart.h"
#import "AATitle.h"
#import "AASubtitle.h"
#import "AAXAxis.h"
#import "AAYAxis.h"
#import "AAToolTip.h"
#import "AAPlotOptions.h"
#import "AAColumn.h"
//#import "AASeries.h"
#import "AALegend.h"
@implementation AAOptions
AAPropSetFuncImplementation(AAOptions, AAChart *, chart);
AAPropSetFuncImplementation(AAOptions, AATitle *, title);
AAPropSetFuncImplementation(AAOptions, AASubtitle *, subtitle);
AAPropSetFuncImplementation(AAOptions, AAXAxis *, xAxis);
AAPropSetFuncImplementation(AAOptions, AAYAxis *, yAxis);
AAPropSetFuncImplementation(AAOptions, AATooltip *, tooltip);
AAPropSetFuncImplementation(AAOptions, AAPlotOptions *, plotOptions);
AAPropSetFuncImplementation(AAOptions, AAColumn *, column);
AAPropSetFuncImplementation(AAOptions, NSArray *, series);
AAPropSetFuncImplementation(AAOptions, AALegend *, legend);
AAPropSetFuncImplementation(AAOptions, NSArray *, colorsTheme);
AAPropSetFuncImplementation(AAOptions, BOOL , gradientColorEnable);


@end
