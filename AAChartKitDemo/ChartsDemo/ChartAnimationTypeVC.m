
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

#define ColorWithRGB(r,g,b,a) [UIColor colorWithRed:(r)/255.0f green:(g)/255.0f blue:(b)/255.0f alpha:(a)]
#define KBlueColor         ColorWithRGB(63, 153,231,1)

@interface ChartAnimationTypeVC ()<UITableViewDelegate,UITableViewDataSource>

@property (nonatomic, strong) AAChartModel *chartModel;
@property (nonatomic, strong) AAChartView  *chartView;
@property (nonatomic, strong) NSArray      *animationTypeArr;

@end

@implementation ChartAnimationTypeVC


- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor = [UIColor whiteColor];
    self.title = @"动画类型";
    
    AAChartType chartType = [self configureTheChartType];

    [self configureTheAnimationTypeTableView];
    [self configureTheChartViewWithChartType:chartType];
  
}

- (AAChartType)configureTheChartType {
    switch (self.chartType) {
        case 0: return AAChartTypeColumn;
        case 1: return AAChartTypeBar;
        case 2: return AAChartTypeArea;
        case 3: return AAChartTypeAreaspline;
        case 4: return AAChartTypeLine;
        case 5: return AAChartTypeSpline;
        case 6: return AAChartTypeLine;
        case 7: return AAChartTypeArea;
        case 8: return AAChartTypeScatter;
    }
}

- (void)configureTheChartViewWithChartType:(AAChartType)chartType  {
    self.chartView = [[AAChartView alloc]initWithFrame:CGRectMake(0, 60, self.view.frame.size.width-115, self.view.frame.size.height-60)];
    self.view.backgroundColor = [UIColor whiteColor];
    self.chartView.scrollEnabled = NO;
   // self.chartView.contentHeight = self.view.frame.size.height-220;
    [self.view addSubview:self.chartView];
    
    self.chartModel = AAObject(AAChartModel)
    .chartTypeSet(chartType)
    .animationDurationSet(@1500)
    .titleSet(@"")
    .subtitleSet(@"")
    .categoriesSet(@[@"Java",@"Swift",@"Python",@"Ruby", @"PHP",@"Go",@"C",@"C#",@"C++",@"Perl",@"R",@"MATLAB",@"SQL"])
    .yAxisTitleSet(@"")
    ;

    if (self.chartType == ChartAnimationTypeVCChartTypeStepArea
        || self.chartType == ChartAnimationTypeVCChartTypeStepLine) {
       self.chartModel
        .gradientColorEnabledSet(true)
        .markerRadiusSet(@0)
        .seriesSet(@[
                     AAObject(AASeriesElement)
                     .nameSet(@"2017")
                     .dataSet(@[@7.0, @6.9, @9.5, @14.5, @18.2, @21.5, @25.2, @26.5, @23.3, @18.3, @13.9, @9.6])
                     .stepSet((id)@(true))
                     ,
                     ]
                   );
    } else if (self.chartType == ChartAnimationTypeVCChartTypeArea
               || self.chartType == ChartAnimationTypeVCChartTypeAreaspline) {
        NSDictionary *gradientColorDic = @{
                                           @"linearGradient": @{
                                                   @"x1": @0,
                                                   @"y1": @1,
                                                   @"x2": @0,
                                                   @"y2": @0
                                                   },
                                           @"stops": @[@[@0,@"rgba(255,140,0,0.2)"],
                                                       @[@1,@"rgba(220,20,60,1)"]]//颜色字符串设置支持十六进制类型和 rgba 类型
                                           };
        self.chartModel
        .markerRadiusSet(@0)
        .gradientColorEnabledSet(true)
        .seriesSet(@[
                     AAObject(AASeriesElement)
                     .nameSet(@"2017")
                     .dataSet(@[@0.9, @0.6, @3.5, @8.4, @13.5, @17.0, @18.6, @17.9, @14.3, @9.0, @3.9, @1.0])
                     .colorSet((id)gradientColorDic)
                     ,
                     ]);
    } else {
        NSDictionary *gradientColorDic = @{
                                           @"linearGradient": @{
                                                   @"x1": @0,
                                                   @"y1": @0,
                                                   @"x2": @0,
                                                   @"y2": @1
                                                   },
                                           @"stops": @[@[@0,@"#8A2BE2"],
                                                       @[@1,@"#1E90FF"]]//颜色字符串设置支持十六进制类型和 rgba 类型
                                           };
        
        self.chartModel
        .seriesSet(@[
                     AAObject(AASeriesElement)
                     .nameSet(@"2017")
                     .dataSet(@[@3.9, @4.2, @5.7, @8.5, @11.9, @15.2, @17.0, @16.6, @14.2, @10.3, @6.6, @4.8])
                     .colorSet((id)gradientColorDic)
                     ,
                     ]);
    }
    
    [self.chartView aa_drawChartWithChartModel:self.chartModel];
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
