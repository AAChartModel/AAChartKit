//
//  ViewController.m
//  AAChartKit
//
//  Created by An An on 17/3/13.
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
 * ❤❤❤❤❤❤   WARM TIPS!!!   ❤❤❤❤❤❤
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

#import "BasicChartVC.h"

@interface BasicChartVC ()<AAChartViewEventDelegate>

@end

@implementation BasicChartVC

- (void)viewWillAppear:(BOOL)animated {
    [super viewWillAppear:YES];
    self.navigationController.navigationBar.barTintColor = [AAEasyTool colorWithHexString:@"#4b2b7f"];
    NSDictionary *titleTextAttributes = @{NSForegroundColorAttributeName:[UIColor grayColor]};
    [self.navigationController.navigationBar setTitleTextAttributes:titleTextAttributes];
}

- (void)viewWillDisappear:(BOOL)animated {
    [super viewWillDisappear:YES];
    self.navigationController.navigationBar.barTintColor = [UIColor whiteColor];
    NSDictionary *titleTextAttributes = @{NSForegroundColorAttributeName:[AAEasyTool colorWithHexString:@"#4b2b7f"]};
    [self.navigationController.navigationBar setTitleTextAttributes:titleTextAttributes];
}

- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor = [AAEasyTool colorWithHexString:@"#4b2b7f"];

    [self setUpTheSegmentedControls];
    [self setUpTheSwitchs];
    
    AAChartType chartType = [self configureTheChartType];
    self.title = [NSString stringWithFormat:@"%@ chart",chartType];
    [self setUpTheNextTypeChartButton];
    
    [self drawChart];
    
}

- (AAChartType)configureTheChartType {
    switch (_chartType) {
        case BasicChartVCChartTypeColumn: return AAChartTypeColumn;
        case BasicChartVCChartTypeBar: return AAChartTypeBar;
        case BasicChartVCChartTypeArea: return AAChartTypeArea;
        case BasicChartVCChartTypeAreaspline: return AAChartTypeAreaspline;
        case BasicChartVCChartTypeLine: return AAChartTypeLine;
        case BasicChartVCChartTypeSpline: return AAChartTypeSpline;
        case BasicChartVCChartTypeStepLine: return AAChartTypeLine;
        case BasicChartVCChartTypeStepArea: return AAChartTypeArea;
        case BasicChartVCChartTypeScatter: return AAChartTypeScatter;
    }
}

- (void)drawChart {
    [self setupAAChartView];
    AAChartType chartType = [self configureTheChartType];
    [self setupAAChartViewWithChartType:chartType];
    [_aaChartView aa_drawChartWithChartModel:_aaChartModel];
}

- (void)setupAAChartView {
    CGFloat aaChartViewOriginY = 64;
    if ([self isHairPhone]) {
        aaChartViewOriginY = 88;
    }
    CGFloat chartViewWidth  = self.view.frame.size.width;
    CGFloat chartViewHeight = self.view.frame.size.height - 160 - aaChartViewOriginY;
    _aaChartView = [[AAChartView alloc]init];
    _aaChartView.frame = CGRectMake(0, aaChartViewOriginY, chartViewWidth, chartViewHeight);
    _aaChartView.scrollEnabled = NO;//禁用 AAChartView 滚动效果
    _aaChartView.isClearBackgroundColor = YES;//设置 AAChartView 的背景色是否为透明
    //    _aaChartView.delegate = self;
    [self.view addSubview:_aaChartView];
    [self setupChartViewEventHandlers];
}

- (void)setupChartViewEventHandlers {
    //获取图表加载完成事件
    [_aaChartView didFinishLoadHandler:^(AAChartView *aaChartView) {
        NSLog(@"🚀🚀🚀🚀 AAChartView content did finish load!!!");
    }];
    
    //获取图表上的手指点击及滑动事件
    [_aaChartView moveOverEventHandler:^(AAChartView *aaChartView,
                                         AAMoveOverEventMessageModel *message) {
        NSDictionary *messageDic = @{
            @"category":message.category,
            @"index":@(message.index),
            @"name":message.name,
            @"offset":message.offset,
            @"x":message.x,
            @"y":message.y
        };
        
        NSString *str1 = [NSString stringWithFormat:@"👌👌👌👌 selected point series element name: %@\n",
                          message.name];
        NSString *str2 = [NSString stringWithFormat:@"user finger moved over!!!,get the move over event message: %@",
                          messageDic];
        NSLog(@"%@%@",str1, str2);
    }];
}

