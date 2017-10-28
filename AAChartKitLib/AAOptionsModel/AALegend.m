//
//  AALegend.m
//  AAChartKit
//
//  Created by An An on 17/1/6.
//  Copyright © 2017年 An An. All rights reserved.
//  source code ----*** https://github.com/AAChartModel/AAChartKit ***--- source code
//

#import "AALegend.h"

@implementation AALegend

AAPropSetFuncImplementation(AALegend, AALegendLayoutType,        layout);
AAPropSetFuncImplementation(AALegend, AALegendAlignType,         align);
AAPropSetFuncImplementation(AALegend, AALegendVerticalAlignType, verticalAlign);
AAPropSetFuncImplementation(AALegend, BOOL,          enabled);
AAPropSetFuncImplementation(AALegend, NSNumber    *, borderWidth);
AAPropSetFuncImplementation(AALegend, AAItemStyle *, itemStyle);

@end
