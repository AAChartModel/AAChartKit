//
//  AAOptions.h
//  AAChartKit
//
//  Created by An An on 17/1/4.
//  Copyright © 2017年 An An. All rights reserved.
//  source code ----*** https://github.com/AAChartModel/AAChartKit ***--- source code
//

/*
 
 * -------------------------------------------------------------------------------
 *
 * ❀❀❀   WARM TIPS!!!   ❀❀❀
 *
 * Please contact me on GitHub,if there are any problems encountered in use.
 * GitHub Issues : https://github.com/AAChartModel/AAChartKit/issues
 * -------------------------------------------------------------------------------
 * And if you want to contribute for this project, please contact me as well
 * GitHub        : https://github.com/AAChartModel
 * StackOverflow : https://stackoverflow.com/users/7842508/codeforu
 * JianShu       : http://www.jianshu.com/u/f1e6753d4254
 * SegmentFault  : https://segmentfault.com/u/huanghunbieguan
 *
 * -------------------------------------------------------------------------------
 
 */


#import <Foundation/Foundation.h>

@class AAChart,AATitle,AASubtitle,AAXAxis,AAYAxis,AATooltip,AAPlotOptions,AALegend;

@interface AAOptions : NSObject

AAPropStatementAndFuncStatement(strong, AAOptions, AAChart       *, chart);
AAPropStatementAndFuncStatement(strong, AAOptions, AATitle       *, title);
AAPropStatementAndFuncStatement(strong, AAOptions, AASubtitle    *, subtitle);
AAPropStatementAndFuncStatement(strong, AAOptions, AAXAxis       *, xAxis);
AAPropStatementAndFuncStatement(strong, AAOptions, AAYAxis       *, yAxis);
AAPropStatementAndFuncStatement(strong, AAOptions, AATooltip     *, tooltip);
AAPropStatementAndFuncStatement(strong, AAOptions, AAPlotOptions *, plotOptions);
AAPropStatementAndFuncStatement(strong, AAOptions, NSArray       *, series);
AAPropStatementAndFuncStatement(strong, AAOptions, AALegend      *, legend);
AAPropStatementAndFuncStatement(strong, AAOptions, NSArray       *, colors);
AAPropStatementAndFuncStatement(assign, AAOptions, BOOL,            gradientColorEnable);
AAPropStatementAndFuncStatement(assign, AAOptions, NSDictionary  *, drilldown);


@end