- (void)setupAAChartViewWithChartType:(AAChartType)chartType {
    _aaChartModel = AAChartModel.new
    .chartTypeSet(chartType)//图表类型
    .colorsThemeSet(@[@"#fe117c",@"#ffc069",@"#06caf4",@"#7dffc0"])//设置主题颜色数组
    .tooltipValueSuffixSet(@"℃")//设置浮动提示框单位后缀
    .yAxisLineWidthSet(@0)//Y轴轴线线宽为0即是隐藏Y轴轴线
    .yAxisGridLineWidthSet(@0)//y轴横向分割线宽度为0(即是隐藏分割线)
    .seriesSet(@[
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
    ]);
    
    [self configureTheStyleForDifferentTypeChart];//为不同类型图表设置样式
    
    /*配置 Y 轴标注线,解开注释,即可查看添加标注线之后的图表效果(NOTE:必须设置 Y 轴可见)*/
    [self configureTheYAxisPlotLineForAAChartView];
}

/**
 *   图表 Y 轴标示线的设置
 *   标示线设置作为图表一项基础功能,用于对图表的基本数据水平均线进行标注
 *   虽然不太常被使用,但我们仍然提供了此功能的完整接口,以便于有特殊需求的用户使用
 *   解除👆上面的设置 Y 轴标注线的已被注释代码,,运行程序,即可查看实际工程效果以酌情选择
 *
 **/
- (void)configureTheYAxisPlotLineForAAChartView {
    _aaChartModel
    .yAxisPlotLinesSet(@[
        AAPlotLinesElement.new
        .colorSet(@"#F05353")//颜色值(16进制)
        .dashStyleSet(AAChartLineDashStyleTypeLongDashDot)//样式：Dash,Dot,Solid等,默认Solid
        .widthSet(@(1)) //标示线粗细
        .valueSet(@(20)) //所在位置
        .zIndexSet(@(5)) //层叠,标示线在图表中显示的层叠级别，值越大，显示越向前
        .labelSet(AALabel.new
                  .textSet(@"PlotLines Element One")
                  .styleSet(AAStyle.new
                            .colorSet(@"#F05353")))
        ,
        AAPlotLinesElement.new
        .colorSet(@"#33BDFD")
        .dashStyleSet(AAChartLineDashStyleTypeLongDashDot)
        .widthSet(@(1))
        .valueSet(@(40))
        .zIndexSet(@5)
        .labelSet(AALabel.new
                  .textSet(@"PlotLines Element Two")
                  .styleSet(AAStyle.new
                            .colorSet(@"#33BDFD")))
        ,
        AAPlotLinesElement.new
        .colorSet(@"#ADFF2F")
        .dashStyleSet(AAChartLineDashStyleTypeLongDashDot)
        .widthSet(@(1))
        .valueSet(@(60))
        .zIndexSet(@5)
        .labelSet(AALabel.new
                  .textSet(@"PlotLines Element Three")
                  .styleSet(AAStyle.new
                            .colorSet(@"#ADFF2F")))
                       ]);
}

- (void)configureTheStyleForDifferentTypeChart {
    if (_chartType == BasicChartVCChartTypeColumn
        || _chartType == BasicChartVCChartTypeBar) {
        [self configureColumnChartAndBarChartStyle];
    } else if (_chartType == BasicChartVCChartTypeArea
               || _chartType == BasicChartVCChartTypeAreaspline) {
        [self configureAreaChartAndAreasplineChartStyle];
    } else if (_chartType == BasicChartVCChartTypeLine
               || _chartType == BasicChartVCChartTypeSpline) {
        [self configureLineChartAndSplineChartStyle];
    } else if (_chartType == BasicChartVCChartTypeStepLine
               || _chartType == BasicChartVCChartTypeStepArea) {
        [self configureStepLineChartAndStepAreaChartStyle];
    }
}

- (void)configureColumnChartAndBarChartStyle {
    _aaChartModel
    .categoriesSet(@[@"Java", @"Swift", @"Python", @"Ruby", @"PHP", @"Go",@"C", @"C#", @"C++", @"Perl", @"R", @"MATLAB", @"SQL"])//设置 X 轴坐标文字内容
    .animationTypeSet(AAChartAnimationEaseOutCubic)//图形的渲染动画类型为 EaseOutCubic
    .animationDurationSet(@(1200))//图形渲染动画时长为1200毫秒
    ;
}

