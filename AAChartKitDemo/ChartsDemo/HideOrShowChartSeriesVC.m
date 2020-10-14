//
//  ChartSeriesHideOrShowVC.m
//  AAChartKitDemo
//
//  Created by AnAn on 2018/11/30.
//  Copyright © 2018 Danny boy. All rights reserved.
//*************** ............ SOURCE CODE ............ ***************
//***.............................................................  ***
//*** iOS     :https://github.com/AAChartModel/AAChartKit           ***
//*** iOS     :https://github.com/AAChartModel/AAChartKit-Swift     ***
//*** Android :https://github.com/AAChartModel/AAChartCore          ***
//*** Android :https://github.com/AAChartModel/AAChartCore-Kotlin   ***
//***...............................................................***
//*************** ............ SOURCE CODE ............ ***************

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

#import "HideOrShowChartSeriesVC.h"

@interface HideOrShowChartSeriesVC ()

@property (nonatomic, strong) AAChartModel *aaChartModel;
@property (nonatomic, strong) AAChartView  *aaChartView;

@end

@implementation HideOrShowChartSeriesVC

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.title = @"ChartSeriesHideOrShow";
    self.view.backgroundColor = UIColor.whiteColor;

    [self setUpSegmentedControls];
    [self setUpTheHideChartSeriesSwitch];
    
    [self setUpChartView];
    [self setUpTheChartModel];
    [self.aaChartView aa_drawChartWithChartModel:self.aaChartModel];
}

- (void)setUpChartView {
    CGFloat chartViewWidth  = self.view.frame.size.width;
    CGFloat chartViewHeight = self.view.frame.size.height - 220;
    self.aaChartView = [[AAChartView alloc]init];
    self.aaChartView.frame = CGRectMake(0, 60, chartViewWidth, chartViewHeight);
    self.aaChartView.scrollEnabled = NO;//禁用 AAChartView 滚动效果
    [self.view addSubview:self.aaChartView];
}

