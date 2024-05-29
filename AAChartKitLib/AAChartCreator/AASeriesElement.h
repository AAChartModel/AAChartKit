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
 * StackOverflow : https://stackoverflow.com/users/12302132/codeforu
 * JianShu       : https://www.jianshu.com/u/f1e6753d4254
 * SegmentFault  : https://segmentfault.com/u/huanghunbieguan
 *
 * -------------------------------------------------------------------------------
 
 */

#import <Foundation/Foundation.h>

@class AAMarker, AADataLabels, AATooltip, AAStates, AAShadow, AAZonesElement, AADataSorting;

typedef NSString * AAChartZoneAxisType;
typedef NSString * AAChartLineStepType;

AACHARTKIT_EXTERN AAChartZoneAxisType const AAChartZoneAxisTypeX;
AACHARTKIT_EXTERN AAChartZoneAxisType const AAChartZoneAxisTypeY;

AACHARTKIT_EXTERN AAChartLineStepType const AAChartLineStepTypeLeft;
AACHARTKIT_EXTERN AAChartLineStepType const AAChartLineStepTypeCenter;
AACHARTKIT_EXTERN AAChartLineStepType const AAChartLineStepTypeRight;

@interface AASeriesElement : NSObject

AAPropStatementAndPropSetFuncStatement(copy,   AASeriesElement, NSString *, type) 
AAPropStatementAndPropSetFuncStatement(assign, AASeriesElement, BOOL      , allowPointSelect) //是否允许在点击数据点标记（markers）、柱子（柱形图）、扇区（饼图）时选中该点，选中的点可以通过 Chart.getSelectedPoints 来获取。 默认是：false.
AAPropStatementAndPropSetFuncStatement(copy,   AASeriesElement, NSString *, name) 
AAPropStatementAndPropSetFuncStatement(strong, AASeriesElement, NSArray  *, data) 
AAPropStatementAndPropSetFuncStatement(strong, AASeriesElement, NSString *, color)
AAPropStatementAndPropSetFuncStatement(strong, AASeriesElement, NSArray  *, colors)
AAPropStatementAndPropSetFuncStatement(assign, AASeriesElement, id        , colorByPoint) //When using automatic point colors pulled from the options.colors collection, this option determines whether the chart should receive one color per series or one color per point. 默认是：false.
AAPropStatementAndPropSetFuncStatement(strong, AASeriesElement, AAMarker *, marker) 
AAPropStatementAndPropSetFuncStatement(copy,   AASeriesElement, NSString *, stacking) 
AAPropStatementAndPropSetFuncStatement(copy,   AASeriesElement, NSString *, dashStyle) 
AAPropStatementAndPropSetFuncStatement(strong, AASeriesElement, NSNumber *, threshold) 
AAPropStatementAndPropSetFuncStatement(strong, AASeriesElement, NSNumber *, lineWidth) //折线图、曲线图、直方折线图、折线填充图、曲线填充图、直方折线填充图的线条宽度
AAPropStatementAndPropSetFuncStatement(copy,   AASeriesElement, NSString *, borderColor) //The border color, It is only valid for column, bar, pie, columnrange, pyramid and funnel chart types
AAPropStatementAndPropSetFuncStatement(strong, AASeriesElement, NSNumber *, borderWidth) //The border width, It is only valid for column, bar, pie, columnrange, pyramid and funnel chart types
AAPropStatementAndPropSetFuncStatement(strong, AASeriesElement, NSNumber *, borderRadius) //The corner radius of the border surrounding each column or bar.
AAPropStatementAndPropSetFuncStatement(strong, AASeriesElement, NSNumber *, borderRadiusTopLeft)
AAPropStatementAndPropSetFuncStatement(strong, AASeriesElement, NSNumber *, borderRadiusTopRight)
AAPropStatementAndPropSetFuncStatement(strong, AASeriesElement, NSNumber *, borderRadiusBottomLeft)
AAPropStatementAndPropSetFuncStatement(strong, AASeriesElement, NSNumber *, borderRadiusBottomRight)
AAPropStatementAndPropSetFuncStatement(strong, AASeriesElement, NSString *, fillColor) //折线填充图、曲线填充图、直方折线填充图等填充图类型的填充颜色
AAPropStatementAndPropSetFuncStatement(strong, AASeriesElement, NSNumber *, fillOpacity) //折线填充图、曲线填充图、直方折线填充图等填充图类型的填充颜色透明度
AAPropStatementAndPropSetFuncStatement(strong, AASeriesElement, NSString *, negativeColor)  // The color for the parts of the graph or points that are below the threshold
AAPropStatementAndPropSetFuncStatement(strong, AASeriesElement, NSString *, negativeFillColor)//A separate color for the negative part of the area.
AAPropStatementAndPropSetFuncStatement(copy,   AASeriesElement, NSString *, innerSize) 
AAPropStatementAndPropSetFuncStatement(strong, AASeriesElement, NSNumber *, size) 
AAPropStatementAndPropSetFuncStatement(strong, AASeriesElement, NSArray  *, keys) 
AAPropStatementAndPropSetFuncStatement(strong, AASeriesElement, NSNumber *, yAxis) 
AAPropStatementAndPropSetFuncStatement(strong, AASeriesElement, AADataLabels*, dataLabels) 
AAPropStatementAndPropSetFuncStatement(strong, AASeriesElement, id        , step) //是否转变为直方折线图
AAPropStatementAndPropSetFuncStatement(strong, AASeriesElement, AAStates *, states)
AAPropStatementAndPropSetFuncStatement(assign, AASeriesElement, BOOL      , showInLegend) //Whether to display this particular series or series type in the legend. The default value is true for standalone series, false for linked series. 默认是：true.
AAPropStatementAndPropSetFuncStatement(assign, AASeriesElement, BOOL      , visible) //数据列是否显示的状态,可以通过 series.show()、series.hide()、series.setVisible 来改变这个属性
AAPropStatementAndPropSetFuncStatement(strong, AASeriesElement, NSArray<AAZonesElement *>*, zones)
AAPropStatementAndPropSetFuncStatement(copy,   AASeriesElement, AAChartZoneAxisType, zoneAxis) //Defines the Axis on which the zones are applied. 默认是：y.
AAPropStatementAndPropSetFuncStatement(strong, AASeriesElement, AAShadow *, shadow) //数据列的阴影效果。从 2.3 开始阴影可以配置成包含 color、offsetX、offsetY、opacity 和 width 属性的对象形式。 默认是：false
AAPropStatementAndPropSetFuncStatement(copy,   AASeriesElement, NSString *, stack)
AAPropStatementAndPropSetFuncStatement(strong, AASeriesElement, AATooltip*, tooltip)
AAPropStatementAndPropSetFuncStatement(strong, AASeriesElement, NSNumber *, zIndex) //层叠，series element 在图表中显示的层叠级别，值越大，显示越向前
AAPropStatementAndPropSetFuncStatement(copy,   AASeriesElement, NSString *, pointPlacement)
AAPropStatementAndPropSetFuncStatement(strong, AASeriesElement, id        , enableMouseTracking)
AAPropStatementAndPropSetFuncStatement(strong, AASeriesElement, AADataSorting *, dataSorting)
AAPropStatementAndPropSetFuncStatement(strong, AASeriesElement, id        , reversed) //Only useful for pyramid chart and funnel chart
AAPropStatementAndPropSetFuncStatement(copy,   AASeriesElement, NSString *, id)
AAPropStatementAndPropSetFuncStatement(strong, AASeriesElement, id        , connectNulls)
AAPropStatementAndPropSetFuncStatement(strong, AASeriesElement, id        , enabledCrosshairs)

