//
//  AATooltip.m
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

#import "AATooltip.h"
#import "NSString+toPureJSString.h"

@implementation AATooltip

- (instancetype)init {
    self = [super init];
    if (self) {
        _enabled = true;
        _animation = true;
        _shared = true;
        _followTouchMove = true;
        _shadow = true;
    }
    return self;
}

AAPropSetFuncImplementation(AATooltip, BOOL,       animation) //是否启用动画是否启用动画(设置 animation == false,禁用 tooltip 动画能够在一定程度上节省程序的计算资源,提高运行效率)
AAPropSetFuncImplementation(AATooltip, NSString *, backgroundColor) //背景色
AAPropSetFuncImplementation(AATooltip, NSString *, borderColor) //边框颜色
AAPropSetFuncImplementation(AATooltip, NSNumber *, borderRadius) //边框的圆角半径
AAPropSetFuncImplementation(AATooltip, NSNumber *, borderWidth) //边框宽度
AAPropSetFuncImplementation(AATooltip, AAStyle  *, style) //为提示框添加CSS样式。提示框同样能够通过 CSS 类 .highcharts-tooltip 来设定样式。 默认是：@{@"color":AAColor.whiteColor,@"cursor":@"default",@"fontSize":@"12px",@"pointerEvents":@"none",@"whiteSpace":@"nowrap" }
AAPropSetFuncImplementation(AATooltip, BOOL,       enabled) 
AAPropSetFuncImplementation(AATooltip, BOOL,       useHTML) 
AAPropSetFuncImplementation(AATooltip, NSString *, format)
//AAPropSetFuncImplementation(AATooltip, NSString *, formatter)
AAPropSetFuncImplementation(AATooltip, NSString *, headerFormat)
AAPropSetFuncImplementation(AATooltip, NSString *, pointFormat)
//AAPropSetFuncImplementation(AATooltip, NSString *, pointFormatter)
AAPropSetFuncImplementation(AATooltip, NSString *, footerFormat) 
AAPropSetFuncImplementation(AATooltip, NSNumber *, valueDecimals) //设置取值精确到小数点后几位
AAPropSetFuncImplementation(AATooltip, NSString *, shape)
AAPropSetFuncImplementation(AATooltip, BOOL,       shared)
AAPropSetFuncImplementation(AATooltip, NSString *, valuePrefix)
AAPropSetFuncImplementation(AATooltip, NSString *, valueSuffix)
AAPropSetFuncImplementation(AATooltip, BOOL,       followPointer)
AAPropSetFuncImplementation(AATooltip, BOOL,       followTouchMove)
AAPropSetFuncImplementation(AATooltip, BOOL,       shadow)
AAPropSetFuncImplementation(AATooltip, NSNumber *, padding) //设置取值精确到小数点后几位
//AAPropSetFuncImplementation(AATooltip, NSString *, positioner)
AAPropSetFuncImplementation(AATooltip, NSNumber *, hideDelay) //提示框隐藏延时: 当鼠标移出数据点或者图表后，数据提示框会在设定的延迟时间后消失 默认是：500.
AAPropSetFuncImplementation(AATooltip, AADateTimeLabelFormats  *, dateTimeLabelFormats)


AAJSFuncTypePropSetFuncImplementation(AATooltip, NSString *, formatter)
AAJSFuncTypePropSetFuncImplementation(AATooltip, NSString *, pointFormatter)
AAJSFuncTypePropSetFuncImplementation(AATooltip, NSString *, positioner)

- (void)setFormatter:(NSString *)formatter {
    _formatter = [formatter aa_toPureJSString];
}

- (void)setPointFormatter:(NSString *)pointFormatter {
    _pointFormatter = [pointFormatter aa_toPureJSString];
}

- (void)setPositioner:(NSString *)positioner {
    _positioner = [positioner aa_toPureJSString];
}


@end
