//
//  FirstViewController.m
//  AAChartKit
//
//  Created by An An on 17/3/14.
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
 * 🌕 🌖 🌗 🌘  ❀❀❀   WARM TIPS!!!   ❀❀❀ 🌑 🌒 🌓 🌔
 *
 * Please contact me on GitHub,if there are any problems encountered in use.
 * GitHub Issues : https://github.com/AAChartModel/AAChartKit/issues
 * -------------------------------------------------------------------------------
 * And if you want to contribute for this project, please contact me as well
 * GitHub        : https://github.com/AAChartModel
 * StackOverflow : https://stackoverflow.com/users/7842508/codeforu
 * JianShu       : http://www.jianshu.com/u/f1e6753d4254
 * SegmentFault  : https://segmentfault.com/u/huanghunbieguan
 *
 * -------------------------------------------------------------------------------
 
 */

#import "FirstViewController.h"
#import "SecondViewController.h"
#import "SpecialChartVC.h"
#import "OnlyRefreshChartDataVC.h"
#import "ChartAnimationTypeVC.h"
#import "DrawChartWithAAOptionsVC.h"
#import "DrilldownChartVC.h"
#import "ShowManyChartViewVC.h"
#import "ChartListVC.h"
#import "MixedChartVC.h"

#warning revise
#import "MonitorViewController.h"

#define ColorWithRGB(r,g,b,a) [UIColor colorWithRed:(r)/255.0f green:(g)/255.0f blue:(b)/255.0f alpha:(a)]
#define AAGrayColor            [UIColor colorWithRed:245/255.0 green:246/255.0 blue:247/255.0 alpha:1.0]
#define AABlueColor            ColorWithRGB(63, 153,231,1)

@interface FirstViewController ()<UITableViewDelegate,UITableViewDataSource>

@property (nonatomic, strong) NSArray *chartTypeNameArr;
@property (nonatomic, strong) NSArray *sectionTypeArr;
@property (nonatomic, strong) NSArray <NSLayoutConstraint *>*constraintArr;

@end

@implementation FirstViewController

- (void)viewWillAppear:(BOOL)animated {
    [super viewWillAppear:YES];
    self.navigationController.navigationBar.barTintColor = [UIColor whiteColor];

}

- (void)viewDidLoad {
    [super viewDidLoad];
    self.title = @"AAChartKit";
    self.view.backgroundColor = [UIColor whiteColor];

    [self configTheTableView];
    
#warning revise
    // 监听点击入口。
    self.navigationItem.rightBarButtonItem = [[UIBarButtonItem alloc] initWithTitle:@"Touch Delegate" style:UIBarButtonItemStylePlain target:self action:@selector(monitorTap)];
}
#warning revise
- (void)monitorTap {
    MonitorViewController *monitorVC = [[MonitorViewController alloc] init];
    [self.navigationController pushViewController:monitorVC animated:YES];
}

- (void)configTheTableView {
    UITableView *tableView = [[UITableView alloc]init];
    tableView.delegate =self;
    tableView.dataSource =self;
    [self.view addSubview:tableView];
    
    tableView.translatesAutoresizingMaskIntoConstraints = NO;
    [self.view addConstraints:[self configureTheConstraintArrayWithItem:tableView toItem:self.view]];
    
}

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return self.chartTypeNameArr.count;
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath {
    return 40;
}

