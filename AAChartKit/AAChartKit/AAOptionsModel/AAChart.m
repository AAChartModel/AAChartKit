//
//  AAChart.m
//  AAChartKit
//
//  Created by An An on 17/1/5.
//  Copyright © 2017年 An An. All rights reserved.
//

#import "AAChart.h"
#import "AAOptions3d.h"


@implementation AAChart
-(instancetype)init{
    self = [super init];
    if (self) {
//        self.spacingTop = @0;
//        self.spacingLeft =@0;
//        self.spacingRight = @0;
//        self.spacingBottom = @0;
//        self.marginBottom = @40;
//        self.marginLeft = @0;
//        self.marginRight = @0;
//        self.marginTop = 0;
        
        
     }
    return self;
}
AAPropSetFuncImplementation(AAChart, NSString *, type);
AAPropSetFuncImplementation(AAChart, NSString  *, backgroundColor);
AAPropSetFuncImplementation(AAChart, NSString *, zoomType);
AAPropSetFuncImplementation(AAChart, BOOL , panning);
AAPropSetFuncImplementation(AAChart, NSString *, panKey);
AAPropSetFuncImplementation(AAChart, NSString *, plotBackgroundColor);
AAPropSetFuncImplementation(AAChart, NSNumber *, plotBorderWidth);
AAPropSetFuncImplementation(AAChart, BOOL, plotShadow);
AAPropSetFuncImplementation(AAChart, BOOL , polar);
AAPropSetFuncImplementation(AAChart, AAOptions3d *, options3d);
AAPropSetFuncImplementation(AAChart, BOOL , animation);
AAPropSetFuncImplementation(AAChart, BOOL , inverted);
//AAPropSetFuncImplementation(AAChart, NSArray *, spacing);
AAPropSetFuncImplementation(AAChart, NSNumber *, spacingBottom);
AAPropSetFuncImplementation(AAChart, NSNumber *, spacingLeft);
AAPropSetFuncImplementation(AAChart, NSNumber *, spacingRight);
AAPropSetFuncImplementation(AAChart, NSNumber *, spacingTop);




AAPropSetFuncImplementation(AAChart, NSNumber *, marginBottom);
AAPropSetFuncImplementation(AAChart, NSNumber *, marginLeft);
AAPropSetFuncImplementation(AAChart, NSNumber *, marginRight);
AAPropSetFuncImplementation(AAChart, NSNumber *, marginTop);
@end
