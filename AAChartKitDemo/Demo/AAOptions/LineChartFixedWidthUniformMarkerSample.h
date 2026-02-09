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

/// 默认示例数据（10 个点）。
+ (NSArray<NSNumber *> *)defaultValues;

/// 生成“固定 10 槽位 + line + scatter 混合（单点右补线 + 强化 Marker）”的完整 AAOptions。
/// @param values 传入业务数据。传 nil 或空数组时会使用默认数据。
+ (AAOptions *)fixedWidthUniformMarkerLineChartOptionsWithValues:(NSArray<NSNumber *> * _Nullable)values;

@end

NS_ASSUME_NONNULL_END
