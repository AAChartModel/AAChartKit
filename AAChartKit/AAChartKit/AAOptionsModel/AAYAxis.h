//
//  AAYAxis.h
//  AAChartKit
//
//  Created by An An on 17/1/5.
//  Copyright © 2017年 An An. All rights reserved.
//gridLineColor

#import <Foundation/Foundation.h>
@class AATitle,AALabels;

@interface AAYAxis : NSObject
AAPropStatementAndFuncStatement(assign, AAYAxis, BOOL,       min);
AAPropStatementAndFuncStatement(strong, AAYAxis, AATitle  *, title);
AAPropStatementAndFuncStatement(strong, AAYAxis, NSArray  *, plotLines);
AAPropStatementAndFuncStatement(assign, AAYAxis, BOOL,       reversed);
AAPropStatementAndFuncStatement(strong, AAYAxis, NSNumber *, gridLineWidth);//y轴网格线宽度
AAPropStatementAndFuncStatement(copy,   AAYAxis, NSString *, gridLineColor);// y 轴网格线颜色
AAPropStatementAndFuncStatement(strong, AAYAxis, AALabels *, labels);//用于设置 y 轴是否显示
AAPropStatementAndFuncStatement(strong, AAYAxis, NSNumber *, lineWidth);//y轴线宽度
AAPropStatementAndFuncStatement(copy,   AAYAxis, NSString *, lineColor);// y 轴线颜色
@end
