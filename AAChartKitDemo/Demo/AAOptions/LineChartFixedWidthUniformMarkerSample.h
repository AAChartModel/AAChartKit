//
//  LineChartFixedWidthUniformMarkerSample.h
//  AAChartKitDemo
//
//  Created by Codex on 2026/2/9.
//

#import <Foundation/Foundation.h>
#import "AAChartKit.h"

NS_ASSUME_NONNULL_BEGIN

@interface LineChartFixedWidthUniformMarkerSample : NSObject

+ (NSArray<NSNumber *> *)defaultValues;

+ (AAOptions *)fixedWidthUniformMarkerLineChartOptionsWithValues:(NSArray<NSNumber *> * _Nullable)values;

@end

NS_ASSUME_NONNULL_END

