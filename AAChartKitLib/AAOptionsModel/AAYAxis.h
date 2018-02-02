//
//  AAYAxis.h
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

@class AATitle,AALabels;

typedef NSString *AAYAxisGridLineInterpolation;
static AAYAxisGridLineInterpolation const AAYAxisGridLineInterpolationCircle  = @"circle";//圆形
static AAYAxisGridLineInterpolation const AAYAxisGridLineInterpolationPolygon = @"polygon";//多边形

@interface AAYAxis : NSObject

//AAPropStatementAndFuncStatement(assign, AAYAxis, BOOL,       min);
AAPropStatementAndFuncStatement(strong, AAYAxis, AATitle  *, title);
AAPropStatementAndFuncStatement(strong, AAYAxis, NSArray  *, plotLines);
AAPropStatementAndFuncStatement(assign, AAYAxis, BOOL,       reversed);
AAPropStatementAndFuncStatement(strong, AAYAxis, NSNumber *, gridLineWidth);//y轴网格线宽度
AAPropStatementAndFuncStatement(copy,   AAYAxis, NSString *, gridLineColor);// y 轴网格线颜色
AAPropStatementAndFuncStatement(copy,   AAYAxis, NSString *, gridLineInterpolation);//Polar charts only. Whether the grid lines should draw as a polygon with straight lines between categories, or as circles. Can be either circle or polygon. 默认是：null.
AAPropStatementAndFuncStatement(strong, AAYAxis, AALabels *, labels);//用于设置 y 轴是否显示
AAPropStatementAndFuncStatement(strong, AAYAxis, NSNumber *, lineWidth);//y轴线宽度
AAPropStatementAndFuncStatement(copy,   AAYAxis, NSString *, lineColor);// y 轴线颜色

AAPropStatementAndFuncStatement(assign, AAYAxis, BOOL,       allowDecimals); //y轴是否允许显示小数
AAPropStatementAndFuncStatement(assign, AAYAxis, NSNumber *, max); //y轴最大值
AAPropStatementAndFuncStatement(assign, AAYAxis, NSNumber *, min); //y轴最小值（设置为0就不会有负数）
AAPropStatementAndFuncStatement(strong, AAYAxis, NSArray  *, tickPositions);//自定义Y轴坐标（如：[@(0), @(25), @(50), @(75) , (100)]）
AAPropStatementAndFuncStatement(assign, AAYAxis, BOOL,       visible); //y轴是否允许显示


@end
