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
#import "BasicChartVC.h"
#import "SpecialChartVC.h"
#import "OnlyRefreshChartDataVC.h"
#import "ChartAnimationTypeVC.h"
#import "DrawChartWithAAOptionsVC.h"
#import "ShowManyChartViewVC.h"
#import "ChartListVC.h"
#import "MixedChartVC.h"
#import "HideOrShowChartSeriesVC.h"
#import "CustomStyleChartVC.h"
#import "MonitorViewController.h"
#import "JSFormatterFunctionVC.h"
#import "EvaluateJSStringFunctionVC.h"
#import "ScrollingUpdateDataVC.h"
#import "DoubleChartsLinkedWorkVC.h"
#import "DrawableChartVC.h"
#import "DataSortingWithAnimationChartVC.h"
#import "ChartAdvancedUpdatingFeatureVC.h"
#import "TestAAChartViewForXibVC.h"
#import "PieChartOptionsVC.h"
#import "PolarChartOptionsVC.h"
#import "MultiYAxesChartOptionsVC.h"
#import "PlotLinesBandsZonesOptionsVC.h"
#import "AreasplineChartOptionsVC.h"
#import "TooltipOptionsVC.h"
#import "DataLabelsOptionsVC.h"
#import "XAxisYAxisLabelsOptionsVC.h"
#import "XAxisYAxisTypeOptionsVC.h"
#import "JSFunctionForAAChartEventsVC.h"

#define AAGrayColor            [UIColor colorWithRed:245/255.0 green:246/255.0 blue:247/255.0 alpha:1.0]

@interface MainVC ()<UITableViewDelegate,UITableViewDataSource>

@property (nonatomic, strong) NSArray *chartTypeNameArr;
@property (nonatomic, strong) NSArray *sectionTypeArr;

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

    [self configTheTableView];
}

- (void)configTheTableView {
    UITableView *tableView = [[UITableView alloc]init];
    tableView.frame = self.view.bounds;
    tableView.autoresizingMask = UIViewAutoresizingFlexibleWidth | UIViewAutoresizingFlexibleHeight;
    tableView.delegate = self;
    tableView.dataSource = self;
    tableView.sectionHeaderHeight = 50;
    [self.view addSubview:tableView];
}

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return self.chartTypeNameArr.count;
}


