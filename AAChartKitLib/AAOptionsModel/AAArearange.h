//
//  AAArearange.h
//  AAChartKit
//
//  Created by AnAn on 2023/11/25.
//  Copyright © 2023 An An. All rights reserved.
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

#import <Foundation/Foundation.h>

@class AAStates;
////                        .arearangeSet(AAArearange.new
////                                      .enableMouseTrackingSet(@NO)
////                                      .statesSet(AAStates.new
////                                                 .inactiveSet(AAInactive.new.enabledSet(@NO)))
//////                                      .colorSet(AAColor.redColor)
////                                      .fillOpacitySet(@(1 / 3.0))
////                                      .lineWidthSet(@0))
NS_ASSUME_NONNULL_BEGIN

@interface AAArearange : NSObject

AAPropStatementAndPropSetFuncStatement(strong, AAArearange, NSNumber *, enableMouseTracking)
AAPropStatementAndPropSetFuncStatement(strong, AAArearange, AAStates *, states)
AAPropStatementAndPropSetFuncStatement(strong, AAArearange, NSString *, color)
AAPropStatementAndPropSetFuncStatement(strong, AAArearange, NSNumber *, fillOpacity)
AAPropStatementAndPropSetFuncStatement(strong, AAArearange, NSNumber *, lineWidth)

@end

NS_ASSUME_NONNULL_END
