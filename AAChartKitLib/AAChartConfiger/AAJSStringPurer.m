//
//  AAJSStringPurer.m
//  AAChartKitDemo
//
//  Created by AnAn on 2019/7/17.
//  Copyright © 2019 Danny boy. All rights reserved.
//

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
