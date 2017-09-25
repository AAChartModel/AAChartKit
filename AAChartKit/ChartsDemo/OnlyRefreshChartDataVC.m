//
//  OnlyRefreshChartDataVC.m
//  AAChartKit
//
//  Created by An An on 2017/7/3.
//  Copyright © 2017年 An An. All rights reserved.
//

#import "OnlyRefreshChartDataVC.h"
#import "AAChartKit.h"

#define AAColorWithRGB(r,g,b,a) [UIColor colorWithRed:(r)/255.0f green:(g)/255.0f blue:(b)/255.0f alpha:(a)]
#define AAGrayColor             [UIColor colorWithRed:245/255.0 green:246/255.0 blue:247/255.0 alpha:1.0]
#define AABlueColor             AAColorWithRGB(63, 153,231,1)

@interface OnlyRefreshChartDataVC ()<AAChartViewDidFinishLoadDelegate>{
    NSTimer *_timer;
}

@property (nonatomic, strong) AAChartModel *chartModel;
@property (nonatomic, strong) AAChartView  *chartView;

@end

@implementation OnlyRefreshChartDataVC

- (void)viewWillDisappear:(BOOL)animated {
    [super viewWillDisappear:YES];
    //取消定时器
    [_timer invalidate];
    _timer = nil;
    
}

- (void)viewDidLoad {
    [super viewDidLoad];
    self.title = @"即时刷新数据";
    [self setUpTheView];
    
}

- (void)setUpTheView {
    for (int i = 0; i<3; i++) {
        
        NSArray *titleNameArr = @[
                                  @"点击只刷新图表数据内容",
                                  @"点击隐藏图表的 Series 内容",
                                  @"随机显示其中某一个"];
        
        UIButton *btn = [UIButton buttonWithType:UIButtonTypeCustom];
        btn.center = CGPointMake(self.view.center.x, self.view.frame.size.height-50*i-30);
        btn.bounds = CGRectMake(0, 0, self.view.frame.size.width-40, 40);
        [btn setTitle:titleNameArr[i] forState:UIControlStateNormal];
        btn.backgroundColor = AAGrayColor;
        [btn setTitleColor:AABlueColor forState:UIControlStateNormal];
        btn.layer.cornerRadius = 3;
        btn.layer.masksToBounds = YES;
        btn.titleLabel.font = [UIFont systemFontOfSize:13.f];
        btn.tag = i;
        [btn addTarget:self action:@selector(oneOfTwoButtonsClicked:) forControlEvents:UIControlEventTouchUpInside];
        [self.view addSubview:btn];
    }
    
    self.chartView = [[AAChartView alloc]init];
    self.chartView.delegate = self;
    self.view.backgroundColor = [UIColor whiteColor];
    self.chartView.frame = CGRectMake(0, 60, self.view.frame.size.width, self.view.frame.size.height-220);
    [self.view addSubview:self.chartView];
    
    self.chartModel= AAObject(AAChartModel)
    .chartTypeSet(AAChartTypeArea)
    //    .invertedSet(true)//x 轴是否垂直
    //    .xAxisReversedSet(true)//x 轴是否翻转
    //    .yAxisReversedSet(true)//y 轴是否翻转
    .stackingSet(AAChartStackingTypeNormal)
    //    .polarSet(true)//是否辐射化图形
    .titleSet(@"编程语言热度")
    .subtitleSet(@"虚拟数据")
    .pointHollowSet(true)
    .categoriesSet(@[@"Java",@"Swift",@"Python",@"Ruby", @"PHP",@"Go",@"C",@"C#",@"C++",@"Perl",@"R",@"MATLAB",@"SQL"])
    .yAxisTitleSet(@"摄氏度")
    .seriesSet(@[
                 AAObject(AASeriesElement)
                 .nameSet(@"2017")
                 .dataSet(@[@45,@88,@49,@43,@65,@56,@47,@28,@49,@44,@89,@55]),
                 
                 AAObject(AASeriesElement)
                 .nameSet(@"2018")
                 .dataSet(@[@31,@22,@33,@54,@35,@36,@27,@38,@39,@54,@41,@29]),
                 
                 AAObject(AASeriesElement)
                 .nameSet(@"2019")
                 .dataSet(@[@11,@12,@13,@14,@15,@16,@17,@18,@19,@33,@56,@39]),
                 ]
               );
    [self.chartView aa_drawChartWithChartModel:self.chartModel];
    
}

- (void)oneOfTwoButtonsClicked:(UIButton *)sender {
    
    //关闭定时器
    [_timer setFireDate:[NSDate distantFuture]];
    if (sender.tag == 0) {
        [self virtualUpdateTheChartViewDataInRealTime];
        
    } else if (sender.tag ==1){
        self.chartView.chartSeriesHidden = YES;
    } else {
        [self.chartView aa_showTheSeriesElementContentWithSeriesElementIndex:arc4random()%3];
    }
}

- (void)virtualUpdateTheChartViewDataInRealTime{
    _timer = [NSTimer scheduledTimerWithTimeInterval:2.0
                                              target:self
                                            selector:@selector(timerStartWork)
                                            userInfo:nil
                                             repeats:YES];
     [_timer fire];
}

- (void)timerStartWork{
    [self onlyRefreshTheChartData];
}

- (void)onlyRefreshTheChartData {
    
    NSMutableArray *virtualData = [[NSMutableArray alloc]init];
    NSMutableArray *virtualData2 = [[NSMutableArray alloc]init];
    NSMutableArray *virtualData3 = [[NSMutableArray alloc]init];
    
    for (int i=0; i<12; i++) {
        NSInteger randomNumber = arc4random()%99;
        NSInteger randomNumber2 = arc4random()%66;
        NSInteger randomNumber3 = arc4random()%55;
        
        [virtualData addObject:[NSNumber numberWithInteger:randomNumber]];
        [virtualData2 addObject:[NSNumber numberWithInteger:randomNumber2]];
        [virtualData3 addObject:[NSNumber numberWithInteger:randomNumber3]];
        
    }
    NSArray *series = @[
                        @{@"name":@"2017",
                          @"data":virtualData},
                        
                        @{@"name":@"2018",
                          @"data":virtualData2},
                        
                        @{@"name":@"2019",
                          @"data":virtualData3},
                        ];
    
    [self.chartView aa_onlyRefreshTheChartDataWithChartModelSeries:series];
    NSLog(@"刷新了图表的数据内容😆");

}

# pragma mark AAChartViewDidFinishLoadDelegate
- (void)AAChartViewDidFinishLoad {
    NSLog(@"AAChartView 内容已加载完成");
}

@end
