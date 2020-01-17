
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
 * JianShu       : https://www.jianshu.com/u/f1e6753d4254
 * SegmentFault  : https://segmentfault.com/u/huanghunbieguan
 *
 * -------------------------------------------------------------------------------
 
 */

#import "OnlyRefreshChartDataVC.h"
#import "AAChartKit.h"

#define AAColorWithRGB(r,g,b,a) [UIColor colorWithRed:(r)/255.0f green:(g)/255.0f blue:(b)/255.0f alpha:(a)]
#define AAGrayColor             [UIColor colorWithRed:245/255.0 green:246/255.0 blue:247/255.0 alpha:1.0]
#define AABlueColor             AAColorWithRGB(63, 153,231,1)

@interface OnlyRefreshChartDataVC ()<AAChartViewEventDelegate> {
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
    myBasicValue = 0;
    _selectedElementIndex = arc4random()%2;
    
    [self setUpBasicViews];
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

- (void)setUpBasicViews {
    [self setUpChartView];
    [self setUpChartModel];
    
    AAOptions *aaOptions = [AAOptionsConstructor configureChartOptionsWithAAChartModel:self.chartModel];
    if (self.chartModel.chartType == AAChartTypeColumn) {
        aaOptions.plotOptions.column.groupPadding = @0;
    } else if (self.chartModel.chartType == AAChartTypeBar) {
        aaOptions.plotOptions.bar.groupPadding = @0;
    }
    
    [self.chartView aa_drawChartWithOptions:aaOptions];
    
    [self virtualUpdateTheChartViewDataInRealTime];
}


- (void)setUpChartView {
    CGRect frame = CGRectMake(0,
                              60,
                              self.view.frame.size.width,
                              self.view.frame.size.height - 60);
    self.chartView = [[AAChartView alloc]initWithFrame:frame];
    self.chartView.delegate = self;
    self.view.backgroundColor = [UIColor whiteColor];
    [self.view addSubview:self.chartView];
}


- (void)setUpChartModel {
    AAChartModel *aaChartModel = [self configureChartModelBasicContent];
    NSArray *seriesArr = [self configureChartSeriesArray];
    aaChartModel.series = seriesArr;
    self.chartModel = aaChartModel;
}

- (AAChartModel *) configureChartModelBasicContent {
    NSDictionary *gradientColorDic1 =
    [AAGradientColor gradientColorWithDirection:AALinearGradientDirectionToBottom
                               startColorString:@"rgba(138,43,226,1)"
                                 endColorString:@"rgba(30,144,255,1)"];
    
    NSDictionary *gradientColorDic2 =
    [AAGradientColor gradientColorWithDirection:AALinearGradientDirectionToBottom
                               startColorString:@"#00BFFF"
                                 endColorString:@"#00FA9A"];
    
     return  AAChartModel.new
    .chartTypeSet([self configureTheChartType])//图表类型随机
    .xAxisVisibleSet(true)
    .yAxisVisibleSet(false)
    .titleSet(@"")
    .subtitleSet(@"")
    .yAxisTitleSet(@"摄氏度")
    .stackingSet(AAChartStackingTypeNormal)
    .colorsThemeSet(@[
        gradientColorDic1,
        gradientColorDic2,
        AAGradientColor.sanguineColor,
        AAGradientColor.wroughtIronColor
    ])
    ;
}

- (NSArray *)configureChartSeriesArray {
    NSArray *seriesDataArr = [self configureSeries];
    seriesDataArr = [self setupStepChartSeriesElementWithSeriesDataArr:seriesDataArr];
    return seriesDataArr;
}

- (NSArray *)setupStepChartSeriesElementWithSeriesDataArr:(NSArray *)seriesDataArr {
    if (self.chartType == OnlyRefreshChartDataVCChartTypeStepArea
        || self.chartType == OnlyRefreshChartDataVCChartTypeStepLine) {
        [seriesDataArr enumerateObjectsUsingBlock:^(id  _Nonnull obj, NSUInteger idx, BOOL * _Nonnull stop) {
            AASeriesElement *element = obj;
            element.step = @true;
        }];
    }
    return seriesDataArr;
}

- (void)virtualUpdateTheChartViewDataInRealTime {
    _timer = [NSTimer scheduledTimerWithTimeInterval:1
                                              target:self
                                            selector:@selector(timerStartWork)
                                            userInfo:nil
                                             repeats:YES];
     [_timer fire];
}

- (void)timerStartWork{
    [self onlyRefreshTheChartData];
}

- (NSArray *)configureSeries {
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
        AASeriesElement.new
        .dataSet(sinNumArr),
        AASeriesElement.new
        .dataSet(sinNumArr2),
        AASeriesElement.new
        .dataSet(sinNumArr),
        AASeriesElement.new
        .dataSet(sinNumArr2),
    ];
    return series;
}

- (void)onlyRefreshTheChartData {
    [self.chartView aa_onlyRefreshTheChartDataWithChartModelSeries:[self configureSeries]
                                                         animation:true];
    NSLog(@"Updated the chart data content!!! ☺️☺️☺️");
}

# pragma mark AAChartViewDidFinishLoadDelegate
- (void)AAChartViewDidFinishLoad {
    NSLog(@"AAChartView 内容已加载完成");
}

@end
