//
//  AATooltip.m
//  AAChartKit
//
//  Created by An An on 17/1/5.
//  Copyright © 2017年 An An. All rights reserved.
//

#import "AATooltip.h"

@implementation AATooltip
AAPropSetFuncImplementation(AATooltip, NSString *, headerFormat);
AAPropSetFuncImplementation(AATooltip, NSString *, pointFormat);
AAPropSetFuncImplementation(AATooltip, NSString *, footerFormat);
AAPropSetFuncImplementation(AATooltip, BOOL , shared);
AAPropSetFuncImplementation(AATooltip, BOOL,  crosshairs);
//AAPropSetFuncImplementation(AATooltip, BOOL , useHTML);
AAPropSetFuncImplementation(AATooltip, NSString *, valueSuffix);
@end
