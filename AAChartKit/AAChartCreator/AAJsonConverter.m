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
    if (objc == nil || objc == [NSNull null]) {
        return @{};
    }

    NSMutableDictionary *propsDic = [NSMutableDictionary dictionary];
    Class currentClass = [objc class];

    while (currentClass && currentClass != [NSObject class]) {
        unsigned int propsCount = 0;
        objc_property_t *props = class_copyPropertyList(currentClass, &propsCount);

        for (NSUInteger i = 0; i < propsCount; i++) {
            objc_property_t prop = props[i];
            NSString *propName = [NSString stringWithUTF8String:property_getName(prop)];
            if (propName.length == 0 || propsDic[propName] != nil) {
                continue;
            }

            id value = nil;
            @try {
                value = [objc valueForKey:propName];
            } @catch (NSException *exception) {
                continue;
            }

            if (value == nil) {
                propsDic[propName] = [NSNull null];
                continue;
            }

            propsDic[propName] = [self getObjectInternal:value];
        }

        if (props != NULL) {
            free(props);
        }

        currentClass = class_getSuperclass(currentClass);
    }

    return propsDic;
}

+ (id)getObjectInternal:(id)objc {
    if (objc == nil || objc == [NSNull null]) {
        return [NSNull null];
    }

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
    if (!jsonData || error) {
        AADetailLog(@"❌❌❌ pure JSONString with JSONObject serialization failed：%@", error);
        return nil;
    }
    NSString *pureJsonStr = [[NSString alloc] initWithData:jsonData encoding:NSUTF8StringEncoding];
    return pureJsonStr;
}

#if DEBUG
+ (NSString*)printPrettyPrintedJsonStringWithJsonObject:(id)jsonObject {
    NSError *error = nil;
    NSData *jsonData = [NSJSONSerialization dataWithJSONObject:jsonObject
                                                       options:NSJSONWritingPrettyPrinted
                                                         error:&error];
    if (!jsonData || error) {
        NSLog(@"❌❌❌ pretty printed JSONString with JSONObject serialization failed：%@", error);
        return nil;
    }
    NSString *jsonStr = [[NSString alloc] initWithData:jsonData encoding:NSUTF8StringEncoding];
    NSLog(@"----------- console log AAOptions JSON information of AAChartView -----------:\n%@",jsonStr);
    return jsonStr;
}
#endif


@end

