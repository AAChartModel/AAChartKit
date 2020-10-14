
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
 * JianShu       : https://www.jianshu.com/u/f1e6753d4254
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
    
    _chartTypeArr =
    @[
      AAChartTypeColumn,
      AAChartTypeBar,
      AAChartTypeLine,
      AAChartTypeSpline,
      AAChartTypeArea,
      AAChartTypeAreaspline,
      AAChartTypeColumn,
      AAChartTypeBar,
      AAChartTypeLine,
      AAChartTypeSpline,
      AAChartTypeArea,
      AAChartTypeAreaspline,
      AAChartTypeBubble,
      AAChartTypeColumn,
      AAChartTypeLine,
      AAChartTypeSpline,
      AAChartTypeArea,
      AAChartTypeAreaspline,
      AAChartTypeBubble,
      AAChartTypeColumn,
      AAChartTypeLine,
      AAChartTypeSpline,
      AAChartTypeArea,
      AAChartTypeAreaspline,
      AAChartTypeBubble,
      ];
    
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
    cell.userInteractionEnabled = false;
    AAChartModel *chartModel = [self configureAAChartModel];
    chartModel.chartType = _chartTypeArr[indexPath.row];
    NSString *chartType = chartModel.chartType;
    
    if ([chartType isEqualToString:AAChartTypeSpline]|| [chartType isEqualToString:AAChartTypeAreaspline]) {
        chartModel.markerRadius = @0;
//        chartModel.series = @[
//                              AAObject(AASeriesElement)
//                              .nameSet(@"2017")
//                              .lineWidthSet(@5)
//                              .dataSet(@[@50, @320, @230, @370, @230, @400,]),
//                              AAObject(AASeriesElement)
//                              .nameSet(@"2018")
//                              .lineWidthSet(@5)
//                              .dataSet(@[@80, @390, @210, @340, @240, @350,]),
//                              AAObject(AASeriesElement)
//                              .nameSet(@"2019")
//                              .lineWidthSet(@5)
//                              .dataSet(@[@100, @370, @180, @280, @260, @300,]),
//                              AAObject(AASeriesElement)
//                              .nameSet(@"2020")
//                              .lineWidthSet(@5)
//                              .dataSet(@[@130, @350, @160, @310, @250, @268,]),
//                              ];
    } else if ([chartType isEqualToString:AAChartTypeArea] || [chartType isEqualToString:AAChartTypeLine]) {
        chartModel.stacking = AAChartStackingTypeFalse;
    } else if ([chartType isEqualToString:AAChartTypeBubble]) {
        chartModel.series =
        @[
          AASeriesElement.new
          .nameSet(@"2017")
          .fillColorSet(@"rgba(255,255,255,0.33)")
          .dataSet(
                   @[
                     @[@97, @36, @79],
                     @[@94, @74, @60],
                     @[@68, @76, @58],
                     @[@64, @87, @56],
                     @[@68, @27, @73],
                     @[@74, @99, @42],
                     @[@7 , @93, @87],
                     @[@51, @69, @40],
                     @[@38, @23, @33],
                     @[@57, @86, @31]
                     ]),
          AASeriesElement.new
          .nameSet(@"2018")
          .fillColorSet(@"rgba(255,255,255,0.66)")
          .dataSet(
                   @[
                     @[@25, @10, @87],
                     @[@2 , @75, @59],
                     @[@11, @54, @8 ],
                     @[@86, @55, @93],
                     @[@5 , @3 , @58],
                     @[@90, @63, @44],
                     @[@91, @33, @17],
                     @[@97, @3 , @56],
                     @[@15, @67, @48],
                     @[@54, @25, @81]
                     ]),
          AASeriesElement.new
          .nameSet(@"2019")
          .fillColorSet(@"rgba(255,255,255,0.99)")
          .dataSet(
                   @[
                     @[@47, @47, @21],
                     @[@20, @12, @4 ],
                     @[@6 , @76, @91],
                     @[@38, @30, @60],
                     @[@57, @98, @64],
                     @[@61, @17, @80],
                     @[@83, @60, @13],
                     @[@67, @78, @75],
                     @[@64, @12, @10],
                     @[@30, @77, @82]
                     ]),
          ];
    }
    if (indexPath.row > 6 && indexPath.row <= 12) {
        chartModel.stacking = AAChartStackingTypePercent;
    } else if (indexPath.row > 12 && indexPath.row <= 18) {
        chartModel.polar = true;
    } else if (indexPath.row > 18) {
        chartModel.polar = true;
        chartModel.stacking = AAChartStackingTypePercent;
    }
    
    AAOptions *aaOptions = [self configureChartStyleWithChartModel:chartModel index:indexPath.row];
    [cell.aaChartView aa_drawChartWithOptions:aaOptions];
    
    return cell;
}

