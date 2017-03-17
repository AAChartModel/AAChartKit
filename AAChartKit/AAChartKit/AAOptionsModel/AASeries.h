//
//  AASeries.h
//  AAChartKit
//
//  Created by An An on 17/1/5.
//  Copyright © 2017年 An An. All rights reserved.
//

#import <Foundation/Foundation.h>
@class AAMarker;
@interface AASeries : NSObject
AAPropStatementAndFuncStatement(strong, AASeries, NSNumber *, borderRadius);
AAPropStatementAndFuncStatement(strong, AASeries, AAMarker *, marker);
AAPropStatementAndFuncStatement(copy, AASeries, NSString *, stacking);
@end
