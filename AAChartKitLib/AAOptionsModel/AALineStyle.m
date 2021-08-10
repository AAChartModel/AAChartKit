//
//  AALineStyle.m
//  AAChartKitDemo
//
//  Created by AnAn on 2020/8/27.
//  Copyright © 2020 AnAn. All rights reserved.
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

#import "AALineStyle.h"

@implementation AALineStyle

AAPropSetFuncImplementation(AALineStyle, NSString *, color)  //准星线颜色
AAPropSetFuncImplementation(AALineStyle, NSString *, dashStyle)  //准星线样式
AAPropSetFuncImplementation(AALineStyle, NSNumber *, width)  //准星线宽度
AAPropSetFuncImplementation(AALineStyle, NSNumber *, zIndex)  //准星线的层叠值, 增大层叠值可以让准星线显示在数据里或网格线的上方。 默认是：2.

+ (AALineStyle *)styleWithWidth:(NSNumber *)width {
    return [self styleWithColor:nil dashStyle:nil width:width];
}

+ (AALineStyle *)styleWithColor:(NSString *)color {
    return [self styleWithColor:color dashStyle:nil];
}

+ (AALineStyle *)styleWithColor:(NSString *)color
                      dashStyle:(NSString *)dashStyle {
    return [self styleWithColor:color dashStyle:dashStyle width:nil];
}

+ (AALineStyle *)styleWithColor:(NSString *)color
                      dashStyle:(NSString *)dashStyle
                          width:(NSNumber *)width {
    return [self styleWithColor:color dashStyle:dashStyle width:width zIndex:nil];
}

+ (AALineStyle *)styleWithColor:(NSString *)color
                      dashStyle:(NSString *)dashStyle
                          width:(NSNumber *)width
                         zIndex:(NSNumber *)zIndex {
    AALineStyle *aaLineStyle = [[AALineStyle alloc]init];
    aaLineStyle.color = color;
    aaLineStyle.dashStyle = dashStyle;
    aaLineStyle.width = width;
    aaLineStyle.zIndex = zIndex;
    return aaLineStyle;
}

@end
