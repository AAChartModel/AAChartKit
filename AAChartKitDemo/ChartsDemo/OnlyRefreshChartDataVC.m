
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

@interface OnlyRefreshChartDataVC ()<AAChartViewEventDelegate> {
    NSTimer *_timer;
    int globalIntenger;
}

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
    globalIntenger = 0;
    
    [self setupChartViewDidFinishLoadHandler];
    
}

- (AAChartType)configureTheChartType {
    switch (self.selectedIndex) {
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
    return nil;
}

- (void)setupChartViewDidFinishLoadHandler {
    __weak __typeof__(self) weakSelf = self;
    [self.aaChartView didFinishLoadHandler:^(AAChartView *aaChartView) {
        NSLog(@"AAChartView 内容已加载完成");
        [weakSelf virtualUpdateTheChartViewDataInRealTime];
    }];
}


- (id)chartConfigurationWithSelectedIndex:(NSUInteger)selectedIndex {
    NSDictionary *gradientColorDic1 =
    [AAGradientColor gradientColorWithDirection:AALinearGradientDirectionToBottom
                               startColorString:@"rgba(138,43,226,1)"
                                 endColorString:@"rgba(30,144,255,1)"];
    
    NSDictionary *gradientColorDic2 =
    [AAGradientColor gradientColorWithDirection:AALinearGradientDirectionToBottom
                               startColorString:@"#00BFFF"
                                 endColorString:@"#00FA9A"];
    
     AAChartModel *aaChartModel = AAChartModel.new
    .chartTypeSet([self configureTheChartType])//图表类型随机
    .xAxisVisibleSet(true)
    .yAxisVisibleSet(false)
    .yAxisTitleSet(@"摄氏度")
    .stackingSet(AAChartStackingTypeNormal)
    .colorsThemeSet(@[
        gradientColorDic1,
        gradientColorDic2,
        AAGradientColor.sanguineColor,
        AAGradientColor.wroughtIronColor
    ])
    .seriesSet([self configureSeries])
    ;
    
    AAOptions *aaOptions = [AAOptionsConstructor configureChartOptionsWithAAChartModel:aaChartModel];
      if (aaChartModel.chartType == AAChartTypeColumn) {
          aaOptions.plotOptions.column.groupPadding = @0;
      } else if (aaChartModel.chartType == AAChartTypeBar) {
          aaOptions.plotOptions.bar.groupPadding = @0;
      }
    return aaOptions;
}

- (NSArray *)configureChartSeriesArray {
    NSArray *seriesDataArr = [self configureSeries];
    seriesDataArr = [self setupStepChartSeriesElementWithSeriesDataArr:seriesDataArr];
    return seriesDataArr;
}

- (NSArray *)setupStepChartSeriesElementWithSeriesDataArr:(NSArray *)seriesDataArr {
    if (self.selectedIndex == 6
        || self.selectedIndex == 7) {
        [seriesDataArr enumerateObjectsUsingBlock:^(id  _Nonnull obj, NSUInteger idx, BOOL * _Nonnull stop) {
            AASeriesElement *element = obj;
            element.step = @true;
        }];
    }
    return seriesDataArr;
}

- (void)virtualUpdateTheChartViewDataInRealTime {
    _timer = [NSTimer scheduledTimerWithTimeInterval:2
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
    for (float x = globalIntenger; x <= globalIntenger + 50 ; x++) {
          //第一个波纹的公式
        y1 = sin((Q) * (x * M_PI / 180)) +x*2*0.01-1 ;
        [sinNumArr addObject:@(y1)];
          //第二个波纹的公式
        y2 =cos((Q) * (x * M_PI / 180))+x*3*0.01-1;
        [sinNumArr2 addObject:@(y2)];
    }
    globalIntenger = globalIntenger +1;
    if (globalIntenger == 32) {
        globalIntenger = 0;
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
    [self.aaChartView aa_onlyRefreshTheChartDataWithChartModelSeries:[self configureSeries]
                                                         animation:true];
    NSLog(@"Updated the chart data content!!! ☺️☺️☺️");
}


@end
