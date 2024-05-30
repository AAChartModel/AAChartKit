//
//  DrawableChartVC.m
//  AAChartKitDemo
//
//  Created by AnAn on 2020/2/4.
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
 * StackOverflow : https://stackoverflow.com/users/12302132/codeforu
 * JianShu       : https://www.jianshu.com/u/f1e6753d4254
 * SegmentFault  : https://segmentfault.com/u/huanghunbieguan
 *
 * -------------------------------------------------------------------------------
 
 */

#import "DrawableChartVC.h"
#import "AAChartKit.h"

@interface DrawableChartVC () {
    int myBasicValue;
}

@end

@implementation DrawableChartVC

- (void)viewDidLoad {
    [super viewDidLoad];
    myBasicValue = 0;
    
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
        case 9: return AAChartTypePie;
    }
    return AAChartTypeColumn;
}

- (id)chartConfigurationWithSelectedIndex:(NSUInteger)selectedIndex {
    self.selectedIndex = selectedIndex;
    
    if (selectedIndex == 6) {
        self.chartType = DrawableChartVCChartTypeStepLine;
    } else if (selectedIndex == 7) {
        self.chartType = DrawableChartVCChartTypeStepArea;
    }
    
    AAChartType chartType = [self configureChartType];
    return [self setupChartOtionsWithChartType:chartType];
}


- (void)configureChartViewTypeWithChartView:(AAChartView *)chartView {
    if (self.type == DrawableChartVCTypeUpdateXAxsiExtremes) {
        chartView.scrollEnabled = NO;
//        [chartView didFinishLoadHandler:^(AAChartView *aaChartView) {
//            NSLog(@"✈️✈️✈️✈️✈️ AAChartView content did finish load!!!");
//            [aaChartView aa_updateXAxisExtremesWithMin:0 max:5];
//        }];
    } else if (self.type == DrawableChartVCTypeChangeChartViewContentSize) {
        chartView.scrollEnabled = true;
        if (self.chartType == DrawableChartVCChartTypeBar) {
            chartView.contentHeight = self.view.frame.size.width * 5;
        } else {
            chartView.contentWidth = self.view.frame.size.width * 5;
        }
    }
}

- (AAOptions *)setupChartOtionsWithChartType:(AAChartType)chartType {
    NSDictionary *gradientColorDic1 =
    [AAGradientColor gradientColorWithDirection:AALinearGradientDirectionToBottom
                               startColorString:@"rgba(138,43,226,1)"
                                 endColorString:@"rgba(30,144,255,1)"];
    
    NSDictionary *gradientColorDic2 =
    [AAGradientColor gradientColorWithDirection:AALinearGradientDirectionToBottom
                               startColorString:@"#00BFFF"
                                 endColorString:@"#00FA9A"];
    
    AAChartModel *aaChartModel =  AAChartModel.new
    .chartTypeSet(chartType)//图表类型随机
    .xAxisVisibleSet(true)
    .yAxisTitleSet(@"摄氏度")
    .stackingSet(AAChartStackingTypeNormal)
    .scrollablePlotAreaSet(
        AAScrollablePlotArea.new
        .minWidthSet(@6000)
        .scrollPositionXSet(@0))
    .colorsThemeSet(@[
        gradientColorDic1,
        gradientColorDic2,
        AAGradientColor.sanguineColor,
        AAGradientColor.wroughtIronColor
    ])
    .seriesSet([self configureSeries])
    ;
    
    if (aaChartModel.chartType == AAChartTypeBar) {
        aaChartModel
        .scrollablePlotAreaSet(
             AAScrollablePlotArea.new
             .minHeightSet(@6000)
             .scrollPositionYSet(@1)
                               );
    }
    
    if (self.type == DrawableChartVCTypeUpdateXAxsiExtremes) {
        aaChartModel.zoomType = AAChartZoomTypeX;//‼️‼️ Important property for supportting drawable chart 重要属性,需要支持 X 轴横向滚动
        aaChartModel.yAxisVisible = true;
    } else {
        aaChartModel.yAxisVisible = false;
    }
    
    AAOptions *aaOptions = aaChartModel.aa_toAAOptions;
    aaOptions.tooltip.followTouchMove = false;
    aaOptions.xAxis.minRange = @2;
    return aaOptions;
}

- (NSArray *)configureSeries {
    NSMutableArray *sinNumArr = [[NSMutableArray alloc]init];
    NSMutableArray *sinNumArr2 = [[NSMutableArray alloc]init];
    CGFloat y1 = 0.f;
    CGFloat y2 = 0.f;
    int Q = arc4random()%30;
    for (float x = myBasicValue; x <= myBasicValue + 280 ; x++) {
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
    
    NSArray *seriesArr = @[
        AASeriesElement.new
        .dataSet(sinNumArr),
        AASeriesElement.new
        .dataSet(sinNumArr2),
        AASeriesElement.new
        .dataSet(sinNumArr),
        AASeriesElement.new
        .dataSet(sinNumArr2),
    ];
    
    return [self setupStepChartSeriesElementWithSeriesArr:seriesArr];
}

- (NSArray *)setupStepChartSeriesElementWithSeriesArr:(NSArray *)seriesArr {
    if (self.chartType == DrawableChartVCChartTypeStepLine
        || self.chartType == DrawableChartVCChartTypeStepArea) {
        [seriesArr enumerateObjectsUsingBlock:^(id  _Nonnull obj, NSUInteger idx, BOOL * _Nonnull stop) {
            AASeriesElement *element = obj;
            element.step = @true;
        }];
    }
    return seriesArr;
}


@end