- (void)configureAreaChartAndAreasplineChartStyle {
    _aaChartModel
    .markerSymbolStyleSet(AAChartSymbolStyleTypeInnerBlank)//设置折线连接点样式为:内部白色
    .animationTypeSet(AAChartAnimationEaseOutQuart)//图形的渲染动画为 EaseOutQuart 动画
    .xAxisCrosshairWidthSet(@0.9)//Zero width to disable crosshair by default
    .xAxisCrosshairColorSet(@"#FFE4C4")//(浓汤)乳脂,番茄色准星线
    .xAxisCrosshairDashStyleTypeSet(AAChartLineDashStyleTypeLongDashDot);
    if (_chartType == BasicChartVCChartTypeArea) {
        _aaChartModel
        .categoriesSet(@[@"Java", @"Swift", @"Python", @"Ruby", @"PHP", @"Go",@"C", @"C#", @"C++", @"Perl", @"R", @"MATLAB", @"SQL"]);//设置 X 轴坐标文字内容
    } else if (_chartType == BasicChartVCChartTypeAreaspline) {
        AASeriesElement *element1 = AASeriesElement.new
        .nameSet(@"Predefined symbol")
        .dataSet(@[@0.45, @0.43, @0.50, @0.55, @0.58, @0.62, @0.83, @0.39, @0.56, @0.67, @0.50, @0.34, @0.50, @0.67, @0.58, @0.29, @0.46, @0.23, @0.47, @0.46, @0.38, @0.56, @0.48, @0.36]);
        AASeriesElement *element2 = AASeriesElement.new
        .nameSet(@"Image symbol")
        .dataSet(@[@0.38, @0.31, @0.32, @0.32, @0.64, @0.66, @0.86, @0.47, @0.52, @0.75, @0.52, @0.56, @0.54, @0.60, @0.46, @0.63, @0.54, @0.51, @0.58, @0.64, @0.60, @0.45, @0.36, @0.67]);
        AASeriesElement *element3 = AASeriesElement.new
        .nameSet(@"Base64 symbol (*)")
        .dataSet(@[@0.46, @0.32, @0.53, @0.58, @0.86, @0.68, @0.85, @0.73, @0.69, @0.71, @0.91, @0.74, @0.60, @0.50, @0.39, @0.67, @0.55, @0.49, @0.65, @0.45, @0.64, @0.47, @0.63, @0.64]);
        AASeriesElement *element4 = AASeriesElement.new
        .nameSet(@"Custom symbol")
        .dataSet(@[@0.60, @0.51, @0.52, @0.53, @0.64, @0.84, @0.65, @0.68, @0.63, @0.47, @0.72, @0.60, @0.65, @0.74, @0.66, @0.65, @0.71, @0.59, @0.65, @0.77, @0.52, @0.53, @0.58, @0.53]);
        
        _aaChartModel
        .xAxisTickIntervalSet(@3)//设置 X轴坐标点的间隔数,默认是1(手机端的屏幕较为狭窄, 如果X轴坐标点过多,文字过于密集的时候可以设置此属性值,用户的密集恐惧症将得到有效治疗😝)
        .seriesSet(@[element1,element2,element3,element4]);
    }
}

- (void)configureLineChartAndSplineChartStyle {
    _aaChartModel
    .markerSymbolStyleSet(AAChartSymbolStyleTypeBorderBlank)//设置折线连接点样式为:边缘白色
    .xAxisCrosshairWidthSet(@01.2)//Zero width to disable crosshair by default
    .xAxisCrosshairColorSet(@"#778899")//浅石板灰准星线
    .xAxisCrosshairDashStyleTypeSet(AAChartLineDashStyleTypeLongDashDotDot);
    
    if (_chartType == BasicChartVCChartTypeLine) {
        _aaChartModel.categories = @[@"Java", @"Swift", @"Python", @"Ruby", @"PHP", @"Go",@"C", @"C#", @"C++", @"Perl", @"R", @"MATLAB", @"SQL"];//设置 X 轴坐标文字内容
    } else if (_chartType == BasicChartVCChartTypeSpline) {
        AASeriesElement *element1 = AASeriesElement.new
        .nameSet(@"2017")
        .lineWidthSet(@5.0)
        .dataSet(@[@5.1, @32.2, @23.3, @37.4, @23.5, @40.6,]);
        AASeriesElement *element2 = AASeriesElement.new
        .nameSet(@"2018")
        .lineWidthSet(@5.0)
        .dataSet(@[@8.1, @39.2, @21.3, @34.4, @24.5, @35.6,]);
        AASeriesElement *element3 = AASeriesElement.new
        .nameSet(@"2019")
        .lineWidthSet(@5.0)
        .dataSet(@[@10.1, @37.2, @18.3, @28.4, @26.5, @30.6,]);
        AASeriesElement *element4 = AASeriesElement.new
        .nameSet(@"2020")
        .lineWidthSet(@5.0)
        .dataSet(@[@13.1, @35.2, @16.3, @31.4, @25.5, @26.6,]);
        
        _aaChartModel
        .markerRadiusSet(@0)
        .seriesSet(@[element1,element2,element3,element4]);
    }
}

