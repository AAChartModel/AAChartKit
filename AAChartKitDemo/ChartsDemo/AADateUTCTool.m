//
//  AADateUTCTool.m
//  AAChartKitDemo
//
//  Created by AnAn on 2018/7/20.
//  Copyright © 2018年 Danny boy. All rights reserved.
//

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
