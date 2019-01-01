//
//  AAPlotLinesElement.h
//  AAChartKit
//
//  Created by An An on 17/1/6.
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
 * JianShu       : https://www.jianshu.com/u/f1e6753d4254
 * SegmentFault  : https://segmentfault.com/u/huanghunbieguan
 *
 * -------------------------------------------------------------------------------
 
 */

#import <Foundation/Foundation.h>
@class AALabel;

@interface AAPlotLinesElement : NSObject

AAPropStatementAndPropSetFuncStatement(copy,   AAPlotLinesElement, NSString *, color) //基线颜色
AAPropStatementAndPropSetFuncStatement(copy,   AAPlotLinesElement, NSString *, dashStyle) //基线样式Dash,Dot,Solid,默认Solid
AAPropStatementAndPropSetFuncStatement(strong, AAPlotLinesElement, NSNumber *, width) //基线宽度
AAPropStatementAndPropSetFuncStatement(strong, AAPlotLinesElement, NSNumber *, value) //显示位置
AAPropStatementAndPropSetFuncStatement(strong, AAPlotLinesElement, NSNumber *, zIndex)//层叠，标示线在图表中显示的层叠级别，值越大，显示越向前，默认标示线显示在数据线之后
AAPropStatementAndPropSetFuncStatement(strong, AAPlotLinesElement, AALabel *, label) //标示线的文字标签，用来描述标示线

@end
