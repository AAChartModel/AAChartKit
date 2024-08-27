//
//  AAColor.m
//  AAChartKitDemo
//
//  Created by AnAn on 2018/11/19.
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

#import "AAColor.h"

@implementation AAColor

+ (NSString *)blackColor {
    return @"black";
};

+ (NSString *)darkGrayColor {
    return @"darkGray";
};

+ (NSString *)lightGrayColor {
    return @"lightGray";
};

+ (NSString *)whiteColor {
    return @"white";
};

+ (NSString *)grayColor {
    return @"gray";
};

+ (NSString *)redColor {
    return @"red";
};

+ (NSString *)greenColor {
    return @"green";
};

+ (NSString *)blueColor {
    return @"blue";
};

+ (NSString *)cyanColor {
    return @"cyan";
};

+ (NSString *)yellowColor {
    return @"yellow";
};

+ (NSString *)magentaColor {
    return @"magenta";
};

+ (NSString *)orangeColor {
    return @"orange";
};

+ (NSString *)purpleColor {
    return @"purple";
};

+ (NSString *)brownColor {
    return @"brown";
};

+ (NSString *)clearColor {
    return @"#00000000";
};

+ (NSString *)colorWithRed:(CGFloat)red
                     green:(CGFloat)green
                      blue:(CGFloat)blue
                     alpha:(CGFloat)alpha {
    return [NSString stringWithFormat:@"rgba(%f,%f,%f,%f)", red, green, blue, alpha];
}

@end