- (CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section {
    return 50;
}

- (UIView *)tableView:(UITableView *)tableView viewForHeaderInSection:(NSInteger)section {
    UIView *view = [[UIView alloc]init];
//    view.backgroundColor = AAGrayColor;
    
    UILabel *label = [[UILabel alloc]init];
    label.textAlignment = NSTextAlignmentCenter;
    label.font = [UIFont boldSystemFontOfSize:16.0f];
    label.backgroundColor = AAGrayColor;
    label.textColor = [UIColor purpleColor];
    label.text = self.sectionTypeArr[section];
    [view addSubview:label];
    
    label.translatesAutoresizingMaskIntoConstraints = NO;
    [view addConstraints:[self configureTheConstraintArrayWithItem:label toItem:view]];
    return view;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    NSArray *arr = self.chartTypeNameArr[section];
    return arr.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    customTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"cell"];
    if (!cell) {
        cell = [[customTableViewCell alloc]initWithStyle:UITableViewCellStyleValue1 reuseIdentifier:@"cell"];
    }
    cell.label.text = self.chartTypeNameArr[indexPath.section][indexPath.row];
    return cell;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    
    switch (indexPath.section) {
        case 0: {
            /*基础类型图表*/
            SecondViewController *vc = [[SecondViewController alloc]init];
            vc.chartType = indexPath.row;
            [self.navigationController pushViewController:vc animated:YES];
        }
            break;
            
        case 1: {
            /*特殊类型图表*/
            SpecialChartVC *vc = [[SpecialChartVC alloc]init];
            vc.chartType = indexPath.row;
            [self.navigationController pushViewController:vc animated:YES];
        }
            break;
        case 2: {
            /*图表数据动态刷新*/
            MixedChartVC *vc = [[MixedChartVC alloc]init];
            vc.chartTypeIndex = indexPath.row;
            [self.navigationController  pushViewController:vc animated:YES];
        }
            break;
            
            
        case 3: {
            /*图表数据动态刷新*/
            OnlyRefreshChartDataVC *vc = [[OnlyRefreshChartDataVC alloc]init];
            vc.chartType = indexPath.row;
            [self.navigationController  pushViewController:vc animated:YES];
        }
            break;
        
        case 4: {
            /*JQuery动画样式类型演示*/
            ChartAnimationTypeVC *vc = [[ChartAnimationTypeVC alloc]init];
            vc.chartType = indexPath.row;
            [self.navigationController pushViewController:vc animated:YES];
        }
            break;
        
        case 5: {
            /*通过AAOptions实例对象来绘制图形*/
            DrawChartWithAAOptionsVC *vc = [[DrawChartWithAAOptionsVC alloc]init];
            vc.selectedIndex = indexPath.row;
            vc.navigationItemTitle = self.chartTypeNameArr[indexPath.section][indexPath.row];
            [self.navigationController pushViewController:vc animated:YES];
        }
            break;
            
        case 6: {
            /*同时显示多个 AAChartView*/
            if (indexPath.row == 0) {
                ShowManyChartViewVC *vc = [[ShowManyChartViewVC alloc]init];
                [self.navigationController pushViewController:vc animated:YES];
            } else {
                ChartListVC *listVC = [[ChartListVC alloc]init];
                [self.navigationController pushViewController:listVC animated:YES];
            }

        }
            break;
            
        case 7: {
            /*可向下钻取类型图表*/
            DrilldownChartVC *vc = [[DrilldownChartVC alloc]init];
            [self.navigationController pushViewController:vc animated:YES];
        }
            break;
        
        default:
            break;
    }
    
}

