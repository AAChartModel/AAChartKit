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
 * StackOverflow : https://stackoverflow.com/users/12302132/codeforu
 * JianShu       : https://www.jianshu.com/u/f1e6753d4254
 * SegmentFault  : https://segmentfault.com/u/huanghunbieguan
 *
 * -------------------------------------------------------------------------------
 
 */

#import "BasicChartVC.h"
#import "AAChartViewManager.h"
#import "BasicChartComposer.h"

@interface BasicChartVC ()<AAChartViewEventDelegate>

@property (nonatomic, strong) UIStackView *mainStackView;
@property (nonatomic, strong) UIStackView *segmentedControlsStackView;
@property (nonatomic, strong) UIStackView *switchesStackView;

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

    AAChartType chartType = [self configureTheChartType];
    self.title = [NSString stringWithFormat:@"%@ chart",chartType];
    [self setUpTheNextTypeChartButton];
    
    [self drawChart];
}

- (AAChartType)configureTheChartType {
    return [BasicChartComposer convertToAAChartType:_chartType];
}

- (void)drawChart {
    [self setupAAChartView];
    AAChartType chartType = [self configureTheChartType];
    [self setupAAChartViewWithChartType:chartType];
    [_aaChartView aa_drawChartWithChartModel:_aaChartModel];
}

- (void)setupAAChartView {
    // 创建 AAChartView
    _aaChartView = [[AAChartView alloc] init];
    _aaChartView.scrollEnabled = NO; // 禁用 AAChartView 滚动效果
    _aaChartView.isClearBackgroundColor = YES; // 设置 AAChartView 的背景色是否为透明
    _aaChartView.translatesAutoresizingMaskIntoConstraints = NO; // 启用 Auto Layout
    
    // 将 AAChartView 添加到视图
    [self.view addSubview:_aaChartView];
    
    // 设置 AAChartView 的 Auto Layout 约束
    [NSLayoutConstraint activateConstraints:@[
        [_aaChartView.topAnchor constraintEqualToAnchor:self.view.safeAreaLayoutGuide.topAnchor],
        [_aaChartView.leadingAnchor constraintEqualToAnchor:self.view.leadingAnchor],
        [_aaChartView.trailingAnchor constraintEqualToAnchor:self.view.trailingAnchor],
        [_aaChartView.bottomAnchor constraintEqualToAnchor:self.view.safeAreaLayoutGuide.bottomAnchor constant:-200] // 为底部控件预留空间
    ]];
    
    if (@available(iOS 16.4, macCatalyst 16.4, *)) {
        _aaChartView.inspectable = YES;
    } else {
        // Fallback on earlier versions
    }
    
    [self setupChartViewEventHandlers];
    [self setupMainStackView];
}

- (void)setupMainStackView {
    // 创建主 StackView
    _mainStackView = [[UIStackView alloc] init];
    _mainStackView.axis = UILayoutConstraintAxisVertical;
    _mainStackView.distribution = UIStackViewDistributionFill;
    _mainStackView.alignment = UIStackViewAlignmentFill;
    _mainStackView.spacing = 10;
    _mainStackView.translatesAutoresizingMaskIntoConstraints = NO;
    [self.view addSubview:_mainStackView];
    
    // 设置主 StackView 约束
    [NSLayoutConstraint activateConstraints:@[
        [_mainStackView.leadingAnchor constraintEqualToAnchor:self.view.safeAreaLayoutGuide.leadingAnchor constant:20],
        [_mainStackView.trailingAnchor constraintEqualToAnchor:self.view.safeAreaLayoutGuide.trailingAnchor constant:-20],
        [_mainStackView.bottomAnchor constraintEqualToAnchor:self.view.safeAreaLayoutGuide.bottomAnchor constant:-20],
        [_mainStackView.heightAnchor constraintEqualToConstant:180]
    ]];
    
    // 创建分段控制器 StackView
    [self setupSegmentedControlsStackView];
    
    // 创建开关控件 StackView
    [self setupSwitchesStackView];
    
    // 将子 StackView 添加到主 StackView
    [_mainStackView addArrangedSubview:_segmentedControlsStackView];
    [_mainStackView addArrangedSubview:_switchesStackView];
}

