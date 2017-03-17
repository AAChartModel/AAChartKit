//
//  AALine.h
//  AAChartKit
//
//  Created by An An on 17/1/6.
//  Copyright © 2017年 An An. All rights reserved.
//

#import <Foundation/Foundation.h>
@class AADataLabels;
@interface AALine : NSObject
AAPropStatementAndFuncStatement(strong, AALine, NSNumber *, lineWidth);//设置折线的宽度
AAPropStatementAndFuncStatement(strong, AALine, AADataLabels *, dataLabels);
//AAPropStatementAndFuncStatement(assign, AALine, BOOL, enableMouseTracking);
@end