- (NSArray *)configureTheConstraintArrayWithItem:(UIView *)view1 toItem:(UIView *)view2 {
    return  @[[NSLayoutConstraint constraintWithItem:view1
                                           attribute:NSLayoutAttributeLeft
                                           relatedBy:NSLayoutRelationEqual
                                              toItem:view2
                                           attribute:NSLayoutAttributeLeft
                                          multiplier:1.0
                                            constant:0],
              [NSLayoutConstraint constraintWithItem:view1
                                           attribute:NSLayoutAttributeRight
                                           relatedBy:NSLayoutRelationEqual
                                              toItem:view2
                                           attribute:NSLayoutAttributeRight
                                          multiplier:1.0
                                            constant:0],
              [NSLayoutConstraint constraintWithItem:view1
                                           attribute:NSLayoutAttributeTop
                                           relatedBy:NSLayoutRelationEqual
                                              toItem:view2
                                           attribute:NSLayoutAttributeTop
                                          multiplier:1.0
                                            constant:0],
              [NSLayoutConstraint constraintWithItem:view1
                                           attribute:NSLayoutAttributeBottom
                                           relatedBy:NSLayoutRelationEqual
                                              toItem:view2
                                           attribute:NSLayoutAttributeBottom
                                          multiplier:1.0
                                            constant:0],
              
              ];
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
                               @"Step Line Chart--直方折线图",
                               @"Step Area Chart--直方折线填充图",
                               @"Scatter Chart---散点图"
                               ],
                             /*特殊类型图表*/
                             @[@"Colorful Column Chart---多彩柱形图",
                               @"Gradient Color Bar---颜色渐变条形图",
                               @"Mixed Line Chart---虚实线混合折线图",
                               @"With Dividing Line---带有阈值分割线区域图",
                               @"Area Chart with minus--带有负数的区域填充图",
                               @"Pie Chart---扇形图",
                               @"Bubble Chart---气泡图",
                               @"Scatter Chart--散点图",
                               @"Arearange Chart--区域面积图",
                               @"Area Spline range Chart--曲线区域面积图",
                               @"Column Range Chart--柱形范围图",
                               @"Step Line Chart--直方折线图",
                               @"Step Area Chart--直方折线填充图",
                               @"Nightingale Rose Chart---南丁格尔玫瑰图",
                               @"Box Plot Chart---箱线图",
                               @"Water Fall---瀑布图",
                               @"Pyramid Chart---金字塔图",
                               @"Funnel Chart---漏斗图",],
                             /*混合类型图表*/
                             @[@"Arearange Mixed Line---面积范围均线图",
                               @"Columnrange Mixed Line---柱形范围图混合折线图",
                               @"Stacking Column Mixed Line---堆积柱形图混合折线图",
                               @"Dash Style Types Mixed---多种类型曲线混合图",
                               @"Negative Color Mixed---基准线以下异色混合图",
                               @"scatterMixedLine---散点图混合折线图(待完成)",
                               @"Negative Color Mixed bubble---基准线以下异色气泡图",
                               @"Polygon Mixed Scatter---多边形混合散点图",
                               @"Polar Chart Mixed---极地混合图"
                               
                               ],
                             /*图表数据动态刷新*/
                             @[@"Column Chart---柱形图",
                               @"Bar Chart---条形图",
                               @"Area Chart---折线填充图",
                               @"Areaspline Chart---曲线填充图",
                               @"Line Chart---折线图",
                               @"Spline Chart---曲线图",
                               @"Step Line Chart--直方折线图",
                               @"Step Area Chart--直方折线填充图",
                               @"Scatter Chart---散点图"
                               ],
                             /*JQuery动画样式类型演示*/
                             @[@"Column Chart---柱形图",
                               @"Bar Chart---条形图",
                               @"Area Chart---折线填充图",
                               @"Areaspline Chart---曲线填充图",
                               @"Line Chart---折线图",
                               @"Spline Chart---曲线图",
                               @"Step Line Chart--直方折线图",
                               @"Step Area Chart--直方折线填充图",
                               @"Scatter Chart --散点图",
                               @"Pie Chart --扇形图"
                               ],
                             /*通过AAOptions实例对象来绘制图形*/
                             @[@"绘制legend居顶部的区域填充图",
                               @"绘制带有中心标题的环形图",
                               @"调整扇形图的标题和DataLabel字体样式",
                               @"绘制嵌套的柱状图",
                               @"多边形线框的雷达图",
                               @"缝隙很小的柱状图",
                               @"Custom style tooltip--自定义浮动提示框",
                               @"调整图表的左右边距",
                               @"设置图表绘图区的背景图片",
                               @"Double Y Axises Chart---双Y轴混合图",
                               @"Adjust Data Accuracy---调整数据精度",
                               @"Adjust Group Padding---调整group间距",
                               @"Custom Style Stacked Column---自定义堆积柱状图",
                               @"时间不连续的直方折线填充图连接图",
                               @"Disable Animation ---禁用动画效果",
                               @"Custom Legend Item Style---自定义图例样式"
                               ],
                             /*同时显示多个 AAChartView*/
                              @[@"同时显示多个 AAChartView",
                                @"UITableView上显示多个 AAChartView"
                                ],
                             /*可向下钻取类型图表*/
                             @[@"Drilldown column chart--向下钻取的柱状图"
                               ],
                             ];
    }
    return _chartTypeNameArr;
}

- (NSArray *)sectionTypeArr {
    if (!_sectionTypeArr) {
        _sectionTypeArr = @[@"Basic Type---基础类型",
                            @"Special Type---特别类型",
                            @"Mixed Type Chart---混合图表",
                            @"Real-time Refresh---即时刷新",
                            @"Animation Type---渲染动画",
                            @"AAOptions---Use AAOptions",
                            @"同时显示多个 AAChartView",
                            @"Drilldown chart---钻取图表(暂时废弃)",];
    }
    return _sectionTypeArr;
}

@end


@implementation customTableViewCell

- (instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier {
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if (self) {
        _label = [[UILabel alloc]init];
        _label.frame = CGRectMake(60, 0, self.frame.size.width-40, 40);
        _label.textAlignment = NSTextAlignmentLeft;
        _label.font = [UIFont systemFontOfSize:12.f];
        _label.textColor = [UIColor darkGrayColor];
        [self addSubview:_label];
        self.accessoryType = UITableViewCellAccessoryDisclosureIndicator;
    }
    return self;
}

@end
