//
//  AAOptions.h
//  AAChartKit
//
//  Created by An An on 17/1/4.
//  Copyright © 2017年 An An. All rights reserved.
//


#import <Foundation/Foundation.h>
@class AAChart,AATitle,AASubtitle,AAXAxis,AAYAxis,AATooltip,AAPlotOptions,AAColumn,AALegend;


@interface AAOptions : NSObject
AAPropStatementAndFuncStatement(strong, AAOptions, AAChart *, chart);
AAPropStatementAndFuncStatement(strong, AAOptions, AATitle *, title);
AAPropStatementAndFuncStatement(strong, AAOptions, AASubtitle *, subtitle);
AAPropStatementAndFuncStatement(strong, AAOptions, AAXAxis *, xAxis);
AAPropStatementAndFuncStatement(strong, AAOptions, AAYAxis *, yAxis);
AAPropStatementAndFuncStatement(strong, AAOptions, AATooltip *, tooltip);
AAPropStatementAndFuncStatement(strong, AAOptions, AAPlotOptions *, plotOptions);
AAPropStatementAndFuncStatement(strong, AAOptions, AAColumn *, column);
AAPropStatementAndFuncStatement(strong, AAOptions, NSArray *, series);
AAPropStatementAndFuncStatement(strong, AAOptions, AALegend *, legend);
AAPropStatementAndFuncStatement(strong, AAOptions, NSArray *, colorsTheme);
AAPropStatementAndFuncStatement(assign, AAOptions, BOOL , gradientColorEnable);

@end
