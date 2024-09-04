//
//  AAGradientColor+DefaultThemes.h
//  AAChartKitDemo
//
//  Created by AnAn on 2024/9/4.
//  Copyright © 2024 An An. All rights reserved.
//

#import "AAGradientColor.h"

NS_ASSUME_NONNULL_BEGIN

@interface AAGradientColor (DefaultThemes)

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

@end

NS_ASSUME_NONNULL_END
