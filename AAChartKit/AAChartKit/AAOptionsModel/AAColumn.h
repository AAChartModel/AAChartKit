//
//  AAColumn.h
//  AAChartKit
//
//  Created by An An on 17/1/5.
//  Copyright © 2017年 An An. All rights reserved.
//

#import <Foundation/Foundation.h>
@class AADataLabels;
@interface AAColumn : NSObject
AAPropStatementAndFuncStatement(strong, AAColumn, NSNumber *, pointPadding);
AAPropStatementAndFuncStatement(strong, AAColumn, NSNumber *, borderWidth);
AAPropStatementAndFuncStatement(assign, AAColumn, BOOL, colorByPoint);//对每个不同的点设置颜色(当图表类型为 AAColumn 时,设置为 AAColumn 对象的属性,当图表类型为 bar 时,应该设置为 bar 对象的属性才有效)
AAPropStatementAndFuncStatement(strong, AAColumn, AADataLabels *, dataLabels);
AAPropStatementAndFuncStatement(copy, AAColumn, NSString *, stacking);

@end
