//
//  AAJsonConverter.m
//  AAChartKitDemo
//
//  Created by AnAn on 2025/9/30.
//  Copyright © 2025 An An. All rights reserved.
//

#import "AAJsonConverter.h"
#import <objc/runtime.h>

@implementation AAJsonConverter

+ (NSDictionary*)dictionaryWithObjectInstance:(id)objc {
    unsigned int propsCount;
    objc_property_t *props = class_copyPropertyList([objc class], &propsCount);
    NSMutableDictionary *propsDic = [NSMutableDictionary dictionaryWithCapacity:propsCount];

    for (NSUInteger i = 0; i < propsCount; i++) {
        objc_property_t prop = props[i];
        NSString *propName = [NSString stringWithUTF8String:property_getName(prop)];
        id value = [objc valueForKey:propName];
        if (value == nil) {
            value = [NSNull null];
            continue;
        } else {
            value = [self getObjectInternal:value];
        }
        propsDic[propName] = value;
    }
    free(props);
    
    return propsDic;
}

+ (id)getObjectInternal:(id)objc {
    if (   [objc isKindOfClass:[NSString class]]
        || [objc isKindOfClass:[NSNumber class]]
        || [objc isKindOfClass:[NSNull   class]] ) {
        return objc;
    }
    
    if ([objc isKindOfClass:[NSArray class]]) {
        NSArray *objcArr = objc;
        NSMutableArray *arr = [NSMutableArray arrayWithCapacity:objcArr.count];
        for (id element in objcArr) {
            [arr addObject:[self getObjectInternal:element]];
        }
        return arr;
    }
    
    if ([objc isKindOfClass:[NSDictionary class]]) {
        NSDictionary *objcDic = objc;
        NSMutableDictionary *dic = [NSMutableDictionary dictionaryWithCapacity:[objcDic count]];
        NSArray *allKeys = objcDic.allKeys;
        for (NSString *key in allKeys) {
            dic[key] = [self getObjectInternal:objcDic[key]];
        }
        return dic;
    }
    
    return [self dictionaryWithObjectInstance:objc];
}

+ (NSString *)pureOptionsJsonStringWithOptionsInstance:(id)optionsObject {
    NSDictionary *dic;
    if ([optionsObject isKindOfClass:[NSDictionary class]] ) {
        dic = optionsObject;
    } else {
        dic = [self dictionaryWithObjectInstance:optionsObject];
    }
#if DEBUG
    [AAJsonConverter printPrettyPrintedJsonStringWithJsonObject:dic];
#endif
    return [self pureJsonStringWithJsonObject:dic];
}

+ (NSString*)pureJsonStringWithJsonObject:(id)jsonObject {
    NSError *error = nil;
    NSData *jsonData = [NSJSONSerialization dataWithJSONObject:jsonObject
                                                       options:kNilOptions
                                                         error:&error];
    NSString *pureJsonStr =[[NSString alloc] initWithData:jsonData encoding:NSUTF8StringEncoding];
    if (error) {
#if DEBUG
        NSLog(@"❌❌❌ pure JSONString with JSONObject serialization failed：%@", error);
#endif
        return nil;
    }
    return pureJsonStr;
}

#if DEBUG
+ (NSString*)printPrettyPrintedJsonStringWithJsonObject:(id)jsonObject {
    NSError *error = nil;
    NSData *jsonData = [NSJSONSerialization dataWithJSONObject:jsonObject
                                                       options:NSJSONWritingPrettyPrinted
                                                         error:&error];
    NSString *jsonStr =[[NSString alloc] initWithData:jsonData encoding:NSUTF8StringEncoding];
    NSLog(@"----------- console log AAOptions JSON information of AAChartView -----------:\n%@",jsonStr);
    
    if (error) {
        NSLog(@"❌❌❌ pretty printed JSONString with JSONObject serialization failed：%@", error);
        return nil;
    }
    return jsonStr;
}
#endif


@end

