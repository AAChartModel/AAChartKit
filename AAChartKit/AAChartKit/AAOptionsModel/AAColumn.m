//
//  AAColumn.m
//  AAChartKit
//
//  Created by An An on 17/1/5.
//  Copyright © 2017年 An An. All rights reserved.
//

#import "AAColumn.h"
#import "AADataLabels.h"
@implementation AAColumn
AAPropSetFuncImplementation(AAColumn, NSNumber *, pointPadding);
AAPropSetFuncImplementation(AAColumn, NSNumber *, borderWidth);
AAPropSetFuncImplementation(AAColumn, BOOL , colorByPoint);
AAPropSetFuncImplementation(AAColumn, AADataLabels *, dataLabels);
AAPropSetFuncImplementation(AAColumn, NSString *, stacking);

@end
