//
//  ChartAnimationTypeVC.m
//  AAChartKit
//
//  Created by An An on 2017/7/6.
//  Copyright © 2017年 An An. All rights reserved.
//

#import "ChartAnimationTypeVC.h"
#import "AAChartKit.h"

#define CurrentHeight ([UIScreen mainScreen].bounds.size.height)
#define CurrentWidth ([UIScreen mainScreen].bounds.size.width)
#define ColorWithRGB(r,g,b,a) [UIColor colorWithRed:(r)/255.0f green:(g)/255.0f blue:(b)/255.0f alpha:(a)]
#define KBlueColor         ColorWithRGB(63, 153,231,1)

@interface ChartAnimationTypeVC ()<UITableViewDelegate,UITableViewDataSource> {
    UIButton *_lastClickedBtn;
}

@property (nonatomic, strong) AAChartModel *chartModel;
@property (nonatomic, strong) AAChartView  *chartView;
@property (nonatomic, strong) NSArray      *animationTypeArr;

@end

@implementation ChartAnimationTypeVC


- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor = [UIColor whiteColor];
    self.title = @"动画类型";
    //[self configureTheButtons];
    [self configureTheAnimationTypeTableView];
    [self configureTheChartView];
  
}

- (void)configureTheChartView  {
    self.chartView = [[AAChartView alloc]init];
    self.view.backgroundColor = [UIColor whiteColor];
    self.chartView.frame = CGRectMake(0, 60, self.view.frame.size.width-115, self.view.frame.size.height-60);
   // self.chartView.contentHeight = self.view.frame.size.height-220;
    [self.view addSubview:self.chartView];
    self.chartModel= AAObject(AAChartModel)
    .chartTypeSet(AAChartTypeColumn)
    .animationDurationSet(@1500)
    .titleSet(@"编程语言热度")
    .subtitleSet(@"虚拟数据")
    .pointHollowSet(true)
    .categoriesSet(@[@"Java",@"Swift",@"Python",@"Ruby", @"PHP",@"Go",@"C",@"C#",@"C++",@"Perl",@"R",@"MATLAB",@"SQL"])
    .yAxisTitleSet(@"摄氏度")
    .seriesSet(@[
                 AAObject(AASeriesElement)
                 .nameSet(@"2017")
                 .dataSet(@[@45,@88,@49,@43,@65,@56,@47,@28,@49,@44,@89,@55]),
                 
//                 AAObject(AASeriesElement)
//                 .nameSet(@"2018")
//                 .dataSet(@[@31,@22,@33,@54,@35,@36,@27,@38,@39,@54,@41,@29]),
//                 
//                 AAObject(AASeriesElement)
//                 .nameSet(@"2019")
//                 .dataSet(@[@11,@12,@13,@14,@15,@16,@17,@18,@19,@33,@56,@39]),
//                 
//                 AAObject(AASeriesElement)
//                 .nameSet(@"2020")
//                 .dataSet(@[@21,@22,@24,@27,@25,@26,@37,@28,@49,@56,@31,@11]),
                 ]
               )
    
    ;
    [self.chartView aa_drawChartWithChartModel:_chartModel];
}

- (void)configureTheAnimationTypeTableView {
    UITableView *animationTypeTableView = [[UITableView alloc]init];
    animationTypeTableView.delegate = self;
    animationTypeTableView.dataSource = self;
    animationTypeTableView.frame = CGRectMake(self.view.frame.size.width-115, 0, 115, self.view.frame.size.height-60);
    [self.view addSubview:animationTypeTableView];
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return self.animationTypeArr.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    static NSString *identifer = @"cell";
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:identifer];
    if (!cell) {
        cell = [[UITableViewCell alloc]initWithStyle:UITableViewCellStyleDefault reuseIdentifier:identifer];
    }
    cell.textLabel.text = self.animationTypeArr[indexPath.row];
    cell.textLabel.font = [UIFont systemFontOfSize:11.f];
    cell.textLabel.textColor = KBlueColor;
    return cell;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    AAChartAnimationType animationType = indexPath.row;
    [self animationTypeTableViewClicked:animationType];
}

- (void)animationTypeTableViewClicked:(AAChartAnimationType)chartAnimationType {
    self.chartModel.animationType = chartAnimationType;
    [self.chartView aa_refreshChartWithChartModel:self.chartModel];//刷新图表数据
    _lastClickedBtn.layer.borderColor = [UIColor lightGrayColor].CGColor;
    _lastClickedBtn.backgroundColor = [UIColor whiteColor];
    [_lastClickedBtn setTitleColor:[UIColor darkTextColor] forState:UIControlStateNormal];

}

- (NSArray *)animationTypeArr {
    if (!_animationTypeArr) {
        _animationTypeArr = @[
                              @"linear",
                              @"swing",
                              @"easeInQuad",
                              @"easeInOutQuad",
                              @"easeInCubic",
                              @"easeOutCubic",
                              @"easeInOutCubic",
                              @"easeInQuart",
                              @"easeOutQuart",
                              @"easeInOutQuart",
                              @"easeInQuint",
                              @"easeOutQuint",
                              @"easeInOutQuint",
                              @"easeInExpo",
                              @"easeOutExpo",
                              @"easeInOutExpo",
                              @"easeInSine",
                              @"easeOutSine",
                              @"easeInOutSine",
                              @"easeInCirc",
                              @"easeOutCirc",
                              @"easeInOutCirc",
                              @"easeInElastic",
                              @"easeOutElastic",
                              @"easeInOutElastic",
                              @"easeInBack",
                              @"easeOutBack",
                              @"easeInOutBack",
                              @"easeInBounce",
                              @"easeOutBounce",
                              @"easeInOutBounce",
                              ];
    }
    return _animationTypeArr;
    }



@end