- (AAOptions *)configureChartStyleWithChartModel:(AAChartModel *)chartModel index:(NSUInteger)index {
    NSArray *gradientColorArr =
    @[[AAGradientColor oceanBlueColorWithDirection:AALinearGradientDirectionToTopLeft],
      [AAGradientColor sanguineColorWithDirection:AALinearGradientDirectionToTopLeft],
      [AAGradientColor lusciousLimeColorWithDirection:AALinearGradientDirectionToTopLeft],
      [AAGradientColor purpleLakeColorWithDirection:AALinearGradientDirectionToTopLeft],
      [AAGradientColor freshPapayaColorWithDirection:AALinearGradientDirectionToTopLeft],
      [AAGradientColor ultramarineColorWithDirection:AALinearGradientDirectionToTopLeft],
      [AAGradientColor pinkSugarColorWithDirection:AALinearGradientDirectionToTopLeft],
      [AAGradientColor lemonDrizzleColorWithDirection:AALinearGradientDirectionToTopLeft],
      [AAGradientColor victoriaPurpleColorWithDirection:AALinearGradientDirectionToTopLeft],
      [AAGradientColor springGreensColorWithDirection:AALinearGradientDirectionToTopLeft],
      [AAGradientColor mysticMauveColorWithDirection:AALinearGradientDirectionToTopLeft],
      [AAGradientColor reflexSilverColorWithDirection:AALinearGradientDirectionToTopLeft],
      [AAGradientColor newLeafColorWithDirection:AALinearGradientDirectionToTopLeft],
      [AAGradientColor pixieDustColorWithDirection:AALinearGradientDirectionToTopLeft],
      [AAGradientColor fizzyPeachColorWithDirection:AALinearGradientDirectionToTopLeft],
      [AAGradientColor sweetDreamColorWithDirection:AALinearGradientDirectionToTopLeft],
      [AAGradientColor firebrickColorWithDirection:AALinearGradientDirectionToTopLeft],
      [AAGradientColor wroughtIronColorWithDirection:AALinearGradientDirectionToTopLeft],
      [AAGradientColor deepSeaColorWithDirection:AALinearGradientDirectionToTopLeft],
      [AAGradientColor coastalBreezeColorWithDirection:AALinearGradientDirectionToTopLeft],
      [AAGradientColor eveningDelightColorWithDirection:AALinearGradientDirectionToTopLeft],
      [AAGradientColor cottonCandyColorWithDirection:AALinearGradientDirectionToTopLeft],
      //重复颜色
      [AAGradientColor oceanBlueColorWithDirection:AALinearGradientDirectionToTopLeft],
      [AAGradientColor sanguineColorWithDirection:AALinearGradientDirectionToTopLeft],
      [AAGradientColor lusciousLimeColorWithDirection:AALinearGradientDirectionToTopLeft],
      [AAGradientColor purpleLakeColorWithDirection:AALinearGradientDirectionToTopLeft],
      ];
    
    NSDictionary *gradientColor = gradientColorArr[index];
    chartModel.colorsThemeSet(@[@"rgba(255,255,255,0.4)",
                                @"rgba(255,255,255,0.6)",
                                @"rgba(255,255,255,0.8)",
                                @"rgba(255,255,255,1.0)",
                                ]);//设置主体颜色数组

    chartModel.backgroundColor = (id)gradientColor;
    
    AAOptions *aaOptions = [AAOptionsConstructor configureChartOptionsWithAAChartModel:chartModel];
    
    aaOptions.plotOptions
    .columnrangeSet(AALine.new
                    .dataLabelsSet(AADataLabels.new
                                   .enabledSet(true)
                                   .styleSet(AAStyle.new
                                             .colorSet(AAColor.whiteColor)
                                             .fontSizeSet(@"14px")
                                             .fontWeightSet(AAChartFontWeightTypeThin)
                                             .textOutlineSet(@"0px 0px contrast")//文字轮廓描边
                                             )));
    aaOptions.plotOptions.series.animation = (id)@false;//禁用图表的渲染动画效果
    
    aaOptions.yAxis
    .lineWidthSet(@1.5)//Y轴轴线颜色
    .lineColorSet(AAColor.whiteColor)//Y轴轴线颜色
    .gridLineWidthSet(@0)//Y轴网格线宽度
    .labels.style.colorSet(AAColor.whiteColor)//Y轴文字颜色
    ;
    
    aaOptions.xAxis
    .tickWidthSet(@0)//X轴刻度线宽度
    .lineWidthSet(@1.5)//X轴轴线宽度
    .lineColorSet(AAColor.whiteColor)//X轴轴线颜色
    .labels.style.colorSet(AAColor.whiteColor)//X轴文字颜色
    ;

    aaOptions.legend
    .itemStyleSet(AAItemStyle.new
                  .colorSet(AAColor.whiteColor)//字体颜色
                  .fontSizeSet(@"13px")//字体大小
                  .fontWeightSet(AAChartFontWeightTypeThin)//字体为细体字
                  );
    return aaOptions;
}

