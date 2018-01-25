//
//  ViewController.m
//  AAChartKit
//
//  Created by An An on 17/3/13.
//  Copyright © 2017年 An An. All rights reserved.
//  source code ----*** https://github.com/AAChartModel/AAChartKit ***--- source code
//

/*
 
 * -------------------------------------------------------------------------------
 *
 * ❤❤❤❤❤❤   WARM TIPS!!!   ❤❤❤❤❤❤
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

#import "SecondViewController.h"
#import "AAChartKit.h"

@interface SecondViewController ()<AAChartViewDidFinishLoadDelegate>

@property (nonatomic, strong) AAChartModel *aaChartModel;
@property (nonatomic, strong) AAChartView  *aaChartView;

@end

@implementation SecondViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor = [self colorWithHexString:@"#4b2b7f"];
    self.navigationController.navigationBar.backgroundColor = [UIColor clearColor];
    
    [self setUpTheSegmentedControls];
    [self setUpTheSwitchs];
    
    AAChartType chartType;
    switch (self.chartType) {
        case 0:
            chartType = AAChartTypeColumn;
            break;
        case 1:
            chartType = AAChartTypeBar;
            break;
        case 2:
            chartType = AAChartTypeArea;
            break;
        case 3:
            chartType = AAChartTypeAreaspline;
            break;
        case 4:
            chartType = AAChartTypeLine;
            break;
        case 5:
            chartType = AAChartTypeSpline;
            break;
        case 6:
            chartType = AAChartTypeLine;
            break;
        case 7:
            chartType = AAChartTypeArea;
            break;
        case 8:
            chartType = AAChartTypeScatter;
            break;
        default:
            break;
    }
    
    self.title = [NSString stringWithFormat:@"%@ chart",chartType];
    
    [self setUpTheAAChartViewWithChartType:chartType];
    
}

- (void)setUpTheAAChartViewWithChartType:(AAChartType)chartType {
    
    CGFloat chartViewWidth  = self.view.frame.size.width;
    CGFloat chartViewHeight = self.view.frame.size.height-220;
    self.aaChartView = [[AAChartView alloc]init];
    self.aaChartView.frame = CGRectMake(0, 60, chartViewWidth, chartViewHeight);
    self.aaChartView.delegate = self;
    //    设置aaChartVie 的内容高度(content height)
    //    self.aaChartView.contentHeight = chartViewHeight;
    [self.view addSubview:self.aaChartView];
    
    
    //设置 AAChartView 的背景色是否为透明
    self.aaChartView.isClearBackgroundColor = YES;
    
    self.aaChartModel= AAObject(AAChartModel)
    .chartTypeSet(chartType)//图表类型
    .titleSet(@"")//图表主标题
    .subtitleSet(@"")//图表副标题
    .yAxisVisibleSet(true)//设置 Y 轴是否可见
    .colorsThemeSet(@[@"#fe117c",@"#ffc069",@"#06caf4",@"#7dffc0"])//设置主体颜色数组
    .yAxisTitleSet(@"")//设置 Y 轴标题
    .tooltipValueSuffixSet(@"℃")//设置浮动提示框单位后缀
//    .backgroundColorSet(@"#4b2b7f")
    .yAxisGridLineWidthSet(@0.3)//y轴横向分割线宽度
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
    [self configureTheStyleForDifferentTypeChart];//为不同类型图表设置样式
    
    /*配置 Y 轴标注线,解开注释,即可查看添加标注线之后的图表效果(NOTE:必须设置 Y 轴可见)*/
//    [self configureTheYAxisPlotLineForAAChartView];
    
    [self.aaChartView aa_drawChartWithChartModel:_aaChartModel];
}

/**
 *   图表 Y 轴标示线的设置
 *   标示线设置作为图表一项基础功能,用于对图表的基本数据水平均线进行标注
 *   虽然不太常被使用,但我们仍然提供了此功能的完整接口,以便于有特殊需求的用户使用
 *   解除👆上面的设置 Y 轴标注线的已被注释代码,,运行程序,即可查看实际工程效果以酌情选择
 *
 **/
