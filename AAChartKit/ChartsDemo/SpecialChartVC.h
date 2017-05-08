//
//  SpecialChartVC.h
//  AAChartKit
//
//  Created by An An on 17/3/23.
//  Copyright © 2017年 An An. All rights reserved.
//  source code ----*** https://github.com/AAChartModel/AAChartKit ***--- source code
//

#import <UIKit/UIKit.h>
typedef NS_ENUM(NSInteger,ENUM_SpecialChartVC_chartType) {
    ENUM_SpecialChartVC_chartTypePie=0,
    ENUM_SpecialChartVC_chartTypeBubble,
    ENUM_SpecialChartVC_chartTypeTreeMap,
    ENUM_SpecialChartVC_chartTypePyramid,
    ENUM_SpecialChartVC_chartTypeFunnel,
};
@interface SpecialChartVC : UIViewController
@property(copy,nonatomic)NSString *receivedChartType;
@property(nonatomic,assign)NSInteger ENUM_SpecialChartVC_chartType;
@end
