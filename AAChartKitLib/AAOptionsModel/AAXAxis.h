//
//  AAXAxis.h
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

@class AALabels;

@interface AAXAxis : NSObject

AAPropStatementAndFuncStatement(strong, AAXAxis, id,         categories);
AAPropStatementAndFuncStatement(assign, AAXAxis, BOOL,       reversed);
AAPropStatementAndFuncStatement(strong, AAXAxis, NSNumber *, gridLineWidth);//x轴网格线宽度
AAPropStatementAndFuncStatement(copy,   AAXAxis, NSString *, gridLineColor);// x轴网格线颜色
AAPropStatementAndFuncStatement(strong, AAXAxis, AALabels *, labels);//用于设置 x 轴是否显示
//lineWidth :0,
//tickWidth:0,
//labels:{
//enabled:false
//}
@end
