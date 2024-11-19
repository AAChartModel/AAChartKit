//
//  AAGauge.h
//  AAChartKitDemo
//
//  Created by AnAn on 2024/11/19.
//  Copyright © 2024 An An. All rights reserved.
//

#import <Foundation/Foundation.h>

@class AADataLabels, AADial, AAPivot;

NS_ASSUME_NONNULL_BEGIN

@interface AAGauge : NSObject

/**
 dial:{
 backgroundColor:#000000
 baseLength:70%
 baseWidth:3
 borderColor:#cccccc
 borderWidth:0
 path:undefined
 radius:80%
 rearLength:10%
 topWidth:1
 }
 
 pivot:{
 backgroundColor:#000000
 borderColor:#cccccc
 borderWidth:0
 radius:5
 }
 */
AAPropStatementAndPropSetFuncStatement(strong, AAGauge, AADataLabels  *, dataLabels)
AAPropStatementAndPropSetFuncStatement(strong, AAGauge, AADial  *, dial)
AAPropStatementAndPropSetFuncStatement(strong, AAGauge, AAPivot *, pivot)

@end


@interface AADial : NSObject

AAPropStatementAndPropSetFuncStatement(copy,   AADial, NSString *, backgroundColor)
AAPropStatementAndPropSetFuncStatement(copy,   AADial, NSString *, baseLength)
AAPropStatementAndPropSetFuncStatement(copy,   AADial, NSNumber *, baseWidth)
AAPropStatementAndPropSetFuncStatement(copy,   AADial, NSString *, borderColor)
AAPropStatementAndPropSetFuncStatement(strong, AADial, NSNumber *, borderWidth)
AAPropStatementAndPropSetFuncStatement(copy,   AADial, NSString *, path)
AAPropStatementAndPropSetFuncStatement(copy,   AADial, NSString *, radius)
AAPropStatementAndPropSetFuncStatement(copy,   AADial, NSString *, rearLength)
AAPropStatementAndPropSetFuncStatement(copy,   AADial, NSString *, topWidth)

@end


@interface AAPivot : NSObject

AAPropStatementAndPropSetFuncStatement(copy,   AAPivot, NSString *, backgroundColor)
AAPropStatementAndPropSetFuncStatement(copy,   AAPivot, NSString *, borderColor)
AAPropStatementAndPropSetFuncStatement(strong, AAPivot, NSNumber *, borderWidth)
AAPropStatementAndPropSetFuncStatement(copy,   AAPivot, NSNumber *, radius)

@end

NS_ASSUME_NONNULL_END
