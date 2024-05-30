//
//  AAOptionsConverter.m
//  AAChartKitDemo
//
//  Created by Admin on 2022/5/21.
//  Copyright © 2022 An An. All rights reserved.
//

#import "AAOptionsConfigurationGenerator.h"
#import <objc/runtime.h>

@implementation AAOptionsConfigurationGenerator


//自动生成 AAOptions 模型的配置代码(备用)
+ (NSString *)modelStringWithObjectInstance:(id)objc {
    unsigned int propsCount;
    objc_property_t *props = class_copyPropertyList([objc class], &propsCount);
    NSMutableDictionary *propsDic = [NSMutableDictionary dictionaryWithCapacity:propsCount];
    
    NSString *classNameStr = NSStringFromClass([objc class]);
    
    //生成 Haxe 版本 AAModel
    NSString *modelStr = [NSString stringWithFormat:@"%@.new\n",classNameStr];
    
    for (NSUInteger i = 0; i < propsCount; i++) {
        objc_property_t prop = props[i];
        NSString *propName = [NSString stringWithUTF8String:property_getName(prop)];
        id value = [objc valueForKey:propName];
        if (value == nil) {
            value = [NSNull null];
            continue;
        } else {
            value = [self getObjectInternalModelStr:value];
        }
        propsDic[propName] = value;
        
//        modelStr += propName + @"Set(" + value + @")" ;
        
        NSString *singleLineStr = [NSString stringWithFormat:@".%@Set(%@)\n\t",propName, value];
        modelStr = [modelStr stringByAppendingString:singleLineStr];
    }
    
    if ([classNameStr isEqualToString:@"AAOptions"]) {
        NSLog(@"最终得到的 AAOptions  的 model 代码为------------%@\
              \
              \n\n\n", modelStr);
    }
    

    
    free(props);
    
    return modelStr;
}

+ (id)getObjectInternalModelStr:(id)objc {
    
    if (   [objc isKindOfClass:[NSString class]]
        || [objc isKindOfClass:[NSNumber class]]
        || [objc isKindOfClass:[NSNull   class]] ) {
        
        if ([objc isKindOfClass:[NSString class]]) {
            return [NSString stringWithFormat:@"@\"%@\"",objc];
        }
        
        if ([objc isKindOfClass:[NSNumber class]]) {
            return [NSString stringWithFormat:@"@%@",objc];
        }
        
        return objc;
    }
    
    if ([objc isKindOfClass:[NSArray class]]) {
        NSArray *objcArr = objc;
        NSMutableArray *arr = [NSMutableArray arrayWithCapacity:objcArr.count];
        for (id element in objcArr) {
            [arr addObject:[self getObjectInternalModelStr:element]];
        }
        
        return [self stringWithArray:arr];
//        return arr;
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
    
    return [self modelStringWithObjectInstance:objc];
}


+ (NSString *)stringWithArray:(NSArray *)array {
    NSString *str = [array componentsJoinedByString:@","];
    str = [NSString stringWithFormat:@"@[%@]",str];
//    str = [str stringByReplacingOccurrencesOfString:@"(" withString:@"["];
//    str = [str stringByReplacingOccurrencesOfString:@")" withString:@"]"];
    return str;
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

//+ (void)pureOptionsJsonStringWithOptionsInstance:(id)optionsObject {
//    NSString *testAAOptionsModel = [self getObjectInternalModelStr:optionsObject];
//
//    NSLog(@"🚀🚀🚀🚀🚀----------%@",testAAOptionsModel);
//}















@end
