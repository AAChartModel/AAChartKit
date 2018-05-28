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
AAPropStatementAndFuncStatement(copy,   AAChart, NSString    *, plotBackgroundImage);//指定绘图区背景图片的地址。如果需要设置整个图表的背景，请通过 CSS 来给容器元素（div）设置背景图。另外如果需要在导出图片中包含这个背景图，要求这个地址是公网可以访问的地址（包含可以访问且是绝对路径）。
AAPropStatementAndFuncStatement(copy,   AAChart, NSString    *, pinchType);
AAPropStatementAndFuncStatement(assign, AAChart, BOOL,          panning);
//AAPropStatementAndFuncStatement(copy,   AAChart, NSString    *, panKey);
AAPropStatementAndFuncStatement(assign, AAChart, BOOL,          polar);
AAPropStatementAndFuncStatement(strong, AAChart, AAOptions3d *, options3d);
AAPropStatementAndFuncStatement(assign, AAChart, AAAnimation *, animation);//设置启用动画的时间和类型
AAPropStatementAndFuncStatement(assign, AAChart, BOOL,          inverted);
AAPropStatementAndFuncStatement(strong, AAChart, NSNumber    *, marginLeft);
AAPropStatementAndFuncStatement(strong, AAChart, NSNumber    *, marginRight);

@end



