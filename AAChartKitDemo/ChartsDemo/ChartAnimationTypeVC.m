
//  SpecialChartVC.m
//  AAChartKit
//
//  Created by An An on 17/3/23.
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

    [self configureTheAnimationTypeTableView];
    [self configureTheChartView];
  
}

- (void)configureTheChartView  {
    self.chartView = [[AAChartView alloc]initWithFrame:CGRectMake(0, 60, self.view.frame.size.width-115, self.view.frame.size.height-60)];
    self.view.backgroundColor = [UIColor whiteColor];
    self.chartView.scrollEnabled = NO;
   // self.chartView.contentHeight = self.view.frame.size.height-220;
    [self.view addSubview:self.chartView];
    
    self.chartModel= AAObject(AAChartModel)
    .chartTypeSet(AAChartTypeColumn)
    .animationDurationSet(@1500)
    .titleSet(@"")
    .borderRadiusSet(@3)
    .subtitleSet(@"")
    .categoriesSet(@[@"Java",@"Swift",@"Python",@"Ruby", @"PHP",@"Go",@"C",@"C#",@"C++",@"Perl",@"R",@"MATLAB",@"SQL"])
    .yAxisTitleSet(@"")
    .seriesSet(@[
                 AAObject(AASeriesElement)
                 .nameSet(@"2017")
                 .dataSet(@[@45,@88,@49,@43,@65,@56,@47,@28,@49,@44,@89,@55]),
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
    cell.textLabel.textColor = [UIColor whiteColor];
    cell.backgroundColor = KBlueColor;
    
    return cell;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    AAChartAnimation animationType = indexPath.row;
    [self animationTypeTableViewClicked:animationType];
}

- (void)animationTypeTableViewClicked:(AAChartAnimation)chartAnimationType {
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
                              @"easeInQuad",
                              @"easeOutQuad",
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
                              @"easeInSine",
                              @"easeOutSine",
                              @"easeInOutSine",
                              @"easeInExpo",
                              @"easeOutExpo",
                              @"easeInOutExpo",
                              @"easeInCirc",
                              @"easeOutCirc",
                              @"easeInOutCirc",
                              @"easeOutBounce",
                              @"easeInBack",
                              @"easeOutBack",
                              @"easeInOutBack",
                              @"elastic",
                              @"swingFromTo",
                              @"swingFrom",
                              @"swingTo",
                              @"bounce",
                              @"bouncePast",
                              @"easeFromTo",
                              @"easeFrom",
                              @"easeTo",
                              ];
    }
    return _animationTypeArr;
    }



@end
