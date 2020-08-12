//
//  AASeries.m
//  AAChartKit
//
//  Created by An An on 17/1/19.
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
 * JianShu       : https://www.jianshu.com/u/f1e6753d4254
 * SegmentFault  : https://segmentfault.com/u/huanghunbieguan
 *
 * -------------------------------------------------------------------------------
 
 */

#import "AASeries.h"
#import "NSString+toPureJSString.h"

@implementation AASeries

AAPropSetFuncImplementation(AASeries, NSNumber     *, borderRadius) 
AAPropSetFuncImplementation(AASeries, AAMarker     *, marker) 
AAPropSetFuncImplementation(AASeries, NSString     *, stacking) 
AAPropSetFuncImplementation(AASeries, AAAnimation  *, animation) 
AAPropSetFuncImplementation(AASeries, NSArray      *, keys) 
//AAPropSetFuncImplementation(AASeries, BOOL , colorByPoint) //设置为 true 则是给每个点分配颜色。
AAPropSetFuncImplementation(AASeries, BOOL ,          connectNulls) 
AAPropSetFuncImplementation(AASeries, AAEvents *, events)
AAPropSetFuncImplementation(AASeries, AAShadow *, shadow)
AAPropSetFuncImplementation(AASeries, AADataLabels *, dataLabels)
AAPropSetFuncImplementation(AASeries, AAStates *, states)
AAPropSetFuncImplementation(AASeries, AAPoint  *, point)
AAPropSetFuncImplementation(AASeries, NSNumber *, borderRadiusTopLeft)
AAPropSetFuncImplementation(AASeries, NSNumber *, borderRadiusTopRight)
AAPropSetFuncImplementation(AASeries, NSNumber *, borderRadiusBottomLeft)
AAPropSetFuncImplementation(AASeries, NSNumber *, borderRadiusBottomRight)

@end


@implementation AAEvents

//AAPropSetFuncImplementation(AAEvents, NSString *, legendItemClick)

- (void)setLegendItemClick:(NSString *)legendItemClick {
    _legendItemClick = [legendItemClick aa_toPureJSString];
}

- (AAEvents * (^) (NSString * legendItemClick))legendItemClickSet {
    return ^(NSString * legendItemClick) {
        self->_legendItemClick = [legendItemClick aa_toPureJSString];
        return self;
    };
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


- (AAPointEvents * (^) (NSString * click))clickSet {
    return ^(NSString * click) {
        self->_click = [click aa_toPureJSString];
        return self;
    };
}

- (AAPointEvents * (^) (NSString * mouseOut))mouseOutSet {
    return ^(NSString * mouseOut) {
        self->_mouseOut = [mouseOut aa_toPureJSString];
        return self;
    };
}

- (AAPointEvents * (^) (NSString * mouseOver))mouseOverSet {
    return ^(NSString * mouseOver) {
        self->_mouseOver = [mouseOver aa_toPureJSString];
        return self;
    };
}

- (AAPointEvents * (^) (NSString * remove))removeSet {
    return ^(NSString * remove) {
        self->_remove = [remove aa_toPureJSString];
        return self;
    };
}

- (AAPointEvents * (^) (NSString * select))selectSet {
    return ^(NSString * select) {
        self->_select = [select aa_toPureJSString];
        return self;
    };
}

- (AAPointEvents * (^) (NSString * unselect))unselectSet {
    return ^(NSString * unselect) {
        self->_unselect = [unselect aa_toPureJSString];
        return self;
    };
}

- (AAPointEvents * (^) (NSString * update))updateSet {
    return ^(NSString * update) {
        self->_update = [update aa_toPureJSString];
        return self;
    };
}

@end
