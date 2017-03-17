//
//  AALine.m
//  AAChartKit
//
//  Created by An An on 17/1/6.
//  Copyright © 2017年 An An. All rights reserved.
//

#import "AALine.h"
#import "AADataLabels.h"
@implementation AALine
-(instancetype)init{
    self = [super init];
    if (self ) {
//        self.lineWidth = @5;
        
    }
    return self;
}
AAPropSetFuncImplementation(AALine, NSNumber *, lineWidth);
AAPropSetFuncImplementation(AALine, AADataLabels *, dataLabels);
//AAPropSetFuncImplementation(AALine, BOOL , enableMouseTracking);
@end