- (UIView *)tableView:(UITableView *)tableView viewForHeaderInSection:(NSInteger)section {
    UIView *sectionHeaderView = [[UIView alloc]init];
    
    UILabel *sectionTitleLabel = [[UILabel alloc]init];
    sectionTitleLabel.frame = sectionHeaderView.bounds;
    sectionTitleLabel.autoresizingMask = UIViewAutoresizingFlexibleWidth | UIViewAutoresizingFlexibleHeight;
    sectionTitleLabel.backgroundColor = [AAEasyTool colorWithHexString:@"#FF3030"]; 
    NSString *titleStr = self.sectionTypeArr[(NSUInteger) section];
    titleStr = [titleStr stringByReplacingOccurrencesOfString:@"---" withString:@" | "];
    sectionTitleLabel.text = titleStr;
    sectionTitleLabel.textColor = UIColor.whiteColor; //255 48 48
    sectionTitleLabel.font = [UIFont boldSystemFontOfSize:16.0f];
    sectionTitleLabel.textAlignment = NSTextAlignmentCenter;
    [sectionHeaderView addSubview:sectionTitleLabel];

    return sectionHeaderView;
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath {
    if (   indexPath.section == 2
        || indexPath.section == 3
        || indexPath.section == 6
        || indexPath.section == 9
        || indexPath.section == 10
        || indexPath.section == 22
        ) {
        return 85;
    } else {
        return 60;
    }
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
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"cell"];
    if (!cell) {
        cell = [[UITableViewCell alloc]initWithStyle:UITableViewCellStyleSubtitle reuseIdentifier:@"cell"];
        cell.textLabel.textColor = [UIColor redColor];
        cell.textLabel.numberOfLines = 0;
        cell.textLabel.textAlignment = NSTextAlignmentLeft;
        cell.textLabel.font = [UIFont systemFontOfSize:18];
        cell.detailTextLabel.font = [UIFont systemFontOfSize:14];
        cell.detailTextLabel.numberOfLines = 0;
        cell.accessoryType = UITableViewCellAccessoryDisclosureIndicator;
    }
    NSString *textStr = self.chartTypeNameArr[(NSUInteger) indexPath.section][(NSUInteger) indexPath.row];
    NSArray *textStrArr = [textStr componentsSeparatedByString:@"---"];
    cell.textLabel.text = textStrArr[0];
    cell.detailTextLabel.text = textStrArr[1];
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
            /*基础类型图表*/
            BasicChartVC *vc = BasicChartVC.new;
            vc.chartType = row;
            [self.navigationController pushViewController:vc animated:YES];
        }
            break;
        
        case 1: {
            /*特殊类型图表*/
            SpecialChartVC *vc = SpecialChartVC.new;
            vc.selectedIndex = row;
            vc.navigationItemTitleArr = self.chartTypeNameArr[section];
            [self.navigationController pushViewController:vc animated:YES];
        }
            break;
            
        case 2: {
            /*一些自定义样式图表*/
            CustomStyleChartVC *vc = CustomStyleChartVC.new;
            vc.selectedIndex = row;
            vc.navigationItemTitleArr = self.chartTypeNameArr[section];
            [self.navigationController  pushViewController:vc animated:YES];
        }
            break;
            
        case 3: {
            /*图表数据动态刷新*/
            MixedChartVC *vc = MixedChartVC.new;
            vc.selectedIndex = row;
            vc.navigationItemTitleArr = self.chartTypeNameArr[section];
            [self.navigationController  pushViewController:vc animated:YES];
        }
            break;
            
        case 4: {
            /*图表数据动态刷新*/
            OnlyRefreshChartDataVC *vc = OnlyRefreshChartDataVC.new;
            vc.selectedIndex = row;
            vc.navigationItemTitleArr = self.chartTypeNameArr[section];
            [self.navigationController  pushViewController:vc animated:YES];
        }
            break;
            
        case 5: {
            /*JQuery动画样式类型演示*/
            ChartAnimationTypeVC *vc = ChartAnimationTypeVC.new;
            vc.chartType = row;
            [self.navigationController pushViewController:vc animated:YES];
        }
            break;
        
        case 6: {
            /*通过AAOptions实例对象来绘制图形*/
            DrawChartWithAAOptionsVC *vc = DrawChartWithAAOptionsVC.new;
            vc.selectedIndex = row;
            vc.navigationItemTitleArr = self.chartTypeNameArr[section];
            [self.navigationController pushViewController:vc animated:YES];
        }
            break;
            
        case 7: {
            /*同时显示多个 AAChartView*/
            if (row == 0) {
                ShowManyChartViewVC *vc = ShowManyChartViewVC.new;
                [self.navigationController pushViewController:vc animated:YES];
            } else if (row == 1) {
                ChartListVC *listVC = ChartListVC.new;
                [self.navigationController pushViewController:listVC animated:YES];
            } else {
                DoubleChartsLinkedWorkVC *vc = DoubleChartsLinkedWorkVC.new;
                [self.navigationController pushViewController:vc animated:YES];
            }
        }
            break;
            
        case 8: {
            HideOrShowChartSeriesVC *vc = HideOrShowChartSeriesVC.new;
            vc.chartTypeIndex = row;
            [self.navigationController pushViewController:vc animated:YES];
        }
            break;
            
        case 9: {
            JSFormatterFunctionVC *vc = JSFormatterFunctionVC.new;
            vc.selectedIndex = row;
            vc.navigationItemTitleArr = self.chartTypeNameArr[section];
            [self.navigationController pushViewController:vc animated:YES];
        }
            break;
            
        case 10: {
            /*基础类型图表*/
            EvaluateJSStringFunctionVC *vc = EvaluateJSStringFunctionVC.new;
            vc.sampleChartTypeIndex = row;
            [self.navigationController pushViewController:vc animated:YES];
        }
            break;
            
        case 11: {
            /*基础类型图表*/
            ScrollingUpdateDataVC *vc = ScrollingUpdateDataVC.new;
            vc.selectedIndex = row;
            vc.navigationItemTitleArr = self.chartTypeNameArr[section];
            [self.navigationController pushViewController:vc animated:YES];
        }
            break;
            
        case 12: {
            /*基础类型图表*/
            DrawableChartVC *vc = DrawableChartVC.new;
            vc.selectedIndex = row;
            vc.navigationItemTitleArr = self.chartTypeNameArr[section];
            vc.chartType = row;
            vc.type = DrawableChartVCTypeUpdateXAxsiExtremes;
            [self.navigationController pushViewController:vc animated:YES];
        }
            break;
            
        case 13: {
            /*基础类型图表*/
            DrawableChartVC *vc = DrawableChartVC.new;
            vc.selectedIndex = row;
            vc.navigationItemTitleArr = self.chartTypeNameArr[section];
            vc.chartType = row;
            vc.type = DrawableChartVCTypeChangeChartViewContentSize;
            [self.navigationController pushViewController:vc animated:YES];
        }
            break;
            
        case 14: {
            /*基础类型图表*/
            DataSortingWithAnimationChartVC *vc = DataSortingWithAnimationChartVC.new;
            vc.selectedIndex = row;
            vc.navigationItemTitleArr = self.chartTypeNameArr[section];
            [self.navigationController pushViewController:vc animated:YES];
        }
            break;
            
        case 15: {
            /*基础类型图表*/
            ChartAdvancedUpdatingFeatureVC *vc = ChartAdvancedUpdatingFeatureVC.new;
            vc.chartType = row;
            [self.navigationController pushViewController:vc animated:YES];
        }
            break;
            
        case 16: {
            /*在 XIB 中创建 AAChartView*/
            TestAAChartViewForXibVC *vc = TestAAChartViewForXibVC.new;
            [self.navigationController pushViewController:vc animated:YES];
        }
            break;
            
        case 17: {
            /*通过 AAOptions 自定义饼图"*/
            PieChartOptionsVC *vc = PieChartOptionsVC.new;
            vc.selectedIndex = row;
            vc.navigationItemTitleArr = self.chartTypeNameArr[section];
            [self.navigationController pushViewController:vc animated:YES];
        }
            break;
            
        case 18: {
            /*通过 AAOptions 自定义极地图"*/
            PolarChartOptionsVC *vc = PolarChartOptionsVC.new;
            vc.selectedIndex = row;
            vc.navigationItemTitleArr = self.chartTypeNameArr[section];
            [self.navigationController pushViewController:vc animated:YES];
        }
            break;
            
        case 19: {
            /*通过 AAOptions 自定义多 Y 轴图表"*/
            MultiYAxesChartOptionsVC *vc = MultiYAxesChartOptionsVC.new;
            vc.selectedIndex = row;
            vc.navigationItemTitleArr = self.chartTypeNameArr[section];
            [self.navigationController pushViewController:vc animated:YES];
        }
            break;
            
        case 20: {
            /*颜色线-颜色带-值颜色分区图表"*/
            PlotLinesBandsZonesOptionsVC *vc = PlotLinesBandsZonesOptionsVC.new;
            vc.selectedIndex = row;
            vc.navigationItemTitleArr = self.chartTypeNameArr[section];
            [self.navigationController pushViewController:vc animated:YES];
        }
            break;
            
        case 21: {
            /*通过 AAOptions 自定义饼图"*/
            AreasplineChartOptionsVC *vc = AreasplineChartOptionsVC.new;
            vc.selectedIndex = row;
            vc.navigationItemTitleArr = self.chartTypeNameArr[section];
            [self.navigationController pushViewController:vc animated:YES];
        }
            break;
            
        case 22: {
            /*通过 AAOptions 自定义 tooltip 浮动提示框*/
            TooltipOptionsVC *vc = TooltipOptionsVC.new;
            vc.selectedIndex = row;
            vc.navigationItemTitleArr = self.chartTypeNameArr[section];
            [self.navigationController pushViewController:vc animated:YES];
        }
            break;
            
        case  23: {
            /*通过 AAOptions 自定义 DataLabels 数据标签*/
            DataLabelsOptionsVC *vc = DataLabelsOptionsVC.new;
            vc.selectedIndex = row;
            vc.navigationItemTitleArr = self.chartTypeNameArr[section];
            [self.navigationController pushViewController:vc animated:YES];
        }
            break;
            
        case  24: {
            /*通过 AAOptions 自定义 X 轴 Y 轴的文字标签*/
            XAxisYAxisLabelsOptionsVC *vc = XAxisYAxisLabelsOptionsVC.new;
            vc.selectedIndex = row;
            vc.navigationItemTitleArr = self.chartTypeNameArr[section];
            [self.navigationController pushViewController:vc animated:YES];
        }
            break;
            
        case  25: {
            /*通过 AAOptions 自定义 X 轴 Y 轴的轴类型*/
            XAxisYAxisTypeOptionsVC *vc = XAxisYAxisTypeOptionsVC.new;
            vc.selectedIndex = row;
            vc.navigationItemTitleArr = self.chartTypeNameArr[section];
            [self.navigationController pushViewController:vc animated:YES];
        }
            break;
        case  26: {
            /*通过 AAOptions 自定义 X 轴 Y 轴的轴类型*/
            JSFunctionForAAChartEventsVC *vc = JSFunctionForAAChartEventsVC.new;
            vc.selectedIndex = row;
            vc.navigationItemTitleArr = self.chartTypeNameArr[section];
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
            @"Basic Type---基础类型",
            @"Special Type---特别类型",
            @"Custom Style---自定义风格样式图表",
            @"Mixed Type Chart---混合图表",
            @"Only Refresh data---单纯刷新数据",
            @"Animation Type---渲染动画",
            @"Draw Chart With AAOptions---通过Options绘图",
            @"Many ChartView simultaneously---同时显示多个AAChartView",
            @"Hide Or Show Chart Series---隐藏或显示内容",
            @"Support JS Formatter Function---支持 JS 函数属性",
            @"Evaluate JS String Function---注入并执行js函数",
            @"Scrolling Updating Data---图表滚动刷新",
            @"Drawable Chart---可拖拽的图表1📈",
            @"Drawable Chart---可拖拽的图表2📊",
            @"Data Sorting Chart With Animation---图表动态排序",
            @"Chart Options Advanced Updating---图表高级更新",
            @"XIB AAChartView---在 XIB 中创建 AAChartView",
            @"Pie Chart Options---通过 AAOptions 自定义饼图",
            @"Polar Chart Options---通过 AAOptions 自定义极地图",
            @"Multi YAxes Chart Options---通过 AAOptions 自定义多 Y 轴图表",
            @"Plot Lines Bands Zones Options---颜色线-颜色带-值颜色分区图表",
            @"Areaspline Chart Options---通过 AAOptions 自定义曲线区域面积图",
            @"Tooltip Options---通过 AAOptions 自定义 tooltip 浮动提示框",
            @"DataLabels Options---通过 AAOptions 自定义 DataLabels 数据标签",
            @"X Axis Y Axis Labels Options---通过 AAOptions 自定义 X 轴 Y 轴的文字标签",
            @"X Axis Y Axis Type Options---通过 AAOptions 自定义 X 轴 Y 轴的轴类型",
            @"JS Function For AAChartEvents---通过 JSFunction 自定义 AAChartEvents 的事件",

        ];
    }
    return _sectionTypeArr;
}

