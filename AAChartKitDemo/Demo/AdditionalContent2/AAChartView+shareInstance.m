//
//  AAChartView+shareInstance.m
//  AAChartKitDemo
//
//  Created by AnAn on 2024/8/30.
//  Copyright © 2024 An An. All rights reserved.
//

#import "AAChartView+shareInstance.h"

@implementation AAChartView (shareInstance)

+ (instancetype)sharedInstance {
    static AAChartView *sharedInstance = nil;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        sharedInstance = [[self alloc] init];
    });
    return sharedInstance;
}


@end
