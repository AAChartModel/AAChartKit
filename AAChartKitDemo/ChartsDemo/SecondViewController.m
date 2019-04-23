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

#import "SecondViewController.h"
#import "AAChartKit.h"
#import "AAEasyTool.h"

@interface SecondViewController ()<AAChartViewEventDelegate>

@property (nonatomic, strong) AAChartModel *aaChartModel;
@property (nonatomic, strong) AAChartView  *aaChartView;

@end

@implementation SecondViewController

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
    [self setUpTheAAChartViewWithChartType:chartType];
    [self setUpTheNextTypeChartButton];
}

- (AAChartType)configureTheChartType {
    switch (self.chartType) {
        case SecondeViewControllerChartTypeColumn: return AAChartTypeColumn;
        case SecondeViewControllerChartTypeBar: return AAChartTypeBar;
        case SecondeViewControllerChartTypeArea: return AAChartTypeArea;
        case SecondeViewControllerChartTypeAreaspline: return AAChartTypeAreaspline;
        case SecondeViewControllerChartTypeLine: return AAChartTypeLine;
        case SecondeViewControllerChartTypeSpline: return AAChartTypeSpline;
        case SecondeViewControllerChartTypeStepLine: return AAChartTypeLine;
        case SecondeViewControllerChartTypeStepArea: return AAChartTypeArea;
        case SecondeViewControllerChartTypeScatter: return AAChartTypeScatter;
    }
}

- (void)setUpTheAAChartViewWithChartType:(AAChartType)chartType {
    CGFloat chartViewWidth  = self.view.frame.size.width;
    CGFloat chartViewHeight = self.view.frame.size.height-220;
    self.aaChartView = [[AAChartView alloc]init];
    self.aaChartView.frame = CGRectMake(0, 60, chartViewWidth, chartViewHeight);
    self.aaChartView.delegate = self;
    self.aaChartView.scrollEnabled = NO;//禁用 AAChartView 滚动效果
//    设置aaChartVie 的内容高度(content height)
//    self.aaChartView.contentHeight = chartViewHeight*2;
//    设置aaChartVie 的内容宽度(content  width)
//    self.aaChartView.contentWidth = chartViewWidth*2;
    [self.view addSubview:self.aaChartView];
    self.aaChartView.backgroundColor = [UIColor clearColor];
    
    
    //设置 AAChartView 的背景色是否为透明
    self.aaChartView.isClearBackgroundColor = YES;
    
    self.aaChartModel= AAChartModel.new
    .chartTypeSet(chartType)//图表类型
    .titleSet(@"")//图表主标题
    .subtitleSet(@"")//图表副标题
    .yAxisLineWidthSet(@0)//Y轴轴线线宽为0即是隐藏Y轴轴线
    .colorsThemeSet(@[@"#fe117c",@"#ffc069",@"#06caf4",@"#7dffc0"])//设置主体颜色数组
    .yAxisTitleSet(@"")//设置 Y 轴标题
    .tooltipValueSuffixSet(@"℃")//设置浮动提示框单位后缀
    .backgroundColorSet(@"#4b2b7f")
    .yAxisGridLineWidthSet(@0)//y轴横向分割线宽度为0(即是隐藏分割线)
    .touchEventEnabledSet(true)//支持用户点击事件
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
                 ]
               );
    [self configureTheStyleForDifferentTypeChart];//为不同类型图表设置样式
    
    /*配置 Y 轴标注线,解开注释,即可查看添加标注线之后的图表效果(NOTE:必须设置 Y 轴可见)*/
    //    [self configureTheYAxisPlotLineForAAChartView];
    
    [self.aaChartView aa_drawChartWithChartModel:_aaChartModel];
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
    .yAxisMaxSet(@(21))//Y轴最大值
    .yAxisMinSet(@(1))//Y轴最小值
    .yAxisAllowDecimalsSet(NO)//是否允许Y轴坐标值小数
    .yAxisTickPositionsSet(@[@(0),@(25),@(50),@(75),@(100)])//指定y轴坐标
    .yAxisPlotLinesSet(@[
                         AAPlotLinesElement.new
                         .colorSet(@"#F05353")//颜色值(16进制)
                         .dashStyleSet(AALineDashStyleTypeLongDashDot)//样式：Dash,Dot,Solid等,默认Solid
                         .widthSet(@(1)) //标示线粗细
                         .valueSet(@(20)) //所在位置
                         .zIndexSet(@(1)) //层叠,标示线在图表中显示的层叠级别，值越大，显示越向前
                         .labelSet(AALabel.new
                                   .textSet(@"标示线1")
                                   .styleSet(AAStyle.new
                                             .colorSet(@"#ff0000")))
                         ,AAPlotLinesElement.new
                         .colorSet(@"#33BDFD")
                         .dashStyleSet(AALineDashStyleTypeLongDashDot)
                         .widthSet(@(1))
                         .valueSet(@(40))
                         .labelSet(AALabel.new
                                   .textSet(@"标示线2")
                                   .styleSet(AAStyle.new
                                             .colorSet(@"#00ff00")))
                         ,AAPlotLinesElement.new
                         .colorSet(@"#ADFF2F")
                         .dashStyleSet(AALineDashStyleTypeLongDashDot)
                         .widthSet(@(1))
                         .valueSet(@(60))
                         .labelSet(AALabel.new
                                   .textSet(@"标示线3")
                                   .styleSet(AAStyle.new
                                             .colorSet(@"#0000ff")))

                         ]
                   );
}

