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

#import "AAGradientColor.h"

@interface AAGradientColor()

@property (nonatomic, strong) NSDictionary *linearGradient;
@property (nonatomic, strong) NSMutableArray *stops;

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

+ (NSDictionary *)oceanBlueColor {
    return [self oceanBlueColorWithDirection:AALinearGradientDirectionToTop];
}

+ (NSDictionary *)sanguineColor {
    return [self sanguineColorWithDirection:AALinearGradientDirectionToTop];
}

+ (NSDictionary *)lusciousLimeColor {
    return [self lusciousLimeColorWithDirection:AALinearGradientDirectionToTop];
}

+ (NSDictionary *)purpleLakeColor {
    return [self purpleLakeColorWithDirection:AALinearGradientDirectionToTop];
}

+ (NSDictionary *)freshPapayaColor {
    return [self freshPapayaColorWithDirection:AALinearGradientDirectionToTop];
}

+ (NSDictionary *)ultramarineColor {
    return [self ultramarineColorWithDirection:AALinearGradientDirectionToTop];
}

+ (NSDictionary *)pinkSugarColor {
    return [self pinkSugarColorWithDirection:AALinearGradientDirectionToTop];
}

+ (NSDictionary *)lemonDrizzleColor {
    return [self lemonDrizzleColorWithDirection:AALinearGradientDirectionToTop];
}

+ (NSDictionary *)victoriaPurpleColor {
    return [self victoriaPurpleColorWithDirection:AALinearGradientDirectionToTop];
}

+ (NSDictionary *)springGreensColor {
    return [self springGreensColorWithDirection:AALinearGradientDirectionToTop];
}

+ (NSDictionary *)mysticMauveColor {
    return [self mysticMauveColorWithDirection:AALinearGradientDirectionToTop];
}

+ (NSDictionary *)reflexSilverColor {
    return [self reflexSilverColorWithDirection:AALinearGradientDirectionToTop];
}

+ (NSDictionary *)neonGlowColor {
    return [self neonGlowColorWithDirection:AALinearGradientDirectionToTop];
}

+ (NSDictionary *)berrySmoothieColor {
    return [self berrySmoothieColorWithDirection:AALinearGradientDirectionToTop];
}

+ (NSDictionary *)newLeafColor {
    return [self newLeafColorWithDirection:AALinearGradientDirectionToTop];
}

+ (NSDictionary *)cottonCandyColor {
    return [self cottonCandyColorWithDirection:AALinearGradientDirectionToTop];
}

+ (NSDictionary *)pixieDustColor {
    return [self pixieDustColorWithDirection:AALinearGradientDirectionToTop];
}

+ (NSDictionary *)fizzyPeachColor {
    return [self fizzyPeachColorWithDirection:AALinearGradientDirectionToTop];
}

+ (NSDictionary *)sweetDreamColor {
    return [self sweetDreamColorWithDirection:AALinearGradientDirectionToTop];
}

+ (NSDictionary *)firebrickColor {
    return [self firebrickColorWithDirection:AALinearGradientDirectionToTop];
}

+ (NSDictionary *)wroughtIronColor {
    return [self wroughtIronColorWithDirection:AALinearGradientDirectionToTop];
}

+ (NSDictionary *)deepSeaColor {
    return [self deepSeaColorWithDirection:AALinearGradientDirectionToTop];
}

+ (NSDictionary *)coastalBreezeColor {
    return [self coastalBreezeColorWithDirection:AALinearGradientDirectionToTop];
}

+ (NSDictionary *)eveningDelightColor {
    return [self eveningDelightColorWithDirection:AALinearGradientDirectionToTop];
}

+ (NSDictionary *)oceanBlueColorWithDirection:(AALinearGradientDirection)direction {
    return [self gradientColorWithDirection:direction
                           startColorString:@"#2E3192"
                             endColorString:@"#1BFFFF"];
}

+ (NSDictionary *)sanguineColorWithDirection:(AALinearGradientDirection)direction {
    return [self gradientColorWithDirection:direction
                           startColorString:@"#D4145A"
                             endColorString:@"#FBB03B"];
}


+ (NSDictionary *)lusciousLimeColorWithDirection:(AALinearGradientDirection)direction {
    return [self gradientColorWithDirection:direction
                           startColorString:@"#009245"
                             endColorString:@"#FCEE21"];
}

+ (NSDictionary *)purpleLakeColorWithDirection:(AALinearGradientDirection)direction {
    return [self gradientColorWithDirection:direction
                           startColorString:@"#662D8C"
                             endColorString:@"#ED1E79"];
}

