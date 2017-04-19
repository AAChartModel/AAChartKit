//
//  Subtitle.h
//  AAChartKit
//
//  Created by An An on 17/1/5.
//  Copyright © 2017年 An An. All rights reserved.
//  source code ----*** https://github.com/AAChartModel/AAChartKit ***--- source code
//

#import <Foundation/Foundation.h>
@class AAStyle;
@interface AASubtitle : NSObject
AAPropStatementAndFuncStatement(copy, AASubtitle, NSString *, text);
AAPropStatementAndFuncStatement(copy, AASubtitle, NSString *, align);
AAPropStatementAndFuncStatement(strong, AASubtitle, AAStyle *, style);
@end
