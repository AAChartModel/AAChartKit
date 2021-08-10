//
//  AAColor.h
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

#import <Foundation/Foundation.h>
#import <CoreGraphics/CoreGraphics.h>

@interface AAColor : NSObject

// Some convenience methods to create colors.  These colors will be as calibrated as possible
@property (class, nonatomic, readonly) NSString *blackColor;      // 0.0 white
@property (class, nonatomic, readonly) NSString *darkGrayColor;   // 0.333 white
@property (class, nonatomic, readonly) NSString *lightGrayColor;  // 0.667 white
@property (class, nonatomic, readonly) NSString *whiteColor;      // 1.0 white
@property (class, nonatomic, readonly) NSString *grayColor;       // 0.5 white
@property (class, nonatomic, readonly) NSString *redColor;        // 1.0, 0.0, 0.0 RGB
@property (class, nonatomic, readonly) NSString *greenColor;      // 0.0, 1.0, 0.0 RGB
@property (class, nonatomic, readonly) NSString *blueColor;       // 0.0, 0.0, 1.0 RGB
@property (class, nonatomic, readonly) NSString *cyanColor;       // 0.0, 1.0, 1.0 RGB
@property (class, nonatomic, readonly) NSString *yellowColor;     // 1.0, 1.0, 0.0 RGB
@property (class, nonatomic, readonly) NSString *magentaColor;    // 1.0, 0.0, 1.0 RGB
@property (class, nonatomic, readonly) NSString *orangeColor;     // 1.0, 0.5, 0.0 RGB
@property (class, nonatomic, readonly) NSString *purpleColor;     // 0.5, 0.0, 0.5 RGB
@property (class, nonatomic, readonly) NSString *brownColor;      // 0.6, 0.4, 0.2 RGB
@property (class, nonatomic, readonly) NSString *clearColor;      // 0.0 white, 0.0 alpha

// Convenience methods for creating rgba color
+ (NSString *)colorWithRed:(CGFloat)red green:(CGFloat)green blue:(CGFloat)blue alpha:(CGFloat)alpha;

@end


