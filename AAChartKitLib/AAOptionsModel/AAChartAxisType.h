//
//  AAChartAxisType.h
//  AAChartKitDemo
//
//  Created by Admin on 2021/7/16.
//  Copyright © 2021 An An. All rights reserved.
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

#ifndef AAChartAxisType_h
#define AAChartAxisType_h

typedef NSString *AAChartAxisType;

static AAChartAxisType const AAChartAxisTypeLinear      = @"linear";//线性轴
static AAChartAxisType const AAChartAxisTypeLogarithmic = @"logarithmic";//对数轴
static AAChartAxisType const AAChartAxisTypeDatetime    = @"datetime";//时间轴
static AAChartAxisType const AAChartAxisTypeCategory    = @"category";//分类轴

#endif /* AAChartAxisType_h */
