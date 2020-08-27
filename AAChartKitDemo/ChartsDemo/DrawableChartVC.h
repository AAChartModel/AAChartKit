//
//  DrawableChartVC.h
//  AAChartKitDemo
//
//  Created by AnAn on 2020/2/4.
//  Copyright © 2020 Danny boy. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface DrawableChartVC : UIViewController

typedef NS_ENUM(NSInteger, DrawableChartVCChartType) {
    DrawableChartVCChartTypeColumn = 0,
    DrawableChartVCChartTypeBar,
    DrawableChartVCChartTypeArea,
    DrawableChartVCChartTypeAreaspline,
    DrawableChartVCChartTypeLine,
    DrawableChartVCChartTypeSpline,
    DrawableChartVCChartTypeStepLine,
    DrawableChartVCChartTypeStepArea,
    DrawableChartVCChartTypeScatter,
};

typedef NS_ENUM(NSInteger, DrawableChartVCType) {
    DrawableChartVCTypeUpdateXAxsiExtremes,
    DrawableChartVCTypeChangeChartViewContentSize
};

@property (nonatomic, assign) DrawableChartVCChartType chartType;
@property (nonatomic, assign) DrawableChartVCType type;

@end


