//
//  AAStates.h
//  AAChartKitDemo
//
//  Created by AnAn on 2020/1/6.
//  Copyright © 2020 An An. All rights reserved.
//

#import <Foundation/Foundation.h>

@class AAHover, AASelect, AAHalo, AAInactive, AASVGAttributes;

@interface AAStates : NSObject

AAPropStatementAndPropSetFuncStatement(strong, AAStates, AAHover    *, hover)
AAPropStatementAndPropSetFuncStatement(strong, AAStates, AASelect   *, select)
AAPropStatementAndPropSetFuncStatement(strong, AAStates, AAInactive *, inactive)


@end


@interface AAHover : NSObject

AAPropStatementAndPropSetFuncStatement(assign, AAHover, BOOL,       enabled)
AAPropStatementAndPropSetFuncStatement(strong, AAHover, NSString *, borderColor)
AAPropStatementAndPropSetFuncStatement(strong, AAHover, NSNumber *, brightness)
AAPropStatementAndPropSetFuncStatement(strong, AAHover, NSString *, color)
AAPropStatementAndPropSetFuncStatement(strong, AAHover, AAHalo   *, halo)
AAPropStatementAndPropSetFuncStatement(strong, AAHover, NSNumber *, lineWidth)
AAPropStatementAndPropSetFuncStatement(strong, AAHover, NSNumber *, lineWidthPlus)

@end


@interface AASelect : NSObject

AAPropStatementAndPropSetFuncStatement(assign, AASelect, BOOL,       enabled)
AAPropStatementAndPropSetFuncStatement(strong, AASelect, NSString *, borderColor)
AAPropStatementAndPropSetFuncStatement(strong, AASelect, NSString *, color)
AAPropStatementAndPropSetFuncStatement(strong, AASelect, AAHalo   *, halo)

@end


@interface AAHalo : NSObject

//AAPropStatementAndPropSetFuncStatement(strong, AAHalo, NSDictionary *, attributes)
AAPropStatementAndPropSetFuncStatement(strong, AAHalo, NSNumber *, opacity) //Opacity for the halo unless a specific fill is overridden using the attributes setting. Note that Highcharts is only able to apply opacity to colors of hex or rgb(a) formats. Default Value：0.25.
AAPropStatementAndPropSetFuncStatement(strong, AAHalo, NSNumber *, size)

@property (nonatomic, strong) NSDictionary  *attributes; //A collection of SVG attributes to override the appearance of the halo, for example fill, stroke and stroke-width.
- (AAHalo * (^) (AASVGAttributes *attributes)) attributesSet;

@end


@interface AAInactive : NSObject

AAPropStatementAndPropSetFuncStatement(assign, AAInactive, BOOL,       enabled)
AAPropStatementAndPropSetFuncStatement(strong, AAInactive, NSNumber *, opacity)

@end


@interface AASVGAttributes: NSObject

AAPropStatementAndPropSetFuncStatement(copy,   AASVGAttributes, NSString *, fill)
AAPropStatementAndPropSetFuncStatement(copy,   AASVGAttributes, NSString *, stroke)
AAPropStatementAndPropSetFuncStatement(strong, AASVGAttributes, NSNumber *, strokeWidth)

- (NSDictionary *)toDic;

@end



