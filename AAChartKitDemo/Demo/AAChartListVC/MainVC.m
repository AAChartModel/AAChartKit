//
//  FirstViewController.m
//  AAChartKit
//
//  Created by An An on 17/3/14.
//  Copyright © 2017年 An An. All rights reserved.
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
 * StackOverflow : https://stackoverflow.com/users/12302132/codeforu
 * JianShu       : https://www.jianshu.com/u/f1e6753d4254
 * SegmentFault  : https://segmentfault.com/u/huanghunbieguan
 *
 * -------------------------------------------------------------------------------
 
 */

#import "MainVC.h"
#import "OnlyRefreshChartDataVC.h"
#import "ChartAnimationTypeVC.h"
#import "ShowManyChartViewVC.h"
#import "ChartListVC.h"
#import "HideOrShowChartSeriesVC.h"
#import "MonitorViewController.h"
#import "JSFunctionForAATooltipVC.h"
#import "EvaluateJSStringFunctionVC.h"
#import "ScrollingUpdateDataVC.h"
#import "DoubleChartsLinkedWorkVC.h"
#import "DoubleChartsLinkedWorkVC2.h"
#import "TripleChartsLinkedWorkVC.h"
#import "DrawableChartVC.h"
#import "DataSortingWithAnimationChartVC.h"
#import "ChartAdvancedUpdatingFeatureVC.h"
#import "TestAAChartViewForXibVC.h"
#import "JSFunctionForAAAxisVC.h"
#import "JSFunctionForAALegendVC.h"
#import "JSFunctionForAAChartEventsVC.h"
#import "CustomTableViewCell.h"
#import "CustomClickEventCallbackMessageVC.h"
#import "CustomTooltipClickEventCallbackVC.h"
#import "DynamicTooltipAfterClickRequestVC.h"
#import "LineChartViewController.h"
#import "AAOptionsComposerChartListVC.h"

#define AAGrayColor            [UIColor colorWithRed:245/255.0 green:246/255.0 blue:247/255.0 alpha:1.0]

@interface MainVC ()<UITableViewDelegate,UITableViewDataSource>

@property (nonatomic, strong) NSArray *chartTypeNameArr;
@property (nonatomic, strong) NSArray *sectionTypeArr;
@property (nonatomic, strong) NSArray *colorsArr;

@end

@implementation MainVC

- (void)viewWillAppear:(BOOL)animated {
    [super viewWillAppear:YES];
    self.navigationController.navigationBar.barTintColor = [UIColor whiteColor];
}

- (void)viewDidLoad {
    [super viewDidLoad];
    self.title = @"AAChartKit";
    self.view.backgroundColor = [UIColor whiteColor];
    _colorsArr = @[
        @"#5470c6",
        @"#91cc75",
        @"#fac858",
        @"#ee6666",
        @"#73c0de",
        @"#3ba272",
        @"#fc8452",
        @"#9a60b4",
        @"#ea7ccc",

        @"#5470c6",
        @"#91cc75",
        @"#fac858",
        @"#ee6666",
        @"#73c0de",
        @"#3ba272",
        @"#fc8452",
        @"#9a60b4",
        @"#ea7ccc",
    ];

    [self configTheTableView];
}

- (void)configTheTableView {
    UITableView *tableView = [[UITableView alloc]init];
    tableView.frame = self.view.bounds;
    tableView.autoresizingMask = UIViewAutoresizingFlexibleWidth | UIViewAutoresizingFlexibleHeight;
    tableView.delegate = self;
    tableView.dataSource = self;
    tableView.sectionHeaderHeight = 50;
    [tableView registerNib:[UINib nibWithNibName:@"CustomTableViewCell" bundle:[NSBundle mainBundle]] forCellReuseIdentifier:@"customCell"];
    [self.view addSubview:tableView];
}

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return self.chartTypeNameArr.count;
}

