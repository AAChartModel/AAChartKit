//
//  AALegend.h
//  AAChartKit
//
//  Created by An An on 17/1/6.
//  Copyright © 2017年 An An. All rights reserved.
//

#import <Foundation/Foundation.h>
@class AAItemStyle;
@interface AALegend : NSObject
AAPropStatementAndFuncStatement(assign, AALegend, BOOL, enabled);
AAPropStatementAndFuncStatement(copy, AALegend, NSString *, layout);
AAPropStatementAndFuncStatement(copy, AALegend, NSString *, align);
AAPropStatementAndFuncStatement(copy, AALegend, NSString *, verticalAlign);
AAPropStatementAndFuncStatement(strong, AALegend, NSNumber *, borderWidth);
AAPropStatementAndFuncStatement(strong, AALegend, AAItemStyle *, itemStyle);
 @end
