//
//  OnlyRefreshChartDataVC.m
//  AAChartKit
//
//  Created by An An on 2017/7/3.
//  Copyright © 2017年 An An. All rights reserved.
//

#import "OnlyRefreshChartDataVC.h"
#import "AAChartKit.h"

@interface OnlyRefreshChartDataVC ()<AAChartViewDidFinishLoadDelegate>

@property(nonatomic,strong)AAChartModel *chartModel;
@property(nonatomic,strong)AAChartView *chartView;

@end

@implementation OnlyRefreshChartDataVC

- (void)viewDidLoad {
    [super viewDidLoad];
    [self setUpTheChartView];

}

- (void)setUpTheChartView{
    self.chartView = [[AAChartView alloc]init];
    self.chartView.delegate = self;
    self.view.backgroundColor = [UIColor whiteColor];
    self.chartView.frame = CGRectMake(0, 60, self.view.frame.size.width, self.view.frame.size.height-220);
    self.chartView.contentHeight = self.view.frame.size.height-220;
    [self.view addSubview:self.chartView];
    self.chartModel= AAObject(AAChartModel)
    .chartTypeSet(AAChartTypeArea)
    .titleSet(@"编程语言热度")
    .subtitleSet(@"虚拟数据")
    .pointHollowSet(true)
    .categoriesSet(@[@"Java",@"Swift",@"Python",@"Ruby", @"PHP",@"Go",@"C",@"C#",@"C++",@"Perl",@"R",@"MATLAB",@"SQL"])
    .yAxisTitleSet(@"摄氏度")
    .seriesSet(@[
                 AAObject(AASeriesElement)
                 .nameSet(@"2017")
                 .dataSet(@[@45,@88,@49,@43,@65,@56,@47,@28,@49,@44,@89,@55]),
                ]);
}

-(void)virtualUpdateTheChartViewDataInRealTime{
    NSTimer *timer = [NSTimer timerWithTimeInterval:1 repeats:YES block:^(NSTimer * _Nonnull timer) {
        NSMutableArray *virtualData = [[NSMutableArray alloc]init];
        for (int i=0; i<9; i++) {
            NSInteger randomNumber = arc4random()%20;
            [virtualData addObject:[NSNumber numberWithInteger:randomNumber]];
        }
        NSArray *series = @[
                             AAObject(AASeriesElement)
                             .nameSet(@"2017")
                             .dataSet(virtualData)
                             ];
        [self.chartView aa_onlyRefreshTheChartDataWithSeries:series];
    }];
    
    [timer fire];
}

# pragma mark AAChartViewDidFinishLoadDelegate
- (void)AAChartViewDidFinishLoad{
    NSLog(@"AAChartView 内容已加载完成");
}



@end