+ (NSDictionary *)freshPapayaColorWithDirection:(AALinearGradientDirection)direction {
    return [self gradientColorWithDirection:direction
                           startColorString:@"#ED1C24"
                             endColorString:@"#FCEE21"];
}

+ (NSDictionary *)ultramarineColorWithDirection:(AALinearGradientDirection)direction {
    return [self gradientColorWithDirection:direction
                           startColorString:@"#00A8C5"
                             endColorString:@"#FFFF7E"];
}

+ (NSDictionary *)pinkSugarColorWithDirection:(AALinearGradientDirection)direction {
    return [self gradientColorWithDirection:direction
                           startColorString:@"#D74177"
                             endColorString:@"#FFE98A"];
}

+ (NSDictionary *)lemonDrizzleColorWithDirection:(AALinearGradientDirection)direction {
    return [self gradientColorWithDirection:direction
                           startColorString:@"#FB872B"
                             endColorString:@"#D9E021"];
}

+ (NSDictionary *)victoriaPurpleColorWithDirection:(AALinearGradientDirection)direction {
    return [self gradientColorWithDirection:direction
                           startColorString:@"#312A6C"
                             endColorString:@"#852D91"];
}

+ (NSDictionary *)springGreensColorWithDirection:(AALinearGradientDirection)direction {
    return [self gradientColorWithDirection:direction
                           startColorString:@"#009E00"
                             endColorString:@"#FFFF96"];
}

+ (NSDictionary *)mysticMauveColorWithDirection:(AALinearGradientDirection)direction {
    return [self gradientColorWithDirection:direction
                           startColorString:@"#B066FE"
                             endColorString:@"#63E2FF"];
}

+ (NSDictionary *)reflexSilverColorWithDirection:(AALinearGradientDirection)direction {
    return [self gradientColorWithDirection:direction
                           startColorString:@"#808080"
                             endColorString:@"#E6E6E6"];
}

+ (NSDictionary *)neonGlowColorWithDirection:(AALinearGradientDirection)direction {
    return [self gradientColorWithDirection:direction
                           startColorString:@"#00FFA1"
                             endColorString:@"#00FFFF"];
}

+ (NSDictionary *)berrySmoothieColorWithDirection:(AALinearGradientDirection)direction {
    return [self gradientColorWithDirection:direction
                           startColorString:@"#8E78FF"
                             endColorString:@"#FC7D7B"];
}

+ (NSDictionary *)newLeafColorWithDirection:(AALinearGradientDirection)direction {
    return [self gradientColorWithDirection:direction
                           startColorString:@"#00537E"
                             endColorString:@"#3AA17E"];
}

+ (NSDictionary *)cottonCandyColorWithDirection:(AALinearGradientDirection)direction {
    return [self gradientColorWithDirection:direction
                           startColorString:@"#FCA5F1"
                             endColorString:@"#B5FFFF"];
}

+ (NSDictionary *)pixieDustColorWithDirection:(AALinearGradientDirection)direction {
    return [self gradientColorWithDirection:direction
                           startColorString:@"#D585FF"
                             endColorString:@"#00FFEE"];
}

+ (NSDictionary *)fizzyPeachColorWithDirection:(AALinearGradientDirection)direction {
    return [self gradientColorWithDirection:direction
                           startColorString:@"#F24645"
                             endColorString:@"#EBC08D"];
}

+ (NSDictionary *)sweetDreamColorWithDirection:(AALinearGradientDirection)direction {
    return [self gradientColorWithDirection:direction
                           startColorString:@"#3A3897"
                             endColorString:@"#A3A1FF"];
}

+ (NSDictionary *)firebrickColorWithDirection:(AALinearGradientDirection)direction {
    return [self gradientColorWithDirection:direction
                           startColorString:@"#45145A"
                             endColorString:@"#FF5300"];
}

+ (NSDictionary *)wroughtIronColorWithDirection:(AALinearGradientDirection)direction {
    return [self gradientColorWithDirection:direction
                           startColorString:@"#333333"
                             endColorString:@"#5A5454"];
}

+ (NSDictionary *)deepSeaColorWithDirection:(AALinearGradientDirection)direction {
    return [self gradientColorWithDirection:direction
                           startColorString:@"#4F00BC"
                             endColorString:@"#29ABE2"];
}

+ (NSDictionary *)coastalBreezeColorWithDirection:(AALinearGradientDirection)direction {
    return [self gradientColorWithDirection:direction
                           startColorString:@"#00B7FF"
                             endColorString:@"#FFFFC7"];
}

+ (NSDictionary *)eveningDelightColorWithDirection:(AALinearGradientDirection)direction {
    return [self gradientColorWithDirection:direction
                           startColorString:@"#93278F"
                             endColorString:@"#00A99D"];
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