- (void)configureTheYAxisPlotLineForAAChartView {
    _aaChartModel.yAxisMaxSet(@(21))//Y轴最大值
    .yAxisMinSet(@(1))//Y轴最小值
    .yAxisAllowDecimalsSet(NO)//是否允许Y轴坐标值小数
    .yAxisTickPositionsSet(@[@(0),@(25),@(50),@(75),@(100)])//指定y轴坐标
    .yAxisPlotLinesSet(@[
                         AAObject(AAPlotLinesElement)
                         .colorSet(@"#F05353")//颜色值(16进制)
                         .dashStyleSet(@"Dash")//样式：Dash,Dot,Solid等,默认Solid
                         .widthSet(@(1)) //标示线粗细
                         .valueSet(@(20)) //所在位置
                         .zIndexSet(@(1)) //层叠,标示线在图表中显示的层叠级别，值越大，显示越向前
                         .labelSet(@{@"text":@"标示线1",@"x":@(0),@"style":@{@"color":@"#33bdfd"}})/*这里其实也可以像AAPlotLinesElement这样定义个对象来赋值（偷点懒直接用了字典，最会终转为js代码，可参考https://www.hcharts.cn/docs/basic-plotLines来写字典）*/
                         ,AAObject(AAPlotLinesElement)
                         .colorSet(@"#33BDFD")
                         .dashStyleSet(@"Dash")
                         .widthSet(@(1))
                         .valueSet(@(40))
                         .labelSet(@{@"text":@"标示线2",@"x":@(0),@"style":@{@"color":@"#33bdfd"}})
                         ,AAObject(AAPlotLinesElement)
                         .colorSet(@"#ADFF2F")
                         .dashStyleSet(@"Dash")
                         .widthSet(@(1))
                         .valueSet(@(60))
                         .labelSet(@{@"text":@"标示线3",@"x":@(0),@"style":@{@"color":@"#33bdfd"}})
                         ]
                   );
    
}

- (void)configureTheStyleForDifferentTypeChart {
    if (self.chartType == SecondeViewControllerChartTypeColumn
        || self.chartType == SecondeViewControllerChartTypeBar) {
        _aaChartModel.categories = @[@"Java", @"Swift", @"Python", @"Ruby", @"PHP", @"Go", @"C", @"C#", @"C++", @"Perl", @"R", @"MATLAB", @"SQL"];//设置 X 轴坐标内容
    } else if (self.chartType == SecondeViewControllerChartTypeArea
               || self.chartType == SecondeViewControllerChartTypeAreaspline) {
        _aaChartModel.symbolStyle = AAChartSymbolStyleTypeInnerBlank;//设置折线连接点样式为:内部白色
        _aaChartModel.gradientColorEnable = true;//启用渐变色
    } else if (self.chartType == SecondeViewControllerChartTypeLine
               || self.chartType == SecondeViewControllerChartTypeSpline) {
        _aaChartModel.symbolStyle = AAChartSymbolStyleTypeBorderBlank;//设置折线连接点样式为:边缘白色
    } else if (self.chartType == SecondeViewControllerChartTypeStepLine
               || self.chartType == SecondeViewControllerChartTypeStepArea) {
        _aaChartModel.yAxisVisible = false;
        _aaChartModel.symbolStyle = (self.chartType == SecondeViewControllerChartTypeStepLine) ? AAChartSymbolStyleTypeBorderBlank : nil ;
        _aaChartModel.gradientColorEnable = (self.chartType == SecondeViewControllerChartTypeStepArea) ? true : false ;
        _aaChartModel.series = @[ @{
                                      @"name": @"Berlin",
                                      @"data": @[@149.9, @171.5, @106.4, @129.2, @144.0, @176.0, @135.6, @188.5, @276.4, @214.1, @95.6, @54.4],
                                      @"step": @(true) //设置折线样式为直方折线,连接点位置默认靠左👈
                                      }, @{
                                      @"name": @"New York",
                                      @"data": @[@83.6, @78.8, @188.5, @93.4, @106.0, @84.5, @105.0, @104.3, @131.2, @153.5, @226.6, @192.3],
                                      @"step": @(true)
                                      }, @{
                                      @"name": @"Tokyo",
                                      @"data": @[@48.9, @38.8, @19.3, @41.4, @47.0, @28.3, @59.0, @69.6, @52.4, @65.2, @53.3, @72.2],
                                      @"step": @(true)
                                      }, ];
    }
}

