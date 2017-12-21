//
//  AAColumn.h
//  AAChartKit
//
//  Created by An An on 17/1/5.
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

#import <Foundation/Foundation.h>

@class AADataLabels;

@interface AAColumn : NSObject

AAPropStatementAndFuncStatement(strong, AAColumn, NSNumber *,     pointPadding);
AAPropStatementAndFuncStatement(strong, AAColumn, NSNumber *,     groupPadding);
AAPropStatementAndFuncStatement(strong, AAColumn, NSNumber *,     borderWidth);
AAPropStatementAndFuncStatement(assign, AAColumn, BOOL,           colorByPoint);//对每个不同的点设置颜色(当图表类型为 AAColumn 时,设置为 AAColumn 对象的属性,当图表类型为 bar 时,应该设置为 bar 对象的属性才有效)
AAPropStatementAndFuncStatement(strong, AAColumn, AADataLabels *, dataLabels);
AAPropStatementAndFuncStatement(copy,   AAColumn, NSString *,     stacking);
AAPropStatementAndFuncStatement(strong, AAColumn, NSNumber *,     borderRadius);

@end
