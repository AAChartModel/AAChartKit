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
 * JianShu       : https://www.jianshu.com/u/f1e6753d4254
 * SegmentFault  : https://segmentfault.com/u/huanghunbieguan
 *
 * -------------------------------------------------------------------------------
 
 */

#import <Foundation/Foundation.h>

@class AAMarker,AADataLabels;

@interface AASeriesElement : NSObject

AAPropStatementAndPropSetFuncStatement(copy,   AASeriesElement, NSString *, type) 
AAPropStatementAndPropSetFuncStatement(assign, AASeriesElement, BOOL      , allowPointSelect) //是否允许在点击数据点标记（markers）、柱子（柱形图）、扇区（饼图）时选中该点，选中的点可以通过 Chart.getSelectedPoints 来获取。 默认是：false.
AAPropStatementAndPropSetFuncStatement(copy,   AASeriesElement, NSString *, name) 
AAPropStatementAndPropSetFuncStatement(strong, AASeriesElement, NSArray  *, data) 
AAPropStatementAndPropSetFuncStatement(copy,   AASeriesElement, NSString *, color) 
AAPropStatementAndPropSetFuncStatement(assign, AASeriesElement, id        , colorByPoint) //When using automatic point colors pulled from the options.colors collection, this option determines whether the chart should receive one color per series or one color per point. 默认是：false.
AAPropStatementAndPropSetFuncStatement(strong, AASeriesElement, AAMarker *, marker) 
AAPropStatementAndPropSetFuncStatement(copy,   AASeriesElement, NSString *, stacking) 
AAPropStatementAndPropSetFuncStatement(copy,   AASeriesElement, NSString *, dashStyle) 
AAPropStatementAndPropSetFuncStatement(strong, AASeriesElement, NSNumber *, threshold) 
AAPropStatementAndPropSetFuncStatement(strong, AASeriesElement, NSNumber *, lineWidth) //折线图、曲线图、直方折线图、折线填充图、曲线填充图、直方折线填充图的线条宽度
AAPropStatementAndPropSetFuncStatement(strong, AASeriesElement, NSNumber *, borderWidth)//柱形图、条形图、扇形图等图形的描边宽度
AAPropStatementAndPropSetFuncStatement(copy,   AASeriesElement, NSString *, borderColor) //柱形图、条形图、扇形图顿号等图形的描边颜色
AAPropStatementAndPropSetFuncStatement(copy,   AASeriesElement, NSString *, fillColor) //折线填充图、曲线填充图、直方折线填充图等填充图类型的填充颜色
AAPropStatementAndPropSetFuncStatement(strong, AASeriesElement, NSNumber *, fillOpacity) //折线填充图、曲线填充图、直方折线填充图等填充图类型的填充颜色透明度
AAPropStatementAndPropSetFuncStatement(copy,   AASeriesElement, NSString *, negativeColor)  // The color for the parts of the graph or points that are below the threshold
AAPropStatementAndPropSetFuncStatement(strong, AASeriesElement, NSNumber *, borderRadius) 
AAPropStatementAndPropSetFuncStatement(copy,   AASeriesElement, NSString *, innerSize) 
AAPropStatementAndPropSetFuncStatement(strong, AASeriesElement, NSNumber *, size) 
AAPropStatementAndPropSetFuncStatement(strong, AASeriesElement, NSArray  *, keys) 
AAPropStatementAndPropSetFuncStatement(strong, AASeriesElement, NSNumber *, yAxis) 
AAPropStatementAndPropSetFuncStatement(strong, AASeriesElement, AADataLabels*, dataLabels) 
AAPropStatementAndPropSetFuncStatement(strong, AASeriesElement, id        , step) //是否转变为直方折线图
AAPropStatementAndPropSetFuncStatement(strong, AASeriesElement, NSDictionary *, states) 
AAPropStatementAndPropSetFuncStatement(assign, AASeriesElement, BOOL      , showInLegend) //Whether to display this particular series or series type in the legend. The default value is true for standalone series, false for linked series. 默认是：true.
AAPropStatementAndPropSetFuncStatement(assign, AASeriesElement, BOOL      , visible) //数据列是否显示的状态,可以通过 series.show()、series.hide()、series.setVisible 来改变这个属性
AAPropStatementAndPropSetFuncStatement(strong, AASeriesElement, NSArray  *, zones)
AAPropStatementAndPropSetFuncStatement(copy,   AASeriesElement, NSString *, zoneAxis)
AAPropStatementAndPropSetFuncStatement(strong, AASeriesElement, id, shadow) //数据列的阴影效果。从 2.3 开始阴影可以配置成包含 color、offsetX、offsetY、opacity 和 width 属性的对象形式。 默认是：false

@end


@interface AAData : NSObject

AAPropStatementAndPropSetFuncStatement(strong, AAData, AADataLabels *, dataLabels)
AAPropStatementAndPropSetFuncStatement(strong, AAData, NSNumber *, y)

@end


@interface AAShadow : NSObject

AAPropStatementAndPropSetFuncStatement(copy,   AAShadow, NSString *, color)
AAPropStatementAndPropSetFuncStatement(strong, AAShadow, NSNumber *, offsetX)
AAPropStatementAndPropSetFuncStatement(strong, AAShadow, NSNumber *, offsetY)
AAPropStatementAndPropSetFuncStatement(strong, AAShadow, NSNumber *, opacity)
AAPropStatementAndPropSetFuncStatement(strong, AAShadow, NSNumber *, width)

@end