- (void)setupSegmentedControlsStackView {
    _segmentedControlsStackView = [[UIStackView alloc] init];
    _segmentedControlsStackView.axis = UILayoutConstraintAxisVertical;
    _segmentedControlsStackView.distribution = UIStackViewDistributionFillEqually;
    _segmentedControlsStackView.alignment = UIStackViewAlignmentFill;
    _segmentedControlsStackView.spacing = 8;
    
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
            @[@"◉ ◉ ◉",
              @"■ ■ ■",
              @"◆ ◆ ◆",
              @"▲ ▲ ▲",
              @"▼ ▼ ▼"]
        ];
        typeLabelNameArr = @[
            @"Stacking type selection",
            @"Maker symbols type selection"
        ];
    }
    
    for (NSUInteger i = 0; i < segmentedNamesArr.count; i++) {
        // 创建容器视图
        UIView *containerView = [[UIView alloc] init];
        
        // 创建标签
        UILabel *typeLabel = [[UILabel alloc] init];
        typeLabel.textColor = [UIColor lightGrayColor];
        typeLabel.text = typeLabelNameArr[i];
        typeLabel.font = [UIFont systemFontOfSize:11.0f];
        typeLabel.translatesAutoresizingMaskIntoConstraints = NO;
        [containerView addSubview:typeLabel];
        
        // 创建分段控制器
        UISegmentedControl *segmentedControl = [[UISegmentedControl alloc] initWithItems:segmentedNamesArr[i]];
        segmentedControl.tintColor = [UIColor redColor];
        segmentedControl.selectedSegmentIndex = 0;
        segmentedControl.tag = i;
        segmentedControl.translatesAutoresizingMaskIntoConstraints = NO;
        [segmentedControl addTarget:self
                             action:@selector(customSegmentedControlCellValueBeChanged:)
                   forControlEvents:UIControlEventValueChanged];
        [containerView addSubview:segmentedControl];
        
        // 设置约束
        [NSLayoutConstraint activateConstraints:@[
            [typeLabel.topAnchor constraintEqualToAnchor:containerView.topAnchor],
            [typeLabel.leadingAnchor constraintEqualToAnchor:containerView.leadingAnchor],
            [typeLabel.trailingAnchor constraintEqualToAnchor:containerView.trailingAnchor],
            [typeLabel.heightAnchor constraintEqualToConstant:20],
            
            [segmentedControl.topAnchor constraintEqualToAnchor:typeLabel.bottomAnchor constant:4],
            [segmentedControl.leadingAnchor constraintEqualToAnchor:containerView.leadingAnchor],
            [segmentedControl.trailingAnchor constraintEqualToAnchor:containerView.trailingAnchor],
            [segmentedControl.bottomAnchor constraintEqualToAnchor:containerView.bottomAnchor],
            [segmentedControl.heightAnchor constraintEqualToConstant:32]
        ]];
        
        [_segmentedControlsStackView addArrangedSubview:containerView];
    }
}

- (void)setupSwitchesStackView {
    _switchesStackView = [[UIStackView alloc] init];
    _switchesStackView.axis = UILayoutConstraintAxisVertical;
    _switchesStackView.distribution = UIStackViewDistributionFill;
    _switchesStackView.alignment = UIStackViewAlignmentFill;
    _switchesStackView.spacing = 8;
    
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
    
    // 创建水平 StackView 来容纳开关控件
    UIStackView *horizontalStackView = [[UIStackView alloc] init];
    horizontalStackView.axis = UILayoutConstraintAxisHorizontal;
    horizontalStackView.distribution = UIStackViewDistributionFillEqually;
    horizontalStackView.alignment = UIStackViewAlignmentTop;
    horizontalStackView.spacing = 8;
    
    for (NSUInteger i = 0; i < nameArr.count; i++) {
        // 创建垂直容器用于放置开关和标签
        UIStackView *verticalContainer = [[UIStackView alloc] init];
        verticalContainer.axis = UILayoutConstraintAxisVertical;
        verticalContainer.distribution = UIStackViewDistributionFill;
        verticalContainer.alignment = UIStackViewAlignmentCenter;
        verticalContainer.spacing = 4;
        
        // 创建开关
        UISwitch *switchView = [[UISwitch alloc] init];
        switchView.onTintColor = [AAEasyTool colorWithHexString:@"#FFDEAD"];
        switchView.thumbTintColor = [UIColor whiteColor];
        switchView.on = NO;
        switchView.tag = i;
        [switchView addTarget:self
                       action:@selector(switchViewClicked:)
             forControlEvents:UIControlEventValueChanged];
        
        // 创建标签
        UILabel *label = [[UILabel alloc] init];
        label.textColor = [UIColor lightGrayColor];
        label.numberOfLines = 0;
        label.text = nameArr[i];
        label.font = [UIFont systemFontOfSize:8.0f];
        label.textAlignment = NSTextAlignmentCenter;
        
        [verticalContainer addArrangedSubview:switchView];
        [verticalContainer addArrangedSubview:label];
        [horizontalStackView addArrangedSubview:verticalContainer];
    }
    
    [_switchesStackView addArrangedSubview:horizontalStackView];
}


