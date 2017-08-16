//
//  AASeries.h
//  AAChartKit
//
//  Created by An An on 17/1/5.
//  Copyright © 2017年 An An. All rights reserved.
//  source code ----*** https://github.com/AAChartModel/AAChartKit ***--- source code
//

#import <Foundation/Foundation.h>

@class AAMarker,AAAnimation;

@interface AASeries : NSObject

AAPropStatementAndFuncStatement(strong, AASeries, NSNumber *, borderRadius);
AAPropStatementAndFuncStatement(strong, AASeries, AAMarker *, marker);
AAPropStatementAndFuncStatement(copy,   AASeries, NSString *, stacking);
AAPropStatementAndFuncStatement(strong, AASeries, AAAnimation *, animation);
//plotOptions.series.connectNulls
//https://www.zhihu.com/question/24173311
AAPropStatementAndFuncStatement(assign, AASeries, BOOL , connectNulls);//设置折线是否断点重连

@end
