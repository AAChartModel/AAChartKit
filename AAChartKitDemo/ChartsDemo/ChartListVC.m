
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

#import "ChartListVC.h"
#import "AAChartModel.h"

#define ColorWithRGB(r,g,b,a) [UIColor colorWithRed:(r)/255.0f green:(g)/255.0f blue:(b)/255.0f alpha:(a)]
#define AAGrayColor            [UIColor colorWithRed:245/255.0 green:246/255.0 blue:247/255.0 alpha:1.0]
#define AABlueColor            ColorWithRGB(63, 153,231,1)

@interface ChartListVC ()<UITableViewDelegate,UITableViewDataSource>

@property (nonatomic, strong) NSArray *chartTypeArr;
@property (nonatomic, strong) NSArray *sectionTypeArr;

@end

@implementation ChartListVC

- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor = [UIColor whiteColor];
    self.title = @"AAInfographics";
    
    _chartTypeArr = @[AAChartTypeColumn,AAChartTypeBar,AAChartTypeLine,AAChartTypeSpline,AAChartTypeArea,AAChartTypeAreaspline,AAChartTypeBubble,AAChartTypeColumn,AAChartTypeLine,AAChartTypeSpline,AAChartTypeArea,AAChartTypeAreaspline,AAChartTypeBubble,AAChartTypeColumn,AAChartTypeLine,AAChartTypeSpline,AAChartTypeArea,AAChartTypeAreaspline,AAChartTypeBubble];
    
    [self setUpBasicView];
}


- (void)setUpBasicView {
    UITableView *tableV = [[UITableView alloc]init];
    tableV.delegate = self;
    tableV.dataSource = self;
    [self.view addSubview:tableV];
    
    tableV.translatesAutoresizingMaskIntoConstraints = NO;
    [self.view addConstraints:[self configureTheConstraintArrayWithItem:tableV toItem:self.view]];
    
}

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return _chartTypeArr.count;
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath {
    return 400;
}

- (CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section {
    return 0;
}


- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    ChartListCell *cell = [tableView dequeueReusableCellWithIdentifier:@"cell"];
    if (!cell) {
        cell = [[ChartListCell alloc]initWithStyle:UITableViewCellStyleDefault reuseIdentifier:@"cell"];
    }
    cell.selectionStyle = UITableViewCellSelectionStyleNone;
    AAChartModel *chartModel = [self configureAAChartModel];
    chartModel.chartType = _chartTypeArr[indexPath.row];
    NSString *chartType = chartModel.chartType;
    
    if ([chartType isEqualToString:AAChartTypeSpline]|| [chartType isEqualToString:AAChartTypeAreaspline]) {
        chartModel.markerRadius = @0;
        chartModel.series = @[
                              AAObject(AASeriesElement)
                              .nameSet(@"2017")
                              .fillOpacitySet(@0.3)
                              .lineWidthSet(@5)
                              .dataSet(@[@50, @320, @230, @370, @230, @400,]),
                              AAObject(AASeriesElement)
                              .nameSet(@"2018")
                              .fillOpacitySet(@0.3)
                              .lineWidthSet(@5)
                              .dataSet(@[@80, @390, @210, @340, @240, @350,]),
                              AAObject(AASeriesElement)
                              .nameSet(@"2019")
                              .fillOpacitySet(@0.3)
                              .lineWidthSet(@5)
                              .dataSet(@[@100, @370, @180, @280, @260, @300,]),
                              AAObject(AASeriesElement)
                              .nameSet(@"2020")
                              .fillOpacitySet(@0.3)
                              .lineWidthSet(@5)
                              .dataSet(@[@130, @350, @160, @310, @250, @268,]),
                              ];
    } else if ([chartType isEqualToString:AAChartTypeArea] || [chartType isEqualToString:AAChartTypeLine]) {
        chartModel.stacking = AAChartStackingTypeFalse;
    }
    
    if (indexPath.row > 6 && indexPath.row <= 12) {
        chartModel.polar = true;
    } else if (indexPath.row > 12) {
        chartModel.polar = true;
        chartModel.stacking = AAChartStackingTypePercent;
    }
    
    [cell.aaChartView aa_drawChartWithChartModel:chartModel];


    return cell;
}

- (AAChartModel *)configureAAChartModel {
   AAChartModel *aaChartModel= AAObject(AAChartModel)
    .chartTypeSet(AAChartTypeColumn)//图表类型
    .titleSet(@"")//图表主标题
    .subtitleSet(@"")//图表副标题
    .yAxisVisibleSet(true)//设置 Y 轴是否可见
    .colorsThemeSet(@[@"#9b43b4",@"#ef476f",@"#ffd066",@"#04d69f",@"#25547c",])//设置主体颜色数组
    .yAxisTitleSet(@"")//设置 Y 轴标题
    .tooltipValueSuffixSet(@"℃")//设置浮动提示框单位后缀
    .backgroundColorSet(@"#ffffff")
    .yAxisGridLineWidthSet(@0)//y轴横向分割线宽度为0(即是隐藏分割线)
    .stackingSet(AAChartStackingTypeNormal)
    .borderRadiusSet(@5)
    .seriesSet(@[
                 AAObject(AASeriesElement)
                 .nameSet(@"2017")
                 .dataSet(@[@7.0, @6.9, @9.5, @14.5, @18.2, @21.5, @25.2, @26.5, @23.3, @18.3, @13.9, @9.6]),
                 AAObject(AASeriesElement)
                 .nameSet(@"2018")
                 .dataSet(@[@0.2, @0.8, @5.7, @11.3, @17.0, @22.0, @24.8, @24.1, @20.1, @14.1, @8.6, @2.5]),
                 AAObject(AASeriesElement)
                 .nameSet(@"2019")
                 .dataSet(@[@0.9, @0.6, @3.5, @8.4, @13.5, @17.0, @18.6, @17.9, @14.3, @9.0, @3.9, @1.0]),
                 AAObject(AASeriesElement)
                 .nameSet(@"2020")
                 .dataSet(@[@3.9, @4.2, @5.7, @8.5, @11.9, @15.2, @17.0, @16.6, @14.2, @10.3, @6.6, @4.8]),
                 ]
               );
    return aaChartModel;
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



@end


@implementation ChartListCell

- (instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier {
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if (self) {
        _aaChartView = [[AAChartView alloc]initWithFrame:CGRectMake(0, 40, self.frame.size.width+40, 300)];
//        _aaChartView.layer.cornerRadius = 8;
//        _aaChartView.layer.masksToBounds = YES;
//        _aaChartView.layer.shadowColor = [UIColor blackColor].CGColor;
//        _aaChartView.layer.shadowOffset = CGSizeMake(2, 4);
//        _aaChartView.backgroundColor = [UIColor redColor];
        [self.contentView addSubview:_aaChartView];
        
        _aaChartView.translatesAutoresizingMaskIntoConstraints = NO;
        [self addConstraints:[self configureTheConstraintArrayWithItem:_aaChartView toItem:self]];
        
    }
    return self;
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

@end



