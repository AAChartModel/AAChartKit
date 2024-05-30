//
//  ViewController.h
//  AAChartKit
//
//  Created by An An on 17/3/13.
//  Copyright © 2017年 An An. All rights reserved.
//*************** ...... SOURCE CODE ...... ***************
//***...................................................***
//*** https://github.com/AAChartModel/AAChartKit        ***
//*** https://github.com/AAChartModel/AAChartKit-Swift  ***
//***...................................................***
//*************** ...... SOURCE CODE ...... ***************

/*
 
 * -------------------------------------------------------------------------------
 *
 * 🌕 🌖 🌗 🌘  ❀❀❀   WARM TIPS!!!   ❀❀❀ 🌑 🌒 🌓 🌔
 *
 * Please contact me on GitHub,if there are any problems encountered in use.
 * GitHub Issues : https://github.com/AAChartModel/AAChartKit/issues
 * -------------------------------------------------------------------------------
 * And if you want to contribute for this project, please contact me as well
 * GitHub        : https://github.com/AAChartModel
 * StackOverflow : https://stackoverflow.com/users/12302132/codeforu
 * JianShu       : https://www.jianshu.com/u/f1e6753d4254
 * SegmentFault  : https://segmentfault.com/u/huanghunbieguan
 *
 * -------------------------------------------------------------------------------
 
 */

#import <UIKit/UIKit.h>
#import "AAEasyTool.h"
#import "AAChartKit.h"

typedef NS_ENUM(NSInteger,BasicChartVCChartType) {
    BasicChartVCChartTypeColumn = 0,
    BasicChartVCChartTypeBar,
    BasicChartVCChartTypeArea,
    BasicChartVCChartTypeAreaspline,
    BasicChartVCChartTypeLine,
    BasicChartVCChartTypeSpline,
    BasicChartVCChartTypeStepLine,
    BasicChartVCChartTypeStepArea,
    BasicChartVCChartTypeScatter,
};

@interface BasicChartVC : UIViewController

@property (nonatomic, strong) AAChartModel *aaChartModel;
@property (nonatomic, strong) AAChartView  *aaChartView;
@property (nonatomic, assign) BasicChartVCChartType chartType;
@property (nonatomic, copy  ) NSString  *receivedChartType;

@end

