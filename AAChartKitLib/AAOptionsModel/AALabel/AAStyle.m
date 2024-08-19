//
//  AAStyle.m
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
 * StackOverflow : https://stackoverflow.com/users/12302132/codeforu
 * JianShu       : https://www.jianshu.com/u/f1e6753d4254
 * SegmentFault  : https://segmentfault.com/u/huanghunbieguan
 *
 * -------------------------------------------------------------------------------
 
 */

#import "AAStyle.h"

@implementation AAStyle

//Styles for the label. 默认是：{"color": "contrast", "fontSize": "11px", "fontWeight": "bold", "textOutline": "1px 1px contrast" }.
//https://api.highcharts.com/class-reference/Highcharts.CSSObject#background
AAPropSetFuncImplementation(AAStyle, NSString *, background)
AAPropSetFuncImplementation(AAStyle, NSString *, backgroundColor)
AAPropSetFuncImplementation(AAStyle, NSString *, border)
AAPropSetFuncImplementation(AAStyle, NSString *, borderRadius)
AAPropSetFuncImplementation(AAStyle, NSString *, color)//设置文字的颜色,可修改为 #ff00ff 任意的这种十六进制字符串
AAPropSetFuncImplementation(AAStyle, NSString *, cursor)
AAPropSetFuncImplementation(AAStyle, NSString *, fontFamily)
AAPropSetFuncImplementation(AAStyle, NSString *, fontSize)//文字大小
AAPropSetFuncImplementation(AAStyle, NSString *, fontWeight)//可选的值有 bold, regular和 thin 三种,分别对应的是加粗字体,常规字体和纤细字体
AAPropSetFuncImplementation(AAStyle, NSNumber *, height)
AAPropSetFuncImplementation(AAStyle, NSNumber *, lineWidth)
AAPropSetFuncImplementation(AAStyle, NSNumber *, opacity)
AAPropSetFuncImplementation(AAStyle, NSString *, padding)
AAPropSetFuncImplementation(AAStyle, NSString *, pointerEvents)
AAPropSetFuncImplementation(AAStyle, NSString *, position)
AAPropSetFuncImplementation(AAStyle, NSString *, textAlign)
AAPropSetFuncImplementation(AAStyle, NSString *, textDecoration)
AAPropSetFuncImplementation(AAStyle, NSString *, textOutline)//文字轮廓描边
AAPropSetFuncImplementation(AAStyle, NSString *, textOverflow)
AAPropSetFuncImplementation(AAStyle, NSString *, top)
AAPropSetFuncImplementation(AAStyle, NSString *, transition)
AAPropSetFuncImplementation(AAStyle, NSString *, whiteSpace)
AAPropSetFuncImplementation(AAStyle, NSNumber *, width)

+ (AAStyle *)styleWithColor:(NSString *)color {
    return [self styleWithColor:color
                       fontSize:0];
}

+ (AAStyle *)styleWithColor:(NSString *)color
                   fontSize:(float)fontSize {
    return [self styleWithColor:color
                       fontSize:fontSize
                     fontWeight:nil];
}

+ (AAStyle *)styleWithColor:(NSString *)color
                   fontSize:(float)fontSize
                 fontWeight:(NSString *)fontWeight {
    return [self styleWithColor:color
                       fontSize:fontSize
                     fontWeight:fontWeight
                    textOutline:nil];
}

+ (AAStyle *)styleWithColor:(NSString *)color
                   fontSize:(float)fontSize
                 fontWeight:(NSString *)fontWeight
                textOutline:(NSString *)textOutline {
    AAStyle *aaStyle = [[AAStyle alloc]init];
    aaStyle.color = color;
    if (fontSize != 0) {
        aaStyle.fontSize = [NSString stringWithFormat:@"%fpx",fontSize];
    }
    aaStyle.fontWeight = fontWeight;
    aaStyle.textOutline = textOutline;
    return aaStyle;
}

@end
