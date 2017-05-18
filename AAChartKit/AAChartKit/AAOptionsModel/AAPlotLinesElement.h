//
//  AAPlotLinesElement.h
//  AAChartKit
//
//  Created by An An on 17/1/6.
//  Copyright © 2017年 An An. All rights reserved.
//  source code ----*** https://github.com/AAChartModel/AAChartKit ***--- source code
//

#import <Foundation/Foundation.h>

@interface AAPlotLinesElement : NSObject
AAPropStatementAndFuncStatement(copy, AAPlotLinesElement, NSString *, color);//基线颜色
AAPropStatementAndFuncStatement(copy, AAPlotLinesElement, NSString *, dashStyle);//基线样式Dash,Dot,Solid,默认Solid
AAPropStatementAndFuncStatement(strong, AAPlotLinesElement, NSNumber *, width);//基线宽度
AAPropStatementAndFuncStatement(strong, AAPlotLinesElement, NSNumber *, value);//显示位置
AAPropStatementAndFuncStatement(strong, AAPlotLinesElement, NSNumber *, zIndex);
AAPropStatementAndFuncStatement(strong, AAPlotLinesElement, NSDictionary *, label);//标示线的文字标签，用来描述标示线
@end
