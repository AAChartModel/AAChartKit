//
//  AAXAxis.h
//  AAChartKit
//
//  Created by An An on 17/1/5.
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
 * StackOverflow : https://stackoverflow.com/users/7842508/codeforu
 * JianShu       : http://www.jianshu.com/u/f1e6753d4254
 * SegmentFault  : https://segmentfault.com/u/huanghunbieguan
 *
 * -------------------------------------------------------------------------------
 
 */

#import <Foundation/Foundation.h>

@class AALabels;

@interface AAXAxis : NSObject

AAPropStatementAndFuncStatement(strong, AAXAxis, NSArray  *, categories);
AAPropStatementAndFuncStatement(assign, AAXAxis, BOOL,       reversed);
AAPropStatementAndFuncStatement(strong, AAXAxis, NSNumber *, gridLineWidth);//x轴网格线宽度
AAPropStatementAndFuncStatement(copy,   AAXAxis, NSString *, gridLineColor);// x轴网格线颜色
AAPropStatementAndFuncStatement(strong, AAXAxis, AALabels *, labels);//用于设置 x 轴文字相关的
AAPropStatementAndFuncStatement(assign, AAXAxis, BOOL ,      visible);//用于设置 x 轴以及 x 轴文字是否显示
AAPropStatementAndFuncStatement(strong, AAXAxis, NSNumber *, tickInterval);//x轴刻度点间隔数(设置每隔几个点显示一个 X轴的内容)

//lineWidth :0,
//tickWidth:0,
//labels:{
//enabled:false 
//}
@end
