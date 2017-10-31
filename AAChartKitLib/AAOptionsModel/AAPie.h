//
//  AAPie.h
//  AAChartKit
//
//  Created by An An on 17/1/9.
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

@interface AAPie : NSObject

AAPropStatementAndFuncStatement(assign, AAPie, BOOL,           allowPointSelect);
AAPropStatementAndFuncStatement(copy,   AAPie, NSString     *, cursor);
AAPropStatementAndFuncStatement(strong, AAPie, AADataLabels *, dataLabels);
AAPropStatementAndFuncStatement(assign, AAPie, BOOL,           showInLegend);
AAPropStatementAndFuncStatement(assign, AAPie, NSNumber     *, startAngle);
AAPropStatementAndFuncStatement(assign, AAPie, NSNumber     *, endAngle);
AAPropStatementAndFuncStatement(strong, AAPie, NSNumber     *, depth);

@end
