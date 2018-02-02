//
//  AAChart.h
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
@class AAAnimation,AAOptions3d;

@interface AAChart : NSObject

AAPropStatementAndFuncStatement(copy,   AAChart, NSString    *, type);
AAPropStatementAndFuncStatement(copy,   AAChart, NSString    *, backgroundColor);
AAPropStatementAndFuncStatement(copy,   AAChart, NSString    *, pinchType);
AAPropStatementAndFuncStatement(assign, AAChart, BOOL,          panning);
AAPropStatementAndFuncStatement(copy,   AAChart, NSString    *, panKey);
AAPropStatementAndFuncStatement(copy,   AAChart, NSString    *, plotBackgroundColor);
AAPropStatementAndFuncStatement(strong, AAChart, NSNumber    *, plotBorderWidth);
AAPropStatementAndFuncStatement(assign, AAChart, BOOL,          plotShadow);
AAPropStatementAndFuncStatement(assign, AAChart, BOOL,          polar);
AAPropStatementAndFuncStatement(strong, AAChart, AAOptions3d *, options3d);
AAPropStatementAndFuncStatement(assign, AAChart, AAAnimation *, animation);//设置启用动画的时间和类型
AAPropStatementAndFuncStatement(assign, AAChart, BOOL,          inverted);
//AAPropStatementAndFuncStatement(strong, AAChart, NSArray *, spacing);//图表的内边距，指图表外边缘和绘图区之间的距离，数组中的数字分别表示顶部，右侧，底部和左侧。可以使用选项 spacingTop，spacingRight，spacingBottom 和 spacingLeft 来指定某一个内边距。 默认是：[10, 10, 15, 10].
AAPropStatementAndFuncStatement(strong, AAChart, NSNumber    *, spacingBottom);//图表的底部内边距（图表底部边缘与内容的距离）。
AAPropStatementAndFuncStatement(strong, AAChart, NSNumber    *, spacingLeft);
AAPropStatementAndFuncStatement(strong, AAChart, NSNumber    *, spacingRight);
AAPropStatementAndFuncStatement(strong, AAChart, NSNumber    *, spacingTop);

AAPropStatementAndFuncStatement(strong, AAChart, NSNumber    *, marginBottom);//图表底部外边缘和绘图区域之间的边距。另请参见spacingBottom
AAPropStatementAndFuncStatement(strong, AAChart, NSNumber    *, marginLeft);
AAPropStatementAndFuncStatement(strong, AAChart, NSNumber    *, marginRight);
AAPropStatementAndFuncStatement(strong, AAChart, NSNumber    *, marginTop);

@end



