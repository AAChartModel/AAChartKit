//
//  AASeries.m
//  AAChartKit
//
//  Created by An An on 17/1/19.
//  Copyright © 2017年 An An. All rights reserved.
//  source code ----*** https://github.com/AAChartModel/AAChartKit ***--- source code
//

#import "AASeries.h"
#import "AAMarker.h"
#import "AAAnimation.h"


@implementation AASeries
AAPropSetFuncImplementation(AASeries, NSNumber *, borderRadius);
AAPropSetFuncImplementation(AASeries, AAMarker *, marker);
AAPropSetFuncImplementation(AASeries, NSString *, stacking);
AAPropSetFuncImplementation(AASeries,  AAAnimation*, animation);

@end
