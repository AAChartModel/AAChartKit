//
//  FirstViewController.m
//  AAChartKit
//
//  Created by An An on 17/3/14.
//  Copyright © 2017年 An An. All rights reserved.
//

#import "FirstViewController.h"
#import "SecondViewController.h"
@interface FirstViewController (){
    UIButton *_selectedBtn;
}

@end

@implementation FirstViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.title = @"AAChartKit";
    self.view.backgroundColor = [UIColor whiteColor];
    
    [self configTheButtons];
    
}
-(void)configTheButtons{
    NSArray *charTypeNameArr = @[@"Column      Chart(柱形图)",
                                 @"Bar         Chart(条形图)",
                                 @"Area        Chart(折线填充图)",
                                 @"Areaspline  Chart(曲线填充图)",
                                 @"Line        Chart(折线图)",
                                 @"Spline      Chart(曲线图)",
                                 @"Scatter     Chart(散点图)"];
    for (int i=0; i<charTypeNameArr.count; i++) {
        UIButton *button =[UIButton buttonWithType:UIButtonTypeCustom];
        button.frame = CGRectMake(self.view.center.x-150, 50*i+150, 300, 40);
        [button setTitleColor:[UIColor brownColor] forState:UIControlStateNormal];
        button.layer.borderWidth = 0.5;
        [button setTitleShadowColor:[UIColor blueColor] forState:UIControlStateSelected];
        button.layer.borderColor = [UIColor lightGrayColor].CGColor;
        [button setTitle:charTypeNameArr[i] forState:UIControlStateNormal];
        button.tag = i;
        [button setHighlighted:YES];
        [button addTarget:self action:@selector(buttonClicked:) forControlEvents:UIControlEventTouchUpInside];
        [self.view addSubview:button];
    }
}
-(void)buttonClicked:(UIButton *)sender{
    [_selectedBtn setBackgroundColor:[UIColor whiteColor]];
    _selectedBtn = sender;
    [_selectedBtn setBackgroundColor:[UIColor cyanColor]];
    SecondViewController *vc = [[SecondViewController alloc]init];
    vc.hidesBottomBarWhenPushed = YES;
    vc.ENUM_secondeViewController_chartType = sender.tag;
    [self.navigationController pushViewController:vc animated:YES];
}


@end
