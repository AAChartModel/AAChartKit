//
//  AADateUTCTool.m
//  AAChartKitDemo
//
//  Created by AnAn on 2018/7/20.
//  Copyright © 2018年 An An. All rights reserved.
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

#import "AADateUTCTool.h"
#import <JavaScriptCore/JavaScriptCore.h>


@implementation AADateUTCTool

+ (NSNumber *)getDateUTCWithYear:(int )year month:(int )month day:(int )day {
    JSContext   *context = [[JSContext alloc] init];
    NSString *js = @"function getDateUTC(year,month,day) {var timeInterval = Date.UTC(year,month,day);  return timeInterval}";
    [context evaluateScript:js];
    JSValue *timeIntervalValue = [context[@"getDateUTC"] callWithArguments:@[@(year), @(month),@(day)]];
    NSTimeInterval timeInterval = [timeIntervalValue toDouble];
    NSNumber *timeIntervalNum = [NSNumber numberWithDouble:timeInterval];
    return timeIntervalNum;
}

@end
