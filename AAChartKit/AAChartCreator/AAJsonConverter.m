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
    // 输入验证
    if (!objc) {
        NSLog(@"⚠️ AAJsonConverter: Attempting to convert nil object to dictionary");
        return @{};
    }
    
    unsigned int propsCount;
    objc_property_t *props = class_copyPropertyList([objc class], &propsCount);
    NSMutableDictionary *propsDic = [NSMutableDictionary dictionaryWithCapacity:propsCount];

    for (NSUInteger i = 0; i < propsCount; i++) {
        objc_property_t prop = props[i];
        NSString *propName = [NSString stringWithUTF8String:property_getName(prop)];
        
        @try {
            id value = [objc valueForKey:propName];
            if (value == nil) {
                // 跳过 nil 值，不添加到字典中（保持 JSON 简洁）
                continue;
            }
            value = [self getObjectInternal:value];
            propsDic[propName] = value;
        } @catch (NSException *exception) {
            NSLog(@"⚠️ AAJsonConverter: Error getting value for key '%@': %@", propName, exception.reason);
            // 发生异常时跳过该属性
            continue;
        }
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
    // 输入验证
    if (!optionsObject) {
        NSLog(@"❌ AAJsonConverter: Attempting to convert nil options object to JSON string");
        return @"{}";
    }
    
    NSDictionary *dic;
    if ([optionsObject isKindOfClass:[NSDictionary class]] ) {
        dic = optionsObject;
    } else {
        dic = [self dictionaryWithObjectInstance:optionsObject];
    }
    
    // 验证转换结果
    if (!dic || dic.count == 0) {
        NSLog(@"⚠️ AAJsonConverter: Converted dictionary is empty for object of class: %@", 
              NSStringFromClass([optionsObject class]));
    }
    
#if DEBUG
    [AAJsonConverter printPrettyPrintedJsonStringWithJsonObject:dic];
#endif
    return [self pureJsonStringWithJsonObject:dic];
}

+ (NSString*)pureJsonStringWithJsonObject:(id)jsonObject {
    // 输入验证
    if (!jsonObject) {
        NSLog(@"❌ AAJsonConverter: Cannot serialize nil JSON object");
        return @"{}";
    }
    
    // 验证对象是否可以序列化为 JSON
    if (![NSJSONSerialization isValidJSONObject:jsonObject]) {
        NSLog(@"❌ AAJsonConverter: Object is not a valid JSON object. Class: %@", 
              NSStringFromClass([jsonObject class]));
        return @"{}";
    }
    
    NSError *error = nil;
    NSData *jsonData = [NSJSONSerialization dataWithJSONObject:jsonObject
                                                       options:kNilOptions
                                                         error:&error];
    
    // 增强错误处理
    if (error || !jsonData) {
        NSLog(@"❌ AAJsonConverter: JSON serialization failed. Error: %@, Object class: %@", 
              error.localizedDescription, NSStringFromClass([jsonObject class]));
#if DEBUG
        // DEBUG 模式下打印更详细的错误信息
        NSLog(@"❌ Full error details - Domain: %@, Code: %ld, UserInfo: %@", 
              error.domain, (long)error.code, error.userInfo);
        NSLog(@"❌ Failed JSON object: %@", jsonObject);
#endif
        return @"{}";
    }
    
    NSString *pureJsonStr = [[NSString alloc] initWithData:jsonData encoding:NSUTF8StringEncoding];
    if (!pureJsonStr) {
        NSLog(@"❌ AAJsonConverter: Failed to convert JSON data to string");
        return @"{}";
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

