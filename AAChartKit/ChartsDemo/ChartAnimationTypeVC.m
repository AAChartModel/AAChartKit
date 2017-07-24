//
//  ChartAnimationTypeVC.m
//  AAChartKit
//
//  Created by An An on 2017/7/6.
//  Copyright © 2017年 Danny boy. All rights reserved.
//

#import "ChartAnimationTypeVC.h"
#import "AAChartKit.h"
//当前屏幕的宽高
#define CurrentHeight ([UIScreen mainScreen].bounds.size.height)
#define CurrentWidth ([UIScreen mainScreen].bounds.size.width)

@interface ChartAnimationTypeVC () {
    UIButton *_lastClickedBtn;
}

@property (nonatomic, strong) AAChartModel *chartModel;
@property (nonatomic, strong) AAChartView  *chartView;

@end

@implementation ChartAnimationTypeVC

- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor = [UIColor whiteColor];
    [self configureTheButtons];
    [self configureTheChartView];
    
    
}

- (void)configureTheButtons {
    NSArray *chartAnimationTypeArr = @[
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
    
    CGRect myRect = CGRectMake(15, self.view.frame.size.height-220, 3, 20);
    
    float btnX = 15;
    float btnY = CGRectGetMaxY(myRect)+10;
    for (int i = 0; i < chartAnimationTypeArr.count; i++) {
        NSDictionary *fontDict = @{NSFontAttributeName:[UIFont systemFontOfSize:13]};
        CGRect frame_W = [chartAnimationTypeArr[i] boundingRectWithSize:CGSizeMake(MAXFLOAT, MAXFLOAT) options:NSStringDrawingUsesLineFragmentOrigin attributes:fontDict context:nil];
        if (btnX+frame_W.size.width+20>CurrentWidth-15) {
            btnX = 13;
            btnY += 40;
        }
        
        UIButton *btn = [[UIButton alloc]initWithFrame:CGRectMake(btnX, btnY, frame_W.size.width+20, 25)];
        [btn setTitle:chartAnimationTypeArr[i] forState:UIControlStateNormal];
        [btn setTitleColor:[UIColor darkTextColor] forState:UIControlStateNormal];
        btn.titleLabel.font = [UIFont systemFontOfSize:13];
        btn.layer.cornerRadius = 5;
        btn.layer.borderColor = [UIColor lightGrayColor].CGColor;
        btn.layer.borderWidth = 1;
        btn.tag = i;
        [btn addTarget:self action:@selector(myAnimationTypeButtonClicked:) forControlEvents:UIControlEventTouchUpInside];
        [self.view addSubview:btn];
        
        btnX = CGRectGetMaxX(btn.frame)+10;
    }
    
}


- (void)configureTheChartView  {
    self.chartView = [[AAChartView alloc]init];
    self.view.backgroundColor = [UIColor whiteColor];
    self.chartView.frame = CGRectMake(0, 60, self.view.frame.size.width, self.view.frame.size.height-220);
    self.chartView.contentHeight = self.view.frame.size.height-220;
    [self.view addSubview:self.chartView];
    self.chartModel= AAObject(AAChartModel)
    .chartTypeSet(AAChartTypeBar)
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

- (void)myAnimationTypeButtonClicked:(UIButton *)sender {
    self.chartModel.animationType = sender.tag;
    [self.chartView aa_refreshChartWithChartModel:self.chartModel];
    _lastClickedBtn.layer.borderColor = [UIColor lightGrayColor].CGColor;
    _lastClickedBtn.backgroundColor = [UIColor whiteColor];
    [_lastClickedBtn setTitleColor:[UIColor darkTextColor] forState:UIControlStateNormal];
    sender.layer.borderColor = [[UIColor blueColor] CGColor];
    sender.backgroundColor = [UIColor blueColor];
    [sender setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
    _lastClickedBtn = sender;
    
}



@end