- (void)setupChartViewEventHandlers {
    //获取图表加载完成事件
    [_aaChartView didFinishLoadHandler:^(AAChartView *aaChartView) {
        NSLog(@"🚀🚀🚀🚀 AAChartView content did finish load!!!");
    }];
    
    [_aaChartView clickEventHandler:^(AAChartView *aaChartView,
                                      AAClickEventMessageModel *message) {
            NSDictionary *messageDic = @{
                @"category":message.category,
                @"index":@(message.index),
                @"name":message.name,
                @"offset":message.offset,
                @"x":message.x,
                @"y":message.y
            };
            
            NSString *str1 = [NSString stringWithFormat:@"🖱🖱🖱🖱 clicked point series element name: %@\n",
                              message.name];
            NSString *str2 = [NSString stringWithFormat:@"user finger clicked!!!,get the click event BLOCK message: %@",
                              messageDic];
            NSLog(@"%@%@",str1, str2);
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
        
        NSString *str1 = [NSString stringWithFormat:@"👌👌👌👌 move over point series element name: %@\n",
                          message.name];
        NSString *str2 = [NSString stringWithFormat:@"user finger moved over!!!,get the move over event BLOCK message: %@",
                          messageDic];
        NSLog(@"%@%@",str1, str2);
    }];
}

- (void)setupAAChartViewWithChartType:(AAChartType)chartType {
    _aaChartModel = [BasicChartComposer configureChartModelWithChartType:_chartType];
}

/**
 *   图表 Y 轴标示线的设置
 *   标示线设置作为图表一项基础功能,用于对图表的基本数据水平均线进行标注
 *   虽然不太常被使用,但我们仍然提供了此功能的完整接口,以便于有特殊需求的用户使用
 *   解除👆上面的设置 Y 轴标注线的已被注释代码,,运行程序,即可查看实际工程效果以酌情选择
 *
 **/
- (void)configureTheYAxisPlotLineForAAChartView {
    // 移除此方法的实现，逻辑已移至 BasicChartComposer
}

#pragma mark -- AAChartView delegate
- (void)aaChartViewDidFinishLoad:(AAChartView *)aaChartView {
    NSLog(@"🔥 AAChartView content did finish load!!!");
}

- (void)aaChartView:(AAChartView *)aaChartView clickEventWithMessage:(AAClickEventMessageModel *)message {
    NSDictionary *messageDic = @{
        @"category":message.category,
        @"index":@(message.index),
        @"name":message.name,
        @"offset":message.offset,
        @"x":message.x,
        @"y":message.y
    };
    NSString *str1 = [NSString stringWithFormat:@"🖱🖱🖱 clicked the point series element name: %@\n",
                      message.name];
    NSString *str2 = [NSString stringWithFormat:@"user finger clicked!!!,get the move over event DELEGATE message: %@",
                      messageDic];
    NSLog(@"%@%@",str1, str2);
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
    
    NSString *str1 = [NSString stringWithFormat:@"👌👌👌 move over the point series element name: %@\n",
                      message.name];
    NSString *str2 = [NSString stringWithFormat:@"user finger moved over!!!,get the move over event DELEGATE message: %@",
                      messageDic];
    NSLog(@"%@%@",str1, str2);
}

- (void)customSegmentedControlCellValueBeChanged:(UISegmentedControl *)segmentedControl {
    NSUInteger selectedSegmentIndex = (NSUInteger) segmentedControl.selectedSegmentIndex;
    
    switch (segmentedControl.tag) {
        case 0: {
            NSArray *stackingArr = @[
                AAChartStackingTypeFalse,
                AAChartStackingTypeNormal,
                AAChartStackingTypePercent
            ];
            _aaChartModel.stacking = stackingArr[selectedSegmentIndex];
        }
            break;
            
        case 1: {
            if (_chartType == 0 || _chartType == 1 ) {
                NSArray *borderRadiusArr = @[ @0, @10, @100 ];
                _aaChartModel.borderRadius = borderRadiusArr[selectedSegmentIndex];
            } else {
                NSArray *symbolArr = @[
                    AAChartSymbolTypeCircle,
                    AAChartSymbolTypeSquare,
                    AAChartSymbolTypeDiamond,
                    AAChartSymbolTypeTriangle,
                    AAChartSymbolTypeTriangle_down
                ];
                _aaChartModel.markerSymbol = symbolArr[selectedSegmentIndex];
            }
        }
            break;
            
        default:
            break;
    }
    
    [self refreshTheChartView];
}


- (void)switchViewClicked:(UISwitch *)switchView {
    BOOL isOn = switchView.isOn;
    
    switch (switchView.tag) {
        case 0: _aaChartModel.xAxisReversed = isOn; break;
        case 1: _aaChartModel.yAxisReversed = isOn; break;
        case 2: _aaChartModel.inverted = isOn; break;
        case 3: _aaChartModel.polar = isOn; break;
        case 4: _aaChartModel.dataLabelsEnabled = isOn; break;
        case 5: _aaChartModel.markerRadius = isOn ? @0 : @5; break;
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
