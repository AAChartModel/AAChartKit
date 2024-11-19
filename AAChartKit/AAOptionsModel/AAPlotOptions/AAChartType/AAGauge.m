//
//  AAGauge.m
//  AAChartKitDemo
//
//  Created by AnAn on 2024/11/19.
//  Copyright © 2024 An An. All rights reserved.
//

#import "AAGauge.h"

/**
 @interface AAGauge : NSObject


 AAPropStatementAndPropSetFuncStatement(strong, AAGauge, AADial *, dial)
 AAPropStatementAndPropSetFuncStatement(strong, AAGauge, AAPivot *, pivot)

 @end


 @interface AADial : NSObject

 AAPropStatementAndPropSetFuncStatement(copy, AADial, NSString *, backgroundColor)
 AAPropStatementAndPropSetFuncStatement(copy, AADial, NSString *, baseLength)
 AAPropStatementAndPropSetFuncStatement(copy, AADial, NSString *, baseWidth)
 AAPropStatementAndPropSetFuncStatement(copy, AADial, NSString *, borderColor)
 AAPropStatementAndPropSetFuncStatement(copy, AADial, NSNumber *, borderWidth)
 AAPropStatementAndPropSetFuncStatement(copy, AADial, NSString *, path)
 AAPropStatementAndPropSetFuncStatement(copy, AADial, NSString *, radius)
 AAPropStatementAndPropSetFuncStatement(copy, AADial, NSString *, rearLength)
 AAPropStatementAndPropSetFuncStatement(copy, AADial, NSString *, topWidth)

 @end


 @interface AAPivot : NSObject

 AAPropStatementAndPropSetFuncStatement(copy, AAPivot, NSString *, backgroundColor)
 AAPropStatementAndPropSetFuncStatement(copy, AAPivot, NSString *, borderColor)
 AAPropStatementAndPropSetFuncStatement(copy, AAPivot, NSNumber *, borderWidth)
 AAPropStatementAndPropSetFuncStatement(copy, AAPivot, NSString *, radius)

 @end
 */
@implementation AAGauge

AAPropSetFuncImplementation(AAGauge, AADial  *, dial)
AAPropSetFuncImplementation(AAGauge, AAPivot *, pivot)

@end


@implementation AADial

AAPropSetFuncImplementation(AADial, NSString *, backgroundColor)
AAPropSetFuncImplementation(AADial, NSString *, baseLength)
AAPropSetFuncImplementation(AADial, NSString *, baseWidth)
AAPropSetFuncImplementation(AADial, NSString *, borderColor)
AAPropSetFuncImplementation(AADial, NSNumber *, borderWidth)
AAPropSetFuncImplementation(AADial, NSString *, path)
AAPropSetFuncImplementation(AADial, NSString *, radius)
AAPropSetFuncImplementation(AADial, NSString *, rearLength)
AAPropSetFuncImplementation(AADial, NSString *, topWidth)

@end


@implementation AAPivot

AAPropSetFuncImplementation(AAPivot, NSString *, backgroundColor)
AAPropSetFuncImplementation(AAPivot, NSString *, borderColor)
AAPropSetFuncImplementation(AAPivot, NSNumber *, borderWidth)
AAPropSetFuncImplementation(AAPivot, NSString *, radius)

@end
