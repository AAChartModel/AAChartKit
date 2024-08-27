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

#import <Foundation/Foundation.h>

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

@interface AAGradientColor : NSObject

- (AAGradientColor * (^) (AALinearGradientDirection direction))directionSet;
- (AAGradientColor * (^) (NSString *startColor))startColorSet;
- (AAGradientColor * (^) (NSString *endColor))endColorSet;
- (AAGradientColor * (^) (NSArray *stopsArray))stopsArraySet;

// Some convenience methods to create gradient colors.
@property (class, nonatomic, readonly) NSDictionary *oceanBlueColor;
@property (class, nonatomic, readonly) NSDictionary *sanguineColor;
@property (class, nonatomic, readonly) NSDictionary *lusciousLimeColor;
@property (class, nonatomic, readonly) NSDictionary *purpleLakeColor;
@property (class, nonatomic, readonly) NSDictionary *freshPapayaColor;
@property (class, nonatomic, readonly) NSDictionary *ultramarineColor;
@property (class, nonatomic, readonly) NSDictionary *pinkSugarColor;
@property (class, nonatomic, readonly) NSDictionary *lemonDrizzleColor;
@property (class, nonatomic, readonly) NSDictionary *victoriaPurpleColor;
@property (class, nonatomic, readonly) NSDictionary *springGreensColor;
@property (class, nonatomic, readonly) NSDictionary *mysticMauveColor;
@property (class, nonatomic, readonly) NSDictionary *reflexSilverColor;
@property (class, nonatomic, readonly) NSDictionary *neonGlowColor;
@property (class, nonatomic, readonly) NSDictionary *berrySmoothieColor;
@property (class, nonatomic, readonly) NSDictionary *newLeafColor;
@property (class, nonatomic, readonly) NSDictionary *cottonCandyColor;
@property (class, nonatomic, readonly) NSDictionary *pixieDustColor;
@property (class, nonatomic, readonly) NSDictionary *fizzyPeachColor;
@property (class, nonatomic, readonly) NSDictionary *sweetDreamColor;
@property (class, nonatomic, readonly) NSDictionary *firebrickColor;
@property (class, nonatomic, readonly) NSDictionary *wroughtIronColor;
@property (class, nonatomic, readonly) NSDictionary *deepSeaColor;
@property (class, nonatomic, readonly) NSDictionary *coastalBreezeColor;
@property (class, nonatomic, readonly) NSDictionary *eveningDelightColor;

+ (NSDictionary *)oceanBlueColorWithDirection:(AALinearGradientDirection)direction;
+ (NSDictionary *)sanguineColorWithDirection:(AALinearGradientDirection)direction;
+ (NSDictionary *)lusciousLimeColorWithDirection:(AALinearGradientDirection)direction;
+ (NSDictionary *)purpleLakeColorWithDirection:(AALinearGradientDirection)direction;
+ (NSDictionary *)freshPapayaColorWithDirection:(AALinearGradientDirection)direction;
+ (NSDictionary *)ultramarineColorWithDirection:(AALinearGradientDirection)direction;
+ (NSDictionary *)pinkSugarColorWithDirection:(AALinearGradientDirection)direction;
+ (NSDictionary *)lemonDrizzleColorWithDirection:(AALinearGradientDirection)direction;
+ (NSDictionary *)victoriaPurpleColorWithDirection:(AALinearGradientDirection)direction;
+ (NSDictionary *)springGreensColorWithDirection:(AALinearGradientDirection)direction;
+ (NSDictionary *)mysticMauveColorWithDirection:(AALinearGradientDirection)direction;
+ (NSDictionary *)reflexSilverColorWithDirection:(AALinearGradientDirection)direction;
+ (NSDictionary *)neonGlowColorWithDirection:(AALinearGradientDirection)direction;
+ (NSDictionary *)berrySmoothieColorWithDirection:(AALinearGradientDirection)direction;
+ (NSDictionary *)newLeafColorWithDirection:(AALinearGradientDirection)direction;
+ (NSDictionary *)cottonCandyColorWithDirection:(AALinearGradientDirection)direction;
+ (NSDictionary *)pixieDustColorWithDirection:(AALinearGradientDirection)direction;
+ (NSDictionary *)fizzyPeachColorWithDirection:(AALinearGradientDirection)direction;
+ (NSDictionary *)sweetDreamColorWithDirection:(AALinearGradientDirection)direction;
+ (NSDictionary *)firebrickColorWithDirection:(AALinearGradientDirection)direction;
+ (NSDictionary *)wroughtIronColorWithDirection:(AALinearGradientDirection)direction;
+ (NSDictionary *)deepSeaColorWithDirection:(AALinearGradientDirection)direction;
+ (NSDictionary *)coastalBreezeColorWithDirection:(AALinearGradientDirection)direction;
+ (NSDictionary *)eveningDelightColorWithDirection:(AALinearGradientDirection)direction;

+ (NSDictionary *)gradientColorWithStartColorString:(NSString *)startColorStr
                                     endColorString:(NSString *)endColorStr;
    
+ (NSDictionary *)gradientColorWithDirection:(AALinearGradientDirection)direction
                            startColorString:(NSString *)startColorStr
                              endColorString:(NSString *)endColorStr;

+ (NSDictionary *)gradientColorWithDirection:(AALinearGradientDirection)direction
                                  stopsArray:(NSArray *)stopsArray;

@end