- (NSArray *)configureTheRandomColorArray {
    NSMutableArray *colorStringArr = [[NSMutableArray alloc]init];
    for (int i=0; i<5; i++) {
        int R = (arc4random() % 256) ;
        int G = (arc4random() % 256) ;
        int B = (arc4random() % 256) ;
        NSString *colorStr = [NSString stringWithFormat:@"rgba(%d,%d,%d,0.9)",R,G,B];
        [colorStringArr addObject:colorStr];
    }
    return colorStringArr;
}

#pragma mark -- AAChartView delegate
- (void)AAChartViewDidFinishLoad {
    NSLog(@"🔥🔥🔥🔥🔥 AAChartView content did finish load!!!");
}

- (void)setUpTheSegmentedControls{
    
    NSArray *segmentedArray;
    NSArray *typeLabelNameArr;
    
    if (self.chartType == SecondeViewControllerChartTypeColumn
        ||self.chartType == SecondeViewControllerChartTypeBar) {
        segmentedArray = @[@[@"No stacking", @"Normal stacking", @"Percent stacking"],
                           @[@"Square corners", @"Rounded corners", @"Wedge"],
                           ];
        typeLabelNameArr = @[@"Stacking type selection", @"Corners Style type selection"];
    } else {
        segmentedArray = @[@[@"No stacking", @"Normal stacking", @"Percent stacking"],
                           @[@"Circle", @"Square", @"Diamond", @"Triangle", @"Triangle-down"]
                           ];
        typeLabelNameArr = @[@"Stacking type selection", @"Chart symbol type selection"];
    }
    
    for (int i=0; i<segmentedArray.count; i++) {
        
        UISegmentedControl * segmentedControl = [[UISegmentedControl alloc]initWithItems:segmentedArray[i]];
        segmentedControl.frame = CGRectMake(20, 40*i+(self.view.frame.size.height-145), self.view.frame.size.width-40, 20);
        segmentedControl.tintColor = [UIColor redColor];
//        segmentedControl.tintColor = [UIColor lightGrayColor];
        segmentedControl.selectedSegmentIndex = 0;
        segmentedControl.tag = i;
        [segmentedControl addTarget:self action:@selector(customsegmentedControlCellValueBeChanged:) forControlEvents:UIControlEventValueChanged];
        [self.view addSubview:segmentedControl];
        
        UILabel *typeLabel = [[UILabel alloc]init];
        typeLabel.textColor = [UIColor lightGrayColor];
        typeLabel.frame =CGRectMake(20, 40*i+(self.view.frame.size.height-165), self.view.frame.size.width-40, 20);
        typeLabel.text = typeLabelNameArr[i];
        typeLabel.font = [UIFont systemFontOfSize:11.0f];
        [self.view addSubview:typeLabel];
        
    }
}

- (void)customsegmentedControlCellValueBeChanged:(UISegmentedControl *)segmentedControl {
    switch (segmentedControl.tag) {
        case 0: {
            NSArray *stackingArr = @[AAChartStackingTypeFalse,
                                     AAChartStackingTypeNormal,
                                     AAChartStackingTypePercent];
            self.aaChartModel.stacking = stackingArr[segmentedControl.selectedSegmentIndex];
        }
            break;
            
        case 1: {
            
            if (self.chartType == 0 || self.chartType == 1 ) {
                NSArray *borderRadiusArr = @[ @0, @10, @100 ];
                self.aaChartModel.borderRadius = borderRadiusArr[segmentedControl.selectedSegmentIndex];
            } else {
                
                NSArray *symbolArr = @[AAChartSymbolTypeCircle,
                                       AAChartSymbolTypeSquare,
                                       AAChartSymbolTypeDiamond,
                                       AAChartSymbolTypeTriangle,
                                       AAChartSymbolTypeTriangle_down];
                self.aaChartModel.symbol = symbolArr[segmentedControl.selectedSegmentIndex];
            }
        }
            break;
            
        default:
            break;
    }
    
    [self refreshTheChartView];
}

