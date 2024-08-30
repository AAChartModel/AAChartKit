//
//  AAChartViewManager.h
//  AAChartKitDemo
//
//  Created by AnAn on 2024/8/30.
//  Copyright © 2024 An An. All rights reserved.
//

#import <Foundation/Foundation.h>
@class AAChartView;
NS_ASSUME_NONNULL_BEGIN

@interface AAChartViewManager : NSObject

@property (nonatomic, strong) AAChartView *aaChartView;

+ (instancetype)sharedInstance;

@end

NS_ASSUME_NONNULL_END