#pragma mark -- UITableViewDelegate && UITableViewDataSource
- (UIView *)tableView:(UITableView *)tableView viewForHeaderInSection:(NSInteger)section {
    UIView *sectionHeaderView = [[UIView alloc]init];
    
    UILabel *sectionTitleLabel = [[UILabel alloc]init];
    sectionTitleLabel.frame = sectionHeaderView.bounds;
    sectionTitleLabel.autoresizingMask = UIViewAutoresizingFlexibleWidth | UIViewAutoresizingFlexibleHeight;
    UIColor *bgColor = [AAEasyTool colorWithHexString:_colorsArr[section % 18]];
    sectionTitleLabel.backgroundColor = bgColor;
    NSString *titleStr = self.sectionTypeArr[(NSUInteger) section];
    titleStr = [titleStr stringByReplacingOccurrencesOfString:@"---" withString:@" | "];
    sectionTitleLabel.text = titleStr;
    sectionTitleLabel.textColor = UIColor.whiteColor; //255 48 48
    sectionTitleLabel.font = [UIFont boldSystemFontOfSize:16.0f];
    sectionTitleLabel.textAlignment = NSTextAlignmentCenter;
    [sectionHeaderView addSubview:sectionTitleLabel];

    return sectionHeaderView;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    NSArray *arr = self.chartTypeNameArr[(NSUInteger) section];
    return arr.count;
}

