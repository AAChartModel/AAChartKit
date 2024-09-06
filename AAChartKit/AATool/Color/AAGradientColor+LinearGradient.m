//
//  AAGradientColor.m
//  AAChartKitDemo
//
//  Created by AnAn on 2018/11/18.
//  Copyright © 2018 An An. All rights reserved.
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

#import "AAGradientColor+LinearGradient.h"

@interface AAGradientColor()



@end


@implementation AAGradientColor

- (AAGradientColor * (^) (AALinearGradientDirection direction))directionSet {
    return ^(AALinearGradientDirection direction) {
        self->_linearGradient = [AAGradientColor linearGradientDictionaryWithDirection:direction];
        return self;
    };
}

- (AAGradientColor * (^) (NSString *startColor))startColorSet {
    return ^(NSString *startColor) {
        self->_stops = [NSMutableArray arrayWithCapacity:2];
        [self->_stops addObject:@[@(0),startColor]];
        return self;
    };
}

- (AAGradientColor * (^) (NSString *endColor))endColorSet {
    return ^(NSString *endColor) {
        NSAssert(self->_stops != nil, @"You should set startColor before setting endColor");
        [self->_stops addObject:@[@(1),endColor]];
        return self;
    };
}

- (AAGradientColor * (^) (NSArray *stopsArray))stopsArraySet {
    return ^(NSArray *stopsArray) {
        self->_stops = (NSMutableArray *)stopsArray;
        return self;
    };
}


+ (NSDictionary *)gradientColorWithStartColorString:(NSString *)startColorStr
                                     endColorString:(NSString *)endColorStr {
    return [self gradientColorWithDirection:AALinearGradientDirectionToTop
                           startColorString:startColorStr
                             endColorString:endColorStr];
}
    
+ (NSDictionary *)gradientColorWithDirection:(AALinearGradientDirection)direction
                            startColorString:(NSString *)startColorStr
                              endColorString:(NSString *)endColorStr {
    NSArray *stopsArr = @[
        @[@(0),startColorStr],
        @[@(1),endColorStr]
    ];
    return [self gradientColorWithDirection:direction stopsArray:stopsArr];
}

+ (NSDictionary *)gradientColorWithDirection:(AALinearGradientDirection)direction
                                  stopsArray:(NSArray *)stopsArray {
    return @{
        @"linearGradient":[self linearGradientDictionaryWithDirection:direction],
        @"stops":stopsArray
    };
}

/**
  (0,0) ----------- (1,0)
   |                   |
   |                   |
   |                   |
   |                   |
   |                   |
  (0,1) ----------- (1,1)
 */
+ (NSDictionary *)linearGradientDictionaryWithDirection:(AALinearGradientDirection)direction {
    switch (direction) {
        case AALinearGradientDirectionToTop:
            return @{@"x1":@(0), @"y1":@(1), @"x2":@(0), @"y2":@(0)};
        case AALinearGradientDirectionToBottom:
            return @{@"x1":@(0), @"y1":@(0), @"x2":@(0), @"y2":@(1)};
        case AALinearGradientDirectionToLeft:
            return @{@"x1":@(1), @"y1":@(0), @"x2":@(0), @"y2":@(0)};
        case AALinearGradientDirectionToRight:
            return @{@"x1":@(0), @"y1":@(0), @"x2":@(1), @"y2":@(0)};
        case AALinearGradientDirectionToTopLeft:
            return @{@"x1":@(1), @"y1":@(1), @"x2":@(0), @"y2":@(0)};
        case AALinearGradientDirectionToTopRight:
            return @{@"x1":@(0), @"y1":@(1), @"x2":@(1), @"y2":@(0)};
        case AALinearGradientDirectionToBottomLeft:
            return @{@"x1":@(1), @"y1":@(0), @"x2":@(0), @"y2":@(1)};
        case AALinearGradientDirectionToBottomRight:
            return @{@"x1":@(0), @"y1":@(0), @"x2":@(1), @"y2":@(1)};
    }
    return nil;
}

@end


