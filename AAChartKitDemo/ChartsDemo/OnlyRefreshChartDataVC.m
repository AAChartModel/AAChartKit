
//  SpecialChartVC.m
//  AAChartKit
//
//  Created by An An on 17/3/23.
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
 * StackOverflow : https://stackoverflow.com/users/7842508/codeforu
 * JianShu       : http://www.jianshu.com/u/f1e6753d4254
 * SegmentFault  : https://segmentfault.com/u/huanghunbieguan
 *
 * -------------------------------------------------------------------------------
 
 */

#import "OnlyRefreshChartDataVC.h"
#import "AAChartKit.h"

#define AAColorWithRGB(r,g,b,a) [UIColor colorWithRed:(r)/255.0f green:(g)/255.0f blue:(b)/255.0f alpha:(a)]
#define AAGrayColor             [UIColor colorWithRed:245/255.0 green:246/255.0 blue:247/255.0 alpha:1.0]
#define AABlueColor             AAColorWithRGB(63, 153,231,1)

@interface OnlyRefreshChartDataVC ()<AAChartViewDidFinishLoadDelegate> {
    NSTimer *_timer;
    int myBasicValue;
    int _selectedElementIndex;
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
    myBasicValue = 0;
    _selectedElementIndex = arc4random()%2;
}

- (AAChartType)configureTheChartType {
    switch (self.chartType) {
        case 0: return AAChartTypeColumn;
        case 1: return AAChartTypeBar;
        case 2: return AAChartTypeArea;
        case 3: return AAChartTypeAreaspline;
        case 4: return AAChartTypeLine;
        case 5: return AAChartTypeSpline;
        case 6: return AAChartTypeLine;
        case 7: return AAChartTypeArea;
        case 8: return AAChartTypeScatter;
    }
}

