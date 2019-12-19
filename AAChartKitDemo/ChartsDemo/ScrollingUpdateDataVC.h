//
//  ScrollingUpdateDataVC.h
//  AAChartKitDemo
//
//  Created by AnAn on 2019/11/9.
//  Copyright © 2019 Danny boy. All rights reserved.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN
typedef NS_ENUM(NSInteger,ScrollingUpdateDataVCChartType) {
    ScrollingUpdateDataVCChartTypeColumn = 0,
    ScrollingUpdateDataVCChartTypeBar,
    ScrollingUpdateDataVCChartTypeArea,
    ScrollingUpdateDataVCChartTypeAreaspline,
    ScrollingUpdateDataVCChartTypeLine,
    ScrollingUpdateDataVCChartTypeSpline,
    ScrollingUpdateDataVCChartTypeStepLine,
    ScrollingUpdateDataVCChartTypeStepArea,
    ScrollingUpdateDataVCChartTypeScatter,
};

@interface ScrollingUpdateDataVC : UIViewController

@property (nonatomic, assign) ScrollingUpdateDataVCChartType chartType;

@end

NS_ASSUME_NONNULL_END
