//
//  FirstViewController.m
//  AAChartKit
//
//  Created by An An on 17/3/14.
//  Copyright © 2017年 An An. All rights reserved.
//

#import "FirstViewController.h"
#import "SecondViewController.h"
#import "SpecialChartVC.h"
@interface FirstViewController ()<UITableViewDelegate,UITableViewDataSource>{
    NSArray *_charTypeNameArr;
}

@end

@implementation FirstViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.title = @"AAChartKit";
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
                          @"Bubble Chart(气泡图)"]
                        ];
    
    [self configTheTableView];
    
}
-(void)configTheTableView{
    UITableView *tableView = [[UITableView alloc]init];
    tableView.frame = CGRectMake(0, 0, self.view.frame.size.width, self.view.frame.size.height);
    tableView.delegate =self;
    tableView.dataSource =self;
    [self.view addSubview:tableView];
    
}
-(NSInteger)numberOfSectionsInTableView:(UITableView *)tableView{
    return 2;
}
-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    return 55;
}
-(CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section{
    return 40;
}

-(UIView *)tableView:(UITableView *)tableView viewForHeaderInSection:(NSInteger)section{
    UIView *view = [[UIView alloc]init];
    view.backgroundColor = [UIColor cyanColor];
    UILabel *label = [[UILabel alloc]init];
    NSArray *sectionTypeArr = @[@"Basic type(基础类型)",@"Special Type(特别类型)"];
    label.frame = CGRectMake(0, 0, self.view.frame.size.width, 40);
    label.textAlignment = NSTextAlignmentCenter;
    label.font = [UIFont boldSystemFontOfSize:18.0f];
    label.textColor = [UIColor blueColor];
    label.text = sectionTypeArr[section];
    [view addSubview:label];
    return view;
}

-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    NSArray *arr =_charTypeNameArr[section];
    return arr.count;
}
-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"cell"];
    if (!cell) {
        cell = [[UITableViewCell alloc]initWithStyle:UITableViewCellStyleValue1 reuseIdentifier:@"cell"];
    }
    cell.textLabel.textColor = [UIColor brownColor];
    cell.textLabel.text =_charTypeNameArr[indexPath.section][indexPath.row];
    return cell;
}
-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    if (indexPath.section ==0) {
        SecondViewController *vc = [[SecondViewController alloc]init];
        vc.ENUM_secondeViewController_chartType = indexPath.row;
        [self.navigationController pushViewController:vc animated:YES];
    }else{
        SpecialChartVC *vc = [[SpecialChartVC alloc]init];
        vc.ENUM_SpecialChartVC_chartType = indexPath.row;
        [self.navigationController pushViewController:vc animated:YES];
    }
}

@end
