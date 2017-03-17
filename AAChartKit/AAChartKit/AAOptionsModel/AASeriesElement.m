//
//  AASeriesElement.m
//  AAChartKit
//
//  Created by An An on 17/1/19.
//  Copyright © 2017年 An An. xAll rights reserved.
//

#import "AASeriesElement.h"
#import "AAMarker.h"

@implementation AASeriesElement
AAPropSetFuncImplementation(AASeriesElement, NSNumber *, borderRadius);
AAPropSetFuncImplementation(AASeriesElement, NSString *, name);
AAPropSetFuncImplementation(AASeriesElement, NSArray  *,data);
AAPropSetFuncImplementation(AASeriesElement, AAMarker *, marker);
AAPropSetFuncImplementation(AASeriesElement, NSString *, stacking);
@end
