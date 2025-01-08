//
//  AABar.h
//  AAChartKit
//
//  Created by An An on 17/1/19.
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

#import <Foundation/Foundation.h>

@class AADataLabels;

@interface AABar : NSObject

AAPropStatementAndPropSetFuncStatement(copy,   AABar, NSString *,     name)
AAPropStatementAndPropSetFuncStatement(strong, AABar, NSArray  *,     data)
AAPropStatementAndPropSetFuncStatement(strong, AABar, NSString *,     color)
AAPropStatementAndPropSetFuncStatement(assign, AABar, BOOL,           grouping) //Whether to group non-stacked columns or to let them render independent of each other. Non-grouped columns will be laid out individually and overlap each other. default：true.
AAPropStatementAndPropSetFuncStatement(strong, AABar, NSNumber *,     pointPadding) //Padding between each column or bar, in x axis units. default：0.1.
AAPropStatementAndPropSetFuncStatement(strong, AABar, NSNumber *,     pointPlacement) //Padding between each column or bar, in x axis units. default：0.1.
AAPropStatementAndPropSetFuncStatement(strong, AABar, NSNumber *,     groupPadding) //Padding between each value groups, in x axis units. default：0.2.
AAPropStatementAndPropSetFuncStatement(strong, AABar, NSNumber *,     borderWidth)
AAPropStatementAndPropSetFuncStatement(assign, AABar, BOOL,           colorByPoint) //对每个不同的点设置颜色(当图表类型为 AABar 时,设置为 AABar 对象的属性,当图表类型为 bar 时,应该设置为 bar 对象的属性才有效)
AAPropStatementAndPropSetFuncStatement(strong, AABar, AADataLabels *, dataLabels)
AAPropStatementAndPropSetFuncStatement(copy,   AABar, NSString *,     stacking)
AAPropStatementAndPropSetFuncStatement(strong, AABar, NSNumber *,     borderRadius)
AAPropStatementAndPropSetFuncStatement(strong, AABar, NSNumber *,     yAxis)

@end
