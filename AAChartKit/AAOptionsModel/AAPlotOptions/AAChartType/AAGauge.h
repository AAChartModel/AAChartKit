//
//  AAGauge.h
//  AAChartKitDemo
//
//  Created by AnAn on 2024/11/19.
//  Copyright © 2024 An An. All rights reserved.
//

#import <Foundation/Foundation.h>

@class AADataLabels, AADial, AAPivot;

@interface AAGauge : NSObject

AAPropStatementAndPropSetFuncStatement(strong, AAGauge, AADataLabels  *, dataLabels)
AAPropStatementAndPropSetFuncStatement(strong, AAGauge, AADial  *, dial)
AAPropStatementAndPropSetFuncStatement(strong, AAGauge, AAPivot *, pivot)

@end


@interface AADial : NSObject

AAPropStatementAndPropSetFuncStatement(strong, AADial, NSString *, backgroundColor)
AAPropStatementAndPropSetFuncStatement(copy,   AADial, NSString *, baseLength)
AAPropStatementAndPropSetFuncStatement(copy,   AADial, NSNumber *, baseWidth)
AAPropStatementAndPropSetFuncStatement(strong, AADial, NSString *, borderColor)
AAPropStatementAndPropSetFuncStatement(strong, AADial, NSNumber *, borderWidth)
AAPropStatementAndPropSetFuncStatement(copy,   AADial, NSString *, path)
AAPropStatementAndPropSetFuncStatement(copy,   AADial, NSString *, radius)
AAPropStatementAndPropSetFuncStatement(copy,   AADial, NSString *, rearLength)
AAPropStatementAndPropSetFuncStatement(copy,   AADial, NSString *, topWidth)

@end


@interface AAPivot : NSObject

AAPropStatementAndPropSetFuncStatement(strong, AAPivot, NSString *, backgroundColor)
AAPropStatementAndPropSetFuncStatement(strong, AAPivot, NSString *, borderColor)
AAPropStatementAndPropSetFuncStatement(strong, AAPivot, NSNumber *, borderWidth)
AAPropStatementAndPropSetFuncStatement(copy,   AAPivot, NSNumber *, radius)

@end
