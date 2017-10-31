//
//  AAJsonConverter.m
//  AAChartKit
//
//  Created by An An on 17/1/9.
//  Copyright © 2017年 An An. All rights reserved.
//  source code ----*** https://github.com/AAChartModel/AAChartKit ***--- source code
//

/*
 
 * -------------------------------------------------------------------------------
 *
 * ❀❀❀   WARM TIPS!!!   ❀❀❀
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

#import "AAJsonConverter.h"
#import <objc/runtime.h>

@implementation AAJsonConverter

+ (NSDictionary*)getObjectData:(id)obj {
    NSMutableDictionary *dic = [NSMutableDictionary dictionary];
    unsigned int propsCount;
    Class class = [obj class];
    do {
        objc_property_t *props = class_copyPropertyList(class, &propsCount);
        for (int i = 0;i < propsCount; i++) {
            objc_property_t prop = props[i];
            
            NSString *propName = [NSString stringWithUTF8String:property_getName(prop)];
            id value = [obj valueForKey:propName];
            if (value == nil) {
                value = [NSNull null];
                continue;
            } else {
                value = [self getObjectInternal:value];
            }
            [dic setObject:value forKey:propName];
        }
        class = [class superclass];
    } while (class != [NSObject class]);
    
    return dic;
}

+ (NSData*)getJSON:(id)obj options:(NSJSONWritingOptions)options error:(NSError**)error {
    return [NSJSONSerialization dataWithJSONObject:[self getObjectData:obj] options:options error:error];
}

+ (id)getObjectInternal:(id)obj {
    if (   [obj isKindOfClass:[NSString class]]
        || [obj isKindOfClass:[NSNumber class]]
        || [obj isKindOfClass:[NSNull   class]] ) {
        return obj;
    }
    
    if ([obj isKindOfClass:[NSArray class]]) {
        NSArray *objarr = obj;
        NSMutableArray *arr = [NSMutableArray arrayWithCapacity:objarr.count];
        for (int i = 0;i < objarr.count; i++) {
            [arr setObject:[self getObjectInternal:[objarr objectAtIndex:i]] atIndexedSubscript:i];
        }
        return arr;
    }
    
    if ([obj isKindOfClass:[NSDictionary class]]) {
        NSDictionary *objdic = obj;
        NSMutableDictionary *dic = [NSMutableDictionary dictionaryWithCapacity:[objdic count]];
        for (NSString *key in objdic.allKeys) {
            [dic setObject:[self getObjectInternal:[objdic objectForKey:key]] forKey:key];
        }
        return dic;
    }
    return [self getObjectData:obj];
}

+ (NSString*)convertDictionaryIntoJson:(NSDictionary *)dictionary {
    NSError *parseError = nil;
    NSData *jsonData = [NSJSONSerialization dataWithJSONObject:dictionary options:NSJSONWritingPrettyPrinted error:&parseError];
    NSString *string =[[NSString alloc] initWithData:jsonData encoding:NSUTF8StringEncoding];
    return string;
}

+ (NSString*)wipeOffTheLineBreakAndBlankCharacter:(NSString *)originalString {
    NSString *str =[originalString stringByTrimmingCharactersInSet:[NSCharacterSet whitespaceAndNewlineCharacterSet]];
    str = [str stringByReplacingOccurrencesOfString:@"\r" withString:@""];
    str = [str stringByReplacingOccurrencesOfString:@"\n" withString:@""];
    return str;
}

+ (NSString *)getPureOptionsString:(id)optionsObject {
    NSDictionary *dic = [self getObjectData:optionsObject];
    NSString *str = [self convertDictionaryIntoJson:dic];
    return [self wipeOffTheLineBreakAndBlankCharacter:str];
}

+ (NSString *)getPureSeriesString:(NSArray<NSDictionary*> *)series {
    NSError *parseError = nil;
    NSData *jsonData = [NSJSONSerialization dataWithJSONObject:series options:NSJSONWritingPrettyPrinted error:&parseError];
    NSString *seriesStr = [[NSString alloc] initWithData:jsonData encoding:NSUTF8StringEncoding];
    return [self wipeOffTheLineBreakAndBlankCharacter:seriesStr];
}

@end