- (NSArray *)sectionIndexTitlesForTableView: (UITableView *)tableView {
    NSMutableArray *listTitles = [[NSMutableArray alloc] init];
    for (NSString *item in self.sectionTypeArr) {
          NSString *title = [item substringToIndex: 1];
          [listTitles addObject: title];
    }
    return listTitles;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    CustomTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"customCell"];
    cell.accessoryType = UITableViewCellAccessoryDisclosureIndicator;
    
    cell.numberLabel.text = [NSString stringWithFormat:@"%ld", indexPath.row + 1];
    cell.numberLabel.layer.masksToBounds = true;
    cell.numberLabel.layer.cornerRadius = 10;
    UIColor *numBgColor = [AAEasyTool colorWithHexString:_colorsArr[indexPath.section % 18]];
    cell.numberLabel.backgroundColor = numBgColor;
    cell.numberLabel.textColor = UIColor.whiteColor;
    NSString *textStr = self.chartTypeNameArr[(NSUInteger) indexPath.section][(NSUInteger) indexPath.row];
    NSArray *textStrArr = [textStr componentsSeparatedByString:@"---"];
    cell.titleLabel.text = textStrArr[0];
    cell.subtitleLabel.text = textStrArr[1];
    
    if (indexPath.row % 2 == 0) {
        cell.backgroundColor = [AAEasyTool colorWithHexString:@"#FFF0F5"];
    } else {
        cell.backgroundColor = UIColor.whiteColor;
    }

    return cell;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
   NSUInteger row = (NSUInteger) indexPath.row;
   NSUInteger section = (NSUInteger) indexPath.section;

    switch (section) {
        case 0: {
            /*图表数据动态刷新*/
            OnlyRefreshChartDataVC *vc = OnlyRefreshChartDataVC.new;
            vc.selectedIndex = row;
            vc.navigationItemTitleArr = self.chartTypeNameArr[section];
            vc.hidesBottomBarWhenPushed = YES;
            [self.navigationController  pushViewController:vc animated:YES];
        }
            break;
            
        case 1: {
            /*JQuery动画样式类型演示*/
            ChartAnimationTypeVC *vc = ChartAnimationTypeVC.new;
            vc.chartType = row;
            vc.hidesBottomBarWhenPushed = YES;
            [self.navigationController pushViewController:vc animated:YES];
        }
            break;
        
        case 2: {
            /*同时显示多个 AAChartView*/
            if (row == 0) {
                ShowManyChartViewVC *vc = ShowManyChartViewVC.new;
                vc.hidesBottomBarWhenPushed = YES;
                [self.navigationController pushViewController:vc animated:YES];
            } else if (row == 1) {
                ChartListVC *vc = ChartListVC.new;
                vc.hidesBottomBarWhenPushed = YES;
                [self.navigationController pushViewController:vc animated:YES];
            } else if (row == 2) {
                DoubleChartsLinkedWorkVC *vc = DoubleChartsLinkedWorkVC.new;
                vc.hidesBottomBarWhenPushed = YES;
                [self.navigationController pushViewController:vc animated:YES];
            } else if (row == 3) {
                DoubleChartsLinkedWorkVC2 *vc = DoubleChartsLinkedWorkVC2.new;
                vc.hidesBottomBarWhenPushed = YES;
                [self.navigationController pushViewController:vc animated:YES];
            }  else if (row == 4) {
                TripleChartsLinkedWorkVC *vc = TripleChartsLinkedWorkVC.new;
                vc.hidesBottomBarWhenPushed = YES;
                [self.navigationController pushViewController:vc animated:YES];
            }
        }
            break;
            
        case 3: {
            HideOrShowChartSeriesVC *vc = HideOrShowChartSeriesVC.new;
            vc.chartTypeIndex = row;
            vc.hidesBottomBarWhenPushed = YES;
            [self.navigationController pushViewController:vc animated:YES];
        }
            break;
            
        case 4: {
            JSFunctionForAATooltipVC *vc = JSFunctionForAATooltipVC.new;
            vc.selectedIndex = row;
            vc.navigationItemTitleArr = self.chartTypeNameArr[section];
            vc.hidesBottomBarWhenPushed = YES;
            [self.navigationController pushViewController:vc animated:YES];
        }
            break;
            
        case 5: {
            /*基础类型图表*/
            EvaluateJSStringFunctionVC *vc = EvaluateJSStringFunctionVC.new;
            vc.sampleChartTypeIndex = row;
            vc.hidesBottomBarWhenPushed = YES;
            [self.navigationController pushViewController:vc animated:YES];
        }
            break;
            
        case 6: {
            /*基础类型图表*/
            ScrollingUpdateDataVC *vc = ScrollingUpdateDataVC.new;
            vc.selectedIndex = row;
            vc.navigationItemTitleArr = self.chartTypeNameArr[section];
            vc.hidesBottomBarWhenPushed = YES;
            [self.navigationController pushViewController:vc animated:YES];
        }
            break;
            
        case 7: {
            /*基础类型图表*/
            DrawableChartVC *vc = DrawableChartVC.new;
            vc.selectedIndex = row;
            vc.navigationItemTitleArr = self.chartTypeNameArr[section];
            vc.chartType = row;
            vc.type = DrawableChartVCTypeUpdateXAxsiExtremes;
            vc.hidesBottomBarWhenPushed = YES;
            [self.navigationController pushViewController:vc animated:YES];
        }
            break;
            
        case 8: {
            /*基础类型图表*/
            DrawableChartVC *vc = DrawableChartVC.new;
            vc.selectedIndex = row;
            vc.navigationItemTitleArr = self.chartTypeNameArr[section];
            vc.chartType = row;
            vc.type = DrawableChartVCTypeChangeChartViewContentSize;
            vc.hidesBottomBarWhenPushed = YES;
            [self.navigationController pushViewController:vc animated:YES];
        }
            break;
            
        case 9: {
            /*基础类型图表*/
            DataSortingWithAnimationChartVC *vc = DataSortingWithAnimationChartVC.new;
            vc.selectedIndex = row;
            vc.navigationItemTitleArr = self.chartTypeNameArr[section];
            vc.hidesBottomBarWhenPushed = YES;
            [self.navigationController pushViewController:vc animated:YES];
        }
            break;
            
        case 10: {
            /*基础类型图表*/
            ChartAdvancedUpdatingFeatureVC *vc = ChartAdvancedUpdatingFeatureVC.new;
            vc.chartType = row;
            vc.hidesBottomBarWhenPushed = YES;
            [self.navigationController pushViewController:vc animated:YES];
        }
            break;
            
        case 11: {
            /*在 XIB 中创建 AAChartView*/
            TestAAChartViewForXibVC *vc = TestAAChartViewForXibVC.new;
            vc.hidesBottomBarWhenPushed = YES;
            [self.navigationController pushViewController:vc animated:YES];
        }
            break;
            
        case 12: {
            /*通过 AAOptions 自定义 X 轴 Y 轴的 Labels*/
            JSFunctionForAAAxisVC *vc = JSFunctionForAAAxisVC.new;
            vc.selectedIndex = row;
            vc.navigationItemTitleArr = self.chartTypeNameArr[section];
            vc.hidesBottomBarWhenPushed = YES;
            [self.navigationController pushViewController:vc animated:YES];
        }
            break;
        case 13: {
            /*通过 AAOptions 自定义 AALegend*/
            JSFunctionForAALegendVC *vc = JSFunctionForAALegendVC.new;
            vc.selectedIndex = row;
            vc.navigationItemTitleArr = self.chartTypeNameArr[section];
            vc.hidesBottomBarWhenPushed = YES;
            [self.navigationController pushViewController:vc animated:YES];
        }
            break;
        case 14: {
            /*通过 AAOptions 自定义 AAChartEvents*/
            JSFunctionForAAChartEventsVC *vc = JSFunctionForAAChartEventsVC.new;
            vc.selectedIndex = row;
            vc.navigationItemTitleArr = self.chartTypeNameArr[section];
            vc.hidesBottomBarWhenPushed = YES;
            [self.navigationController pushViewController:vc animated:YES];
        }
            break;
            
        case 15: {
            /*通过 AAOptions 自定义折线图*/
            LineChartViewController *vc = LineChartViewController.new;
            vc.selectedIndex = row;
            vc.navigationItemTitleArr = self.chartTypeNameArr[section];
            vc.hidesBottomBarWhenPushed = YES;
            [self.navigationController pushViewController:vc animated:YES];
        }
            break;
                        
        case 16: {
            /*完全自定义图表交互事件回调的信息*/
            if (row == 0) {
                CustomClickEventCallbackMessageVC *vc = CustomClickEventCallbackMessageVC.new;
                vc.hidesBottomBarWhenPushed = YES;
                [self.navigationController pushViewController:vc animated:YES];
            } else if (row == 1) {
                CustomTooltipClickEventCallbackVC *vc = CustomTooltipClickEventCallbackVC.new;
                vc.hidesBottomBarWhenPushed = YES;
                [self.navigationController pushViewController:vc animated:YES];
            } else if (row == 2) {
                DynamicTooltipAfterClickRequestVC *vc = DynamicTooltipAfterClickRequestVC.new;
                vc.hidesBottomBarWhenPushed = YES;
                [self.navigationController pushViewController:vc animated:YES];
            }
        }
            break;

        case 17: {
            /*AAOptions Composer Provider 测试入口*/
            AAOptionsComposerChartListVC *vc = AAOptionsComposerChartListVC.new;
            vc.hidesBottomBarWhenPushed = YES;
            [self.navigationController pushViewController:vc animated:YES];
        }
            break;
            
        default:
            break;
    }
    
}