- (void)configureTheStyleForDifferentTypeChart {
    if (self.chartType == SecondeViewControllerChartTypeColumn || self.chartType == SecondeViewControllerChartTypeBar) {
        _aaChartModel
        .categoriesSet(@[@"Java", @"Swift", @"Python", @"Ruby", @"PHP", @"Go",@"C", @"C#", @"C++", @"Perl", @"R", @"MATLAB", @"SQL"])//设置 X 轴坐标文字内容
        .animationTypeSet(AAChartAnimationBounce)//图形的渲染动画为弹性动画
        .animationDurationSet(@(1200))//图形渲染动画时长为1200毫秒
        .yAxisTitleSet(@"");
    } else if (self.chartType == SecondeViewControllerChartTypeArea || self.chartType == SecondeViewControllerChartTypeAreaspline) {
        _aaChartModel
        .markerSymbolStyleSet(AAChartSymbolStyleTypeInnerBlank)//设置折线连接点样式为:内部白色
        .easyGradientColorsSet(true)//启用渐变色
        .animationTypeSet(AAChartAnimationEaseOutQuart)//图形的渲染动画为 EaseOutQuart 动画
        .xAxisCrosshairWidthSet(@0.9)//Zero width to disable crosshair by default
        .xAxisCrosshairColorSet(@"#FFE4C4")//(浓汤)乳脂,番茄色准星线
        .xAxisCrosshairDashStyleTypeSet(AALineDashStyleTypeLongDashDot);
        if (self.chartType == SecondeViewControllerChartTypeLine) {
            _aaChartModel
            .categoriesSet(@[@"Java", @"Swift", @"Python", @"Ruby", @"PHP", @"Go",@"C", @"C#", @"C++", @"Perl", @"R", @"MATLAB", @"SQL"]);//设置 X 轴坐标文字内容
        } else if (self.chartType == SecondeViewControllerChartTypeAreaspline) {
            _aaChartModel
            .xAxisTickIntervalSet(@3)//设置 X轴坐标点的间隔数,默认是1(手机端的屏幕较为狭窄, 如果X轴坐标点过多,文字过于密集的时候可以设置此属性值,用户的密集恐惧症将得到有效治疗😝)
            .seriesSet(@[
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
                         ]);
        }
    } else if (self.chartType == SecondeViewControllerChartTypeLine || self.chartType == SecondeViewControllerChartTypeSpline) {
        _aaChartModel
        .markerSymbolStyleSet(AAChartSymbolStyleTypeBorderBlank)//设置折线连接点样式为:边缘白色
        .xAxisCrosshairWidthSet(@01.2)//Zero width to disable crosshair by default
        .xAxisCrosshairColorSet(@"#778899")//浅石板灰准星线
        .xAxisCrosshairDashStyleTypeSet(AALineDashStyleTypeLongDashDotDot);

        if (self.chartType == SecondeViewControllerChartTypeLine) {
            _aaChartModel.categories = @[@"Java", @"Swift", @"Python", @"Ruby", @"PHP", @"Go",@"C", @"C#", @"C++", @"Perl", @"R", @"MATLAB", @"SQL"];//设置 X 轴坐标文字内容
        } else if (self.chartType == SecondeViewControllerChartTypeSpline) {
            _aaChartModel
            .markerRadiusSet(@0)
            .seriesSet(@[
                         AASeriesElement.new
                         .nameSet(@"2017")
                         .lineWidthSet(@5.0)
                         .dataSet(@[@50.1, @320.2, @230.3, @370.4, @230.5, @400.6,]),
                         AASeriesElement.new
                         .nameSet(@"2018")
                         .lineWidthSet(@5.0)
                         .dataSet(@[@80.1, @390.2, @210.3, @340.4, @240.5, @350.6,]),
                         AASeriesElement.new
                         .nameSet(@"2019")
                         .lineWidthSet(@5.0)
                         .dataSet(@[@100.1, @370.2, @180.3, @280.4, @260.5, @300.6,]),
                         AASeriesElement.new
                         .nameSet(@"2020")
                         .lineWidthSet(@5.0)
                         .dataSet(@[@130.1, @350.2, @160.3, @310.4, @250.5, @268.6,]),
                         ]);
        }
    } else if (self.chartType == SecondeViewControllerChartTypeStepLine || self.chartType == SecondeViewControllerChartTypeStepArea) {
        _aaChartModel.yAxisVisibleSet(false);
        if (self.chartType == SecondeViewControllerChartTypeStepLine) {
            _aaChartModel.markerSymbolStyleSet(AAChartSymbolStyleTypeBorderBlank);
        } else {
            _aaChartModel.easyGradientColorsSet(true);
        }
        _aaChartModel
        .seriesSet(@[
                     AASeriesElement.new
                     .nameSet(@"Berlin")
                     .dataSet(@[@149.9, @171.5, @106.4, @129.2, @144.0, @176.0, @135.6, @188.5, @276.4, @214.1, @95.6, @54.4])
                     .stepSet(@true),//设置折线样式为直方折线,连接点位置默认靠左👈
                     AASeriesElement.new
                     .nameSet(@"New York")
                     .dataSet(@[@83.6, @78.8, @188.5, @93.4, @106.0, @84.5, @105.0, @104.3, @131.2, @153.5, @226.6, @192.3])
                     .stepSet(@true),//设置折线样式为直方折线,连接点位置默认靠左👈
                     AASeriesElement.new
                     .nameSet(@"Tokyo")
                     .dataSet(@[@48.9, @38.8, @19.3, @41.4, @47.0, @28.3, @59.0, @69.6, @52.4, @65.2, @53.3, @72.2])
                     .stepSet(@true)//设置折线样式为直方折线,连接点位置默认靠左👈
                     ]);
    }
}