- (void)configureStepLineChartAndStepAreaChartStyle {
    _aaChartModel.yAxisVisibleSet(false);
    if (_chartType == BasicChartVCChartTypeStepLine) {
        _aaChartModel.markerSymbolStyleSet(AAChartSymbolStyleTypeBorderBlank);
    }
    AASeriesElement *element1 = AASeriesElement.new
    .nameSet(@"Berlin")
    .dataSet(@[@149.9, @171.5, @106.4, @129.2, @144.0, @176.0, @135.6, @188.5, @276.4, @214.1, @95.6, @54.4])
    .stepSet(@true);//设置折线样式为直方折线,连接点位置默认靠左👈
    AASeriesElement *element2 = AASeriesElement.new
    .nameSet(@"New York")
    .dataSet(@[@83.6, @78.8, @188.5, @93.4, @106.0, @84.5, @105.0, @104.3, @131.2, @153.5, @226.6, @192.3])
    .stepSet(@true);//设置折线样式为直方折线,连接点位置默认靠左👈
    AASeriesElement *element3 = AASeriesElement.new
    .nameSet(@"Tokyo")
    .dataSet(@[@48.9, @38.8, @19.3, @41.4, @47.0, @28.3, @59.0, @69.6, @52.4, @65.2, @53.3, @72.2])
    .stepSet(@true);//设置折线样式为直方折线,连接点位置默认靠左👈
    
    _aaChartModel.seriesSet(@[element1,element2,element3,]);

}

#pragma mark -- AAChartView delegate
- (void)aaChartViewDidFinishLoad:(AAChartView *)aaChartView {
    NSLog(@"🔥 AAChartView content did finish load!!!");
}

- (void)aaChartView:(AAChartView *)aaChartView moveOverEventWithMessage:(AAMoveOverEventMessageModel *)message {
    NSDictionary *messageDic = @{
        @"category":message.category,
        @"index":@(message.index),
        @"name":message.name,
        @"offset":message.offset,
        @"x":message.x,
        @"y":message.y
    };
    
    NSString *str1 = [NSString stringWithFormat:@"👌 selected point series element name: %@\n",
                      message.name];
    NSString *str2 = [NSString stringWithFormat:@"user finger moved over!!!,get the move over event message: %@",
                      messageDic];
    NSLog(@"%@%@",str1, str2);
}


