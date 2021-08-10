//
//  NSArray+toJSArray.m
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
 * ------------------------------------------------------------------------------
 * And if you want to contribute for this project, please contact me as well
 * GitHub        : https://github.com/AAChartModel
 * StackOverflow : https://stackoverflow.com/users/12302132/codeforu
 * JianShu       : https://www.jianshu.com/u/f1e6753d4254
 * SegmentFault  : https://segmentfault.com/u/huanghunbieguan
 *
 * -------------------------------------------------------------------------------
 
 */

#import "NSArray+toJSArray.h"

@implementation NSArray (toJSArray)

- (NSString *)aa_toJSArray {
    NSString *originalJsArrStr = @"";
    for (NSString *obj in self) {
        originalJsArrStr = [originalJsArrStr stringByAppendingFormat:@"'%@',",obj];
    }
    
    NSString *finalJSArrStr = [NSString stringWithFormat:@"[%@]",originalJsArrStr];
    return finalJSArrStr;
}

@end
