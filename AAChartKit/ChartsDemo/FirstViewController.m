//
//  FirstViewController.m
//  AAChartKit
//
//  Created by An An on 17/3/14.
//  Copyright © 2017年 An An. All rights reserved.
//  source code ----*** https://github.com/AAChartModel/AAChartKit ***--- source code
//

/*
 
 * -------------------------------------------------------------------------------
 *
 * ❀❀❀   WARM TIPS!!!   ❀❀❀
 * Please contact me on GitHub,if there are any problems encountered in use.
 * GitHub Issues : https://github.com/AAChartModel/AAChartKit-Swift/issues
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

#define ColorWithRGB(r,g,b,a) [UIColor colorWithRed:(r)/255.0f green:(g)/255.0f blue:(b)/255.0f alpha:(a)]
#define AAGrayColor            [UIColor colorWithRed:245/255.0 green:246/255.0 blue:247/255.0 alpha:1.0]
#define AABlueColor            ColorWithRGB(63, 153,231,1)

@interface FirstViewController ()<UITableViewDelegate,UITableViewDataSource>

@property (nonatomic, strong) NSArray *chartTypeNameArr;
@property (nonatomic, strong) NSArray *sectionTypeArr;
@property (nonatomic, strong) NSArray <NSLayoutConstraint *>*constraintArr;

@end

@implementation FirstViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.title = @"AAChartKit 2.0";
    self.view.backgroundColor = [UIColor whiteColor];
    
    
    [self configTheTableView];
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
    return 55;
}

- (CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section {
    return 40;
}

- (UIView *)tableView:(UITableView *)tableView viewForHeaderInSection:(NSInteger)section {
    UIView *view = [[UIView alloc]init];
    view.backgroundColor = AAGrayColor;
    
    UILabel *label = [[UILabel alloc]init];
    label.textAlignment = NSTextAlignmentCenter;
    label.font = [UIFont boldSystemFontOfSize:16.0f];
    label.backgroundColor = AABlueColor;
    label.textColor = [UIColor whiteColor];
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
            /*可向下钻取类型图表*/
            DrilldownChartVC *vc = [[DrilldownChartVC alloc]init];
            [self.navigationController pushViewController:vc animated:YES];
        }
            break;
        
        case 3: {
            /*图表数据动态刷新*/
            OnlyRefreshChartDataVC *vc = [[OnlyRefreshChartDataVC alloc]init];
            [self.navigationController  pushViewController:vc animated:YES];
        }
            break;
        
        case 4: {
            /*JQuery动画样式类型演示*/
            ChartAnimationTypeVC *vc = [[ChartAnimationTypeVC alloc]init];
            [self.navigationController pushViewController:vc animated:YES];
        }
            break;
        
        case 5: {
            /*通过AAOptions实例对象来绘制图形*/
            DrawChartWithAAOptionsVC *vc = [[DrawChartWithAAOptionsVC alloc]init];
            [self.navigationController pushViewController:vc animated:YES];
        }
            break;
        
        default:
            break;
    }
    
}

- (NSArray *)configureTheConstraintArrayWithItem:(UIView *)view1 toItem:(UIView *)view2{
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
        _chartTypeNameArr =@[
                             /*基础类型图表*/
                             @[@"Column Chart---柱形图",
                               @"Bar Chart---条形图",
                               @"Area Chart---折线填充图",
                               @"Areaspline Chart---曲线填充图",
                               @"Line Chart---折线图",
                               @"Spline Chart---曲线图",
                               @"Scatter Chart---散点图"],
                             /*特殊类型图表*/
                             @[@"Mixed Line Chart---虚实线混合折线图",
                               @"Pie Chart---扇形图",
                               @"Bubble Chart---气泡图",
                               @"Scatter Chart--散点图",
                               @"Pyramid Chart---金字塔图",
                               @"Funnel Chart---漏斗图",
                               @"Arearange Chart--区域面积图",
                               @"Columnrange Chart--柱形面积图",
                               @"Mixed Chart---混合图"],
                             /*可向下钻取类型图表*/
                             @[@"Drilldown column chart--向下钻取的柱状图"],
                             /*图表数据动态刷新*/
                             @[@"模拟实时更新数据示例"],
                             /*JQuery动画样式类型演示*/
                             @[@"图形动画样式相关演示"],
                             /*通过AAOptions实例对象来绘制图形*/
                             @[@"直接通过AAOptions实例对象绘制图形"]
                             ];
    }
    return _chartTypeNameArr;
}

- (NSArray *)sectionTypeArr {
    if (!_sectionTypeArr) {
        _sectionTypeArr = @[@"Basic Type---基础类型",
                            @"Special Type---特别类型",
                            @"Drilldown chart---钻取图表",
                            @"Real-time Refresh---即时刷新",
                            @"Animation Type---动画相关",
                            @"Draw chart with AAOptions---AAOptions实例对象绘制图形"];
    }
    return _sectionTypeArr;
}

@end


@implementation customTableViewCell

- (instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier {
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if (self) {
        _label = [[UILabel alloc]init];
        _label.frame = CGRectMake(60, 0, self.frame.size.width, 55);
        _label.textAlignment = NSTextAlignmentLeft;
        _label.font = [UIFont systemFontOfSize:14.f];
        _label.textColor = [UIColor darkGrayColor];
        [self addSubview:_label];
    }
    return self;
}

@end