- (void)setUpTheSegmentedControls {
    NSArray *segmentedNamesArr;
    NSArray *typeLabelNameArr;
    
    if (_chartType == BasicChartVCChartTypeColumn
        ||_chartType == BasicChartVCChartTypeBar) {
        segmentedNamesArr = @[
            @[@"No stacking",
              @"Normal stacking",
              @"Percent stacking"],
            @[@"Square corners",
              @"Rounded corners",
              @"Wedge"],
        ];
        typeLabelNameArr = @[
            @"Stacking type selection",
            @"Corners Style type selection"
        ];
    } else {
        segmentedNamesArr = @[
            @[@"No stacking",
              @"Normal stacking",
              @"Percent stacking"],
            @[@"Circle",
              @"Square",
              @"Diamond",
              @"Triangle",
              @"Triangle-down"]
        ];
        typeLabelNameArr = @[
            @"Stacking type selection",
            @"Chart symbol type selection"
        ];
    }
    
    for (int i = 0; i < segmentedNamesArr.count; i++) {
        UISegmentedControl * segmentedControl = [[UISegmentedControl alloc]initWithItems:segmentedNamesArr[i]];
        segmentedControl.frame = CGRectMake(20,
                                            40 * i + (self.view.frame.size.height - 145),
                                            self.view.frame.size.width - 40,
                                            20);
        segmentedControl.tintColor = [UIColor redColor];
        //        segmentedControl.tintColor = [UIColor lightGrayColor];
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
    switch (segmentedControl.tag) {
        case 0: {
            NSArray *stackingArr = @[AAChartStackingTypeFalse,
                                     AAChartStackingTypeNormal,
                                     AAChartStackingTypePercent];
            _aaChartModel.stacking = stackingArr[segmentedControl.selectedSegmentIndex];
        }
            break;
            
        case 1: {
            if (_chartType == 0 || _chartType == 1 ) {
                NSArray *borderRadiusArr = @[ @0, @10, @100 ];
                _aaChartModel.borderRadius = borderRadiusArr[segmentedControl.selectedSegmentIndex];
            } else {
                
                NSArray *symbolArr = @[AAChartSymbolTypeCircle,
                                       AAChartSymbolTypeSquare,
                                       AAChartSymbolTypeDiamond,
                                       AAChartSymbolTypeTriangle,
                                       AAChartSymbolTypeTriangle_down];
                _aaChartModel.markerSymbol = symbolArr[segmentedControl.selectedSegmentIndex];
            }
        }
            break;
            
        default:
            break;
    }
    
    [self refreshTheChartView];
}

- (void)setUpTheSwitchs {
    NSArray *nameArr;
    if (_chartType == BasicChartVCChartTypeColumn || _chartType == BasicChartVCChartTypeBar) {
        nameArr = @[
            @"xAxisReversed",
            @"yAxisReversed",
            @"xAxisInverted",
            @"Polarization",
            @"DataLabelShow",
        ];
    } else {
        nameArr = @[
            @"xReversed",
            @"yReversed",
            @"xAxisInverted",
            @"Polarization",
            @"DataShow",
            @"HideMarker"
        ];
    }
    
    CGFloat switchWidth = (self.view.frame.size.width - 40) / nameArr.count;
    
    for (int i = 0; i < nameArr.count; i++) {
        UISwitch * switchView = [[UISwitch alloc]init];
        switchView.frame = CGRectMake(switchWidth * i + 20,
                                      self.view.frame.size.height - 70,
                                      switchWidth,
                                      20);
        switchView.onTintColor = [AAEasyTool colorWithHexString:@"#FFDEAD"];
        switchView.thumbTintColor = [UIColor whiteColor];
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
        label.text = nameArr[i];
        label.font = [UIFont systemFontOfSize:8.0f];
        [self.view addSubview:label];
    }
}

- (void)switchViewClicked:(UISwitch *)switchView {
    switch (switchView.tag) {
        case 0: _aaChartModel.xAxisReversed = switchView.on;
            break;
        case 1: _aaChartModel.yAxisReversed = switchView.on;
            break;
        case 2: _aaChartModel.inverted = switchView.on;
            break;
        case 3: _aaChartModel.polar = switchView.on;
            break;
        case 4: _aaChartModel.dataLabelsEnabled = switchView.on;
            break;
        case 5: _aaChartModel.markerRadius = switchView.on ? @0 : @5;
            break;
        default:
            break;
    }

    [self refreshTheChartView];
}


- (void)refreshTheChartView {
    [_aaChartView aa_refreshChartWithChartModel:_aaChartModel];
}

- (void)setUpTheNextTypeChartButton {
    UIBarButtonItem *btnItem = [[UIBarButtonItem alloc] initWithTitle:@"Next Type"
                                                                style:UIBarButtonItemStylePlain
                                                               target:self
                                                               action:@selector(monitorTap)];
    self.navigationItem.rightBarButtonItem = btnItem;
}

- (void)monitorTap {
    _chartType = _chartType + 1;
    NSString *chartType = [self configureTheChartType];
    self.title = [NSString stringWithFormat:@"%@ chart",chartType];
    _aaChartModel.chartType = chartType;
    AAOptions *options;
    
    AAChart *aaChart = AAChart.new
    .typeSet(chartType);
    
    options = AAOptions.new
    .chartSet(aaChart);
    
    if (_chartType == BasicChartVCChartTypeStepArea
        || _chartType == BasicChartVCChartTypeStepLine) {
        [_aaChartModel.series enumerateObjectsUsingBlock:^(id  _Nonnull obj, NSUInteger idx, BOOL * _Nonnull stop) {
            AASeriesElement *element = obj;
            element.step = @YES;
        }];
        options.seriesSet(_aaChartModel.series);
    } else if (_chartType == BasicChartVCChartTypeScatter) {
        [_aaChartModel.series enumerateObjectsUsingBlock:^(id  _Nonnull obj, NSUInteger idx, BOOL * _Nonnull stop) {
            AASeriesElement *element = obj;
            element.step = @NO;
        }];
        options.seriesSet(_aaChartModel.series);
    }
    
//    [_aaChartView aa_refreshChartWithChartModel:_aaChartModel];
    [_aaChartView aa_updateChartWithOptions:options];
    
    if (_chartType == BasicChartVCChartTypeScatter) {
        _chartType = -1;//重新开始
    }
}

- (BOOL)isHairPhone {
    if (@available(iOS 11.0, *)) {
        if ([[UIApplication sharedApplication] delegate].window.safeAreaInsets.bottom > 0) {
          return true;
        }
        return false;
    } else {
        return false;
    }

}

@end
