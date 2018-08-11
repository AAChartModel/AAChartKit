
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

#import "ShowManyChartViewVC.h"
#import "AAChartView.h"
@interface ShowManyChartViewVC ()

@end

@implementation ShowManyChartViewVC

- (void)viewDidLoad {
    [super viewDidLoad];
    self.title = @"同时显示多个 AAChartView";
    self.view.backgroundColor = [UIColor whiteColor];
    
    [self setUpTheAAChartViewOne];
    [self setUpTheAAChartViewTwo];
 
}

//配置第一个 AAChartView
- (void)setUpTheAAChartViewOne {
    CGFloat chartViewWidth  = self.view.frame.size.width;
    CGFloat screenHeight = self.view.frame.size.height;
    
    AAChartView *aaChartView = [[AAChartView alloc]initWithFrame:CGRectMake(0, 60, chartViewWidth, screenHeight/2)];
    aaChartView.scrollEnabled = NO;
    [self.view addSubview:aaChartView];

    AAChartModel *aaChartModel= AAObject(AAChartModel)
    .chartTypeSet(AAChartTypeColumn)
    .titleSet(@"X轴文字垂直显示")
    .subtitleSet(@"")
    .categoriesSet(@[@"孤<br>岛<br>危<br>机",
                     @"使<br>命<br>召<br>唤",
                     @"荣<br>誉<br>勋<br>章",
                     @"狙<br>击<br>精<br>英",
                     @"神<br>秘<br>海<br>域",
                     @"最<br>后<br>生<br>还<br>者",
                     @"巫<br>师<br>3<br>狂<br>猎",
                     @"对<br>马<br>之<br>魂",
                     @"蝙<br>蝠<br>侠<br>之<br>阿<br>甘<br>骑<br>士",
                     @"地<br>狱<br>边<br>境",
                     @"闪<br>客",
                     @"忍<br>者<br>之<br>印"])
    .yAxisTitleSet(@"")
    .tooltipEnabledSet(false)
    .borderRadiusSet(@3)
    .seriesSet(@[
                 AAObject(AASeriesElement)
                 .nameSet(@"2017")
                 .dataSet(@[@45,@88,@49,@43,@65,@56,@47,@28,@49,@44,@89,@55])
                 .allowPointSelectSet(YES)
                 ,
                 ]
               );
        
    [aaChartView aa_drawChartWithChartModel:aaChartModel];
    
}

//配置第二个 AAChartView
- (void)setUpTheAAChartViewTwo {
    CGFloat chartViewWidth  = self.view.frame.size.width;
    CGFloat screenHeight = self.view.frame.size.height;
    
    AAChartView *aaChartView2 = [[AAChartView alloc]initWithFrame:CGRectMake(0, screenHeight/2+60, chartViewWidth, screenHeight/2-60)];
    aaChartView2.scrollEnabled = NO;
    [self.view addSubview:aaChartView2];
    
    AAChartModel *aaChartModel2= AAObject(AAChartModel)
    .chartTypeSet(AAChartTypeLine)
    .titleSet(@"")
    .subtitleSet(@"")
    .categoriesSet(@[@"Java",@"Swift",@"Python",@"Ruby", @"PHP",@"Go",@"C",@"C#",@"C++",@"Perl",@"R",@"MATLAB",@"SQL"])
    .yAxisTitleSet(@"")
    .symbolStyleSet(AAChartSymbolStyleTypeBorderBlank)
    .markerRadiusSet(@6)
    .xAxisCrosshairWidthSet(@1.5)
    .xAxisCrosshairColorSet(@"#ff0000")
    .xAxisCrosshairDashStyleTypeSet(AALineDashSyleTypeDashDot)
    .yAxisCrosshairWidthSet(@1.5)
    .yAxisCrosshairColorSet(@"#ff0000")
    .yAxisCrosshairDashStyleTypeSet(AALineDashSyleTypeLongDashDot)
    .seriesSet(@[
                 AAObject(AASeriesElement)
                 .nameSet(@"2018")
                 .dataSet(@[@31,@22,@33,@54,@35,@36,@27,@38,@39,@54,@41,@29]),
                 ]
               );
    [aaChartView2 aa_drawChartWithChartModel:aaChartModel2];
}



@end
