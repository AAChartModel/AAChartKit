//
//  AAPlotOptions.m
//  AAChartKit
//
//  Created by An An on 17/1/5.
//  Copyright © 2017年 An An. All rights reserved.
//

#import "AAPlotOptions.h"
#import "AAColumn.h"
#import "AALine.h"
#import "AAPie.h"
#import "AABar.h"
#import "AASpline.h"
#import "AAArea.h"
#import "AAAreaspline.h"
#import "AASeries.h"
@implementation AAPlotOptions
AAPropSetFuncImplementation(AAPlotOptions, AAColumn *, column);
AAPropSetFuncImplementation(AAPlotOptions, AALine *, line);
AAPropSetFuncImplementation(AAPlotOptions, AAPie *, pie);
AAPropSetFuncImplementation(AAPlotOptions, AABar *, bar);
AAPropSetFuncImplementation(AAPlotOptions, AASpline *, spline);
AAPropSetFuncImplementation(AAPlotOptions, AASeries *, series);
AAPropSetFuncImplementation(AAPlotOptions, AAArea *, area);
AAPropSetFuncImplementation(AAPlotOptions, AAAreaspline *, areaspline);

@end
