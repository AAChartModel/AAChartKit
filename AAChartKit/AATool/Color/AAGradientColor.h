//
//  AAGradientColor.h
//  AAChartKitDemo
//
//  Created by AnAn on 2024/9/6.
//  Copyright © 2024 An An. All rights reserved.
//

#import <Foundation/Foundation.h>

@class AALinearGradient, AARadialGradient;

//https://api.highcharts.com/class-reference/Highcharts.GradientColorObject
@interface AAGradientColor : NSObject

AAPropStatementAndPropSetFuncStatement(strong, AAGradientColor, AALinearGradient *, linearGradient)
AAPropStatementAndPropSetFuncStatement(strong, AAGradientColor, AARadialGradient *, radialGradient)
AAPropStatementAndPropSetFuncStatement(strong, AAGradientColor, NSArray *, stops)

@end


@interface AALinearGradient : NSObject

AAPropStatementAndPropSetFuncStatement(strong, AALinearGradient, NSNumber *, x1)
AAPropStatementAndPropSetFuncStatement(strong, AALinearGradient, NSNumber *, y1)
AAPropStatementAndPropSetFuncStatement(strong, AALinearGradient, NSNumber *, x2)
AAPropStatementAndPropSetFuncStatement(strong, AALinearGradient, NSNumber *, y2)

//初始化方法
+ (AALinearGradient *)linearGradientWithX1:(NSNumber *)x1
                                        y1:(NSNumber *)y1
                                        x2:(NSNumber *)x2
                                        y2:(NSNumber *)y2;

@end


@interface AARadialGradient : NSObject

AAPropStatementAndPropSetFuncStatement(strong, AARadialGradient, NSNumber *, cx)
AAPropStatementAndPropSetFuncStatement(strong, AARadialGradient, NSNumber *, cy)
AAPropStatementAndPropSetFuncStatement(strong, AARadialGradient, NSNumber *, r)

//初始化方法
+ (AARadialGradient *)radialGradientWithCx:(NSNumber *)cx
                                        cy:(NSNumber *)cy
                                         r:(NSNumber *)r;

@end

