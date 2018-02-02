//
//  AALegend.h
//  AAChartKit
//
//  Created by An An on 17/1/6.
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

#import <Foundation/Foundation.h>

@class AAItemStyle;

typedef NSString *AALegendLayoutType;
typedef NSString *AALegendAlignType;
typedef NSString *AALegendVerticalAlignType;

static AALegendLayoutType const AALegendLayoutTypeHorizontal = @"horizontal";
static AALegendLayoutType const AALegendLayoutTypeVertical   = @"vertical";

static AALegendAlignType const AALegendAlignTypeLeft   = @"left";
static AALegendAlignType const AALegendAlignTypeCenter = @"center";
static AALegendAlignType const AALegendAlignTypeRight  = @"right";

static AALegendVerticalAlignType const AALegendVerticalAlignTypeTop    = @"top";
static AALegendVerticalAlignType const AALegendVerticalAlignTypeMiddle = @"middle";
static AALegendVerticalAlignType const AALegendVerticalAlignTypeBottom = @"bottom";

@interface AALegend : NSObject

AAPropStatementAndFuncStatement(copy,   AALegend, AALegendLayoutType,        layout);//图例数据项的布局。布局类型： "horizontal" 或 "vertical" 即水平布局和垂直布局 默认是：horizontal.
AAPropStatementAndFuncStatement(copy,   AALegend, AALegendAlignType,         align);//设定图例在图表区中的水平对齐方式，合法值有left，center 和 right。
AAPropStatementAndFuncStatement(copy,   AALegend, AALegendVerticalAlignType, verticalAlign);//设定图例在图表区中的垂直对齐方式，合法值有 top，middle 和 bottom。垂直位置可以通过 y 选项做进一步设定。
AAPropStatementAndFuncStatement(assign, AALegend, BOOL,          enabled);
AAPropStatementAndFuncStatement(strong, AALegend, NSNumber    *, borderWidth);
AAPropStatementAndFuncStatement(strong, AALegend, NSNumber    *, itemMarginTop);//图例的每一项的顶部外边距，单位px。 默认是：0.
AAPropStatementAndFuncStatement(strong, AALegend, AAItemStyle *, itemStyle);

@end
