//
//  AASeriesElement.m
//  AAChartKit
//
//  Created by An An on 17/1/19.
//  Copyright © 2017年 An An. xAll rights reserved.
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


#import "AASeriesElement.h"

@implementation AASeriesElement

AAPropSetFuncImplementation(AASeriesElement, NSNumber *, borderRadius);
AAPropSetFuncImplementation(AASeriesElement, NSString *, type);
AAPropSetFuncImplementation(AASeriesElement, NSString *, name);
AAPropSetFuncImplementation(AASeriesElement, NSArray  *, data);
AAPropSetFuncImplementation(AASeriesElement, NSString *, innerSize);
AAPropSetFuncImplementation(AASeriesElement, AAMarker *, marker);
AAPropSetFuncImplementation(AASeriesElement, NSString *, stacking);

@end
