//
//  AAOptions.m
//  AAChartKit
//
//  Created by An An on 17/1/4.
//  Copyright © 2017年 An An. All rights reserved.
//*************** ...... SOURCE CODE ...... ***************
//***...................................................***
//*** https://github.com/AAChartModel/AAChartKit        ***
//*** https://github.com/AAChartModel/AAChartKit-Swift  ***
//***...................................................***
//*************** ...... SOURCE CODE ...... ***************

/*
 
 * -------------------------------------------------------------------------------
 *
 * 🌕 🌖 🌗 🌘  ❀❀❀   WARM TIPS!!!   ❀❀❀ 🌑 🌒 🌓 🌔
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

#import "AAOptions.h"

@implementation AAOptions

AAPropSetFuncImplementation(AAOptions, AAChart       *, chart);
AAPropSetFuncImplementation(AAOptions, AATitle       *, title);
AAPropSetFuncImplementation(AAOptions, AASubtitle    *, subtitle);
AAPropSetFuncImplementation(AAOptions, AAXAxis       *, xAxis);
AAPropSetFuncImplementation(AAOptions, AAYAxis       *, yAxis);
AAPropSetFuncImplementation(AAOptions, AATooltip     *, tooltip);
AAPropSetFuncImplementation(AAOptions, AAPlotOptions *, plotOptions);
AAPropSetFuncImplementation(AAOptions, NSArray       *, series);
AAPropSetFuncImplementation(AAOptions, AALegend      *, legend);
AAPropSetFuncImplementation(AAOptions, NSArray       *, colors);
AAPropSetFuncImplementation(AAOptions, BOOL,            gradientColorEnabled);
AAPropSetFuncImplementation(AAOptions, NSDictionary  *, drilldown);
AAPropSetFuncImplementation(AAOptions, NSString      *, zoomResetButtonText); //String to display in 'zoom reset button"



@end
