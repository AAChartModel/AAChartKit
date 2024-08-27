//
//  AASeries.m
//  AAChartKit
//
//  Created by An An on 17/1/19.
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

#import "AASeries.h"
#import "NSString+toPureJSString.h"

@implementation AASeries

AAPropSetFuncImplementation(AASeries, NSString     *, borderColor) //The border color, It is only valid for column, bar, pie, columnrange, pyramid and funnel chart types
AAPropSetFuncImplementation(AASeries, NSNumber     *, borderWidth) //The border width, It is only valid for column, bar, pie, columnrange, pyramid and funnel chart types
AAPropSetFuncImplementation(AASeries, NSNumber     *, borderRadius) //The corner radius of the border surrounding each column or bar.
AAPropSetFuncImplementation(AASeries, NSNumber     *, borderRadiusTopLeft)
AAPropSetFuncImplementation(AASeries, NSNumber     *, borderRadiusTopRight)
AAPropSetFuncImplementation(AASeries, NSNumber     *, borderRadiusBottomLeft)
AAPropSetFuncImplementation(AASeries, NSNumber     *, borderRadiusBottomRight)
AAPropSetFuncImplementation(AASeries, AAMarker     *, marker) 
AAPropSetFuncImplementation(AASeries, NSString     *, stacking) 
AAPropSetFuncImplementation(AASeries, AAAnimation  *, animation) 
AAPropSetFuncImplementation(AASeries, NSArray      *, keys) 
//AAPropSetFuncImplementation(AASeries, BOOL , colorByPoint) //设置为 true 则是给每个点分配颜色。
AAPropSetFuncImplementation(AASeries, BOOL ,          connectNulls) 
AAPropSetFuncImplementation(AASeries, AASeriesEvents *, events)
AAPropSetFuncImplementation(AASeries, AAShadow *, shadow)
AAPropSetFuncImplementation(AASeries, AADataLabels *, dataLabels)
AAPropSetFuncImplementation(AASeries, AAStates *, states)
AAPropSetFuncImplementation(AASeries, id        , allowPointSelect) //折线图的曲线宽度，默认是：0
AAPropSetFuncImplementation(AASeries, AAPoint  *, point)
AAPropSetFuncImplementation(AASeries, NSNumber *, pointWidth) //柱状图, 条形图, 柱形范围图, 瀑布图, 箱线图(盒须图)直接设置单个图形元素的宽度
AAPropSetFuncImplementation(AASeries, NSNumber *, maxPointWidth) //柱状图, 条形图, 柱形范围图, 瀑布图, 箱线图(盒须图)直接设置单个图形元素的最大宽度
AAPropSetFuncImplementation(AASeries, NSNumber *, minPointLength) //柱状图, 条形图, 柱形范围图, 瀑布图, 箱线图(盒须图)直接设置单个图形元素的最小高度


@end


@implementation AASeriesEvents

//AAPropSetFuncImplementation(AASeriesEvents, NSString *, click)
//AAPropSetFuncImplementation(AASeriesEvents, NSString *, mouseOver)
//AAPropSetFuncImplementation(AASeriesEvents, NSString *, mouseOut)
//AAPropSetFuncImplementation(AASeriesEvents, NSString *, legendItemClick)

AAJSFuncTypePropSetFuncImplementation(AASeriesEvents, NSString *, click)
AAJSFuncTypePropSetFuncImplementation(AASeriesEvents, NSString *, mouseOver)
AAJSFuncTypePropSetFuncImplementation(AASeriesEvents, NSString *, mouseOut)
AAJSFuncTypePropSetFuncImplementation(AASeriesEvents, NSString *, legendItemClick)


- (void)setClick:(NSString *)click {
    _click = [click aa_toPureJSString];
}

- (void)setMouseOver:(NSString *)mouseOver {
    _mouseOver = [mouseOver aa_toPureJSString];
}

- (void)setMouseOut:(NSString *)mouseOut {
    _mouseOut = [mouseOut aa_toPureJSString];
}

- (void)setLegendItemClick:(NSString *)legendItemClick {
    _legendItemClick = [legendItemClick aa_toPureJSString];
}


@end


@implementation AAPoint : NSObject

AAPropSetFuncImplementation(AAPoint, AAPointEvents     *, events)

@end


@implementation AAPointEvents : NSObject

//AAPropSetFuncImplementation(AAPointEvents, NSString *, click) //点击事件
//AAPropSetFuncImplementation(AAPointEvents, NSString *, mouseOut) //鼠标划出
//AAPropSetFuncImplementation(AAPointEvents, NSString *, mouseOver) //鼠标划过
//AAPropSetFuncImplementation(AAPointEvents, NSString *, remove) //删除
//AAPropSetFuncImplementation(AAPointEvents, NSString *, select) //选中
//AAPropSetFuncImplementation(AAPointEvents, NSString *, unselect) //取消选中
//AAPropSetFuncImplementation(AAPointEvents, NSString *, update) //更新

AAJSFuncTypePropSetFuncImplementation(AAPointEvents, NSString *, click) //点击事件
AAJSFuncTypePropSetFuncImplementation(AAPointEvents, NSString *, mouseOut) //鼠标划出
AAJSFuncTypePropSetFuncImplementation(AAPointEvents, NSString *, mouseOver) //鼠标划过
AAJSFuncTypePropSetFuncImplementation(AAPointEvents, NSString *, remove) //删除
AAJSFuncTypePropSetFuncImplementation(AAPointEvents, NSString *, select) //选中
AAJSFuncTypePropSetFuncImplementation(AAPointEvents, NSString *, unselect) //取消选中
AAJSFuncTypePropSetFuncImplementation(AAPointEvents, NSString *, update) //更新
AAJSFuncTypePropSetFuncImplementation(AAPointEvents, NSString *, legendItemClick) //图例点击事件

- (void)setClick:(NSString *)click {
    _click = [click aa_toPureJSString];
}

- (void)setMouseOut:(NSString *)mouseOut {
    _mouseOut = [mouseOut aa_toPureJSString];
}

- (void)setMouseOver:(NSString *)mouseOver {
    _mouseOver = [mouseOver aa_toPureJSString];
}

- (void)setRemove:(NSString *)remove {
    _remove = [remove aa_toPureJSString];
}

- (void)setSelect:(NSString *)select {
    _select = [select aa_toPureJSString];
}

- (void)setUnselect:(NSString *)unselect {
    _unselect = [unselect aa_toPureJSString];
}

- (void)setUpdate:(NSString *)update {
    _update = [update aa_toPureJSString];
}

- (void)setLegendItemClick:(NSString *)legendItemClick {
    _legendItemClick = [legendItemClick aa_toPureJSString];
}

@end
