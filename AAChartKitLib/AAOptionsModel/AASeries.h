//
//  AASeries.h
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

#import <Foundation/Foundation.h>

@class AAMarker,AAAnimation;

@interface AASeries : NSObject

AAPropStatementAndFuncStatement(strong, AASeries, NSNumber     *, borderRadius);
AAPropStatementAndFuncStatement(strong, AASeries, AAMarker     *, marker);
AAPropStatementAndFuncStatement(copy,   AASeries, NSString     *, stacking);
AAPropStatementAndFuncStatement(strong, AASeries, AAAnimation  *, animation);
//colorByPoint 决定了图表是否给每个数据列或每个点分配一个颜色，默认值是 false， 即默认是给每个数据类分配颜色，
//AAPropStatementAndFuncStatement(assign, AASeries, BOOL , colorByPoint);//设置为 true 则是给每个点分配颜色。
//plotOptions.series.connectNulls
//https://www.zhihu.com/question/24173311
AAPropStatementAndFuncStatement(assign, AASeries, BOOL ,          connectNulls);//设置折线是否断点重连
AAPropStatementAndFuncStatement(strong, AASeries, NSDictionary *, events);

@end