- (NSArray *)sectionTypeArr {
    if (!_sectionTypeArr) {
        _sectionTypeArr = @[
            @"Only Refresh data---单纯刷新数据",
            @"Animation Type---渲染动画",
            @"Many ChartView simultaneously---同时显示多个AAChartView",
            @"Hide Or Show Chart Series---隐藏或显示内容",
            @"JS Function For AATooltip---支持 JS 函数属性",
            @"Evaluate JS String Function---注入并执行js函数",
            @"Scrolling Updating Data---图表滚动刷新",
            @"Drawable Chart---可拖拽的图表1📈",
            @"Drawable Chart---可拖拽的图表2📊",
            @"Data Sorting Chart With Animation---图表动态排序",
            @"Chart Options Advanced Updating---图表高级更新",
            @"XIB AAChartView---在 XIB 中创建 AAChartView",
            @"JS Function For AAAxis Labels---通过 JSFunction 自定义 AAAxis 的 Labels",
            @"JS Function For AALegend Click Events---通过 JSFunction 自定义 Legend  图例的点击事件",
            @"JS Function For AAChartEvents---通过 JSFunction 自定义 AAChartEvents 的事件",
            @"Line Chart Options---通过 AAOptions 自定义折线图",
            @"Custom Event Callback Message---完全自定义图表交互事件回调的信息",
            @"AAOptions Composer Provider---AAOptions 统一预览测试入口",
        ];
    }
    return _sectionTypeArr;
}

