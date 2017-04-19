//
//  AATitle.h
//  AAChartKit
//
//  Created by An An on 17/1/5.
//  Copyright © 2017年 An An. All rights reserved.
//  source code ----*** https://github.com/AAChartModel/AAChartKit ***--- source code
//




#import <Foundation/Foundation.h>
@class AAStyle;
@interface AATitle : NSObject
AAPropStatementAndFuncStatement(copy, AATitle, NSString *, text);
AAPropStatementAndFuncStatement(strong, AATitle, AAStyle *, style);

@end
