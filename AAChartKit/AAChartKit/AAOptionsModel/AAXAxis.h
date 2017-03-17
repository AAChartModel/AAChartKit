//
//  AAXAxis.h
//  AAChartKit
//
//  Created by An An on 17/1/5.
//  Copyright © 2017年 An An. All rights reserved.
//
                                                                         \


#import <Foundation/Foundation.h>
@class AALabels;
@interface AAXAxis : NSObject
AAPropStatementAndFuncStatement(strong, AAXAxis, id, categories);
AAPropStatementAndFuncStatement(assign, AAXAxis, BOOL, reversed);
AAPropStatementAndFuncStatement(strong, AAXAxis, NSNumber *, gridLineWidth);//x轴网格线宽度
AAPropStatementAndFuncStatement(copy, AAXAxis, NSString  *, gridLineColor);// x轴网格线颜色
AAPropStatementAndFuncStatement(strong, AAXAxis, AALabels *, labels);//用于设置 x 轴是否显示
//lineWidth :0,
//tickWidth:0,
//labels:{
//enabled:false
//}
@end
