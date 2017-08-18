//
//  ViewController.h
//  AAChartKit
//
//  Created by An An on 17/3/13.
//  Copyright © 2017年 An An. All rights reserved.
//  source code ----*** https://github.com/AAChartModel/AAChartKit ***--- source code
//

#import <UIKit/UIKit.h>
typedef NS_ENUM(NSInteger,SecondeViewControllerChartType) {
    SecondeViewControllerChartTypeColumn =0,
    SecondeViewControllerChartTypeBar,
    SecondeViewControllerChartTypeArea,
    SecondeViewControllerChartTypeAreaspline,
    SecondeViewControllerChartTypeLine,
    SecondeViewControllerChartTypeSpline,
    SecondeViewControllerChartTypeScatter,
};

@interface SecondViewController : UIViewController

@property (nonatomic, assign) SecondeViewControllerChartType chartType;
@property (nonatomic, copy  ) NSString  *receivedChartType;

@end

