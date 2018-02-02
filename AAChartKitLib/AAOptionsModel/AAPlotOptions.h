//
//  AAPlotOptions.h
//  AAChartKit
//
//  Created by An An on 17/1/5.
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

#import <Foundation/Foundation.h>

@class AAColumn,AABar,AALine,AASpline,AAArea,AAAreaspline,AAPie,AASeries;

@interface AAPlotOptions : NSObject

AAPropStatementAndFuncStatement(strong, AAPlotOptions, AAColumn     *, column);
AAPropStatementAndFuncStatement(strong, AAPlotOptions, AALine       *, line);
AAPropStatementAndFuncStatement(strong, AAPlotOptions, AAPie        *, pie);
AAPropStatementAndFuncStatement(strong, AAPlotOptions, AABar        *, bar);
AAPropStatementAndFuncStatement(strong, AAPlotOptions, AASpline     *, spline);
AAPropStatementAndFuncStatement(strong, AAPlotOptions, AASeries     *, series);
AAPropStatementAndFuncStatement(strong, AAPlotOptions, AAArea       *, area);
AAPropStatementAndFuncStatement(strong, AAPlotOptions, AAAreaspline *, areaspline);
AAPropStatementAndFuncStatement(strong, AAPlotOptions, NSObject     *, columnrange);
AAPropStatementAndFuncStatement(strong, AAPlotOptions, NSObject     *, arearange);

@end
