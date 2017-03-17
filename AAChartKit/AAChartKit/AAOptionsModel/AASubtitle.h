//
//  Subtitle.h
//  AAChartKit
//
//  Created by An An on 17/1/5.
//  Copyright © 2017年 An An. All rights reserved.
//

#import <Foundation/Foundation.h>
@class AAStyle;
@interface AASubtitle : NSObject
AAPropStatementAndFuncStatement(copy, AASubtitle, NSString *, text);
AAPropStatementAndFuncStatement(strong, AASubtitle, AAStyle *, style);
@end
