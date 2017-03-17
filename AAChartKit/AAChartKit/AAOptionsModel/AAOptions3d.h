//
//  AAOptions3d.h
//  AAChartKit
//
//  Created by An An on 17/1/17.
//  Copyright © 2017年 An An. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface AAOptions3d : NSObject
AAPropStatementAndFuncStatement(assign, AAOptions3d, BOOL, enabled);
AAPropStatementAndFuncStatement(strong, AAOptions3d, NSNumber *, alpha);
AAPropStatementAndFuncStatement(strong, AAOptions3d, NSNumber *, beta);
@end
