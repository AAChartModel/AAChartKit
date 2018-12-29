//
//  AAColor.h
//  AAChartKitDemo
//
//  Created by AnAn on 2018/11/19.
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

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@interface AAColor : NSObject

+ (NSString *)blackColor;      // 0.0 white
+ (NSString *)darkGrayColor;   // 0.333 white
+ (NSString *)lightGrayColor;  // 0.667 white
+ (NSString *)whiteColor;      // 1.0 white
+ (NSString *)grayColor;       // 0.5 white
+ (NSString *)redColor;        // 1.0, 0.0, 0.0 RGB
+ (NSString *)greenColor;      // 0.0, 1.0, 0.0 RGB
+ (NSString *)blueColor;       // 0.0, 0.0, 1.0 RGB
+ (NSString *)cyanColor;       // 0.0, 1.0, 1.0 RGB
+ (NSString *)yellowColor;     // 1.0, 1.0, 0.0 RGB
+ (NSString *)magentaColor;    // 1.0, 0.0, 1.0 RGB
+ (NSString *)orangeColor;     // 1.0, 0.5, 0.0 RGB
+ (NSString *)purpleColor;     // 0.5, 0.0, 0.5 RGB
+ (NSString *)brownColor;      // 0.6, 0.4, 0.2 RGB
+ (NSString *)clearColor;      // 0.0 white, 0.0 alpha

@end

NS_ASSUME_NONNULL_END
