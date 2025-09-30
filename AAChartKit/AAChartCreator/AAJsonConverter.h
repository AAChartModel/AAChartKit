//
//  AAJsonConverter.h
//  AAChartKitDemo
//
//  Created by AnAn on 2025/9/30.
//  Copyright © 2025 An An. All rights reserved.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN


@interface AAJsonConverter : NSObject

/// Convert Object to be Dictionary
/// @param objc  object instance
+ (NSDictionary*)dictionaryWithObjectInstance:(id)objc;

/// Get pure options Json string from option instance
/// @param optionsObject Instance object of AAOptions
+ (NSString *)pureOptionsJsonStringWithOptionsInstance:(id)optionsObject;

/// Get pure Json string from Json object
/// @param jsonObjc Instance object of Json object
+ (NSString *)pureJsonStringWithJsonObject:(id)jsonObjc;


@end

NS_ASSUME_NONNULL_END