- (void)setUpTheChartModel {
    AAChartType chartType = [self configureChartType];
    
    self.aaChartModel = AAChartModel.new
    .chartTypeSet(chartType)//图表类型
    .animationTypeSet(AAChartAnimationBounce)
    .titleSet(@"CHART SERIES HIDE OR SHOW")//图表主标题
    .subtitleSet(@"2020/08/08")//图表副标题
    .colorsThemeSet(@[@"#fe117c",@"#ffc069",@"#06caf4",@"#7dffc0"])//设置主体颜色数组
    .tooltipValueSuffixSet(@"℃")//设置浮动提示框单位后缀
    .yAxisGridLineStyleSet([AALineStyle styleWithWidth:@0])//y轴横向分割线宽度为0(即是隐藏分割线)
    .stackingSet(AAChartStackingTypeNormal)
    .scrollablePlotAreaSet(
          AAScrollablePlotArea.new
          .minWidthSet(@3000)
          .scrollPositionXSet(@0))
    ;
    
    NSArray *seriesArr;
    if (   [chartType isEqualToString:AAChartTypeColumn]
        || [chartType isEqualToString:AAChartTypeBar] ) {
        seriesArr = @[
                      AASeriesElement.new
                      .nameSet(@"2017")
                      .dataSet(@[@7.0, @6.9, @9.5, @14.5, @18.2, @21.5, @25.2, @26.5, @23.3, @18.3, @13.9, @9.6]),
                      AASeriesElement.new
                      .nameSet(@"2018")
                      .dataSet(@[@0.2, @0.8, @5.7, @11.3, @17.0, @22.0, @24.8, @24.1, @20.1, @14.1, @8.6, @2.5]),
                      AASeriesElement.new
                      .nameSet(@"2019")
                      .dataSet(@[@0.9, @0.6, @3.5, @8.4, @13.5, @17.0, @18.6, @17.9, @14.3, @9.0, @3.9, @1.0]),
                      AASeriesElement.new
                      .nameSet(@"2020")
                      .dataSet(@[@3.9, @4.2, @5.7, @8.5, @11.9, @15.2, @17.0, @16.6, @14.2, @10.3, @6.6, @4.8]),
                      ];
    } else if (   [chartType isEqualToString:AAChartTypeLine]
               || [chartType isEqualToString:AAChartTypeSpline]
               || [chartType isEqualToString:AAChartTypeArea]
               || [chartType isEqualToString:AAChartTypeAreaspline]
               || [chartType isEqualToString:AAChartTypeScatter]) {
        self.aaChartModel.markerRadius = @(0);
        seriesArr = @[
                      AASeriesElement.new
                      .nameSet(@"Tokyo Hot")
                      .dataSet(@[@0.45, @0.43, @0.50, @0.55, @0.58, @0.62, @0.83, @0.39, @0.56, @0.67, @0.50, @0.34, @0.50, @0.67, @0.58, @0.29, @0.46, @0.23, @0.47, @0.46, @0.38, @0.56, @0.48, @0.36]),
                      AASeriesElement.new
                      .nameSet(@"Berlin Hot")
                      .dataSet(@[@0.38, @0.31, @0.32, @0.32, @0.64, @0.66, @0.86, @0.47, @0.52, @0.75, @0.52, @0.56, @0.54, @0.60, @0.46, @0.63, @0.54, @0.51, @0.58, @0.64, @0.60, @0.45, @0.36, @0.67]),
                      AASeriesElement.new
                      .nameSet(@"London Hot")
                      .dataSet(@[@0.46, @0.32, @0.53, @0.58, @0.86, @0.68, @0.85, @0.73, @0.69, @0.71, @0.91, @0.74, @0.60, @0.50, @0.39, @0.67, @0.55, @0.49, @0.65, @0.45, @0.64, @0.47, @0.63, @0.64]),
                      AASeriesElement.new
                      .nameSet(@"NewYork Hot")
                      .dataSet(@[@0.60, @0.51, @0.52, @0.53, @0.64, @0.84, @0.65, @0.68, @0.63, @0.47, @0.72, @0.60, @0.65, @0.74, @0.66, @0.65, @0.71, @0.59, @0.65, @0.77, @0.52, @0.53, @0.58, @0.53]),
                      ];
        if ([chartType isEqualToString:AAChartTypeScatter]) {
            self.aaChartModel.markerSymbolStyle = AAChartSymbolStyleTypeInnerBlank;
            self.aaChartModel.markerRadius = @6.0;
        }
    } else if (   [chartType isEqualToString:@"StepLineChart"]
        || [chartType isEqualToString:@"StepAreaChart"]) {
        if ([chartType isEqualToString:@"StepLineChart"]) {
            self.aaChartModel.chartType = AAChartTypeLine;
        } else {
            self.aaChartModel.chartType = AAChartTypeArea;
        }
        self.aaChartModel.stacking = AAChartStackingTypePercent;
        seriesArr = @[
                      AASeriesElement.new
                      .nameSet(@"2017")
                      .fillOpacitySet(@1.0)
                      .stepSet(@(true))
                      .dataSet(@[@2.73, @21.3, @41.6, @17.2, @19.9, @1.60, @2.10, @2.54, @2.78, @3.62, @4.41, @4.09, @3.83, @4.47, @4.20, @3.94, @3.80, @3.58, @3.19, @4.30, @3.69, @3.52, @3.02, @3.30]),
                      AASeriesElement.new
                      .nameSet(@"2018")
                      .fillOpacitySet(@1.0)
                      .stepSet(@(true))
                      .dataSet(@[@1.51, @28.7, @0.94, @1.44, @18.6, @1.63, @1.56, @1.91, @2.45, @3.87, @3.24, @4.90, @4.61, @4.10, @4.17, @3.85, @4.17, @3.46, @3.46, @3.55, @3.50, @4.13, @2.58, @2.28]),
                      AASeriesElement.new
                      .nameSet(@"2019")
                      .fillOpacitySet(@1.0)
                      .stepSet(@(true))
                      .dataSet(@[@1.33, @4.68, @1.31, @1.10, @13.9, @1.10, @1.16, @1.67, @2.64, @2.86, @3.00, @3.21, @4.14, @4.07, @3.68, @3.11, @3.41, @3.25, @3.32, @3.07, @3.92, @3.05, @2.18, @3.24]),
                      AASeriesElement.new
                      .nameSet(@"2020")
                      .fillOpacitySet(@1.0)
                      .stepSet(@(true))
                      .dataSet(@[@3.23, @3.15, @2.90, @1.81, @2.11, @2.43, @5.59, @3.09, @4.09, @6.14, @5.33, @6.05, @5.71, @6.22, @6.56, @4.75, @5.27, @6.02, @5.22, @5.77, @6.19, @5.68, @4.33, @5.48]),
                      ];
    }
    
    self.aaChartModel.series = seriesArr;
}

