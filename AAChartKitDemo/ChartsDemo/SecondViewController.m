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
 * ❀❀❀   WARM TIPS!!!   ❀❀❀
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
    self.view.backgroundColor = [UIColor whiteColor];
    
    [self configureTheSegmentedControls];
    [self configureTheSwitchs];
    
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
            chartType = AAChartTypeScatter;
            break;
        default:
            break;
    }
    
    self.title = [NSString stringWithFormat:@"%@ chart",chartType];
    
    [self configTheChartView:chartType];
    
}

- (void)configTheChartView:(AAChartType)chartType {
    
    CGFloat chartViewWidth  = self.view.frame.size.width;
    CGFloat chartViewHeight = self.view.frame.size.height-250;
//    self.aaChartView = [[AAChartView alloc]initWithFrame:CGRectMake(0, 60, chartViewWidth, chartViewHeight)];
    self.aaChartView = [[AAChartView alloc]init];
    self.aaChartView.frame = CGRectMake(0, 60, chartViewWidth, chartViewHeight);

    self.aaChartView.delegate = self;
//    设置aaChartVie 的内容高度(content height)
//    self.aaChartView.contentHeight = self.view.frame.size.height-250;
    [self.view addSubview:self.aaChartView];
    
//    //设置 AAChartView 的背景色是否为透明(解开注释查看设置背景色透明后的效果)
//    self.aaChartView.isClearBackgroundColor = YES;
//    self.view.backgroundColor = [UIColor blueColor];
    

    self.aaChartModel= AAObject(AAChartModel)
    .chartTypeSet(chartType)
    .titleSet(@"")
    .subtitleSet(@"")
    .borderRadiusSet(@5)
    .categoriesSet(@[@"Java",@"Swift",@"Python",@"Ruby", @"PHP",
                     @"Go",@"C",@"C#",@"C++",@"Perl",@"R",@"MATLAB",@"SQL"])
    .colorsThemeSet(@[@"#EA007B", @"#49C1B6", @"#FDC20A", @"#F78320", @"#068E81",])
    .yAxisTitleSet(@"")
    .tooltipValueSuffixSet(@"℃")
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
               )
    /**
     *   标示线的设置
     *   标示线设置作为图表一项基础功能,用于对图表的基本数据水平均线进行标注
     *   虽然不太常被使用,但我们仍然提供了此功能的完整接口,以便于有特殊需求的用户使用
     *   解除以下代码注释,,运行程序,即可查看实际工程效果以酌情选择
     *
     **/
    //    .yPlotLinesSet(@[AAObject(AAPlotLinesElement)
    //                     .colorSet(@"#F05353")//颜色值(16进制)
    //                     .dashStyleSet(@"Dash")//样式：Dash,Dot,Solid等,默认Solid
    //                     .widthSet(@(1)) //标示线粗细
    //                     .valueSet(@(20)) //所在位置
    //                     .zIndexSet(@(1)) //层叠,标示线在图表中显示的层叠级别，值越大，显示越向前
    //                     .labelSet(@{@"text":@"标示线1",@"x":@(0),@"style":@{@"color":@"#33bdfd"}})/*这里其实也可以像AAPlotLinesElement这样定义个对象来赋值（偷点懒直接用了字典，最会终转为js代码，可参考https://www.hcharts.cn/docs/basic-plotLines来写字典）*/
    //                     ,AAObject(AAPlotLinesElement)
    //                     .colorSet(@"#33BDFD")
    //                     .dashStyleSet(@"Dash")
    //                     .widthSet(@(1))
    //                     .valueSet(@(40))
    //                     .labelSet(@{@"text":@"标示线2",@"x":@(0),@"style":@{@"color":@"#33bdfd"}})
    //                     ,AAObject(AAPlotLinesElement)
    //                     .colorSet(@"#ADFF2F")
    //                     .dashStyleSet(@"Dash")
    //                     .widthSet(@(1))
    //                     .valueSet(@(60))
    //                     .labelSet(@{@"text":@"标示线3",@"x":@(0),@"style":@{@"color":@"#33bdfd"}})
    //                     ]
    //                   )
    //    //Y轴最大值
    //    .yMaxSet(@(100))
    //    //Y轴最小值
    //    .yMinSet(@(1))
    //    //是否允许Y轴坐标值小数
    //    .yAllowDecimalsSet(NO)
    //    //指定y轴坐标
    //    .yTickPositionsSet(@[@(0),@(25),@(50),@(75),@(100)])
    ;
    
    if ([chartType isEqualToString:AAChartTypeColumn]
        || [chartType isEqualToString:AAChartTypeBar]) {
        self.aaChartView.frame = CGRectMake(0, 60, chartViewWidth, chartViewHeight+40);
    } else if ([chartType isEqualToString:AAChartTypeArea]
               || [chartType isEqualToString:AAChartTypeAreaspline]) {
        _aaChartModel.symbolStyle = AAChartSymbolStyleTypeInnerBlank;//设置折线连接点样式为:内部白色
        _aaChartModel.gradientColorEnable = true;
    } else if ([chartType isEqualToString:AAChartTypeLine]
               || [chartType isEqualToString:AAChartTypeSpline]) {
        _aaChartModel.symbolStyle = AAChartSymbolStyleTypeBorderBlank;//设置折线连接点样式为:边缘白色
    }
    
    //是否起用渐变色功能
