//
//  AAChart.m
//  AAChartKit
//
//  Created by An An on 17/1/5.
//  Copyright © 2017年 An An. All rights reserved.
//  source code ----*** https://github.com/AAChartModel/AAChartKit ***--- source code
//

/*
 
 * -------------------------------------------------------------------------------
 *
 * ❀❀❀   WARM TIPS!!!   ❀❀❀
 *
 * Please contact me on GitHub,if there are any problems encountered in use.
 * GitHub Issues : https://github.com/AAChartModel/AAChartKit/issues
 * -------------------------------------------------------------------------------
 * And if you want to contribute for this project, please contact me as well
 * GitHub        : https://github.com/AAChartModel
 * StackOverflow : https://stackoverflow.com/users/7842508/codeforu
 * JianShu       : http://www.jianshu.com/u/f1e6753d4254
 * SegmentFault  : https://segmentfault.com/u/huanghunbieguan
 *
 * -------------------------------------------------------------------------------
 
 */

#import "AAChart.h"

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

AAPropSetFuncImplementation(AAChart, NSString    *, type);
AAPropSetFuncImplementation(AAChart, NSString    *, backgroundColor);
AAPropSetFuncImplementation(AAChart, NSString    *, zoomType);
AAPropSetFuncImplementation(AAChart, BOOL ,         panning);
AAPropSetFuncImplementation(AAChart, NSString    *, panKey);
AAPropSetFuncImplementation(AAChart, NSString    *, plotBackgroundColor);
AAPropSetFuncImplementation(AAChart, NSNumber    *, plotBorderWidth);
AAPropSetFuncImplementation(AAChart, BOOL,          plotShadow);
AAPropSetFuncImplementation(AAChart, BOOL ,         polar);
AAPropSetFuncImplementation(AAChart, AAOptions3d *, options3d);
AAPropSetFuncImplementation(AAChart, AAAnimation *, animation);
AAPropSetFuncImplementation(AAChart, BOOL ,         inverted);
//AAPropSetFuncImplementation(AAChart, NSArray  *, spacing);
AAPropSetFuncImplementation(AAChart, NSNumber    *, spacingBottom);
AAPropSetFuncImplementation(AAChart, NSNumber    *, spacingLeft);
AAPropSetFuncImplementation(AAChart, NSNumber    *, spacingRight);
AAPropSetFuncImplementation(AAChart, NSNumber    *, spacingTop);

AAPropSetFuncImplementation(AAChart, NSNumber    *, marginBottom);
AAPropSetFuncImplementation(AAChart, NSNumber    *, marginLeft);
AAPropSetFuncImplementation(AAChart, NSNumber    *, marginRight);
AAPropSetFuncImplementation(AAChart, NSNumber    *, marginTop);
@end
