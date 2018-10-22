//
//  AADataLabels.h
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
 * JianShu       : http://www.jianshu.com/u/f1e6753d4254
 * SegmentFault  : https://segmentfault.com/u/huanghunbieguan
 *
 * -------------------------------------------------------------------------------
 
 */

#import <Foundation/Foundation.h>

@class AAStyle;

@interface AADataLabels : NSObject

//https://api.hcharts.cn/highcharts#plotOptions.area.dataLabels.align
//align: 水平对齐
//allowOverlap: 允许重叠
//backgroundColor: 背景颜色
//borderColor: 边框颜色
//borderRadius: 边框圆角
//borderWidth: 边框宽度
//className: 类名
//color: 颜色
//crop: 裁剪
//defer: 延迟显示
//enabled: 开关
//format: 格式化字符串
//formatter: 格式化函数
//inside: 显示在内部
//overflow: 溢出处理
//padding: 内边距
//rotation: 旋转角度
//shadow: 阴影
//shape: 箭头形状
//style: 样式
//useHTML: HTML 渲染
//verticalAlign: 竖直对齐方式
//x: 水平偏移
//y: 竖直偏移
//zIndex

//https://api.hcharts.cn/highcharts#plotOptions.pie.dataLabels.connectorPadding
//backgroundColor: undefined
//borderColor: undefined
//borderRadius: 0
//borderWidth: 0
//className: undefined
//color: undefined
//connectorColor: "{point.color}"
//connectorPadding: 5
//connectorWidth: 1
//crop: true
//defer: true
//distance: 30
//enabled: true
//format: "{y}"
//formatter: undefined
//inside: undefined
//overflow: "justify"
//padding: 5
//rotation: 0
//shadow: false
//shape: "square"
//softConnector: true
//style: {"color": "contrast", "fontSize": "11px", "fontWeight": "bold", "textOutline": "1px 1px contrast" }
//useHTML: false
//verticalAlign: undefined
//x: 0
//y: -6
//zIndex

AAPropStatementAndPropSetFuncStatement(assign, AADataLabels, BOOL      , enabled) 
AAPropStatementAndPropSetFuncStatement(strong, AADataLabels, AAStyle  *, style) 
AAPropStatementAndPropSetFuncStatement(copy,   AADataLabels, NSString *, format) 
AAPropStatementAndPropSetFuncStatement(strong, AADataLabels, NSNumber *, rotation) 
AAPropStatementAndPropSetFuncStatement(assign, AADataLabels, BOOL      , allowOverlap) 
AAPropStatementAndPropSetFuncStatement(assign, AADataLabels, BOOL      , useHTML) 
AAPropStatementAndPropSetFuncStatement(strong, AADataLabels, NSNumber *, distance) 
AAPropStatementAndPropSetFuncStatement(strong, AADataLabels, NSNumber *, x) 
AAPropStatementAndPropSetFuncStatement(strong, AADataLabels, NSNumber *, y)
AAPropStatementAndPropSetFuncStatement(copy,   AADataLabels, NSString *, backgroundColor)
AAPropStatementAndPropSetFuncStatement(copy,   AADataLabels, NSString *, shape)


@end
