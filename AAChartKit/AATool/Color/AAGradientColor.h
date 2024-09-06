//
//  AAGradientColor.h
//  AAChartKitDemo
//
//  Created by AnAn on 2024/9/6.
//  Copyright © 2024 An An. All rights reserved.
//

#import <Foundation/Foundation.h>

@class AALinearGradient, AARadialGradient;

@interface AAGradientColor : NSObject

AAPropStatementAndPropSetFuncStatement(strong, AAGradientColor, AALinearGradient *, linearGradient)
AAPropStatementAndPropSetFuncStatement(strong, AAGradientColor, AARadialGradient *, radialGradient)
AAPropStatementAndPropSetFuncStatement(strong, AAGradientColor, NSMutableArray *, stops)

@end


@interface AALinearGradient : NSObject

AAPropStatementAndPropSetFuncStatement(strong, AALinearGradient, NSNumber *, x1)
AAPropStatementAndPropSetFuncStatement(strong, AALinearGradient, NSNumber *, y1)
AAPropStatementAndPropSetFuncStatement(strong, AALinearGradient, NSNumber *, x2)
AAPropStatementAndPropSetFuncStatement(strong, AALinearGradient, NSNumber *, y2)

@end


@interface AARadialGradient : NSObject

AAPropStatementAndPropSetFuncStatement(strong, AARadialGradient, NSNumber *, cx)
AAPropStatementAndPropSetFuncStatement(strong, AARadialGradient, NSNumber *, cy)
AAPropStatementAndPropSetFuncStatement(strong, AARadialGradient, NSNumber *, r)

@end

