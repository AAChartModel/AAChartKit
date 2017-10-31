//
//  AATitle.h
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

@class AAStyle;
typedef NSString * AAChartTitleVerticalAlignType;
static AAChartTitleVerticalAlignType const AAChartTitleVerticalAlignTypeTop    = @"top";
static AAChartTitleVerticalAlignType const AAChartTitleVerticalAlignTypeMiddle = @"middle";
static AAChartTitleVerticalAlignType const AAChartTitleVerticalAlignTypeBottom = @"bottom";

@interface AATitle : NSObject

AAPropStatementAndFuncStatement(copy,   AATitle, NSString *, text);
AAPropStatementAndFuncStatement(strong, AATitle, AAStyle  *, style);
AAPropStatementAndFuncStatement(copy,   AATitle, AAChartTitleVerticalAlignType, verticalAlign);
AAPropStatementAndFuncStatement(strong, AATitle, NSNumber *, y);

@end