#pragma mark -- AAChartView delegate
- (void)AAChartViewDidFinishLoad {
    NSLog(@"🔥🔥🔥🔥🔥 AAChartView content did finish load!!!");
}

- (void)AAChartView:(AAChartView *)chartView moveOverEventWithMessage:(AAMoveOverEventMessageModel *)message {
    NSLog(@"🚀selected point series element name: %@",message.name);
    NSLog(@"🦋🦋🦋🦋🦋 user finger moved over!!!,get the move over event message: %@",[AAJsonConverter jsonDictWithString:[AAJsonConverter getPureOptionsString:message]] );
}


- (void)setUpTheSegmentedControls {
    NSArray *segmentedNamesArr;
    NSArray *typeLabelNameArr;
    
    if (self.chartType == SecondeViewControllerChartTypeColumn
        ||self.chartType == SecondeViewControllerChartTypeBar) {
        segmentedNamesArr = @[
                              @[@"No stacking",
                                @"Normal stacking",
                                @"Percent stacking"],
                              @[@"Square corners",
                                @"Rounded corners",
                                @"Wedge"],
                              ];
        typeLabelNameArr = @[@"Stacking type selection",
                             @"Corners Style type selection"];
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
        typeLabelNameArr = @[@"Stacking type selection",
                             @"Chart symbol type selection"];
    }
    
    for (int i=0; i<segmentedNamesArr.count; i++) {
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
            self.aaChartModel.stacking = stackingArr[segmentedControl.selectedSegmentIndex];
        }
            break;
            
        case 1: {
            if (self.chartType == 0 || self.chartType == 1 ) {
                NSArray *borderRadiusArr = @[ @0, @10, @100 ];
                self.aaChartModel.borderRadius = borderRadiusArr[segmentedControl.selectedSegmentIndex];
            } else {
                
                NSArray *symbolArr = @[AAChartSymbolTypeCircle,
                                       AAChartSymbolTypeSquare,
                                       AAChartSymbolTypeDiamond,
                                       AAChartSymbolTypeTriangle,
                                       AAChartSymbolTypeTriangle_down];
                self.aaChartModel.markerSymbol = symbolArr[segmentedControl.selectedSegmentIndex];
            }
        }
            break;
            
        default:
            break;
    }
    
    [self refreshTheChartView];
}

