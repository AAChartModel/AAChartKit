//
//  AAJSStringPurer.m
//  AAChartKitDemo
//
//  Created by AnAn on 2019/7/17.
//  Copyright © 2019 Danny boy. All rights reserved.
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

#import "AAJSStringPurer.h"

@implementation AAJSStringPurer

+ (NSString *)pureJavaScriptFunctionStringWithString:(NSString *)jsString {
    NSString *finalJSFunc = [NSString stringWithFormat:@"(%@)",jsString];
    finalJSFunc = [finalJSFunc stringByReplacingOccurrencesOfString:@"'" withString:@"\""];
    finalJSFunc = [finalJSFunc stringByReplacingOccurrencesOfString:@"\0" withString:@""];
    finalJSFunc = [finalJSFunc stringByReplacingOccurrencesOfString:@"\n" withString:@""];
    finalJSFunc = [finalJSFunc stringByReplacingOccurrencesOfString:@"\\" withString:@"\\\\"];
    finalJSFunc = [finalJSFunc stringByReplacingOccurrencesOfString:@"\"" withString:@"\\\""];
    finalJSFunc = [finalJSFunc stringByReplacingOccurrencesOfString:@"\'" withString:@"\\\'"];
    finalJSFunc = [finalJSFunc stringByReplacingOccurrencesOfString:@"\n" withString:@"\\n"];
    finalJSFunc = [finalJSFunc stringByReplacingOccurrencesOfString:@"\r" withString:@"\\r"];
    finalJSFunc = [finalJSFunc stringByReplacingOccurrencesOfString:@"\f" withString:@"\\f"];
    finalJSFunc = [finalJSFunc stringByReplacingOccurrencesOfString:@"\u2028" withString:@"\\u2028"];
    finalJSFunc = [finalJSFunc stringByReplacingOccurrencesOfString:@"\u2029" withString:@"\\u2029"];
    return finalJSFunc;
}

@end
