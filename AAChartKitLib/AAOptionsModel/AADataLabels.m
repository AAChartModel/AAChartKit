//
//  AADataLabels.m
//  AAChartKit
//
//  Created by An An on 17/1/6.
//  Copyright © 2017年 An An. All rights reserved.
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
 * JianShu       : http://www.jianshu.com/u/f1e6753d4254
 * SegmentFault  : https://segmentfault.com/u/huanghunbieguan
 *
 * -------------------------------------------------------------------------------
 
 */

#import "AADataLabels.h"

@implementation AADataLabels

//- (instancetype)init {
//    self = [super init];
//    if (self) {
//        NSDictionary *styleDic = @{@"color": @"contrast",//设置图表数据文字的颜色,可修改为 #ff00ff 任意的这种十六进制字符串
//                                   @"fontSize": @"10.5px",//数据文字大小
//                                   @"fontWeight": @"thin",//默认数据加粗,另外可设置为 thin 即是细体字
//                                   @"textOutline": @"1px 1px contrast" };//文字轮廓描边
//        self.style = (id)styleDic;
//    }
//
//    return self;
//}

AAPropSetFuncImplementation(AADataLabels, BOOL      , enabled);
AAPropSetFuncImplementation(AADataLabels, AAStyle  *, style);
AAPropSetFuncImplementation(AADataLabels, NSString *, format);
AAPropSetFuncImplementation(AADataLabels, NSNumber *, rotation);
AAPropSetFuncImplementation(AADataLabels, BOOL      , allowOverlap);

@end
