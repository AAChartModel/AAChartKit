//
//  AALabels.h
//  AAChartKit
//
//  Created by An An on 17/3/1.
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

@class AAStyle;
@interface AALabels : NSObject

AAPropStatementAndPropSetFuncStatement(copy,   AALabels, NSString *, align)//轴标签的对齐方式，可用的值有 "left"、"center" 及 "right"。默认值是根据坐标轴的位置（在图表中的位置）即标签的旋转角度进行智能判断的。 默认是：center.
AAPropStatementAndPropSetFuncStatement(strong, AALabels, id        , autoRotation)//只针对水平轴有效，允许在防止轴标签重叠时自动旋转轴标签的角度。当空间足够时，轴标签不会被旋转。当图表变小时（主要是宽度变小） ，轴标签开始旋转对应的角度，然后会依次删除间隔的轴标签并尝试旋转数组中的角度。可以通过将此参数设置为 false 来关闭轴标签旋转（这将导致标签自动换行）。 默认是：[-45].
AAPropStatementAndPropSetFuncStatement(strong, AALabels, NSNumber *, autoRotationLimit)//当每个分类的宽度比该参数的值大很多（像素）时，轴标签将不会被自动旋转，而是以换行的形式展示轴标签。 当轴标签包含多个短词时换行展示轴标签可以使得轴标签有足够的空间，所以设置合理的自动旋转下限是非常有意义的。 默认是：80.
AAPropStatementAndPropSetFuncStatement(strong, AALabels, NSNumber *, distance)//只针对级地图有效，定义周标签与绘图区边缘的距离。 默认是：15.
AAPropStatementAndPropSetFuncStatement(assign, AALabels, BOOL      , enabled)//是否显示坐标轴标签 默认是：true.
AAPropStatementAndPropSetFuncStatement(copy,   AALabels, NSString *, format)//坐标轴格式化字符串。 默认是：{value}.
AAPropStatementAndPropSetFuncStatement(strong, AALabels, NSNumber *, padding)//轴标签的内间距，作用是保证轴标签之间有空隙。 默认是：5.
AAPropStatementAndPropSetFuncStatement(strong, AALabels, NSNumber *, rotation)//轴标签的旋转角度 默认是：0.
AAPropStatementAndPropSetFuncStatement(strong, AALabels, NSNumber *, staggerLines)//只针对水平轴有效，定义轴标签显示行数。
AAPropStatementAndPropSetFuncStatement(strong, AALabels, NSNumber *, step)//显示 n 的倍数标签，例如设置为 2 则表示标签间隔一个轴标签显示。默认情况下，为了避免轴标签被覆盖，该参数会根据情况自动计算。可以通过设置此参数为 1 来阻止自动计算。
AAPropStatementAndPropSetFuncStatement(strong, AALabels, AAStyle  *, style)//轴标签的 CSS 样式
AAPropStatementAndPropSetFuncStatement(strong, AALabels, NSNumber *, x)//相对于坐标轴刻度线的水平偏移。 默认是：0.
AAPropStatementAndPropSetFuncStatement(strong, AALabels, NSNumber *, y)//相对于坐标轴刻度线的垂直平偏移。 默认是：null.




@end
