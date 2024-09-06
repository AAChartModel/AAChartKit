//
//  AAGradientColor.h
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

typedef NS_ENUM(NSInteger, AALinearGradientDirection) {
    AALinearGradientDirectionToTop = 0,     //⇧⇧⇧⇧⇧⇧
    AALinearGradientDirectionToBottom,      //⇩⇩⇩⇩⇩⇩
    AALinearGradientDirectionToLeft,        //⇦⇦⇦⇦⇦⇦
    AALinearGradientDirectionToRight,       //⇨⇨⇨⇨⇨⇨
    AALinearGradientDirectionToTopLeft,     //⇖⇖⇖⇖⇖⇖
    AALinearGradientDirectionToTopRight,    //⇗⇗⇗⇗⇗⇗
    AALinearGradientDirectionToBottomLeft,  //⇙⇙⇙⇙⇙⇙
    AALinearGradientDirectionToBottomRight, //⇘⇘⇘⇘⇘⇘
};

@interface AAGradientColor (LinearGradient)

- (AAGradientColor * (^) (AALinearGradientDirection direction))directionSet;
- (AAGradientColor * (^) (NSString *startColor))startColorSet;
- (AAGradientColor * (^) (NSString *endColor))endColorSet;
- (AAGradientColor * (^) (NSArray *stopsArray))stopsArraySet;


+ (NSDictionary *)gradientColorWithStartColorString:(NSString *)startColorStr
                                     endColorString:(NSString *)endColorStr;
    
+ (NSDictionary *)gradientColorWithDirection:(AALinearGradientDirection)direction
                            startColorString:(NSString *)startColorStr
                              endColorString:(NSString *)endColorStr;

+ (NSDictionary *)gradientColorWithDirection:(AALinearGradientDirection)direction
                                  stopsArray:(NSArray *)stopsArray;

@end




