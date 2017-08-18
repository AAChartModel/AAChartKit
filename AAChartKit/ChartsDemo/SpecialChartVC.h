//
//  SpecialChartVC.h
//  AAChartKit
//
//  Created by An An on 17/3/23.
//  Copyright © 2017年 An An. All rights reserved.
//  source code ----*** https://github.com/AAChartModel/AAChartKit ***--- source code
//

#import <UIKit/UIKit.h>
typedef NS_ENUM(NSInteger,SpecialChartVCChartType) {
    SpecialChartVCChartTypeMixedLine = 0,
    SpecialChartVCChartTypePie,
    SpecialChartVCChartTypeBubble,
    SpecialChartVCChartTypeScatter,
//    SpecialChartVCChartTypeTreeMap,
    SpecialChartVCChartTypePyramid,
    SpecialChartVCChartTypeFunnel,
    SpecialChartVCChartTypeArearange,
    SpecialChartVCChartTypeColumnrange,
    SpecialChartVCChartTypeMixed,
};

@interface SpecialChartVC : UIViewController

@property (nonatomic, copy  ) NSString  *receivedChartType;
@property (nonatomic, assign) SpecialChartVCChartType chartType;

@end
