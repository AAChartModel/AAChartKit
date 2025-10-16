//
//  AAAxisTitle.h
//  AAChartKitDemo
//
//  Created by AnAn on 2025/9/18.
//  Copyright © 2025 An An. All rights reserved.
//

#import <Foundation/Foundation.h>

@class AAStyle;

typedef NSString *AAChartAxisTitleAlignValueType;

//https://api.highcharts.com/highcharts/xAxis.title.align
//https://api.highcharts.com/highcharts/yAxis.title.align
AACHARTKIT_EXTERN AAChartAxisTitleAlignValueType const AAChartAxisTitleAlignValueTypeHigh;
AACHARTKIT_EXTERN AAChartAxisTitleAlignValueType const AAChartAxisTitleAlignValueTypeLow;
AACHARTKIT_EXTERN AAChartAxisTitleAlignValueType const AAChartAxisTitleAlignValueTypeMiddle;

//https://api.highcharts.com/highcharts/xAxis.title
//https://api.highcharts.com/highcharts/yAxis.title
@interface AAAxisTitle : NSObject

AAPropStatementAndPropSetFuncStatement(copy,   AAAxisTitle, AAChartAxisTitleAlignValueType, align)
AAPropStatementAndPropSetFuncStatement(copy,   AAAxisTitle, NSString *, margin)
AAPropStatementAndPropSetFuncStatement(strong, AAAxisTitle, NSNumber *, offset)
AAPropStatementAndPropSetFuncStatement(strong, AAAxisTitle, NSNumber *, rotation)
AAPropStatementAndPropSetFuncStatement(strong, AAAxisTitle, AAStyle  *, style)
AAPropStatementAndPropSetFuncStatement(copy,   AAAxisTitle, NSString *, text)
AAPropStatementAndPropSetFuncStatement(copy,   AAAxisTitle, NSString *, textAlign)
AAPropStatementAndPropSetFuncStatement(strong, AAAxisTitle, NSNumber *, useHTML) // BOOL 类型, 是否使用 HTML 渲染标题
AAPropStatementAndPropSetFuncStatement(strong, AAAxisTitle, NSNumber *, x) //标题相对于水平对齐的偏移量，取值范围为：图表左边距到图表右边距，可以是负值，单位px。 默认是：0.
AAPropStatementAndPropSetFuncStatement(strong, AAAxisTitle, NSNumber *, y) //标题相对于垂直对齐的偏移量，取值范围：图表的上边距（chart.spacingTop ）到图表的下边距（chart.spacingBottom），可以是负值，单位是px。默认值和字体大小有关。

@end

