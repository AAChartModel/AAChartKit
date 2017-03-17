//
//  AAStyle.h
//  AAChartKit
//
//  Created by An An on 17/1/6.
//  Copyright © 2017年 An An. All rights reserved.
//


#import <Foundation/Foundation.h>

@interface AAStyle : NSObject
AAPropStatementAndFuncStatement(copy, AAStyle, NSString *, color);
AAPropStatementAndFuncStatement(copy, AAStyle, NSString *, fontSize);
AAPropStatementAndFuncStatement(copy, AAStyle, NSString *, fontWeight);
AAPropStatementAndFuncStatement(copy, AAStyle, NSString *, textOutline);

@end
