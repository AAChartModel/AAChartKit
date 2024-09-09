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

@implementation AAGradientColor (LinearGradient)

- (AAGradientColor * (^) (AALinearGradientDirection direction))directionSet {
    return ^(AALinearGradientDirection direction) {
        self.linearGradient = [AAGradientColor linearGradientWithDirection:direction];
        return self;
    };
}

- (AAGradientColor * (^) (NSString *startColor))startColorSet {
    return ^(NSString *startColor) {
        self.stops = @[
            @[@(0), startColor]
        ];
        return self;
    };
}

- (AAGradientColor * (^) (NSString *endColor))endColorSet {
    return ^(NSString *endColor) {
        NSAssert(self.stops != nil, @"You should set startColor before setting endColor");
        NSMutableArray *mutableArray = self.stops.mutableCopy;
        [mutableArray addObject:@[
            @[@(1), endColor]
        ]];
        self.stops = mutableArray;
        return self;
    };
}

- (AAGradientColor * (^) (NSArray *stopsArray))stopsArraySet {
    return ^(NSArray *stopsArray) {
        self.stops = (NSMutableArray *)stopsArray;
        return self;
    };
}


+ (AAGradientColor *)gradientColorWithStartColorString:(NSString *)startColorStr
                                        endColorString:(NSString *)endColorStr {
    return [self gradientColorWithDirection:AALinearGradientDirectionToTop
                           startColorString:startColorStr
                             endColorString:endColorStr];
}

+ (AAGradientColor *)gradientColorWithDirection:(AALinearGradientDirection)direction
                               startColorString:(NSString *)startColorStr
                                 endColorString:(NSString *)endColorStr {
    NSArray *stopsArr = @[
        @[@(0),startColorStr],
        @[@(1),endColorStr]
    ];
    return [self gradientColorWithDirection:direction stopsArray:stopsArr];
}

+ (AAGradientColor *)gradientColorWithDirection:(AALinearGradientDirection)direction
                                     stopsArray:(NSArray *)stopsArray {
    AAGradientColor *gradientColor = AAGradientColor.new;
    gradientColor.linearGradient = [AAGradientColor linearGradientWithDirection:direction];
    gradientColor.stops = stopsArray;
    return gradientColor;
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
+ (AALinearGradient *)linearGradientWithDirection:(AALinearGradientDirection)direction {
    switch (direction) {
        case AALinearGradientDirectionToTop:         return [AALinearGradient linearGradientWithX1:@0 y1:@1 x2:@0 y2:@0];
        case AALinearGradientDirectionToBottom:      return [AALinearGradient linearGradientWithX1:@0 y1:@0 x2:@0 y2:@1];
        case AALinearGradientDirectionToLeft:        return [AALinearGradient linearGradientWithX1:@1 y1:@0 x2:@0 y2:@0];
        case AALinearGradientDirectionToRight:       return [AALinearGradient linearGradientWithX1:@0 y1:@0 x2:@1 y2:@0];

        case AALinearGradientDirectionToTopLeft:     return [AALinearGradient linearGradientWithX1:@1 y1:@1 x2:@0 y2:@0];
        case AALinearGradientDirectionToTopRight:    return [AALinearGradient linearGradientWithX1:@0 y1:@1 x2:@1 y2:@0];
        case AALinearGradientDirectionToBottomLeft:  return [AALinearGradient linearGradientWithX1:@1 y1:@0 x2:@0 y2:@1];
        case AALinearGradientDirectionToBottomRight: return [AALinearGradient linearGradientWithX1:@0 y1:@0 x2:@1 y2:@1];
    }
    return nil;
}

@end


