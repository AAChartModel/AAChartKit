//
//  ViewController.h
//  AAChartKit
//
//  Created by An An on 17/3/13.
//  Copyright © 2017年 An An. All rights reserved.
//

#import <UIKit/UIKit.h>
typedef NS_ENUM(NSInteger,ENUM_secondeViewController_chartType){
    ENUM_secondeViewController_chartTypeColumn =0,
    ENUM_secondeViewController_chartTypeBar,
    ENUM_secondeViewController_chartTypeArea,
    ENUM_secondeViewController_chartTypeAreaspline,
    ENUM_secondeViewController_chartTypeLine,
    ENUM_secondeViewController_chartTypeSpline,
    ENUM_secondeViewController_chartTypeScatter,
    
};


@interface SecondViewController : UIViewController
@property(nonatomic,assign)NSInteger ENUM_secondeViewController_chartType;
@property(nonatomic,copy)NSString *receivedChartType;

@end

