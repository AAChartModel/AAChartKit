//
//  BasicChartComposer.h
//  AAChartKit
//
//  Created by An An on 17/3/13.
//  Copyright © 2017年 An An. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "AAChartKit.h"

typedef NS_ENUM(NSInteger, BasicChartVCChartType) {
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

@interface BasicChartComposer : NSObject

+ (AAChartModel *)configureChartModelWithChartType:(BasicChartVCChartType)chartType;
+ (AAChartType)convertToAAChartType:(BasicChartVCChartType)chartType;

@end
