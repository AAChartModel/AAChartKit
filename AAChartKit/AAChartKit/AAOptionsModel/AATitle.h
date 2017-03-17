//
//  AATitle.h
//  AAChartKit
//
//  Created by An An on 17/1/5.
//  Copyright © 2017年 An An. All rights reserved.
//




#import <Foundation/Foundation.h>
@class AAStyle;
@interface AATitle : NSObject
AAPropStatementAndFuncStatement(copy, AATitle, NSString *, text);
AAPropStatementAndFuncStatement(strong, AATitle, AAStyle *, style);

@end
