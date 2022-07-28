//
//  AAStyleConvenience.h
//  AAChartKitDemo
//
//  Created by AnAn on 2020/8/11.
//  Copyright © 2020 An An. All rights reserved.
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

#ifndef AAStyleConvenience_h
#define AAStyleConvenience_h

#import "AAStyle.h"

AACHARTKIT_STATIC_INLINE
NSString * AARgbaColor(int red,
                       int green,
                       int blue,
                       float alpha) {
    return [NSString stringWithFormat:@"rgba(%d,%d,%d,%f)",
            red,
            green,
            blue,
            alpha];
}

AACHARTKIT_STATIC_INLINE
NSString * AARgbColor(int red,
                      int green,
                      int blue) {
    return [NSString stringWithFormat:@"rgba(%d,%d,%d,1.0)",
            red,
            green,
            blue];
}

AACHARTKIT_STATIC_INLINE
AAStyle * AAStyleColorSizeWeightOutline(NSString * color,
                                        float fontSize,
                                        NSString * fontWeight,
                                        NSString * textOutline) {
    AAStyle *aaStyle = [[AAStyle alloc]init];
    aaStyle.color = color;
    if (fontSize != 0) {
        aaStyle.fontSize = [NSString stringWithFormat:@"%fpx",fontSize];
    }
    aaStyle.fontWeight = fontWeight;
    aaStyle.textOutline = textOutline;
    return aaStyle;
}

AACHARTKIT_STATIC_INLINE
AAStyle * AAStyleColorSizeWeight(NSString * color,
                                 float fontSize,
                                 NSString * fontWeight) {
    return AAStyleColorSizeWeightOutline(color, fontSize, fontWeight, nil);
}

AACHARTKIT_STATIC_INLINE
AAStyle * AAStyleColorSize(NSString * color,
                           float fontSize) {
    return AAStyleColorSizeWeight(color, fontSize, nil);
}

AACHARTKIT_STATIC_INLINE
AAStyle * AAStyleColor(NSString * color) {
    return AAStyleColorSize(color, 0);
}

#endif /* AAStyleConvenience_h */
