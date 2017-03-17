//
//  AAPie.h
//  AAChartKit
//
//  Created by An An on 17/1/9.
//  Copyright © 2017年 An An. All rights reserved.
//

#import <Foundation/Foundation.h>
@class AADataLabels;
@interface AAPie : NSObject
AAPropStatementAndFuncStatement(assign, AAPie, BOOL, allowPointSelect);
AAPropStatementAndFuncStatement(copy, AAPie, NSString *, cursor);
AAPropStatementAndFuncStatement(strong, AAPie, AADataLabels *, dataLabels);
AAPropStatementAndFuncStatement(assign, AAPie, BOOL, showInLegend);
AAPropStatementAndFuncStatement(assign, AAPie, NSNumber *, startAngle);
AAPropStatementAndFuncStatement(assign, AAPie, NSNumber *, endAngle);
AAPropStatementAndFuncStatement(strong, AAPie, NSNumber *, depth);

@end