- (void)setUpTheView {
    for (int i = 0; i<4; i++) {
        NSArray *titleNameArr = @[
                                  @"Click to update whole chart data",
                                  @"Click to hide whole data content",
                                  @"Show one element of data array",
                                  @"Hide one element of data array"];
        
        UIButton *btn = [UIButton buttonWithType:UIButtonTypeCustom];
        btn.center = CGPointMake(self.view.center.x, self.view.frame.size.height-40*i-30);
        btn.bounds = CGRectMake(0, 0, self.view.frame.size.width-40, 30);
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
    
    self.chartView = [[AAChartView alloc]initWithFrame:CGRectMake(0, 60, self.view.frame.size.width, self.view.frame.size.height-250)];
    self.chartView.delegate = self;
    self.view.backgroundColor = [UIColor whiteColor];
    [self.view addSubview:self.chartView];

    self.chartModel= AAObject(AAChartModel)
    .chartTypeSet([self configureTheChartType])//图表类型随机
    .xAxisVisibleSet(true)
    .yAxisVisibleSet(false)
    .titleSet(@"")
    .subtitleSet(@"")
    .yAxisTitleSet(@"摄氏度")
    .colorsThemeSet(@[@"#1e90ff",@"#dc143c"]);
    
    NSDictionary *gradientColorDic1 =
    @{
      @"linearGradient": @{
              @"x1": @0,
              @"y1": @0,
              @"x2": @0,
              @"y2": @1
              },
      @"stops": @[@[@0,@"#8A2BE2"],
                  @[@1,@"#1E90FF"]]//颜色字符串设置支持十六进制类型和 rgba 类型
      };
    
    
    NSDictionary *gradientColorDic2 =
    @{
      @"linearGradient": @{
              @"x1": @0,
              @"y1": @1,
              @"x2": @0,
              @"y2": @0
              },
      @"stops": @[@[@0,@"rgba(255,140,0,0.2)"],
                  @[@1,@"rgba(220,20,60,1)"]]//颜色字符串设置支持十六进制类型和 rgba 类型
      };
    
    if (self.chartType == OnlyRefreshChartDataVCChartTypeStepArea
        || self.chartType == OnlyRefreshChartDataVCChartTypeStepLine) {
        
        self.chartModel
        .gradientColorEnabledSet(true)
        .markerRadiusSet(@0)
        .seriesSet(@[
                     AAObject(AASeriesElement)
                     .nameSet(@"2017")
                     .dataSet(@[@7.0, @6.9, @9.5, @14.5, @18.2, @21.5, @25.2, @26.5, @23.3, @18.3, @13.9, @9.6])
                     .colorSet((id)gradientColorDic1)
                     .stepSet((id)@(true))
                     ,
                     AAObject(AASeriesElement)
                     .nameSet(@"2018")
                     .dataSet(@[@0.2, @0.8, @5.7, @11.3, @17.0, @22.0, @24.8, @24.1, @20.1, @14.1, @8.6, @2.5])
                     .colorSet((id)gradientColorDic2)
                     .stepSet((id)@(true))
                     ,
                     ]
                   );
    } else {
        NSMutableArray *sinNumArr = [[NSMutableArray alloc]init];
        NSMutableArray *sinNumArr2 = [[NSMutableArray alloc]init];
        CGFloat y1 = 0.f;
        CGFloat y2 = 0.f;
        //第一个波纹的公式
        for (float x = 0.f; x <= 50 ; x++) {
            y1 = sin((10) * (x * M_PI / 180)) +x*2*0.01 ;
            [sinNumArr addObject:@(y1)];
            y2 =cos((10) * (x * M_PI / 180))+x*3*0.01;
            [sinNumArr2 addObject:@(y2)];
        }
        self.chartModel.seriesSet(@[
                                    AAObject(AASeriesElement)
                                    .nameSet(@"2017")
                                    .dataSet(sinNumArr)
                                    .colorSet((id)gradientColorDic1)
                                    ,
                                    AAObject(AASeriesElement)
                                    .nameSet(@"2018")
                                    .dataSet(sinNumArr2)
                                    .colorSet((id)gradientColorDic2)
                                    ,
                                    ]
                                  );
    }
    [self.chartView aa_drawChartWithChartModel:self.chartModel];
}

- (void)oneOfTwoButtonsClicked:(UIButton *)sender {
    //关闭定时器
    [_timer setFireDate:[NSDate distantFuture]];
    if (sender.tag == 0) {
        [self virtualUpdateTheChartViewDataInRealTime];
    } else if (sender.tag == 1){
        self.chartView.chartSeriesHidden = YES;
    } else if (sender.tag == 2) {
        [self.chartView aa_showTheSeriesElementContentWithSeriesElementIndex:_selectedElementIndex];
    } else {
        [self.chartView aa_hideTheSeriesElementContentWithSeriesElementIndex:_selectedElementIndex];
    }
}

- (void)virtualUpdateTheChartViewDataInRealTime {
    _timer = [NSTimer scheduledTimerWithTimeInterval:1 target:self selector:@selector(timerStartWork) userInfo:nil repeats:YES];
     [_timer fire];
}

- (void)timerStartWork{
    [self onlyRefreshTheChartData];
}

- (void)onlyRefreshTheChartData {

    NSMutableArray *sinNumArr = [[NSMutableArray alloc]init];
    NSMutableArray *sinNumArr2 = [[NSMutableArray alloc]init];
    CGFloat y1 = 0.f;
    CGFloat y2 = 0.f;
    int Q = arc4random()%30;
    for (float x = myBasicValue; x <= myBasicValue + 50 ; x++) {
          //第一个波纹的公式
        y1 = sin((Q) * (x * M_PI / 180)) +x*2*0.01-1 ;
        [sinNumArr addObject:@(y1)];
          //第二个波纹的公式
        y2 =cos((Q) * (x * M_PI / 180))+x*3*0.01-1;
        [sinNumArr2 addObject:@(y2)];
    }
    myBasicValue = myBasicValue +1;
    if (myBasicValue == 32) {
        myBasicValue = 0;
    }
    
    NSArray *series = @[
                        @{@"name":@"2017",
                          @"type":@"bar",
                          @"data":sinNumArr},
                        @{@"name":@"2018",
                          @"type":@"line",
                          @"data":sinNumArr2},
                        ];
    
    [self.chartView aa_onlyRefreshTheChartDataWithChartModelSeries:series];
    NSLog(@"Updated the chart data content!!! ☺️☺️☺️");
}

# pragma mark AAChartViewDidFinishLoadDelegate
- (void)AAChartViewDidFinishLoad {
    NSLog(@"AAChartView 内容已加载完成");
}

@end
