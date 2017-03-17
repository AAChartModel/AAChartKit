//
//  AABar.h
//  AAChartKit
//
//  Created by An An on 17/1/19.
//  Copyright © 2017年 An An. All rights reserved.
//

#import <Foundation/Foundation.h>
@class AADataLabels;
@interface AABar : NSObject
AAPropStatementAndFuncStatement(strong, AABar, NSNumber *, pointPadding);
AAPropStatementAndFuncStatement(strong, AABar, NSNumber *, borderWidth);
AAPropStatementAndFuncStatement(assign, AABar, BOOL, colorByPoint);//对每个不同的点设置颜色(当图表类型为 column 时,设置为 column 对象的属性,当图表类型为 bar 时,应该设置为 bar 对象的属性才有效)
AAPropStatementAndFuncStatement(strong, AABar, AADataLabels *, dataLabels);
@end
