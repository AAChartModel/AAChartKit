//
//  AAPlotLinesElement.m
//  AAChartKit
//
//  Created by An An on 17/1/6.
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

#import "AAPlotLinesElement.h"

@implementation AAPlotLinesElement

AAPropSetFuncImplementation(AAPlotLinesElement, NSString *, color);//基线颜色
AAPropSetFuncImplementation(AAPlotLinesElement, NSString *, dashStyle);//基线样式Dash,Dot,Solid,默认Solid
AAPropSetFuncImplementation(AAPlotLinesElement, NSNumber *, width);//基线宽度
AAPropSetFuncImplementation(AAPlotLinesElement, NSNumber *, value);//显示位置
AAPropSetFuncImplementation(AAPlotLinesElement, NSNumber *, zIndex);//层叠，标示线在图表中显示的层叠级别，值越大，显示越向前，默认标示线显示在数据线之后
AAPropSetFuncImplementation(AAPlotLinesElement, NSDictionary *, label);//标示线的文字标签，用来描述标示线

@end
