//
//  MonitorViewController.m
//  AAChartKitDemo
//
//  Created by 魏唯隆 on 2017/12/11.
//  Copyright © 2017年 Danny boy. All rights reserved.
//

#import "MonitorViewController.h"
#import "AAChartKit.h"
#import "AAChartView.h"

#define PostNum 14  // 柱状图行数，对应x轴数量

@interface MonitorViewController ()<AAChartViewDidFinishLoadDelegate, UIGestureRecognizerDelegate>
{
    UIScrollView *_monitorScrollView;
}
@property (nonatomic, strong) AAChartModel *aaChartModel;
@property (nonatomic, strong) AAChartView  *aaChartView;
@end

@implementation MonitorViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor = [UIColor orangeColor];
    
    [self configTheChartView:AAChartTypeColumn];
}
- (void)configTheChartView:(AAChartType)chartType {
    
    _monitorScrollView = [[UIScrollView alloc] initWithFrame:CGRectMake(0, 60, self.view.frame.size.width, self.view.frame.size.height-220)];
    _monitorScrollView.bounces = NO;
    _monitorScrollView.contentSize = CGSizeMake(self.view.frame.size.width*2, 0);
    [self.view addSubview:_monitorScrollView];
    
    self.aaChartView = [[AAChartView alloc]initWithFrame:CGRectMake(0, 0, self.view.frame.size.width*2, self.view.frame.size.height-220)];
    self.aaChartView.userInteractionEnabled = YES;
    self.aaChartView.delegate = self;
    self.aaChartView.contentHeight = self.view.frame.size.height-250;
    [_monitorScrollView addSubview:self.aaChartView];
    
    UITapGestureRecognizer *myTap = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(handleSingleTap:)];
    [self.aaChartView addGestureRecognizer:myTap];
    myTap.delegate = self;
    myTap.cancelsTouchesInView = NO;
    
    self.aaChartModel= AAObject(AAChartModel)
    .chartTypeSet(chartType)
    .titleSet(@"")
    .subtitleSet(@"")
    .categoriesSet(@[@"10/25",@"10/26",@"10/27",@"10/28",@"10/29",@"10/30",@"10/31",@"11/01",@"11/02",@"11/03",@"11/04",@"11/05",@"11/06",@"11/07"])
    .yAxisTitleSet(@"")
    .seriesSet(@[
                 AAObject(AASeriesElement)
                 .nameSet(@"水环比")
                 .dataSet(@[@16,@17,@18,@19,@33,@56,@39,@16,@17,@18,@19,@33,@56,@39]),
                 
                 AAObject(AASeriesElement)
                 .nameSet(@"电环比")
                 .dataSet(@[@26,@37,@28,@49,@56,@31,@11,@26,@37,@28,@49,@56,@31,@11]),
                 ]
               );
    
    [self.aaChartView aa_drawChartWithChartModel:_aaChartModel];
    
}
#pragma mark -- AAChartView delegate
-(void)AAChartViewDidFinishLoad {
    NSLog(@"😊😊😊图表视图已完成加载=====");
}

- (BOOL)gestureRecognizer:(UIGestureRecognizer *)gestureRecognizer shouldRecognizeSimultaneouslyWithGestureRecognizer:(UIGestureRecognizer *)otherGestureRecognizer
{
    return YES;
}

 -(void)handleSingleTap:(UITapGestureRecognizer *)sender{
     CGPoint gesturePoint = [sender locationInView:self.view];
     NSLog(@"handleSingleTap--- x:%f,y:%f",gesturePoint.x,gesturePoint.y);
 
     CGFloat xRallerWidth = _monitorScrollView.contentSize.width;
     
     // 点击区域
     CGFloat postWidth = (xRallerWidth - 60)/PostNum;
     for (int i=0; i<PostNum; i++) {
         if((gesturePoint.x + _monitorScrollView.contentOffset.x) >= (postWidth*i + 40) &&
            (gesturePoint.x + _monitorScrollView.contentOffset.x) <= (postWidth*(i+1) + 40)){
             NSLog(@"🖱点击了第%d行柱", i+1);
         }
     }
 }

@end
