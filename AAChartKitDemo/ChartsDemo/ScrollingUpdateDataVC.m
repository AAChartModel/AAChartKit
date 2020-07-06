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

@property (nonatomic, strong) NSTimer *timer;

@end

@implementation ScrollingUpdateDataVC

- (void)viewDidLoad {
    [super viewDidLoad];
    
    __weak __typeof__(self) weakSelf = self;
    [self.aaChartView didFinishLoadHandler:^(AAChartView *aaChartView) {
        [weakSelf setupTimer];
    }];
}

- (AAChartType)configureChartType {
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


- (id)chartConfigurationWithSelectedIndex:(NSUInteger)selectedIndex {
    AAChartModel *aaChartModel = AAChartModel.new
    .chartTypeSet([self configureChartType])
    .tooltipEnabledSet(true)
    .yAxisGridLineWidthSet(@0)
    .borderRadiusSet(@8)
    .stackingSet(AAChartStackingTypeNormal)
    .dataLabelsEnabledSet(false)
    .zoomTypeSet(AAChartZoomTypeX)
    .seriesSet([self configureChartSeriesArray]);
    
    if (aaChartModel.chartType != AAChartTypeColumn && aaChartModel.chartType != AAChartTypeBar) {
        aaChartModel
        .markerRadiusSet(@9)
        .markerSymbolStyleSet(AAChartSymbolStyleTypeBorderBlank);
    }
    
    AAOptions *aaOptions = [AAOptionsConstructor configureChartOptionsWithAAChartModel:aaChartModel];
    if (aaChartModel.chartType == AAChartTypeColumn) {
        aaOptions.plotOptions.column
        .groupPaddingSet(@0);
    } else if (aaChartModel.chartType == AAChartTypeBar) {
        aaOptions.plotOptions.bar
        .groupPaddingSet(@0);
    }
    
    return aaOptions;
}

- (NSArray *)configureChartSeriesArray {
    NSMutableArray *sinNumArr = [[NSMutableArray alloc]init];
    NSMutableArray *sinNumArr2 = [[NSMutableArray alloc]init];
    CGFloat y1 = 0.f;
    CGFloat y2 = 0.f;
    
    _x = 18;

    for (float x = 0.f; x <= _x ; x++) {
        //第一个波纹的公式
        y1 = sin((10) * (x * M_PI / 180)) + x * 1 * 0.00005 ;
        [sinNumArr addObject:@(y1)];
        //第二个波纹的公式
        y2 =cos((10) * (x * M_PI / 180)) + x * 2 * 0.00005;
        [sinNumArr2 addObject:@(y2)];
    }
    
    
    AASeriesElement *element0 = AASeriesElement.new
    .nameSet(@"2017")
    .dataSet(sinNumArr)
    .colorSet((id)[AAGradientColor deepSeaColor]);
    
    AASeriesElement *element1 = AASeriesElement.new
    .nameSet(@"2018")
    .dataSet(sinNumArr2)
    .colorSet((id)[AAGradientColor sanguineColor]);
    
    AASeriesElement *element2 = AASeriesElement.new
    .nameSet(@"2019")
    .dataSet(sinNumArr)
    .colorSet((id)[AAGradientColor wroughtIronColor]);
    
    AASeriesElement *element3 = AASeriesElement.new
    .nameSet(@"2020")
    .dataSet(sinNumArr2)
    .colorSet((id)[AAGradientColor pixieDustColor]);
    
    NSArray *seriesArr = @[element0,element1,element2,element3,];
    
    seriesArr = [self setupStepChartSeriesElementWithSeriesArr:seriesArr];
    return seriesArr;
}


- (void)setupTimer {
    dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(1.3 * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
        _timer = [NSTimer scheduledTimerWithTimeInterval:0.8 repeats:YES block:^(NSTimer * _Nonnull timer) {
            [self timerRepeatWork];
        }];
         [_timer fire];
    });
}

- (void)timerRepeatWork {
    NSLog(@"⚡️⚡️⚡️滚动刷新!!!");
    
    _x = _x + 1;
    
    //第一个波纹的公式
    CGFloat y0 = sin((10) * (_x * M_PI / 180)) + _x * 1 * 0.00005 ;
    //第二个波纹的公式
    CGFloat y1 = cos((10) * (_x * M_PI / 180)) + _x * 2 * 0.00005;
    
    // options 支持 NSNuber, NSArray 和 AADataElement 三种类型
    id options0;
    id options1;
    id options2;
    id options3;
    
    if (self.selectedIndex != 0 //柱状图
        && self.selectedIndex != 1 //条形图
        ) {
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
        
        options2 = AADataElement.new
             .ySet(@(y0))
             .dataLabelsSet(AADataLabels.new
                            .colorSet(@"grey")
                            .formatSet(@"{y:.2f} 欧元"))
             .markerSet(AAMarker.new
                        .radiusSet(@8)//曲线连接点半径
                        .symbolSet(AAChartSymbolTypeSquare)//曲线点类型："circle", "square", "diamond", "triangle","triangle-down"，默认是"circle"
                        .fillColorSet(AAColor.whiteColor)//点的填充色(用来设置折线连接点的填充色)
                        .lineWidthSet(@5)//外沿线的宽度(用来设置折线连接点的轮廓描边的宽度)
                        //外沿线的颜色(用来设置折线连接点的轮廓描边颜色，当值为空字符串时，默认取数据点或数据列的颜色)
                        .lineColorSet(@"grey")
                        );
             
             options3 = AADataElement.new
             .ySet(@(y1))
             .dataLabelsSet(AADataLabels.new
                            .colorSet(@"SpringGreen")
                            .formatSet(@"{y:.2f} 日元"))
             .markerSet(AAMarker.new
                        .radiusSet(@8)//曲线连接点半径
                        .symbolSet(AAChartSymbolTypeTriangle)//曲线点类型："circle", "square", "diamond", "triangle","triangle-down"，默认是"circle"
                        .fillColorSet(AAColor.whiteColor)//点的填充色(用来设置折线连接点的填充色)
                        .lineWidthSet(@5)//外沿线的宽度(用来设置折线连接点的轮廓描边的宽度)
                        //外沿线的颜色(用来设置折线连接点的轮廓描边颜色，当值为空字符串时，默认取数据点或数据列的颜色)
                        .lineColorSet(@"SpringGreen")
                        );
    } else {
        options0 = @(y0);
        options1 = @(y1);
        options2 = @(y0);
        options3 = @(y1);
    }
    
//    .colorsThemeSet(@[@"#fe117c",@"#ffc069",@"#06caf4",@"#7dffc0"])//设置主题颜色数组


    [self.aaChartView aa_addPointsToChartSeriesArrayWithOptionsArray:@[options0, options1,options2, options3]];
}

- (NSArray *)setupStepChartSeriesElementWithSeriesArr:(NSArray *)seriesArr {
    if (self.selectedIndex == 6 //直方折线图
        || self.selectedIndex == 7 //直方折线填充图
        ) {
        [seriesArr enumerateObjectsUsingBlock:^(id  _Nonnull obj, NSUInteger idx, BOOL * _Nonnull stop) {
            AASeriesElement *element = obj;
            element.step = @true;
        }];
    }
    return seriesArr;
}

- (void)viewWillDisappear:(BOOL)animated {
    [super viewWillDisappear:animated];
    [_timer invalidate];
    _timer = nil;
}


@end