- (NSArray *)chartTypeNameArr {
    if (!_chartTypeNameArr) {
        _chartTypeNameArr = @[
            /*图表数据动态刷新*/
            @[@"Column Chart---柱形图",
              @"Bar Chart---条形图",
              @"Area Chart---折线填充图",
              @"Areaspline Chart---曲线填充图",
              @"Line Chart---折线图",
              @"Spline Chart---曲线图",
              @"Step Line Chart---直方折线图",
              @"Step Area Chart---直方折线填充图",
              @"Scatter Chart---散点图"
            ],
            /*JQuery动画样式类型演示*/
            @[@"Column Chart---柱形图",
              @"Bar Chart---条形图",
              @"Area Chart---折线填充图",
              @"Areaspline Chart---曲线填充图",
              @"Line Chart---折线图",
              @"Spline Chart---曲线图",
              @"Step Line Chart---直方折线图",
              @"Step Area Chart---直方折线填充图",
              @"Scatter Chart---散点图",
              @"Pie Chart---扇形图"
            ],
            /*同时显示多个 AAChartView*/
            @[@"Show Two AAChartView On View---同时显示多个 AAChartView",
              @"Show Many AAChartView On UITableView---UITableView上显示多个 AAChartView",
              @"Double Charts Linked Working---双表联动",
              @"Double Charts Linked Working2---双表联动2",
              @"Triple Charts Linked Working---三表联动"
            ],
            /*隐藏或显示图表的Series*/
            @[@"Column Chart---柱形图",
              @"Bar Chart---条形图",
              @"Area Chart---折线填充图",
              @"Areaspline Chart---曲线填充图",
              @"Line Chart---折线图",
              @"Spline Chart---曲线图",
              @"Step Line Chart---直方折线图",
              @"Step Area Chart---直方折线填充图",
              @"Scatter Chart---散点图",
              @"Pie Chart---饼图"
            ],
            
            /*JS Function For AATooltip*/
            @[@"customAreaChartTooltipStyleWithSimpleFormatString---简单字符串拼接",
              @"customAreaChartTooltipStyleWithDifferentUnitSuffix---自定义不同单位后缀",
              @"customAreaChartTooltipStyleWithColorfulHtmlLabels---自定义多彩颜色文字",
              @"customLineChartTooltipStyleWhenValueBeZeroDoNotShow---值为0时,在tooltip中不显示",
              @"customStackedAndGroupedColumnChartTooltip---自定义分组堆积柱状图tooltip内容",
              @"configureSpecialStyleTrianglePolarChart---外部显示六边形边框的三角形雷达图",
              @"customArearangeChartTooltip---自定义面积范围图的 tooltip",
              @"customLineChartOriginalPointPositionByConfiguringXAxisFormatterAndTooltipFormatter---通过自定义X轴的 labels 的 Formatter 和 tooltip 的 Formatter 来调整折线图的 X 轴左边距",
              @"customTooltipWhichDataSourceComeFromOutSideRatherThanSeries---通过来自外部的数据源来自定义 tooltip (而非常规的来自图表的 series)",
              @"customAreasplineChartTooltipStyleByDivWithCSS---通过自定义 div 的 css 样式来自定义复杂效果的 tooltip 浮动提示框",
            ],

            /*执行由 JavaScript 字符串映射转换成的 js function 函数*/
            @[@"Custom Chart DataLabel Sample One---自定义 DataLabel 1",
              @"Custom Chart DataLabel Sample Two---自定义 DataLabel 2",
              @"Custom Chart StackLabel Sample---自定义 StackLabel ",
              @"Support Dragging Chart On X Axis---支持图表在 X 轴方向上拖动",
              @"Show Tooltip In Specific Postion after chart was loaded---图表加载完成后,指定位置默认显示 tooltip",
              @"Add Event For XAxis Labels Group Element---为 X 轴文字 Labels 添加点击事件 "
            ],
            /*基础类型图表X轴水平滚动刷新*/
            @[@"Column Chart---柱形图",
              @"Bar Chart---条形图",
              @"Area Chart---折线填充图",
              @"Areaspline Chart---曲线填充图",
              @"Line Chart---折线图",
              @"Spline Chart---曲线图",
              @"Step Line Chart---直方折线图",
              @"Step Area Chart---直方折线填充图",
              @"Scatter Chart---散点图"
            ],
            /*基础类型图表X轴水平拖动类型 1*/
            @[@"Column Chart---柱形图",
              @"Bar Chart---条形图",
              @"Area Chart---折线填充图",
              @"Areaspline Chart---曲线填充图",
              @"Line Chart---折线图",
              @"Spline Chart---曲线图",
              @"Step Line Chart---直方折线图",
              @"Step Area Chart---直方折线填充图",
              @"Scatter Chart---散点图"
            ],
            /*基础类型图表X轴水平拖动类型 2*/
            @[@"Column Chart---柱形图",
              @"Bar Chart---条形图",
              @"Area Chart---折线填充图",
              @"Areaspline Chart---曲线填充图",
              @"Line Chart---折线图",
              @"Spline Chart---曲线图",
              @"Step Line Chart---直方折线图",
              @"Step Area Chart---直方折线填充图",
              @"Scatter Chart---散点图"
            ],
            /*基础类型图表X轴水平拖动类型 2*/
            @[@"Column Chart---柱形图",
              @"Bar Chart---条形图",
              @"Scatter Chart---散点图"
            ],
            /*图表高级更新*/
            @[@"Column Chart---柱形图",
              @"Bar Chart---条形图",
              @"Area Chart---折线填充图",
              @"Areaspline Chart---曲线填充图",
              @"Line Chart---折线图",
              @"Spline Chart---曲线图",
              @"Step Line Chart---直方折线图",
              @"Step Area Chart---直方折线填充图",
              @"Scatter Chart---散点图"
            ],
            /*在 XIB 中创建 AAChartView*/
            @[@"XIB AAChartView---在 XIB 中创建 AAChartView",
            ],
            /*通过 JSFunction 自定义 AAAxis 的 Labels*/
            @[@"customYAxisLabels---自定义Y轴文字",
              @"customYAxisLabels2---自定义Y轴文字2",
              @"customAreaChartXAxisLabelsTextUnitSuffix1---自定义X轴文字单位后缀(通过 formatter 函数)",
              @"customAreaChartXAxisLabelsTextUnitSuffix2---自定义X轴文字单位后缀(不通过 formatter 函数)",
              @"configureTheAxesLabelsFormattersOfDoubleYAxesChart---配置双 Y 轴图表的 Y 轴文字标签的 Formatter 函数 示例 1",
              @"configureTheAxesLabelsFormattersOfDoubleYAxesChart2---配置双 Y 轴图表的 Y 轴文字标签的 Formatter 函数 示例 2",
              @"configureTheAxesLabelsFormattersOfDoubleYAxesChart3---配置双 Y 轴图表的 Y 轴文字标签的 Formatter 函数 示例 3",
              @"customColumnChartXAxisLabelsTextByInterceptTheFirstFourCharacters---通过截取前四个字符来自定义 X 轴 labels",
              @"customSpiderChartStyle---自定义蜘蛛🕷🕸图样式",
              @"customizeEveryDataLabelSinglelyByDataLabelsFormatter---通过 DataLabels 的 formatter 函数来实现单个数据标签🏷自定义",
              @"customXAxisLabelsBeImages---自定义 X轴 labels 为一组图片",
              @"loadImageForAATooltip---为自定义 AATooltip 加载图片内容",
            ],
            /*自定义 Legend 图例点击事件*/
            @[@"disableLegendClickEventForNormalChart---禁用普通图表的图例点击事件",
              @"disableLegendClickEventForPieChart---禁用饼图的图例点击事件",
              @"customLegendItemClickEvent---自定义图例点击事件",
            ],
            /*通过 JSFunction 自定义 AAChartEvents 的事件*/
            @[@"setCrosshairAndTooltipToTheDefaultPositionAfterLoadingChart---图表加载完成后设置 crosshair 和 tooltip 到默认位置",
              @"generalDrawingChart---普通绘图",
              @"advancedTimeLineChart---高级时间轴绘图",
              @"configureBlinkMarkerChart---配置闪烁特效的 marker 图表",
              @"configureSpecialStyleMarkerOfSingleDataElementChartWithBlinkEffect---配置闪烁特效的 marker 图表2",
              @"configureScatterChartWithBlinkEffect---配置闪烁特效的散点图",
              @"automaticallyHideTooltipAfterItIsShown---在浮动提示框显示后自动隐藏",
              @"dynamicHeightGridLineAreaChart---动态高度的网格线区域填充图",
              @"customizeYAxisPlotLinesLabelBeSpecialStyle---自定义 Y 轴轴线上面的标签文字特殊样式",
              @"configureECGStyleChart---配置心电图样式图表📈",
              @"configureTheSizeOfTheSliceOfDonutAndPieChart---配置环形图和饼图的扇区大小",
              @"configurePlotBackgroundClickEvent---配置绘图区的点击事件",
            ],
            /*自定义折线图*/
            @[@"customconnectNullsWithZonesForLineChart---自定义 connectNulls + zones 实现同一个 line chart 局部断开和局部重连",
              @"fixedWidthSlotsLineChartWithOnePointAndRightExtension---固定 10 槽位: 1 点显示 + 向右补线",
              @"fixedWidthSlotsLineChartWithTwoPoints---固定 10 槽位: 2 点显示在左右两端",
              @"fixedWidthSlotsLineChartWithThreePoints---固定 10 槽位: 3 点显示在左/中/右",
              @"fixedWidthSlotsLineChartWithTenPoints---固定 10 槽位: 10 点等距填满 + 强化 Marker",
            ],
            /*完全自定义图表交互事件回调的信息*/
            @[@"Custom Click Event Callback Message---自定义点击及滑动事件回调的信息",
              @"CustomTooltipClickEventCallbackVC---自定义 tooltip 点击事件",
              @"DynamicTooltipAfterClickRequestVC---点击图表📊后请求数据动态更新 tooltip 内容",
            ],
            /*AAOptions Composer Provider 测试*/
            @[@"Open AAOptions Composer ChartListVC---统一预览全部 AAOptions 样例",
            ]
            
        ];
    }
    return _chartTypeNameArr;
}

@end