- (void)setUpSegmentedControls {
    NSArray *segmentedNamesArr = @[
        @[@"hide One",
          @"hide Two",
          @"hide Three",
          @"hide Four",
        ],
        @[@"show One",
          @"show Two",
          @"show Three",
          @"show Four",
        ]
    ];
    
    NSArray *typeLabelNameArr = @[
        @"HIDE CHART SERIES",
        @"SHOW CHART SERIES"
    ];
    
    for (int i = 0; i < segmentedNamesArr.count; i++) {
        UISegmentedControl * segmentedControl = [[UISegmentedControl alloc]initWithItems:segmentedNamesArr[i]];
        segmentedControl.frame = CGRectMake(20,
                                            40 * i + (self.view.frame.size.height - 145),
                                            self.view.frame.size.width - 40,
                                            20);
        segmentedControl.tintColor = [UIColor redColor];
        segmentedControl.selectedSegmentIndex = 0;
        segmentedControl.tag = i;
        [segmentedControl addTarget:self
                             action:@selector(customsegmentedControlCellValueBeChanged:)
                   forControlEvents:UIControlEventValueChanged];
        [self.view addSubview:segmentedControl];
        
        UILabel *typeLabel = [[UILabel alloc]init];
        typeLabel.textColor = [UIColor lightGrayColor];
        typeLabel.frame =CGRectMake(20,
                                    40 * i + (self.view.frame.size.height - 165),
                                    self.view.frame.size.width - 40,
                                    20);
        typeLabel.text = typeLabelNameArr[i];
        typeLabel.font = [UIFont systemFontOfSize:11.0f];
        [self.view addSubview:typeLabel];
    }
}

- (void)customsegmentedControlCellValueBeChanged:(UISegmentedControl *)segmentedControl {
    if (segmentedControl.tag == 0) {
        [self.aaChartView aa_hideTheSeriesElementContentWithSeriesElementIndex:segmentedControl.selectedSegmentIndex];
    } else {
        [self.aaChartView aa_showTheSeriesElementContentWithSeriesElementIndex:segmentedControl.selectedSegmentIndex];
    }
}

- (void)setUpTheHideChartSeriesSwitch {
    NSInteger i = 0;
    CGFloat switchWidth = 100;
    UISwitch * switchView = [[UISwitch alloc]init];
    switchView.frame = CGRectMake(switchWidth * i+20,
                                  self.view.frame.size.height-70,
                                  switchWidth,
                                  20);
    switchView.on = NO;
    switchView.tag = i;
    [switchView addTarget:self
                   action:@selector(switchViewClicked:)
         forControlEvents:UIControlEventValueChanged];
    [self.view addSubview:switchView];
    
    UILabel *label = [[UILabel alloc]init];
    label.textColor = [UIColor lightGrayColor];
    label.numberOfLines = 0;
    label.frame = CGRectMake(switchWidth * i + 20,
                             self.view.frame.size.height - 40,
                             switchWidth,
                             40);
    label.text = @"Hide Chart Whole Series Content";
    label.font = [UIFont systemFontOfSize:8.0f];
    [self.view addSubview:label];
}

- (void)switchViewClicked:(UISwitch *)switchView {
    self.aaChartView.chartSeriesHidden = switchView.on;
}

- (AAChartType)configureChartType {
    NSArray *chartTypesArr = @[AAChartTypeColumn,
                               AAChartTypeBar,
                               AAChartTypeArea,
                               AAChartTypeAreaspline,
                               AAChartTypeLine,
                               AAChartTypeSpline,
                               @"StepLineChart",
                               @"StepAreaChart",
                               AAChartTypeScatter,
                               ];
    return  chartTypesArr[self.chartTypeIndex];
}

@end
