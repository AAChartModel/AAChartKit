//
//  ChartRaceWithBarChartVC.h
//  AAChartKitDemo
//
//  Created by AnAn on 2020/6/16.
//  Copyright © 2020 Danny boy. All rights reserved.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN
typedef NS_ENUM(NSInteger,DataSortingWithAnimationChartVCChartType) {
    DataSortingWithAnimationChartVCChartTypeColumn = 0,
    DataSortingWithAnimationChartVCChartTypeBar,
//    DataSortingWithAnimationChartVCChartTypeArea,
//    DataSortingWithAnimationChartVCChartTypeAreaspline,
//    DataSortingWithAnimationChartVCChartTypeLine,
//    DataSortingWithAnimationChartVCChartTypeSpline,
//    DataSortingWithAnimationChartVCChartTypeStepLine,
//    DataSortingWithAnimationChartVCChartTypeStepArea,
    DataSortingWithAnimationChartVCChartTypeScatter,
};

@interface DataSortingWithAnimationChartVC : UIViewController
@property (nonatomic, assign) DataSortingWithAnimationChartVCChartType chartType;

@end

NS_ASSUME_NONNULL_END
