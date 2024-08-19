//
//  AADataLabels.m
//  AAChartKit
//
//  Created by An An on 17/1/6.
//  Copyright © 2017年 An An. All rights reserved.
//*************** ...... SOURCE CODE ...... ***************
//***...................................................***
//*** https://github.com/AAChartModel/AAChartKit        ***
//*** https://github.com/AAChartModel/AAChartKit-Swift  ***
//***...................................................***
//*************** ...... SOURCE CODE ...... ***************

/*
 
 * -------------------------------------------------------------------------------
 *
 * 🌕 🌖 🌗 🌘  ❀❀❀   WARM TIPS!!!   ❀❀❀ 🌑 🌒 🌓 🌔
 *
 * Please contact me on GitHub,if there are any problems encountered in use.
 * GitHub Issues : https://github.com/AAChartModel/AAChartKit/issues
 * -------------------------------------------------------------------------------
 * And if you want to contribute for this project, please contact me as well
 * GitHub        : https://github.com/AAChartModel
 * StackOverflow : https://stackoverflow.com/users/12302132/codeforu
 * JianShu       : https://www.jianshu.com/u/f1e6753d4254
 * SegmentFault  : https://segmentfault.com/u/huanghunbieguan
 *
 * -------------------------------------------------------------------------------
 
 */

#import "AADataLabels.h"
#import "NSString+toPureJSString.h"

AAChartDataLabelsShapeType const AAChartDataLabelsShapeTypeSquare   = @"square";
AAChartDataLabelsShapeType const AAChartDataLabelsShapeTypeCallout  = @"callout";
AAChartDataLabelsShapeType const AAChartDataLabelsShapeTypeCircle   = @"circle";
AAChartDataLabelsShapeType const AAChartDataLabelsShapeTypeDiamond  = @"diamond";
AAChartDataLabelsShapeType const AAChartDataLabelsShapeTypeTriangle = @"triangle";

AAChartDataLabelsOverflowType const AAChartDataLabelsOverflowTypeNone    = @"none";
AAChartDataLabelsOverflowType const AAChartDataLabelsOverflowTypeAllow   = @"allow";
AAChartDataLabelsOverflowType const AAChartDataLabelsOverflowTypeJustify = @"justify";

@implementation AADataLabels

- (instancetype)init {
    self = [super init];
    if (self) {
        _enabled = true;
        _softConnector = true;
    }
    return self;
}

AAPropSetFuncImplementation(AADataLabels, BOOL      , enabled)
AAPropSetFuncImplementation(AADataLabels, NSString *, align)
AAPropSetFuncImplementation(AADataLabels, AAStyle  *, style) 
AAPropSetFuncImplementation(AADataLabels, NSString *, format)
//AAPropSetFuncImplementation(AADataLabels, NSString *, formatter)
AAPropSetFuncImplementation(AADataLabels, NSNumber *, rotation) 
AAPropSetFuncImplementation(AADataLabels, BOOL      , allowOverlap) 
AAPropSetFuncImplementation(AADataLabels, BOOL      , useHTML) 
AAPropSetFuncImplementation(AADataLabels, NSNumber *, distance)
AAPropSetFuncImplementation(AADataLabels, NSString *, verticalAlign)
AAPropSetFuncImplementation(AADataLabels, NSNumber *, x) 
AAPropSetFuncImplementation(AADataLabels, NSNumber *, y)
AAPropSetFuncImplementation(AADataLabels, NSString *, color)
AAPropSetFuncImplementation(AADataLabels, NSString *, backgroundColor)
AAPropSetFuncImplementation(AADataLabels, NSString *, borderColor)
AAPropSetFuncImplementation(AADataLabels, NSNumber *, borderRadius)
AAPropSetFuncImplementation(AADataLabels, NSNumber *, borderWidth)
AAPropSetFuncImplementation(AADataLabels, AAChartDataLabelsShapeType, shape)
AAPropSetFuncImplementation(AADataLabels, BOOL      , crop)
AAPropSetFuncImplementation(AADataLabels, BOOL      , inside)
AAPropSetFuncImplementation(AADataLabels, AAChartDataLabelsOverflowType, overflow)
AAPropSetFuncImplementation(AADataLabels, BOOL      , softConnector)//Whether to render the connector as a soft arc or a line with sharp break. Only useful for pie, pyramid and funnel chart
AAPropSetFuncImplementation(AADataLabels, NSDictionary *, textPath)
AAPropSetFuncImplementation(AADataLabels, NSDictionary *, filter);
AAPropSetFuncImplementation(AADataLabels, NSString *, connectorColor)
AAPropSetFuncImplementation(AADataLabels, NSNumber *, connectorPadding)
AAPropSetFuncImplementation(AADataLabels, NSString *, connectorShape)
AAPropSetFuncImplementation(AADataLabels, NSNumber *, connectorWidth)
AAPropSetFuncImplementation(AADataLabels, NSString *, crookDistance)
AAPropSetFuncImplementation(AADataLabels, NSString *, alignTo)

AAJSFuncTypePropSetFuncImplementation(AADataLabels, NSString *, formatter)

- (void)setFormatter:(NSString *)formatter {
    _formatter = [formatter aa_toPureJSString];
}


@end
