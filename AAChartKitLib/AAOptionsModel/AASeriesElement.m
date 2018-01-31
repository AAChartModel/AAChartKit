//
//  AASeriesElement.m
//  AAChartKit
//
//  Created by An An on 17/1/19.
//  Copyright © 2017年 An An. xAll rights reserved.
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


#import "AASeriesElement.h"

@implementation AASeriesElement

AAPropSetFuncImplementation(AASeriesElement, NSString *, type);
AAPropSetFuncImplementation(AASeriesElement, BOOL      , allowPointSelect);//是否允许在点击数据点标记（markers）、柱子（柱形图）、扇区（饼图）时选中该点，选中的点可以通过 Chart.getSelectedPoints 来获取。 默认是：false.
AAPropSetFuncImplementation(AASeriesElement, NSString *, name);
AAPropSetFuncImplementation(AASeriesElement, NSArray  *, data);
AAPropSetFuncImplementation(AASeriesElement, AAMarker *, marker);
AAPropSetFuncImplementation(AASeriesElement, NSString *, stacking);
AAPropSetFuncImplementation(AASeriesElement, NSNumber *, threshold);
AAPropSetFuncImplementation(AASeriesElement, NSNumber *, lineWidth);//折线图、曲线图、直方折线图、折线填充图、曲线填充图、直方折线填充图的线条宽度
AAPropSetFuncImplementation(AASeriesElement, NSNumber *, fillOpacity);//折线填充图、曲线填充图、直方折线填充图等填充图类型的填充颜色透明度
AAPropSetFuncImplementation(AASeriesElement, NSNumber *, borderRadius);
AAPropSetFuncImplementation(AASeriesElement, NSString *, innerSize);

@end
