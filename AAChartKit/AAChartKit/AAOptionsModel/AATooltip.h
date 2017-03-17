//
//  AATooltip.h
//  AAChartKit
//
//  Created by An An on 17/1/5.
//  Copyright © 2017年 An An. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface AATooltip : NSObject
AAPropStatementAndFuncStatement(copy, AATooltip, NSString *, headerFormat);
AAPropStatementAndFuncStatement(copy, AATooltip, NSString *, pointFormat);
AAPropStatementAndFuncStatement(copy, AATooltip, NSString *, footerFormat);
AAPropStatementAndFuncStatement(assign, AATooltip, BOOL, shared);
AAPropStatementAndFuncStatement(assign, AATooltip, BOOL, crosshairs);

//AAPropStatementAndFuncStatement(assign, AATooltip, BOOL, useHTML);
AAPropStatementAndFuncStatement(copy, AATooltip, NSString *, valueSuffix);
@end
