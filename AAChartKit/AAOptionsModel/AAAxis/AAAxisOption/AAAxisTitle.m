//
//  AAAxisTitle.m
//  AAChartKitDemo
//
//  Created by AnAn on 2025/9/18.
//  Copyright © 2025 An An. All rights reserved.
//

#import "AAAxisTitle.h"

AAChartAxisTitleAlignValueType const AAChartAxisTitleAlignValueTypeHigh   = @"high";
AAChartAxisTitleAlignValueType const AAChartAxisTitleAlignValueTypeLow    = @"low";
AAChartAxisTitleAlignValueType const AAChartAxisTitleAlignValueTypeMiddle = @"middle";

@implementation AAAxisTitle

AAPropSetFuncImplementation(AAAxisTitle, NSString *, align)
AAPropSetFuncImplementation(AAAxisTitle, NSString *, margin)
AAPropSetFuncImplementation(AAAxisTitle, NSNumber *, offset)
AAPropSetFuncImplementation(AAAxisTitle, NSNumber *, rotation)
AAPropSetFuncImplementation(AAAxisTitle, AAStyle  *, style)
AAPropSetFuncImplementation(AAAxisTitle, NSString *, text)
AAPropSetFuncImplementation(AAAxisTitle, NSNumber *, x) //标题相对于水平对齐的偏移量，取值范围为：图表左边距到图表右边距，可以是负值，单位px。 默认是：0.
AAPropSetFuncImplementation(AAAxisTitle, NSNumber *, y) //标题相对于垂直对齐的偏移量，取值范围：图表的上边距（chart.spacingTop ）到图表的下边距（chart.spacingBottom），可以是负值，单位是px。默认值和字体大小有关。

@end
