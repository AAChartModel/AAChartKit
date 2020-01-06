//
//  AAStates.h
//  AAChartKitDemo
//
//  Created by AnAn on 2020/1/6.
//  Copyright © 2020 Danny boy. All rights reserved.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@class AAHover, AASelect;

@interface AAStates : NSObject

AAPropStatementAndPropSetFuncStatement(strong, AAStates, AAHover *, hover)
AAPropStatementAndPropSetFuncStatement(strong, AAStates, AASelect *, select)

@end


@interface AAHover : NSObject

AAPropStatementAndPropSetFuncStatement(copy,   AAHover, NSString *, borderColor)
AAPropStatementAndPropSetFuncStatement(strong, AAHover, NSNumber *, brightness)
AAPropStatementAndPropSetFuncStatement(copy,   AAHover, NSString *, color)

@end


@interface AASelect : NSObject

AAPropStatementAndPropSetFuncStatement(copy,   AASelect, NSString *, borderColor)
AAPropStatementAndPropSetFuncStatement(copy,   AASelect, NSString *, color)

@end

NS_ASSUME_NONNULL_END


