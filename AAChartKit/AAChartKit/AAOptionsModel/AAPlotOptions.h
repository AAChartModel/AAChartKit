//
//  AAPlotOptions.h
//  AAChartKit
//
//  Created by An An on 17/1/5.
//  Copyright © 2017年 An An. All rights reserved.
//

#import <Foundation/Foundation.h>
@class AAColumn,AABar,AALine,AASpline,AAArea,AAAreaspline,AAPie,AASeries;

@interface AAPlotOptions : NSObject
AAPropStatementAndFuncStatement(strong, AAPlotOptions, AAColumn *, column);
AAPropStatementAndFuncStatement(strong, AAPlotOptions, AALine *, line);
AAPropStatementAndFuncStatement(strong, AAPlotOptions, AAPie *, pie);
AAPropStatementAndFuncStatement(strong, AAPlotOptions, AABar *, bar);
AAPropStatementAndFuncStatement(strong, AAPlotOptions, AASpline *, spline);
AAPropStatementAndFuncStatement(strong, AAPlotOptions, AASeries *, series);
AAPropStatementAndFuncStatement(strong, AAPlotOptions, AAArea *, area);
AAPropStatementAndFuncStatement(strong, AAPlotOptions, AAAreaspline *, areaspline);

@end