- (void)refreshTheChartView {
    [self.aaChartView aa_refreshChartWithChartModel:self.aaChartModel];
}

- (void)setUpTheSwitchs {
    NSArray *nameArr;
    if (self.chartType == SecondeViewControllerChartTypeColumn || self.chartType == SecondeViewControllerChartTypeBar) {
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
    
    CGFloat switchWidth = (self.view.frame.size.width-40)/nameArr.count;
    
    for (int i=0; i<nameArr.count; i++) {
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
        case 0: self.aaChartModel.xAxisReversed = switchView.on;
            break;
        case 1: self.aaChartModel.yAxisReversed = switchView.on;
            break;
        case 2: self.aaChartModel.inverted = switchView.on;
            break;
        case 3: self.aaChartModel.polar = switchView.on;
            break;
        case 4: self.aaChartModel.dataLabelEnabled = switchView.on;
            break;
        case 5: self.aaChartModel.markerRadius = switchView.on ? @0 : @5;
            break;
        default:
            break;
    }

    [self refreshTheChartView];
    
}

- (void)setUpTheNextTypeChartButton {
    UIBarButtonItem *btnItem = [[UIBarButtonItem alloc] initWithTitle:@"Next Type"
                                                                style:UIBarButtonItemStylePlain
                                                               target:self
                                                               action:@selector(monitorTap)];
    self.navigationItem.rightBarButtonItem = btnItem;
}

- (void)monitorTap {
    self.chartType = self.chartType + 1;
    NSString *chartType = [self configureTheChartType];
    self.title = [NSString stringWithFormat:@"%@ chart",chartType];
    _aaChartModel.chartType = chartType;
    if (self.chartType == SecondeViewControllerChartTypeStepArea
        || self.chartType == SecondeViewControllerChartTypeStepLine) {
        [_aaChartModel.series enumerateObjectsUsingBlock:^(id  _Nonnull obj, NSUInteger idx, BOOL * _Nonnull stop) {
            AASeriesElement *element = obj;
            element.step = @YES;
        }];
    } else if (self.chartType == SecondeViewControllerChartTypeScatter) {
        [_aaChartModel.series enumerateObjectsUsingBlock:^(id  _Nonnull obj, NSUInteger idx, BOOL * _Nonnull stop) {
            AASeriesElement *element = obj;
            element.step = @NO;
        }];
    }
    
    [_aaChartView aa_refreshChartWithChartModel:_aaChartModel];
    
    if (self.chartType == SecondeViewControllerChartTypeScatter) {
        self.chartType = -1;//重新开始
    }
}

@end
