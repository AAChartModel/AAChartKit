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
 * StackOverflow : https://stackoverflow.com/users/7842508/codeforu
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

@property (nonatomic, strong) AAChartModel *chartModel;
@property (nonatomic, strong) AAChartView  *chartView;

@end

@implementation DrawableChartVC

- (void)viewDidLoad {
    [super viewDidLoad];
    myBasicValue = 0;
    
    AAChartView *aaChartView = [self setupChartView];
    AAOptions *aaOptions = [self setupChartOtions];
    
    [aaChartView aa_drawChartWithOptions:aaOptions];
}

- (AAChartType)configureChartType {
    switch (_chartType) {
        case DrawableChartVCChartTypeColumn: return AAChartTypeColumn;
        case DrawableChartVCChartTypeBar: return AAChartTypeBar;
        case DrawableChartVCChartTypeArea: return AAChartTypeArea;
        case DrawableChartVCChartTypeAreaspline: return AAChartTypeAreaspline;
        case DrawableChartVCChartTypeLine: return AAChartTypeLine;
        case DrawableChartVCChartTypeSpline: return AAChartTypeSpline;
        case DrawableChartVCChartTypeStepLine: return AAChartTypeLine;
        case DrawableChartVCChartTypeStepArea: return AAChartTypeArea;
        case DrawableChartVCChartTypeScatter: return AAChartTypeScatter;
    }
}

- (AAChartView *)setupChartView {
    CGRect chartViewFrame = CGRectMake(0,
                                       88,
                                       self.view.frame.size.width,
                                       self.view.frame.size.height - 88);
    AAChartView *aaChartView = [[AAChartView alloc]initWithFrame:chartViewFrame];
    self.view.backgroundColor = [UIColor whiteColor];
    [self configureChartViewTypeWithChartView:aaChartView];
    [self.view addSubview:aaChartView];
    
    return aaChartView;
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

- (AAOptions *) setupChartOtions {
    NSDictionary *gradientColorDic1 =
    [AAGradientColor gradientColorWithDirection:AALinearGradientDirectionToBottom
                               startColorString:@"rgba(138,43,226,1)"
                                 endColorString:@"rgba(30,144,255,1)"];
    
    NSDictionary *gradientColorDic2 =
    [AAGradientColor gradientColorWithDirection:AALinearGradientDirectionToBottom
                               startColorString:@"#00BFFF"
                                 endColorString:@"#00FA9A"];
    
    AAChartModel *aaChartModel =  AAChartModel.new
    .chartTypeSet([self configureChartType])//图表类型随机
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
    
    AAOptions *aaOptions = [AAOptionsConstructor configureChartOptionsWithAAChartModel:aaChartModel];
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
