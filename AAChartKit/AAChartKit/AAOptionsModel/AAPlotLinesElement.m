//
//  AAPlotLinesElement.m
//  AAChartKit
//
//  Created by An An on 17/1/6.
//  Copyright © 2017年 An An. All rights reserved.
//  source code ----*** https://github.com/AAChartModel/AAChartKit ***--- source code
//

#import "AAPlotLinesElement.h"

@implementation AAPlotLinesElement
AAPropSetFuncImplementation(AAPlotLinesElement, NSString *, color);//基线颜色
AAPropSetFuncImplementation(AAPlotLinesElement, NSString *, dashStyle);//基线样式Dash,Dot,Solid,默认Solid
AAPropSetFuncImplementation(AAPlotLinesElement, NSNumber *, width);//基线宽度
AAPropSetFuncImplementation(AAPlotLinesElement, NSNumber *, value);//显示位置
AAPropSetFuncImplementation(AAPlotLinesElement, NSNumber *, zIndex);
@end
