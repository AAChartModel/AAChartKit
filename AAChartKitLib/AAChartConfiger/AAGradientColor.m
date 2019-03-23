//
//  AAGradientColor.m
//  AAChartKitDemo
//
//  Created by AnAn on 2018/11/18.
//  Copyright © 2018 Danny boy. All rights reserved.
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
 * StackOverflow : https://stackoverflow.com/users/7842508/codeforu
 * JianShu       : https://www.jianshu.com/u/f1e6753d4254
 * SegmentFault  : https://segmentfault.com/u/huanghunbieguan
 *
 * -------------------------------------------------------------------------------
 
 */

#import "AAGradientColor.h"

@implementation AAGradientColor

+ (NSDictionary *)oceanBlueColor {
    return [self configureGradientColorWithStartColorString:@"#2E3192" endColorString:@"#1BFFFF"];
}

+ (NSDictionary *)sanguineColor {
    return [self configureGradientColorWithStartColorString:@"#D4145A" endColorString:@"#FBB03B"];
}

+ (NSDictionary *)lusciousLimeColor {
    return [self configureGradientColorWithStartColorString:@"#009245" endColorString:@"#FCEE21"];
}

+ (NSDictionary *)purpleLakeColor {
    return [self configureGradientColorWithStartColorString:@"#662D8C" endColorString:@"#ED1E79"];
}

+ (NSDictionary *)freshPapayaColor {
    return [self configureGradientColorWithStartColorString:@"#ED1C24" endColorString:@"#FCEE21"];
}

+ (NSDictionary *)ultramarineColor {
    return [self configureGradientColorWithStartColorString:@"#00A8C5" endColorString:@"#FFFF7E"];
}

+ (NSDictionary *)pinkSugarColor {
    return [self configureGradientColorWithStartColorString:@"#D74177" endColorString:@"#FFE98A"];
}

+ (NSDictionary *)lemonDrizzleColor {
    return [self configureGradientColorWithStartColorString:@"#FB872B" endColorString:@"#D9E021"];
}

+ (NSDictionary *)victoriaPurpleColor {
    return [self configureGradientColorWithStartColorString:@"#312A6C" endColorString:@"#852D91"];
}

+ (NSDictionary *)springGreensColor {
    return [self configureGradientColorWithStartColorString:@"#009E00" endColorString:@"#FFFF96"];
}

+ (NSDictionary *)mysticMauveColor {
    return [self configureGradientColorWithStartColorString:@"#B066FE" endColorString:@"#63E2FF"];
}

+ (NSDictionary *)reflexSilverColor {
    return [self configureGradientColorWithStartColorString:@"#808080" endColorString:@"#E6E6E6"];
}

+ (NSDictionary *)neonGlowColor {
    return [self configureGradientColorWithStartColorString:@"#00FFA1" endColorString:@"#00FFFF"];
}

+ (NSDictionary *)berrySmoothieColor {
    return [self configureGradientColorWithStartColorString:@"#8E78FF" endColorString:@"#FC7D7B"];
}

+ (NSDictionary *)newLeafColor {
    return [self configureGradientColorWithStartColorString:@"#00537E" endColorString:@"#3AA17E"];
}

+ (NSDictionary *)cottonCandyColor {
    return [self configureGradientColorWithStartColorString:@"#FCA5F1" endColorString:@"#B5FFFF"];
}

+ (NSDictionary *)pixieDustColor {
    return [self configureGradientColorWithStartColorString:@"#D585FF" endColorString:@"#00FFEE"];
}

+ (NSDictionary *)fizzyPeachColor {
    return [self configureGradientColorWithStartColorString:@"#F24645" endColorString:@"#EBC08D"];
}

+ (NSDictionary *)sweetDreamColor {
    return [self configureGradientColorWithStartColorString:@"#3A3897" endColorString:@"#A3A1FF"];
}

+ (NSDictionary *)firebrickColor {
    return [self configureGradientColorWithStartColorString:@"#45145A" endColorString:@"#FF5300"];
}

+ (NSDictionary *)wroughtIronColor {
    return [self configureGradientColorWithStartColorString:@"#333333" endColorString:@"#5A5454"];
}

+ (NSDictionary *)deepSeaColor {
    return [self configureGradientColorWithStartColorString:@"#4F00BC" endColorString:@"#29ABE2"];
}

+ (NSDictionary *)coastalBreezeColor {
    return [self configureGradientColorWithStartColorString:@"#00B7FF" endColorString:@"#FFFFC7"];
}

+ (NSDictionary *)eveningDelightColor {
    return [self configureGradientColorWithStartColorString:@"#93278F" endColorString:@"#00A99D"];
}

+ (NSDictionary *)configureGradientColorWithStartColorString:(NSString *)startColorStr
                                              endColorString:(NSString *)endColorStr {
    NSDictionary *linearGradientDic = @{@"x1":@(0), @"y1":@(1), @"x2":@(0), @"y2":@(0)};
    NSArray *stopsArr = @[@[@(0),startColorStr],
                          @[@(1),endColorStr]];
    NSMutableDictionary *gradientColorDic = [NSMutableDictionary dictionary];
    [gradientColorDic setValue:linearGradientDic forKey:@"linearGradient"];
    [gradientColorDic setValue:stopsArr forKey:@"stops"];
    return gradientColorDic;
}

@end