- (void)refreshTheChartView {
    //    self.aaChartModel.colorsTheme = [self configureTheRandomColorArray];//random colors theme, Just for fun!!!
    [self.aaChartView aa_refreshChartWithChartModel:self.aaChartModel];
}

- (void)setUpTheSwitchs {
    NSArray *nameArr;
    if (self.chartType == SecondeViewControllerChartTypeColumn
        ||self.chartType == SecondeViewControllerChartTypeBar) {
        nameArr = @[@"xAxisReversed", @"yAxisReversed", @"xAxisInverted", @"Polarization", @"DataLabelShow",];
    } else {
        nameArr = @[@"xReversed", @"yReversed", @"xAxisInverted", @"Polarization", @"DataShow", @"HideMarker"];
    }
    
    CGFloat switchWidth = (self.view.frame.size.width-40)/nameArr.count;
    
    for (int i=0; i<nameArr.count; i++) {
        
        UISwitch * switchView = [[UISwitch alloc]init];
        switchView.frame = CGRectMake(switchWidth*i+20, self.view.frame.size.height-70, switchWidth, 20);
        //        switchView.backgroundColor = [UIColor blueColor];
//        switchView.onTintColor = [UIColor colorWithRed:0/255 green:191/255 blue:255/255 alpha:0.6];
        switchView.onTintColor = [UIColor whiteColor];
        switchView.thumbTintColor = [UIColor lightGrayColor];
        switchView.on = NO;
        switchView.tag = i;
        [switchView addTarget:self action:@selector(switchViewClicked:) forControlEvents:UIControlEventValueChanged];
        [self.view addSubview:switchView];
        
        UILabel *label = [[UILabel alloc]init];
        label.textColor = [UIColor lightGrayColor];
        label.numberOfLines = 0;
        label.frame = CGRectMake(switchWidth*i+20,  self.view.frame.size.height-40, switchWidth, 40);
        label.text = nameArr[i];
        label.font = [UIFont systemFontOfSize:8.0f];
        [self.view addSubview:label];
    }
}

- (void)switchViewClicked:(UISwitch *)switchView {
    switch (switchView.tag) {
        case 0:
            self.aaChartModel.xAxisReversed = switchView.on;
            break;
        case 1:
            self.aaChartModel.yAxisReversed = switchView.on;
            break;
        case 2:
            self.aaChartModel.inverted = switchView.on;
            break;
        case 3:
            self.aaChartModel.polar = switchView.on;
            break;
        case 4:
            self.aaChartModel.dataLabelEnabled = switchView.on;
            break;
        case 5:
            self.aaChartModel.markerRadius = switchView.on ? @0 : @5;
            break;
        default:
            break;
    }

    [self refreshTheChartView];
    
}

- (UIColor *) colorWithHexString: (NSString *)color
{
    NSString *cString = [[color stringByTrimmingCharactersInSet:[NSCharacterSet whitespaceAndNewlineCharacterSet]] uppercaseString];
    
    // String should be 6 or 8 characters
    if ([cString length] < 6) {
        return [UIColor clearColor];
    }
    // 判断前缀
    if ([cString hasPrefix:@"0X"])
        cString = [cString substringFromIndex:2];
    if ([cString hasPrefix:@"#"])
        cString = [cString substringFromIndex:1];
    if ([cString length] != 6)
        return [UIColor clearColor];
    // 从六位数值中找到RGB对应的位数并转换
    NSRange range;
    range.location = 0;
    range.length = 2;
    //R、G、B
    NSString *rString = [cString substringWithRange:range];
    range.location = 2;
    NSString *gString = [cString substringWithRange:range];
    range.location = 4;
    NSString *bString = [cString substringWithRange:range];
    // Scan values
    unsigned int r, g, b;
    [[NSScanner scannerWithString:rString] scanHexInt:&r];
    [[NSScanner scannerWithString:gString] scanHexInt:&g];
    [[NSScanner scannerWithString:bString] scanHexInt:&b];
    
    return [UIColor colorWithRed:((float) r / 255.0f) green:((float) g / 255.0f) blue:((float) b / 255.0f) alpha:1.0f];
}

@end
