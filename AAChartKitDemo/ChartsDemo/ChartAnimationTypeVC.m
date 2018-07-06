
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
        case 9: return AAChartTypePie;
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
    } else if (self.chartType == ChartAnimationTypeVCChartTypeScatter) {
        self.chartModel.seriesSet(@[
                                    AAObject(AASeriesElement)
                                    .nameSet(@"男")
                                    .dataSet(@[
                                               @[@161.2, @51.6], @[@167.5, @59.0], @[@159.5, @49.2], @[@157.0, @63.0], @[@155.8, @53.6],
                                               @[@170.0, @59.0], @[@159.1, @47.6], @[@166.0, @69.8], @[@176.2, @66.8], @[@160.2, @75.2],
                                               @[@172.5, @55.2], @[@170.9, @54.2], @[@172.9, @62.5], @[@153.4, @42.0], @[@160.0, @50.0],
                                               @[@147.2, @49.8], @[@168.2, @49.2], @[@175.0, @73.2], @[@157.0, @47.8], @[@167.6, @68.8],
                                               @[@159.5, @50.6], @[@175.0, @82.5], @[@166.8, @57.2], @[@176.5, @87.8], @[@170.2, @72.8],
                                               @[@174.0, @54.5], @[@173.0, @59.8], @[@179.9, @67.3], @[@170.5, @67.8], @[@160.0, @47.0],
                                               @[@154.4, @46.2], @[@162.0, @55.0], @[@176.5, @83.0], @[@160.0, @54.4], @[@152.0, @45.8],
                                               @[@162.1, @53.6], @[@170.0, @73.2], @[@160.2, @52.1], @[@161.3, @67.9], @[@166.4, @56.6],
                                               @[@168.9, @62.3], @[@163.8, @58.5], @[@167.6, @54.5], @[@160.0, @50.2], @[@161.3, @60.3],
                                               @[@167.6, @58.3], @[@165.1, @56.2], @[@160.0, @50.2], @[@170.0, @72.9], @[@157.5, @59.8],
                                               @[@167.6, @61.0], @[@160.7, @69.1], @[@163.2, @55.9], @[@152.4, @46.5], @[@157.5, @54.3],
                                               @[@168.3, @54.8], @[@180.3, @60.7], @[@165.5, @60.0], @[@165.0, @62.0], @[@164.5, @60.3],
                                               @[@156.0, @52.7], @[@160.0, @74.3], @[@163.0, @62.0], @[@165.7, @73.1], @[@161.0, @80.0],
                                               @[@162.0, @54.7], @[@166.0, @53.2], @[@174.0, @75.7], @[@172.7, @61.1], @[@167.6, @55.7],
                                               @[@151.1, @48.7], @[@164.5, @52.3], @[@163.5, @50.0], @[@152.0, @59.3], @[@169.0, @62.5],
                                               @[@164.0, @55.7], @[@161.2, @54.8], @[@155.0, @45.9], @[@170.0, @70.6], @[@176.2, @67.2],
                                               @[@170.0, @69.4], @[@162.5, @58.2], @[@170.3, @64.8], @[@164.1, @71.6], @[@169.5, @52.8],
                                               @[@163.2, @59.8], @[@154.5, @49.0], @[@159.8, @50.0], @[@173.2, @69.2], @[@170.0, @55.9],
                                               @[@161.4, @63.4], @[@169.0, @58.2], @[@166.2, @58.6], @[@159.4, @45.7], @[@162.5, @52.2],
                                               @[@159.0, @48.6], @[@162.8, @57.8], @[@159.0, @55.6], @[@179.8, @66.8], @[@162.9, @59.4],
                                               @[@161.0, @53.6], @[@151.1, @73.2], @[@168.2, @53.4], @[@168.9, @69.0], @[@173.2, @58.4],
                                               @[@171.8, @56.2], @[@178.0, @70.6], @[@164.3, @59.8], @[@163.0, @72.0], @[@168.5, @65.2],
                                               @[@166.8, @56.6], @[@172.7, @93.3], @[@163.5, @51.8], @[@169.4, @63.4], @[@167.8, @59.0],
                                               @[@159.5, @47.6], @[@167.6, @63.0], @[@161.2, @55.2], @[@160.0, @45.0], @[@163.2, @54.0],
                                               @[@162.2, @50.2], @[@161.3, @60.2], @[@149.5, @44.8], @[@157.5, @58.8], @[@163.2, @56.4],
                                               @[@172.7, @62.0], @[@155.0, @49.2], @[@156.5, @67.2], @[@164.0, @53.8], @[@160.9, @54.4],
                                               @[@162.8, @58.0], @[@167.0, @59.8], @[@160.0, @54.8], @[@160.0, @43.2], @[@168.9, @60.5],
                                               @[@158.2, @46.4], @[@156.0, @64.4], @[@160.0, @48.8], @[@167.1, @62.2], @[@158.0, @55.5],
                                               @[@167.6, @57.8], @[@156.0, @54.6], @[@162.1, @59.2], @[@173.4, @52.7], @[@159.8, @53.2],
                                               @[@170.5, @64.5], @[@159.2, @51.8], @[@157.5, @56.0], @[@161.3, @63.6], @[@162.6, @63.2],
                                               @[@160.0, @59.5], @[@168.9, @56.8], @[@165.1, @64.1], @[@162.6, @50.0], @[@165.1, @72.3],
                                               @[@166.4, @55.0], @[@160.0, @55.9], @[@152.4, @60.4], @[@170.2, @69.1], @[@162.6, @84.5],
                                               @[@170.2, @55.9], @[@158.8, @55.5], @[@172.7, @69.5], @[@167.6, @76.4], @[@162.6, @61.4],
                                               @[@167.6, @65.9], @[@156.2, @58.6], @[@175.2, @66.8], @[@172.1, @56.6], @[@162.6, @58.6],
                                               @[@160.0, @55.9], @[@165.1, @59.1], @[@182.9, @81.8], @[@166.4, @70.7], @[@165.1, @56.8],
                                               @[@177.8, @60.0], @[@165.1, @58.2], @[@175.3, @72.7], @[@154.9, @54.1], @[@158.8, @49.1],
                                               @[@172.7, @75.9], @[@168.9, @55.0], @[@161.3, @57.3], @[@167.6, @55.0], @[@165.1, @65.5],
                                               @[@175.3, @65.5], @[@157.5, @48.6], @[@163.8, @58.6], @[@167.6, @63.6], @[@165.1, @55.2],
                                               @[@165.1, @62.7], @[@168.9, @56.6], @[@162.6, @53.9], @[@164.5, @63.2], @[@176.5, @73.6],
                                               @[@168.9, @62.0], @[@175.3, @63.6], @[@159.4, @53.2], @[@160.0, @53.4], @[@170.2, @55.0],
                                               @[@162.6, @70.5], @[@167.6, @54.5], @[@162.6, @54.5], @[@160.7, @55.9], @[@160.0, @59.0],
                                               @[@157.5, @63.6], @[@162.6, @54.5], @[@152.4, @47.3], @[@170.2, @67.7], @[@165.1, @80.9],
                                               @[@172.7, @70.5], @[@165.1, @60.9], @[@170.2, @63.6], @[@170.2, @54.5], @[@170.2, @59.1],
                                               @[@161.3, @70.5], @[@167.6, @52.7], @[@167.6, @62.7], @[@165.1, @86.3], @[@162.6, @66.4],
                                               @[@152.4, @67.3], @[@168.9, @63.0], @[@170.2, @73.6], @[@175.2, @62.3], @[@175.2, @57.7],
                                               @[@160.0, @55.4], @[@165.1, @94.4], @[@174.0, @55.5], @[@170.2, @77.3], @[@160.0, @80.5],
                                               @[@167.6, @64.5], @[@167.6, @72.3], @[@167.6, @61.4], @[@154.9, @58.2], @[@162.6, @81.8],
                                               @[@175.3, @63.6], @[@171.4, @53.4], @[@157.5, @54.5], @[@165.1, @53.6], @[@160.0, @60.0],
                                               @[@174.0, @73.6], @[@162.6, @61.4], @[@174.0, @55.5], @[@162.6, @63.6], @[@161.3, @60.9],
                                               @[@156.2, @60.0], @[@149.9, @46.8], @[@169.5, @57.3], @[@160.0, @64.1], @[@175.3, @63.6],
                                               @[@169.5, @67.3], @[@160.0, @75.5], @[@172.7, @68.2], @[@162.6, @61.4], @[@157.5, @76.8],
                                               @[@176.5, @71.8], @[@164.4, @55.5], @[@160.7, @48.6], @[@174.0, @66.4], @[@163.8, @67.3]
                                               ]),
                                    ]);
    } else if (self.chartType == ChartAnimationTypeVCChartTypePie) {
      self.chartModel.seriesSet(@[
          AAObject(AASeriesElement)
          .nameSet(@"语言热度值")
          .innerSizeSet(@"20%")//内部圆环半径大小占比
          .borderWidthSet(@0)//描边的宽度
          .allowPointSelectSet(false)//是否允许在点击数据点标记(扇形图点击选中的块发生位移)
          .dataSet(
                   @[
                     @[@"Firefox",   @3336.2],
                     @[@"Others",    @223],
                     @[@"IE",        @26.8],
                     @[@"Safari",    @88.5],
                     @[@"Opera",     @46.0],
                     
                     ]
                   ),
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