@end


@interface AADataElement : NSObject

AAPropStatementAndPropSetFuncStatement(copy  , AADataElement, NSString *, color)
AAPropStatementAndPropSetFuncStatement(strong, AADataElement, AADataLabels *, dataLabels)
AAPropStatementAndPropSetFuncStatement(strong, AADataElement, AAMarker *, marker)
AAPropStatementAndPropSetFuncStatement(copy  , AADataElement, NSString *, name)
AAPropStatementAndPropSetFuncStatement(strong, AADataElement, NSNumber *, x)
AAPropStatementAndPropSetFuncStatement(strong, AADataElement, NSNumber *, y)
AAPropStatementAndPropSetFuncStatement(strong, AADataElement, id,         selected)

@end


@interface AAZonesElement : NSObject

AAPropStatementAndPropSetFuncStatement(strong, AAZonesElement, NSNumber *, value)
AAPropStatementAndPropSetFuncStatement(copy,   AAZonesElement, NSString *, color)
AAPropStatementAndPropSetFuncStatement(strong, AAZonesElement, NSString *, fillColor)
AAPropStatementAndPropSetFuncStatement(copy,   AAZonesElement, NSString *, dashStyle)

@end


@interface AADataSorting : NSObject

AAPropStatementAndPropSetFuncStatement(assign, AADataSorting, BOOL, enabled)
AAPropStatementAndPropSetFuncStatement(assign, AADataSorting, BOOL, matchByName)

@end