- (NSArray *)chartTypeNameArr {
    if (!_chartTypeNameArr) {
        _chartTypeNameArr = @[
            /*基础类型图表*/
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
            /*特殊类型图表*/
            @[@"Pie Chart---扇形图",
              @"Bubble Chart---气泡图",
              @"Scatter Chart---散点图",
              @"Area Range Chart---折线区域面积图",
              @"Area Spline range Chart---曲线区域面积图",
              @"Column Range Chart---柱形范围图",
              @"Box Plot Chart---箱线图",
              @"Water Fall---瀑布图",
              @"Pyramid Chart---金字塔图",
              @"Funnel Chart---漏斗图",
              @"Error Bar Chart---误差图",
            ],
            /*自定义风格样式图表*/
            @[@"Colorful Column Chart---多彩条形图",
              @"Colorful Gradient Color Chart---多彩颜色渐变条形图",
              @"Discontinuous Data Chart---数值不连续的图表",
              @"Mixed Line Chart---虚实线混合折线图",
              @"Colorful Column Chart---多彩柱形图",
              @"Gradient Color Bar Chart---颜色渐变条形图",
              @"configureXAxisHaveAAZonesElementChart--- X 轴阈值分割区",
              @"configureYAxisHaveAAZonesElementChart--- Y 轴带有阈值分割区",
              @"Step Line Chart---直方折线图",
              @"Step Area Chart---直方折线填充图",
              @"Nightingale Rose Chart---南丁格尔玫瑰图",
              @"Specific Data Customize Datalabel---指定 data 元素自定义 Datalabel",
              @"Chart With Shadow Style---带有阴影效果の图表",
              @"Colorful gradient Areaspline Chart---多层次渐变区域填充图",
              @"Colorful gradient Spline Chart---多层次渐变曲线图",
              @"Gradient Color Areaspline Chart---半透明渐变效果区域填充图",
              @"Special Style Marker Of Single Data Element Chart---指定单个数据元素的 Marker 为特殊样式",
              @"Special Style Column Of Single Data Element Chart---指定单个数据元素的 Column 为特殊样式",
              @"configure Area Chart Threshold---自定义阈值",
              @"custom Scatter Chart Marker Symbol Content---自定义散点图的标志点内容",
              @"custom Line Chart Marker Symbol Content---自定义折线图的标志点内容",
              @"Area Chart with minus---带有负数的区域填充图",
              @"splineChartHoverLineWithNoChangeAndCustomMarkerStatesHoverStyle---曲线图禁用选中变粗&&自定义选中后的 marker 样式",
              @"Pentagon Radar Chart---五角形雷达图",
              @"Hexagon Radar Chart---六角形雷达图",
              @"adjustYAxisMaxAndMinValues---调整 X 轴和 Y 轴最大值",
              @"custom Special Style DataLabel Of Single Data Element Chart---指定单个数据元素的 DataLabel 为特殊样式",
              @"custom Bar Chart Hover Color and Select Color---自定义条形图手指滑动颜色和单个长条被选中颜色",
              @"custom Line Chart Chart Hover And Select Halo Style---自定义直线图手指略过和选中的 Halo 样式",
              @"custom Spline Chart Marker States Hover Style---自定义曲线图手指略过时的 Marker 样式",
              @"customNormalStackingChartDataLabelsContentAndStyle---自定义堆积柱状图 DataLabels 的内容及样式",
              @"upsideDownPyramidChart---倒立的金字塔图",
              @"doubleLayerPieChart---双层嵌套扇形图",
              @"doubleLayerDoubleColorsPieChart---双层嵌套双颜色主题扇形图",
              @"disableSomeOfLinesMouseTrackingEffect---针对部分数据列关闭鼠标或手指跟踪行为",
              @"configureColorfulShadowChart---彩色阴影效果的曲线图",
              @"configureColorfulDataLabelsStepLineChart---彩色 DataLabels 的直方折线图",
              @"configureColorfulGradientColorAndColorfulDataLabelsStepAreaChart---彩色渐变效果且彩色 DataLabels 的直方折线填充图",
              @"disableSplineChartMarkerHoverEffect---禁用曲线图的手指滑动 marker 点的光圈变化放大的效果",
              @"configureMaxAndMinDataLabelsForChart---为图表最大值最小值添加 DataLabels 标记",
              @"customVerticalXAxisCategoriesLabelsByHTMLBreakLineTag---通过 HTML 的换行标签来实现图表的 X 轴的 分类文字标签的换行效果",
              @"noMoreGroupingAndOverlapEachOtherColumnChart---不分组的相互重叠柱状图📊",
              @"noMoreGroupingAndNestedColumnChart---不分组的嵌套柱状图📊",
              @"topRoundedCornersStackingColumnChart---顶部为圆角的堆积柱状图📊",
              @"freeStyleRoundedCornersStackingColumnChart---各个圆角自由独立设置的堆积柱状图📊",
              @"customColumnChartBorderStyleAndStatesHoverColor---自定义柱状图 border 样式及手指掠过图表 series 元素时的柱形颜色",
              
              @"customLineChartWithColorfulMarkersAndLines---彩色连接点和连接线的折线图📈",
              @"customLineChartWithColorfulMarkersAndLines2---彩色连接点和连接线的多组折线的折线图📈",
              @"drawLineChartWithPointsCoordinates---通过点坐标来绘制折线图",
              @"configureSpecialStyleColumnForNegativeDataMixedPositiveData---为正负数混合的柱形图自定义特殊样式效果"
            ],
            /*混合类型图表*/
            @[@"Arearange Mixed Line---面积范围均线图",
              @"Columnrange Mixed Line---柱形范围图混合折线图",
              @"Stacking Column Mixed Line---堆积柱形图混合折线图",
              @"Dash Style Types Mixed---多种类型曲线混合图",
              @"All Line Dash Style Types Mixed Chart---所有类型曲线混合图",
              @"Negative Color Mixed Column Chart---基准线以下异色混合柱状图📊",
              @"scatterMixedLine---散点图混合折线图",
              @"Negative Color Mixed Bubble Chart---基准线以下异色混合气泡图",
              @"Polygon Mixed Scatter---多边形混合散点图",
              @"Polar Chart Mixed---极地混合图",
              @"configure Column Mixed Scatter Chart---柱形图混合散点图",
              @"Negative Color Mixed Areaspline chart---基准线以下异色混合曲线填充图",
              @"Negative Color Mixed Area chart---基准线以下异色混合直线填充图",
              @"Area Chart Mixed Step Area Chart---折线填充和直方折线填充混合图"
              
            ],
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
            /*通过AAOptions实例对象来绘制图形*/
            @[@"configureTheAAOptionsOfAreaChart---绘制legend居顶部的区域填充图",
              @"configureTheAAOptionsOfSpecialNestedColumnChart---绘制嵌套的柱状图",
              @"configureTheNoGapColumnChart---缝隙很小的柱状图",
              @"adjustChartLeftAndRightMargin---调整图表的左右边距",
              @"configureChartWithBackgroundImage---设置图表绘图区的背景图片",
              @"Adjust Data Accuracy---调整数据精度",
              @"Custom Style Stacked Column---自定义堆积柱状图",
              @"Disable Animation ---禁用动画效果",
              @"Custom Legend Item Style---自定义图例样式",
              @"configure_DataLabels_XAXis_YAxis_Legend_Style---配置DataLabels、XAXis、YAxis、Legend等图表元素样式",
              @"custom Chart Style When No Data---数据为空的情况下,配置图表的 x 轴 y 轴等样式",
              @"custom Chart Style When Every Data Value Is 0---所有数据都为 0 的情况下, 配置图表的 x 轴 y 轴等样式",
              @"disable Spline Chart Hover Animation Effect---禁用手指点击曲线或者掠过曲线后,曲线变粗的动画效果",
              @"yAxisOnTheRightSideChart---y轴在右侧的图表",
            ],
            /*同时显示多个 AAChartView*/
            @[@"Show Two AAChartView On View---同时显示多个 AAChartView",
              @"Show Many AAChartView On UITableView---UITableView上显示多个 AAChartView",
              @"Double Charts Linked Working---双表联动",
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
              @"Scatter Chart---散点图"
            ],
            
            /*JS Formatter Function*/
            @[@"customAreaChartTooltipStyleWithSimpleFormatString---简单字符串拼接",
              @"customAreaChartTooltipStyleWithDifferentUnitSuffix---自定义不同单位后缀",
              @"customAreaChartTooltipStyleWithColorfulHtmlLabels---自定义多彩颜色文字",
              @"customLineChartTooltipStyleWhenValueBeZeroDoNotShow---值为0时,在tooltip中不显示",
              @"customBoxplotTooltipContent---自定义箱线图的浮动提示框头部内容",
              @"customYAxisLabels---自定义Y轴文字",
              @"customStackedAndGroupedColumnChartTooltip---自定义分组堆积柱状图tooltip内容",
              @"everySingleColumnHasGrayBackground---每根棱柱都有白色背景的柱形图",
              @"everySingleColumnHasWhiteEmptyBorderLineBackground---每根棱柱都有空心白色边缘线的柱形图",
              @"colorfulSpecialStyleColumnChart---温度计🌡风格的彩色棱柱图",
              @"configureSpecialStyleTrianglePolarChart---外部显示六边形边框的三角形雷达图",
              @"customDoubleXAxesChart---双 X 轴镜像条形图",
              @"customAreaChartXAxisLabelsTextUnitSuffix1(With Formatter)---自定义 X 轴文字单位后缀(通过 formatter 函数)",
              @"customAreaChartXAxisLabelsTextUnitSuffix2(Without Formatter)---自定义X轴文字单位后缀(不通过 formatter 函数)",
              @"customArearangeChartTooltip---自定义面积范围图的 tooltip",
              @"customLineChartOriginalPointPositionByConfiguringXAxisFormatterAndTooltipFormatter---调整折线图的 X 轴左边距",
              @"customTooltipWhichDataSourceComeFromOutSideRatherThanSeries---通过来自外部的数据源来自定义 tooltip (而非常规的来自图表的 series)",
              @"custom Spider Chart Style---自定义蜘蛛图🕷🕸样式",
              @"customize Every DataLabel Singlely By DataLabels Formatter---通过 DataLabels 的 formatter 函数来实现单个数据标签🏷自定义",
              @"custom XAxis Labels Be Images---自定义柱形图 X 轴 labels 为一组图片🖼",
              @"custom Legend Item Click Event---自定义图例点击事件🖱",
              @"customTooltipPositionerFunction---自定义浮动提示框 positioner 函数",
              @"fixedTooltipPositionByCustomPositionerFunction---通过 Positioner 函数来实现一个位置固定的提示框",
              @"customPlotAreaOutsideComplicatedTooltipStyle---通过 Positioner 函数来实现绘图区外的复杂浮动提示框样式",
              @"disableColumnChartUnselectEventEffectBySeriesPointEventClickFunction---通过 Series 的 Point 的选中事件函数来禁用条形图反选效果",
              @"customAreasplineChartTooltipStyleByDivWithCSS---通过自定义 div 的 css 样式来自定义复杂效果的 tooltip 浮动提示框",
              @"configureTheAxesLabelsFormattersOfDoubleYAxesChart---配置双 Y 轴图表的 Y 轴文字标签的 Formatter 函数 示例 1",
              @"configureTheAxesLabelsFormattersOfDoubleYAxesChart2---配置双 Y 轴图表的 Y 轴文字标签的 Formatter 函数 示例 2",
              @"configureTheAxesLabelsFormattersOfDoubleYAxesChart3---配置双 Y 轴图表的 Y 轴文字标签的 Formatter 函数 示例 3",
              @"makePieChartShow0Data---使饼图显示为 0 的数据",
              @"customColumnChartXAxisLabelsTextByInterceptTheFirstFourCharacters---通过截取前四个字符来自定义 X 轴 labels",
              @"setCrosshairAndTooltipToTheDefaultPositionAfterLoadingChart---图表加载完成后, 在指定位置默认显示 crosshair 和 tooltip",
              @"customColumnChartBorderStyleAndStatesHoverColor---自定义📊柱状图的 border 样式和手指或鼠标 hover 时的显示效果",
              @"generalDrawingChart---自由绘图🎨",
              @"advancedTimeLineChart---高级时间线图",
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
            /*自定义饼图*/
            @[@"configurePieChartTitle---自定义饼图的标题",
              @"adjustPieChartTitleAndDataLabelFontStyle---自定义饼图的标题和 DataLabels",
              @"adjustPieChartTitleAndDataLabelFontStyle2---自定义饼图的标题和 DataLabels",
              @"configurePieChartFormatProperty---配置饼图的 dataLabels 的 format 属性",
              @"doubleLayerHalfPieChart---双层嵌套的玉阕图",
              @"adjustPieChartDataLabelStyleAndPostion---调整饼图的 dataLabels 样式及位置使其居中",
            ],
            /*polar chart 极地图*/
            @[@"configureThePolygonPolarChart---简单的多边形雷达图",
              @"adjustGroupPaddingForPolarChart---调整柱状极地图的 GroupPadding",
              @"configureTriangleRadarChart---带有颜色标志带的三角形雷达图",
              @"configureQuadrangleRadarChart---带有颜色标志带的四角形雷达图",
              @"configurePentagonRadarChart---带有颜色标志带的五角形雷达图",
              @"configureHexagonRadarChart---带有颜色标志带的六角形雷达图",
              @"configureSpiderWebRadarChart---带有颜色标志带的🕸蜘蛛网状雷达图",
            ],
            /*多 Y 轴图表*/
            @[@"configureDoubleYAxesAreasplineMixedColumnChart---双Y轴曲线面积-柱形混合图",
              @"configureTripleYAxesColumnMixedSplineChart---三条Y轴柱形-曲线混合图",
              @"configureDoubleYAxesColumnMixedSplineChart---双Y轴柱形-曲线混合图",
              @"configureDoubleYAxesMarketDepthChart---双Y轴市场深度图",
              @"Mirror Column Chart ---镜像效果的柱状图📊",
              @"Mirror Column Chart With No Any Gap---没有任何衔接缝隙的镜像柱状图📊",
            ],
            /*颜色线-颜色带-值颜色分区图表*/
            @[@"simpleGaugeChart---简易仪表图",
              @"gaugeChartWithPlotBand---带有颜色标志带的仪表图",
              @"configureAAPlotBandsForChart---带有颜色标志带的曲线图",
              @"configureAAPlotLinesForChart---带有颜色标志线及文字的折线图表",
              @"configureAASeriesElementZones---数据分区 Zones",
              @"configureAASeriesElementZonesMixedAAPlotLines---数据分区 Zones 和颜色标志线混合",
              @"configureXAxisPlotBandAreaMixedColumnChart---X轴有 plotBand 的区域面积与柱形混合图",
            ],
            /*自定义曲线区域面积图*/
            @[@"configureComplicatedCustomAreasplineChart---复杂自定义曲线填充图 1",
              @"configureComplicatedCustomAreasplineChart2---复杂自定义曲线填充图 2",
              @"configureComplicatedCustomAreasplineChart3---复杂自定义曲线填充图 3",
            ],
            /*自定义 tooltip 浮动提示框*/
            @[@"customTooltipStyleByFormatProperties---通过 tooltip 的 format 属性自定义 tooltip 样式内容",
              @"customAreaChartTooltipStyleLikeHTMLTable---自定义 tooltip 提示框为 HTML 表格样式",
              @"customAreasplineChartTooltipContentWithHeaderFormat---通过 tooltip 的 headerFormat 属性来自定义 曲线填充图的 tooltip",
              @"customAreaChartTooltipStyleWithTotalValueHeader---浮动提示框 header 显示总值信息",
            ],
            /*自定义 DataLabels 数据标签*/
            @[@"adjustChartDataLabelsStyle---自定义DataLabels样式",
              @"customizeEveryDataLabelBySinglely---单独自定义指定的data的DataLabels样式",
              @"configureStackingColumnChartDataLabelsOverflow---允许DataLabels文字溢出绘图区",
              @"configureReversedBarChartDataLabelsStyle---调整Y轴倒转的条形图的DataLabels风格样式",
              @"configureColumnChartDataLabelsLayout---配置柱状图📊的 dataLabels 布局",
            ],
            /*自定义 X 轴 Y 轴文字标签*/
            @[@"configureXAxisLabelsFontColorWithHTMLString---通过HTML字符串自定义X轴文字颜色",
              @"configureXAxisLabelsFontColorAndFontSizeWithHTMLString---通过HTML字符串自定义X轴文字颜色和字体大小",
              @"customXAxisLabelsBeImages---自定义曲线面积图 X 轴 labels 为一组图片🖼",
              @"configureYAxisLabelsNumericSymbolsMagnitudeOfAerasplineChart---自定义 Y 轴的 Labels 国际单位符基数及国际单位符",
            ],
            /*自定义 X 轴 Y 轴的轴类型*/
            @[@"dateTimeTypeStepLineChart---时间轴类型的阶梯型折线图📈",
              @"timeDataWithIrregularIntervalsChart---X 轴时间不连续的折线图",
              @"logarithmicAxisLineChart---对数轴折线图📈",
              @"logarithmicAxisScatterChart---对数轴散点图",
            ],
            /*通过 JSFunction 自定义 AAChartEvents 的事件*/
            @[@"setCrosshairAndTooltipToTheDefaultPositionAfterLoadingChart---图表加载完成后设置 crosshair 和 tooltip 到默认位置",
              @"generalDrawingChart---普通绘图",
              @"advancedTimeLineChart---高级时间轴绘图",
              @"configureBlinkMarkerChart---配置闪烁特效的 marker 图表",
              @"configureSpecialStyleMarkerOfSingleDataElementChartWithBlinkEffect---配置闪烁特效的 marker 图表2",
              @"configureScatterChartWithBlinkEffect---配置闪烁特效的散点图",
              @"densityChart---密度图",
            ]

        ];
    }
    return _chartTypeNameArr;
}

@end