- (AAChartModel *)configureAAChartModel {
   AAChartModel *aaChartModel = AAChartModel.new
    .chartTypeSet(AAChartTypeColumn)//图表类型
    .yAxisVisibleSet(true)//设置 Y 轴是否可见
    .tooltipValueSuffixSet(@"℃")//设置浮动提示框单位后缀
    .yAxisGridLineStyleSet([AALineStyle styleWithWidth:@0])//y轴横向分割线宽度为0(即是隐藏分割线)
    .stackingSet(AAChartStackingTypeNormal)
    .borderRadiusSet(@5)
    .seriesSet(@[
                 AASeriesElement.new
                 .nameSet(@"Tokyo Hot")
                 .fillColorSet(@"rgba(255,255,255,0.4)")
                 .dataSet(@[@0.45, @0.43, @0.50, @0.55, @0.58, @0.62, @0.83, @0.39, @0.56, @0.67, @0.50, @0.34, @0.50, @0.67, @0.58, @0.29, @0.46, @0.23, @0.47, @0.46, @0.38, @0.56, @0.48, @0.36]),
                 AASeriesElement.new
                 .nameSet(@"Berlin Hot")
                 .fillColorSet(@"rgba(255,255,255,0.6)")
                 .dataSet(@[@0.38, @0.31, @0.32, @0.32, @0.64, @0.66, @0.86, @0.47, @0.52, @0.75, @0.52, @0.56, @0.54, @0.60, @0.46, @0.63, @0.54, @0.51, @0.58, @0.64, @0.60, @0.45, @0.36, @0.67]),
                 AASeriesElement.new
                 .nameSet(@"London Hot")
                 .fillColorSet(@"rgba(255,255,255,0.8)")
                 .dataSet(@[@0.46, @0.32, @0.53, @0.58, @0.86, @0.68, @0.85, @0.73, @0.69, @0.71, @0.91, @0.74, @0.60, @0.50, @0.39, @0.67, @0.55, @0.49, @0.65, @0.45, @0.64, @0.47, @0.63, @0.64]),
                 AASeriesElement.new
                 .nameSet(@"NewYork Hot")
                 .fillColorSet(@"rgba(255,255,255,1.0)")
                 .dataSet(@[@0.60, @0.51, @0.52, @0.53, @0.64, @0.84, @0.65, @0.68, @0.63, @0.47, @0.72, @0.60, @0.65, @0.74, @0.66, @0.65, @0.71, @0.59, @0.65, @0.77, @0.52, @0.53, @0.58, @0.53]),
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



