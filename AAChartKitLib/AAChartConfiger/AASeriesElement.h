//
//  AASeriesElement.h
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

@class AAMarker;

@interface AASeriesElement : NSObject

AAPropStatementAndFuncStatement(copy,   AASeriesElement, NSString *, type);
AAPropStatementAndFuncStatement(assign, AASeriesElement, BOOL      , allowPointSelect);//是否允许在点击数据点标记（markers）、柱子（柱形图）、扇区（饼图）时选中该点，选中的点可以通过 Chart.getSelectedPoints 来获取。 默认是：false.
AAPropStatementAndFuncStatement(copy,   AASeriesElement, NSString *, name);
AAPropStatementAndFuncStatement(strong, AASeriesElement, NSArray  *, data);
AAPropStatementAndFuncStatement(copy,   AASeriesElement, NSString *, color);
AAPropStatementAndFuncStatement(strong, AASeriesElement, AAMarker *, marker);
AAPropStatementAndFuncStatement(copy,   AASeriesElement, NSString *, stacking);
AAPropStatementAndFuncStatement(copy,   AASeriesElement, NSString *, dashStyle);
AAPropStatementAndFuncStatement(strong, AASeriesElement, NSNumber *, threshold);
AAPropStatementAndFuncStatement(strong, AASeriesElement, NSNumber *, lineWidth);//折线图、曲线图、直方折线图、折线填充图、曲线填充图、直方折线填充图的线条宽度
AAPropStatementAndFuncStatement(strong, AASeriesElement, NSNumber *, fillOpacity);//折线填充图、曲线填充图、直方折线填充图等填充图类型的填充颜色透明度
AAPropStatementAndFuncStatement(copy,   AASeriesElement, NSString *, negativeColor); // The color for the parts of the graph or points that are below the threshold
AAPropStatementAndFuncStatement(strong, AASeriesElement, NSNumber *, borderRadius);
AAPropStatementAndFuncStatement(copy,   AASeriesElement, NSString *, innerSize);
AAPropStatementAndFuncStatement(strong, AASeriesElement, NSNumber *, size);
AAPropStatementAndFuncStatement(strong, AASeriesElement, NSArray  *, keys);
AAPropStatementAndFuncStatement(strong, AASeriesElement, NSNumber *, yAxis);

@end


