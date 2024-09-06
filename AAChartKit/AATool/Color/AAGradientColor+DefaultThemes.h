//
//  AAGradientColor+DefaultThemes.h
//  AAChartKitDemo
//
//  Created by AnAn on 2024/9/4.
//  Copyright © 2024 An An. All rights reserved.
//

#import "AAGradientColor.h"
#import "AAGradientColor+LinearGradient.h"

NS_ASSUME_NONNULL_BEGIN

@interface AAGradientColor (DefaultThemes)

// Some convenience methods to create gradient colors.
@property (class, nonatomic, readonly) AAGradientColor *oceanBlueColor;
@property (class, nonatomic, readonly) AAGradientColor *sanguineColor;
@property (class, nonatomic, readonly) AAGradientColor *lusciousLimeColor;
@property (class, nonatomic, readonly) AAGradientColor *purpleLakeColor;
@property (class, nonatomic, readonly) AAGradientColor *freshPapayaColor;
@property (class, nonatomic, readonly) AAGradientColor *ultramarineColor;
@property (class, nonatomic, readonly) AAGradientColor *pinkSugarColor;
@property (class, nonatomic, readonly) AAGradientColor *lemonDrizzleColor;
@property (class, nonatomic, readonly) AAGradientColor *victoriaPurpleColor;
@property (class, nonatomic, readonly) AAGradientColor *springGreensColor;
@property (class, nonatomic, readonly) AAGradientColor *mysticMauveColor;
@property (class, nonatomic, readonly) AAGradientColor *reflexSilverColor;
@property (class, nonatomic, readonly) AAGradientColor *neonGlowColor;
@property (class, nonatomic, readonly) AAGradientColor *berrySmoothieColor;
@property (class, nonatomic, readonly) AAGradientColor *newLeafColor;
@property (class, nonatomic, readonly) AAGradientColor *cottonCandyColor;
@property (class, nonatomic, readonly) AAGradientColor *pixieDustColor;
@property (class, nonatomic, readonly) AAGradientColor *fizzyPeachColor;
@property (class, nonatomic, readonly) AAGradientColor *sweetDreamColor;
@property (class, nonatomic, readonly) AAGradientColor *firebrickColor;
@property (class, nonatomic, readonly) AAGradientColor *wroughtIronColor;
@property (class, nonatomic, readonly) AAGradientColor *deepSeaColor;
@property (class, nonatomic, readonly) AAGradientColor *coastalBreezeColor;
@property (class, nonatomic, readonly) AAGradientColor *eveningDelightColor;

+ (AAGradientColor *)oceanBlueColorWithDirection:(AALinearGradientDirection)direction;
+ (AAGradientColor *)sanguineColorWithDirection:(AALinearGradientDirection)direction;
+ (AAGradientColor *)lusciousLimeColorWithDirection:(AALinearGradientDirection)direction;
+ (AAGradientColor *)purpleLakeColorWithDirection:(AALinearGradientDirection)direction;
+ (AAGradientColor *)freshPapayaColorWithDirection:(AALinearGradientDirection)direction;
+ (AAGradientColor *)ultramarineColorWithDirection:(AALinearGradientDirection)direction;
+ (AAGradientColor *)pinkSugarColorWithDirection:(AALinearGradientDirection)direction;
+ (AAGradientColor *)lemonDrizzleColorWithDirection:(AALinearGradientDirection)direction;
+ (AAGradientColor *)victoriaPurpleColorWithDirection:(AALinearGradientDirection)direction;
+ (AAGradientColor *)springGreensColorWithDirection:(AALinearGradientDirection)direction;
+ (AAGradientColor *)mysticMauveColorWithDirection:(AALinearGradientDirection)direction;
+ (AAGradientColor *)reflexSilverColorWithDirection:(AALinearGradientDirection)direction;
+ (AAGradientColor *)neonGlowColorWithDirection:(AALinearGradientDirection)direction;
+ (AAGradientColor *)berrySmoothieColorWithDirection:(AALinearGradientDirection)direction;
+ (AAGradientColor *)newLeafColorWithDirection:(AALinearGradientDirection)direction;
+ (AAGradientColor *)cottonCandyColorWithDirection:(AALinearGradientDirection)direction;
+ (AAGradientColor *)pixieDustColorWithDirection:(AALinearGradientDirection)direction;
+ (AAGradientColor *)fizzyPeachColorWithDirection:(AALinearGradientDirection)direction;
+ (AAGradientColor *)sweetDreamColorWithDirection:(AALinearGradientDirection)direction;
+ (AAGradientColor *)firebrickColorWithDirection:(AALinearGradientDirection)direction;
+ (AAGradientColor *)wroughtIronColorWithDirection:(AALinearGradientDirection)direction;
+ (AAGradientColor *)deepSeaColorWithDirection:(AALinearGradientDirection)direction;
+ (AAGradientColor *)coastalBreezeColorWithDirection:(AALinearGradientDirection)direction;
+ (AAGradientColor *)eveningDelightColorWithDirection:(AALinearGradientDirection)direction;

@end

NS_ASSUME_NONNULL_END
