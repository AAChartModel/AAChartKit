//
//  CustomStyleChartVC.m
//  AAChartKitDemo
//
//  Created by AnAn on 2018/11/13.
//  Copyright © 2018 Danny boy. All rights reserved.
//

#import "CustomStyleChartVC.h"
#import "AAChartKit.h"

@interface CustomStyleChartVC ()

@end

@implementation CustomStyleChartVC

- (void)viewDidLoad {
    [super viewDidLoad];
}

- (AAChartModel *)setUpDiscontinuousDataChart {
    NSDictionary *gradientColorDic1 =
    @{@"linearGradient": @{
              @"x1": @0,
              @"y1": @0,
              @"x2": @0,
              @"y2": @1
              },
      @"stops": @[@[@0,@"#8A2BE2"],
                  @[@1,@"#1E90FF"]]//颜色字符串设置支持十六进制类型和 rgba 类型
      };
        
        AAChartModel *aaChartModel = AAChartModel.new
        .chartTypeSet(AAChartTypeColumn)
        .yAxisTitleSet(@"")//设置Y轴标题
        .dataLabelEnabledSet(true)//是否显示值
        .tooltipEnabledSet(true)
        .seriesSet(@[
                     AASeriesElement.new
                     .nameSet(@"所有专业")
                     .dataSet(@[@7.0, @6.9, @9.5, @14.5, @18.2,[NSNull null],[NSNull null],[NSNull null],[NSNull null], @21.5, @25.2, @26.5, @23.3, @18.3, @13.9, @9.6,])
                     .colorSet((id)gradientColorDic1)
                     ])
        ;
        
        return aaChartModel;
}

@end
