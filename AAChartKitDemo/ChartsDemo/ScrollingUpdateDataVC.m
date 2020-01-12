//
//  ScrollingUpdateDataVC.m
//  AAChartKitDemo
//
//  Created by AnAn on 2019/11/9.
//  Copyright © 2019 AnAn. All rights reserved.
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

#import "ScrollingUpdateDataVC.h"
#import "AAChartKit.h"

@interface ScrollingUpdateDataVC ()<AAChartViewEventDelegate> {
    CGFloat _x;
}

@property (nonatomic, strong) AAChartModel *chartModel;
@property (nonatomic, strong) AAChartView  *chartView;
@property (nonatomic, strong) NSTimer *timer;

@end

@implementation ScrollingUpdateDataVC

- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor = [UIColor whiteColor];
    [self setupChartView];
}

- (AAChartType)configureChartType {
    switch (_chartType) {
        case ScrollingUpdateDataVCChartTypeColumn: return AAChartTypeColumn;
        case ScrollingUpdateDataVCChartTypeBar: return AAChartTypeBar;
        case ScrollingUpdateDataVCChartTypeArea: return AAChartTypeArea;
        case ScrollingUpdateDataVCChartTypeAreaspline: return AAChartTypeAreaspline;
        case ScrollingUpdateDataVCChartTypeLine: return AAChartTypeLine;
        case ScrollingUpdateDataVCChartTypeSpline: return AAChartTypeSpline;
        case ScrollingUpdateDataVCChartTypeStepLine: return AAChartTypeLine;
        case ScrollingUpdateDataVCChartTypeStepArea: return AAChartTypeArea;
        case ScrollingUpdateDataVCChartTypeScatter: return AAChartTypeScatter;
    }
}


- (void)setupChartView {
    CGFloat chartViewWidth  = self.view.frame.size.width;
    CGFloat screenHeight = self.view.frame.size.height;
    CGRect frame = CGRectMake(0, 60, chartViewWidth, screenHeight - 60);
    AAChartView *aaChartView = [[AAChartView alloc]initWithFrame:frame];
    aaChartView.scrollEnabled = NO;
    aaChartView.delegate = self;
    [self.view addSubview:aaChartView];
    self.chartView = aaChartView;

    AAChartModel *aaChartModel = AAChartModel.new
    .chartTypeSet([self configureChartType])
    .titleSet(@"")
    .yAxisTitleSet(@"")
    .tooltipEnabledSet(true)
    .yAxisGridLineWidthSet(@0)
    .borderRadiusSet(@8)
//    .stackingSet(AAChartStackingTypeNormal)
    .dataLabelsEnabledSet(false)
//    .yAxisMaxSet(@1.3)
//    .yAxisMinSet(@-1.0)
    .zoomTypeSet(AAChartZoomTypeX)
    .seriesSet([self configureChartSeriesArray]);
    
    if (self.chartType != ScrollingUpdateDataVCChartTypeColumn && self.chartType != ScrollingUpdateDataVCChartTypeBar) {
        aaChartModel
        .markerRadiusSet(@9)
        .markerSymbolStyleSet(AAChartSymbolStyleTypeBorderBlank);
    }
    
    self.chartModel = aaChartModel;
    
    AAOptions *aaOptions = [AAOptionsConstructor configureChartOptionsWithAAChartModel:self.chartModel];
    if (aaChartModel.chartType == AAChartTypeColumn) {
            aaOptions.plotOptions.column
        .pointPaddingSet(@0)
        .groupPaddingSet(@0);
    } else if (aaChartModel.chartType == AAChartTypeBar) {
          aaOptions.plotOptions.bar
        .pointPaddingSet(@0)
        .groupPaddingSet(@0);
    }

    
    [aaChartView aa_drawChartWithOptions:aaOptions];
        
//    [aaChartView aa_drawChartWithChartModel:aaChartModel];
}

- (NSArray *)configureChartSeriesArray {
    NSMutableArray *sinNumArr = [[NSMutableArray alloc]init];
    NSMutableArray *sinNumArr2 = [[NSMutableArray alloc]init];
    CGFloat y1 = 0.f;
    CGFloat y2 = 0.f;
    
    _x = 12;

    for (float x = 0.f; x <= _x ; x++) {
        //第一个波纹的公式
        y1 = sin((10) * (x * M_PI / 180)) + x * 1 * 0.00005 ;
        [sinNumArr addObject:@(y1)];
        //第二个波纹的公式
        y2 =cos((10) * (x * M_PI / 180)) + x * 2 * 0.00005;
        [sinNumArr2 addObject:@(y2)];
    }
    
    
    AASeriesElement *element1 = AASeriesElement.new
    .nameSet(@"2017")
    .dataSet(sinNumArr)
    .colorSet((id)[AAGradientColor deepSeaColor]);
    
    AASeriesElement *element2 = AASeriesElement.new
    .nameSet(@"2018")
    .dataSet(sinNumArr2)
    .colorSet((id)[AAGradientColor sanguineColor]);
    
    NSArray *seriesDataArr = @[element1,element2];
    
    seriesDataArr = [self setupStepChartSeriesElementWithSeriesDataArr:seriesDataArr];
    return seriesDataArr;
}

