//
//  FirstViewController.m
//  AAChartKit
//
//  Created by An An on 17/3/14.
//  Copyright © 2017年 An An. All rights reserved.
//  source code ----*** https://github.com/AAChartModel/AAChartKit ***--- source code
//

#import "FirstViewController.h"
#import "SecondViewController.h"
#import "SpecialChartVC.h"
#import "OnlyRefreshChartDataVC.h"
#import "ChartAnimationTypeVC.h"

#define ColorWithRGB(r,g,b,a) [UIColor colorWithRed:(r)/255.0f green:(g)/255.0f blue:(b)/255.0f alpha:(a)]
#define KGrayColor            [UIColor colorWithRed:245/255.0 green:246/255.0 blue:247/255.0 alpha:1.0]
#define KBlueColor            ColorWithRGB(63, 153,231,1)

@interface FirstViewController ()<UITableViewDelegate,UITableViewDataSource>

@property (nonatomic, strong) NSArray *chartTypeNameArr;
@property (nonatomic, strong) NSArray *sectionTypeArr;

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
    tableView.frame = CGRectMake(0, 0, self.view.frame.size.width, self.view.frame.size.height);
    tableView.delegate =self;
    tableView.dataSource =self;
    [self.view addSubview:tableView];

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
    view.backgroundColor = KGrayColor;
    UILabel *label = [[UILabel alloc]init];
    label.frame = CGRectMake(0, 0, self.view.frame.size.width, 40);
    label.textAlignment = NSTextAlignmentCenter;
    label.font = [UIFont boldSystemFontOfSize:16.0f];
    label.textColor = KBlueColor;
    label.text = self.sectionTypeArr[section];
    [view addSubview:label];
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
            SecondViewController *vc = [[SecondViewController alloc]init];
            vc.chartType = indexPath.row;
            [self.navigationController pushViewController:vc animated:YES];
        }
            break;
            
        case 1: {
            SpecialChartVC *vc = [[SpecialChartVC alloc]init];
            vc.chartType = indexPath.row;
            [self.navigationController pushViewController:vc animated:YES];
        }
            break;
            
        case 2: {
            OnlyRefreshChartDataVC *vc = [[OnlyRefreshChartDataVC alloc]init];
            [self.navigationController  pushViewController:vc animated:YES];
        }
            break;
            
        case 3: {
            ChartAnimationTypeVC *vc = [[ChartAnimationTypeVC alloc]init];
            [self.navigationController pushViewController:vc animated:YES];
        }
            break;
            
        default:
            break;
    }

}

- (NSArray *)chartTypeNameArr {
    if (!_chartTypeNameArr) {
        _chartTypeNameArr =@[
                             @[@"Column Chart---柱形图",@"Bar Chart---条形图",@"Area Chart---折线填充图",@"Areaspline Chart---曲线填充图",@"Line Chart---折线图",@"Spline Chart---曲线图",@"Scatter Chart---散点图"],
                             @[@"Mixed Line Chart---虚实线混合折线图",@"Pie Chart---扇形图",@"Bubble Chart---气泡图",@"Scatter Chart--散点图",@"Pyramid Chart---金字塔图",@"Funnel Chart---漏斗图",@"Arearange Chart--区域面积图",@"Columnrange Chart--柱形面积图",@"Mixed Chart---混合图"],
                             @[@"模拟实时更新数据示例"],
                             @[@"图形动画样式相关演示"]
                             ];
    }
    return _chartTypeNameArr;
}

- (NSArray *)sectionTypeArr {
    if (!_sectionTypeArr) {
        _sectionTypeArr = @[@"Basic Type---基础类型",@"Special Type---特别类型",@"Real-time Refresh---即时刷新",@"Animation Type---动画相关"];
    }
    return _sectionTypeArr;
}

@end


@implementation customTableViewCell

- (instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier {
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if (self) {
        _label = [[UILabel alloc]init];
        _label.frame = CGRectMake(0, 0, self.frame.size.width, 55);
        _label.textAlignment = NSTextAlignmentCenter;
        _label.font = [UIFont systemFontOfSize:14.f];
        _label.textColor = [UIColor darkGrayColor];
        [self addSubview:_label];
    }
    return self;
}

@end
