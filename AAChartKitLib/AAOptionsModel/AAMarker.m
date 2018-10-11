//
//  AAMarker.m
//  AAChartKit
//
//  Created by An An on 17/1/20.
//  Copyright © 2017年 An An. All rights reserved.
//
//*************** ...... SOURCE CODE ...... ***************
//***...................................................***
//***    https://github.com/AAChartModel/AAChartKit     ***
//***...................................................***
//*************** ...... SOURCE CODE ...... ***************
//

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

#import "AAMarker.h"

@implementation AAMarker

AAPropSetFuncImplementation(AAMarker, NSNumber *, radius) 
AAPropSetFuncImplementation(AAMarker, NSString *, symbol) 
AAPropSetFuncImplementation(AAMarker, NSString *, fillColor) //点的填充色(用来设置折线连接点的填充色)
AAPropSetFuncImplementation(AAMarker, NSNumber *, lineWidth) //外沿线的宽度(用来设置折线连接点的轮廓描边的宽度)
AAPropSetFuncImplementation(AAMarker, NSString *, lineColor) //外沿线的颜色(用来设置折线连接点的轮廓描边颜色，当值为空字符串时，默认取数据点或数据列的颜色。)

@end
