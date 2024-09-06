//
//  CustomStyleForScatterChartComposer.h
//  AAChartKitDemo
//
//  Created by AnAn on 2024/9/6.
//  Copyright © 2024 An An. All rights reserved.
//

#import <Foundation/Foundation.h>

@class AAChartModel;

NS_ASSUME_NONNULL_BEGIN

@interface CustomStyleForScatterChartComposer : NSObject

+ (AAChartModel *)customScatterChartMarkerSymbolContent;
+ (AAChartModel *)drawLineMixedScatterChartWithPointsCoordinates2;

@end

NS_ASSUME_NONNULL_END
