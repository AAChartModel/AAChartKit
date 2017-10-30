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
 * GitHub Issues : https://github.com/AAChartModel/AAChartKit-Swift/issues
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
    
    [self configThesegmentedControl];
    [self configTheSwitch];
    
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
    
    self.aaChartView = [[AAChartView alloc]initWithFrame:CGRectMake(0, 60, self.view.frame.size.width, self.view.frame.size.height-220)];
    self.aaChartView.delegate = self;
    self.aaChartView.contentHeight = self.view.frame.size.height-250;
    [self.view addSubview:self.aaChartView];
    
//    //设置 AAChartView 的背景色是否为透明(解开注释查看设置背景色透明后的效果)
//    self.aaChartView.isClearBackgroundColor = YES;
//    self.view.backgroundColor = [UIColor blueColor];

    self.aaChartModel= AAObject(AAChartModel)
    .chartTypeSet(chartType)
    .titleSet(@"")
    .subtitleSet(@"")
    .categoriesSet(@[@"Java",@"Swift",@"Python",@"Ruby", @"PHP",@"Go",@"C",@"C#",@"C++",@"Perl",@"R",@"MATLAB",@"SQL"])
    .yAxisTitleSet(@"")
    .seriesSet(@[
                 AAObject(AASeriesElement)
                 .nameSet(@"2017")
                 .dataSet(@[@45,@88,@49,@43,@65,@56,@47,@28,@49,@44,@89,@55]),
                 
                 AAObject(AASeriesElement)
                 .nameSet(@"2018")
                 .dataSet(@[@31,@22,@33,@54,@35,@36,@27,@38,@39,@54,@41,@29]),
                 
                 AAObject(AASeriesElement)
                 .nameSet(@"2019")
                 .dataSet(@[@11,@12,@13,@14,@15,@16,@17,@18,@19,@33,@56,@39]),
                 
                 AAObject(AASeriesElement)
                 .nameSet(@"2020")
                 .dataSet(@[@21,@22,@24,@27,@25,@26,@37,@28,@49,@56,@31,@11]),
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
    
    if ([chartType isEqualToString:AAChartTypeLine]
        || [chartType isEqualToString:AAChartTypeSpline]) {
        _aaChartModel.symbolStyle = AAChartSymbolStyleTypeBorderBlank;//设置折线连接点样式为:边缘白色
    } else if ([chartType isEqualToString:AAChartTypeArea]
               || [chartType isEqualToString:AAChartTypeAreaspline]) {
        _aaChartModel.symbolStyle = AAChartSymbolStyleTypeInnerBlank;//设置折线连接点样式为:内部白色
    }
    
    //是否起用渐变色功能
//    _aaChartModel.gradientColorEnable = YES;
    
    [self.aaChartView aa_drawChartWithChartModel:_aaChartModel];
}

#pragma mark -- AAChartView delegate
-(void)AAChartViewDidFinishLoad {
    NSLog(@"😊😊😊图表视图已完成加载");
}

- (void)configThesegmentedControl{
    NSArray *segmentedArray = @[@[@"常规",@"堆叠",@"百分比堆叠"],
                                @[@"波点",@"方块",@"钻石",@"正三角",@"倒三角"]
                                ];
    
    NSArray *typeLabelNameArr = @[@"堆叠类型选择",@"折线连接点形状选择"];
    
    for (int i=0; i<segmentedArray.count; i++) {
        
        UISegmentedControl * segmentedControl = [[UISegmentedControl alloc]initWithItems:segmentedArray[i]];
        segmentedControl.frame = CGRectMake(20, 40*i+(self.view.frame.size.height-145), self.view.frame.size.width-40, 20);
        segmentedControl.selectedSegmentIndex = 0;
        segmentedControl.tag = i;
        [segmentedControl addTarget:self action:@selector(customsegmentedControlCellValueBeChanged:) forControlEvents:UIControlEventValueChanged];
        [self.view addSubview:segmentedControl];
        
        UILabel *typeLabel = [[UILabel alloc]init];
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
    [self.aaChartView aa_refreshChartWithChartModel:self.aaChartModel];
}

- (void)configTheSwitch {
    NSArray *nameArr = @[@"x轴翻转",@"y轴翻转",@"x 轴直立",@"辐射化图形",@"隐藏连接点",@"显示数字"];
    CGFloat switchWidth = (self.view.frame.size.width-40)/6;
    
    for (int i=0; i<nameArr.count; i++) {
        
        UISwitch * switchView = [[UISwitch alloc]init];
        switchView.frame = CGRectMake(switchWidth*i+20, self.view.frame.size.height-70, switchWidth, 20);
        switchView.on = NO;
        switchView.tag = i;
        [switchView addTarget:self action:@selector(switchViewClicked:) forControlEvents:UIControlEventValueChanged];
        [self.view addSubview:switchView];
        
        UILabel *label = [[UILabel alloc]init];
        label.textAlignment = NSTextAlignmentCenter;
        label.numberOfLines = 0;
        label.frame = CGRectMake(switchWidth*i+20,  self.view.frame.size.height-40, switchWidth, 40);
        label.text = nameArr[i];
        label.font = [UIFont systemFontOfSize:10.0f];
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
            self.aaChartModel.markerRadius = switchView.on?@0:@5;
            break;
        case 5:
            self.aaChartModel.dataLabelEnabled = switchView.on;
            break;
        default:
            break;
    }
    
    [self refreshTheChartView];
    
}
@end
