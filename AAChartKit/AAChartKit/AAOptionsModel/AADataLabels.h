//
//  AADataLabels.h
//  AAChartKit
//
//  Created by An An on 17/1/6.
//  Copyright © 2017年 An An. All rights reserved.
//

#import <Foundation/Foundation.h>
@class AAStyle;
@interface AADataLabels : NSObject
AAPropStatementAndFuncStatement(assign, AADataLabels, BOOL , enabled);
AAPropStatementAndFuncStatement(strong, AADataLabels, AAStyle *, style);
@end
