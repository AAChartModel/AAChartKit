//
//  ShowManyChartViewVC.m
//  AAChartKit
//
//  Created by An An on 2017/10/14.
//  Copyright © 2017年 An An. All rights reserved.
//

#import "ShowManyChartViewVC.h"
#import "AAChartView.h"
@interface ShowManyChartViewVC ()

@end

@implementation ShowManyChartViewVC

- (void)viewDidLoad {
    [super viewDidLoad];
    self.title = @"同时显示多个 AAChartView";
    self.view.backgroundColor = [UIColor whiteColor];
    
    [self setUpTheAAChartViewOne];
    [self setUpTheAAChartViewTwo];
 
}

//配置第一个 AAChartView
- (void)setUpTheAAChartViewOne {
    CGFloat chartViewWidth  = self.view.frame.size.width;
    CGFloat screenHeight = self.view.frame.size.height;
    
    AAChartView *aaChartView = [[AAChartView alloc]initWithFrame:CGRectMake(0, 60, chartViewWidth, screenHeight/2)];
    [self.view addSubview:aaChartView];

    AAChartModel *aaChartModel= AAObject(AAChartModel)
    .chartTypeSet(AAChartTypeColumn)
    .titleSet(@"")
    .subtitleSet(@"")
    .categoriesSet(@[@"Java",@"Swift",@"Python",@"Ruby", @"PHP",@"Go",@"C",@"C#",@"C++",@"Perl",@"R",@"MATLAB",@"SQL"])
    .yAxisTitleSet(@"")
    .seriesSet(@[
                 AAObject(AASeriesElement)
                 .nameSet(@"2017")
                 .dataSet(@[@45,@88,@49,@43,@65,@56,@47,@28,@49,@44,@89,@55]),
                 ]
               );
    
    [aaChartView aa_drawChartWithChartModel:aaChartModel];
    
}

//配置第二个 AAChartView
- (void)setUpTheAAChartViewTwo {
    CGFloat chartViewWidth  = self.view.frame.size.width;
    CGFloat screenHeight = self.view.frame.size.height;
    
    AAChartView *aaChartView2 = [[AAChartView alloc]initWithFrame:CGRectMake(0, screenHeight/2+60, chartViewWidth, screenHeight/2-60)];
    [self.view addSubview:aaChartView2];
    
    AAChartModel *aaChartModel2= AAObject(AAChartModel)
    .chartTypeSet(AAChartTypeArea)
    .titleSet(@"")
    .subtitleSet(@"")
    .categoriesSet(@[@"Java",@"Swift",@"Python",@"Ruby", @"PHP",@"Go",@"C",@"C#",@"C++",@"Perl",@"R",@"MATLAB",@"SQL"])
    .yAxisTitleSet(@"")
    .seriesSet(@[
                 AAObject(AASeriesElement)
                 .nameSet(@"2018")
                 .dataSet(@[@31,@22,@33,@54,@35,@36,@27,@38,@39,@54,@41,@29]),
                 ]
               );
    [aaChartView2 aa_drawChartWithChartModel:aaChartModel2];
}



@end