-(void)aaChartViewDidFinishLoad:(AAChartView *)aaChartView {
//    [self changeXAxisExtremes];
    
    [self setupTimer];
}

- (void)setupTimer {
    _timer = [NSTimer scheduledTimerWithTimeInterval:0.8
                                              target:self
                                            selector:@selector(timerStartWork)
                                            userInfo:nil
                                             repeats:YES];
     [_timer fire];
}

- (void)timerStartWork {
    _timer = [NSTimer timerWithTimeInterval:1
                                    repeats:YES
                                      block:^(NSTimer * _Nonnull timer) {
        NSLog(@"⚡️⚡️⚡️滚动刷新!!!");
        
        _x = _x + 1;
        
        //第一个波纹的公式
        CGFloat y0 = sin((10) * (_x * M_PI / 180)) + _x * 1 * 0.00005 ;
        //第二个波纹的公式
        CGFloat y1 = cos((10) * (_x * M_PI / 180)) + _x * 2 * 0.00005;
        
        // options 支持 NSNuber, NSArray 和 AADataElement 三种类型
        id options0 = @(y0);
        id options1 = @(y1);
        
        if (self.chartType != ScrollingUpdateDataVCChartTypeColumn && self.chartType != ScrollingUpdateDataVCChartTypeBar) {
            options0 = AADataElement.new
            .ySet(@(y0))
            .dataLabelsSet(AADataLabels.new
                           .colorSet(@"deepskyblue")
                           .formatSet(@"{y:.2f} 英镑"))
            .markerSet(AAMarker.new
                       .radiusSet(@8)//曲线连接点半径
                       .symbolSet(AAChartSymbolTypeDiamond)//曲线点类型："circle", "square", "diamond", "triangle","triangle-down"，默认是"circle"
                       .fillColorSet(AAColor.whiteColor)//点的填充色(用来设置折线连接点的填充色)
                       .lineWidthSet(@5)//外沿线的宽度(用来设置折线连接点的轮廓描边的宽度)
                       //外沿线的颜色(用来设置折线连接点的轮廓描边颜色，当值为空字符串时，默认取数据点或数据列的颜色)
                       .lineColorSet(@"deepskyblue")
                       );
            
            options1 = AADataElement.new
            .ySet(@(y1))
            .dataLabelsSet(AADataLabels.new
                           .colorSet(@"red")
                           .formatSet(@"{y:.2f} 美元"))
            .markerSet(AAMarker.new
                       .radiusSet(@8)//曲线连接点半径
                       .symbolSet(AAChartSymbolTypeCircle)//曲线点类型："circle", "square", "diamond", "triangle","triangle-down"，默认是"circle"
                       .fillColorSet(AAColor.whiteColor)//点的填充色(用来设置折线连接点的填充色)
                       .lineWidthSet(@5)//外沿线的宽度(用来设置折线连接点的轮廓描边的宽度)
                       //外沿线的颜色(用来设置折线连接点的轮廓描边颜色，当值为空字符串时，默认取数据点或数据列的颜色)
                       .lineColorSet(@"red")
                       );
        }
        
//        [self.chartView aa_addPointToChartSeriesElementWithElementIndex:0
//                                                                options:options0
//                                                                  shift:true];
//        [self.chartView aa_addPointToChartSeriesElementWithElementIndex:1
//                                                                options:options1
//                                                                  shift:true];
        
//        [self.chartView aa_addPointToChartSeriesElementWithElementIndex:0 options:options0 redraw:false shift:true animation:false];
//        [self.chartView aa_addPointToChartSeriesElementWithElementIndex:1 options:options1 redraw:false shift:true animation:false];
//        [self.chartView aa_redrawWithAniamtion:true];
        [self.chartView aa_addPointsToChartSeriesArrayWithoptionsArray:@[options0,options1]];
    }];
    
    [_timer fire];
}

- (NSArray *)setupStepChartSeriesElementWithSeriesDataArr:(NSArray *)seriesDataArr {
    if (self.chartType == ScrollingUpdateDataVCChartTypeStepLine
        || self.chartType == ScrollingUpdateDataVCChartTypeStepArea) {
        [seriesDataArr enumerateObjectsUsingBlock:^(id  _Nonnull obj, NSUInteger idx, BOOL * _Nonnull stop) {
            AASeriesElement *element = obj;
            element.step = @true;
        }];
    }
    return seriesDataArr;
}

- (void)changeXAxisExtremes {
    NSString *jsFunc = @AAJSFunc((aaGlobalChart.xAxis[0].setExtremes(0, 8);));
    [self.chartView aa_evaluateJavaScriptStringFunction:jsFunc];
}



- (void)dealloc {
    if (_timer) {
        if ([_timer isValid]) {
            [_timer invalidate];
            _timer = nil;
        }
    }
}

@end