//    _aaChartModel.gradientColorEnable = YES;
    
    [self.aaChartView aa_drawChartWithChartModel:_aaChartModel];
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
-(void)AAChartViewDidFinishLoad {
    NSLog(@"😊😊😊 AAChartView content did finish load!!!");
}

- (void)configureTheSegmentedControls{
    
    NSArray *segmentedArray;
    NSArray *typeLabelNameArr;
    CGFloat segmentedControlFrameY;
    
    if (self.chartType == SecondeViewControllerChartTypeColumn
        ||self.chartType == SecondeViewControllerChartTypeBar) {
        segmentedArray = @[@[@"No stacking",@"Normal stacking",@"Percent stacking"],
                           ];
        typeLabelNameArr = @[@"Stacking type selection",];
        segmentedControlFrameY = 40;
    } else {
        segmentedArray = @[@[@"No stacking",@"Normal stacking",@"Percent stacking"],
                           @[@"Circle",@"Square",@"Diamond",@"Triangle",@"Triangle-down"]
                           ];
        typeLabelNameArr = @[@"Stacking type selection",@"Chart symbol type selection"];
        segmentedControlFrameY = 0;
    }
    
    for (int i=0; i<segmentedArray.count; i++) {
        
        UISegmentedControl * segmentedControl = [[UISegmentedControl alloc]initWithItems:segmentedArray[i]];
        segmentedControl.frame = CGRectMake(20, segmentedControlFrameY+40*i+(self.view.frame.size.height-145), self.view.frame.size.width-40, 20);
        segmentedControl.tintColor = [UIColor redColor];
        segmentedControl.selectedSegmentIndex = 0;
        segmentedControl.tag = i;
        [segmentedControl addTarget:self action:@selector(customsegmentedControlCellValueBeChanged:) forControlEvents:UIControlEventValueChanged];
        [self.view addSubview:segmentedControl];
        
        UILabel *typeLabel = [[UILabel alloc]init];
        typeLabel.frame =CGRectMake(20, segmentedControlFrameY+40*i+(self.view.frame.size.height-165), self.view.frame.size.width-40, 20);
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
            NSArray *symbolArr = @[AAChartSymbolTypeCircle,
                                   AAChartSymbolTypeSquare,
                                   AAChartSymbolTypeDiamond,
                                   AAChartSymbolTypeTriangle,
                                   AAChartSymbolTypeTriangle_down];
            self.aaChartModel.symbol = symbolArr[segmentedControl.selectedSegmentIndex];
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

- (void)configureTheSwitchs {
    NSArray *nameArr;
    if (self.chartType == SecondeViewControllerChartTypeColumn
        ||self.chartType == SecondeViewControllerChartTypeBar) {
        nameArr = @[@"xAxisReversed",@"yAxisReversed",@"xAxisInverted",@"Polarization",@"DataLabelShow",];
    } else {
        nameArr = @[@"xAxisReversed",@"yAxisReversed",@"xAxisInverted",@"Polarization",@"DataShow",@"HideMarker"];
    }
    CGFloat switchWidth = (self.view.frame.size.width-40)/nameArr.count;
    
    for (int i=0; i<nameArr.count; i++) {
        
        UISwitch * switchView = [[UISwitch alloc]init];
        switchView.frame = CGRectMake(switchWidth*i+20, self.view.frame.size.height-70, switchWidth, 20);
//        switchView.backgroundColor = [UIColor blueColor];
        switchView.onTintColor = [UIColor colorWithRed:0/255 green:191/255 blue:255/255 alpha:0.6];
        switchView.on = NO;
        switchView.tag = i;
        [switchView addTarget:self action:@selector(switchViewClicked:) forControlEvents:UIControlEventValueChanged];
        [self.view addSubview:switchView];
        
        UILabel *label = [[UILabel alloc]init];
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
            self.aaChartModel.markerRadius = switchView.on?@0:@5;
            break;
        default:
            break;
    }
    
    [self refreshTheChartView];
    
}
@end
