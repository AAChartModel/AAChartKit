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

#define ColorWithRGB(r,g,b,a) [UIColor colorWithRed:(r)/255.0f green:(g)/255.0f blue:(b)/255.0f alpha:(a)]
#define KGrayColor        [UIColor colorWithRed:245/255.0 green:246/255.0 blue:247/255.0 alpha:1.0]
#define KBlueColor         ColorWithRGB(63, 153,231,1)

@interface FirstViewController ()<UITableViewDelegate,UITableViewDataSource> {
    NSArray *_charTypeNameArr;
}

@end

@implementation FirstViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.title = @"AAChartKit 2.0";
    self.view.backgroundColor = [UIColor whiteColor];
    _charTypeNameArr =@[
                        @[@"Column Chart(柱形图)",
                          @"Bar Chart(条形图)",
                          @"Area Chart(折线填充图)",
                          @"Areaspline Chart(曲线填充图)",
                          @"Line Chart(折线图)",
                          @"Spline Chart(曲线图)",
                          @"Scatter Chart(散点图)"],
                        
                        @[@"Pie Chart(扇形图)",
                          @"Bubble Chart(气泡图)",
                          @"Pyramid Chart(金字塔图)",
                          @"Funnel Chart(漏斗图)",
                          @"Mixed Chart(混合图)"],
                        
                        @[@"模拟实时更新数据示例"]
                        ];
    
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
    return _charTypeNameArr.count;
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
    NSArray *sectionTypeArr = @[@"Basic type(基础类型)",@"Special Type(特别类型)",@"附加说明"];
    label.frame = CGRectMake(0, 0, self.view.frame.size.width, 40);
    label.textAlignment = NSTextAlignmentCenter;
    label.font = [UIFont boldSystemFontOfSize:16.0f];
    label.textColor = KBlueColor;
    label.text = sectionTypeArr[section];
    [view addSubview:label];
    return view;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    NSArray *arr =_charTypeNameArr[section];
    return arr.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"cell"];
    if (!cell) {
        cell = [[UITableViewCell alloc]initWithStyle:UITableViewCellStyleValue1 reuseIdentifier:@"cell"];
    }
    cell.textLabel.textColor = [UIColor darkGrayColor];
    cell.textLabel.text =_charTypeNameArr[indexPath.section][indexPath.row];
    cell.textLabel.font = [UIFont systemFontOfSize:15.0f];
    return cell;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    if (indexPath.section ==0) {
        SecondViewController *vc = [[SecondViewController alloc]init];
        vc.SecondeViewControllerChartType = indexPath.row;
        [self.navigationController pushViewController:vc animated:YES];
    }else if(indexPath.section==1){
        SpecialChartVC *vc = [[SpecialChartVC alloc]init];
        vc.SpecialChartVCChartType = indexPath.row;
        [self.navigationController pushViewController:vc animated:YES];
    }else{
        OnlyRefreshChartDataVC *vc = [[OnlyRefreshChartDataVC alloc]init];
        [self.navigationController  pushViewController:vc animated:YES];
    }
}

@end
