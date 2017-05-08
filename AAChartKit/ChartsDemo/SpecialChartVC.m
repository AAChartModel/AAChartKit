//
//  SpecialChartVC.m
//  AAChartKit
//
//  Created by An An on 17/3/23.
//  Copyright © 2017年 An An. All rights reserved.
//  source code ----*** https://github.com/AAChartModel/AAChartKit ***--- source code
//

#import "SpecialChartVC.h"
#import "AAChartView.h"

@interface SpecialChartVC ()
@property(nonatomic,strong)AAChartModel *chartModel;
@property(nonatomic,strong)AAChartView *chartView;
@end

@implementation SpecialChartVC

- (void)viewDidLoad {
    [super viewDidLoad];
    switch (self.ENUM_SpecialChartVC_chartType) {
        case 0:
            [self configTheChartView:AAChartTypePie];
            break;
            
        case 1:
            [self configTheChartView:AAChartTypeBubble];
            break;
            
        case 2:
            [self configTheChartView:AAChartTypePyramid];
            break;
            
        case 3:
            [self configTheChartView:AAChartTypeFunnel];
            break;
            
        default:
            break;
    }
    
    
}


-(void)configTheChartView:(NSString *)chartType{
    self.chartView = [[AAChartView alloc]init];
    self.view.backgroundColor = [UIColor whiteColor];
    self.chartView.frame = CGRectMake(0, 0, self.view.frame.size.width, self.view.frame.size.height);
    self.chartView.contentHeight = self.view.frame.size.height-60;
    [self.view addSubview:self.chartView];
    
    
    self.chartModel = [self configTheChartModel:chartType];
    
    [self.chartView aa_drawChartWithChartModel:_chartModel];
}


-(AAChartModel *)configTheChartModel:(NSString *)chartType{
    if ([chartType isEqualToString:AAChartTypePie]) {
        AAChartModel *chartModel= AAObject(AAChartModel)
        .chartTypeSet(AAChartTypePie)
        .titleSet(@"编程语言热度")
        .subtitleSet(@"虚拟数据")
        .dataLabelEnabledSet(true)//是否直接显示扇形图数据
        .yAxisTitleSet(@"摄氏度")
        .seriesSet(
                   @[AAObject(AASeriesElement)
                     .nameSet(@"语言热度占比")
                     .dataSet(@[
                                @[@"Java"  , @67],
                                @[@"Swift" , @44],
                                @[@"Python", @83],
                                @[@"OC"    , @11],
                                @[@"Ruby"  , @42],
                                @[@"PHP"   , @31],
                                @[@"Go"    , @63],
                                @[@"C"     , @24],
                                @[@"C#"    , @888],
                                @[@"C++"   , @66],
                                ]),
                     ]
                   )
        ;
        return chartModel;
        
    }else if ([chartType isEqualToString:AAChartTypeBubble]){
        AAChartModel *chartModel= AAObject(AAChartModel)
        .chartTypeSet(AAChartTypeBubble)
        .titleSet(@"编程语言热度")
        .subtitleSet(@"虚拟数据")
        .yAxisTitleSet(@"摄氏度")
        .seriesSet(
                   @[
                     AAObject(AASeriesElement)
                     .nameSet(@"2017")
                     .dataSet(
                              @[
                                @[@97, @36, @79],
                                @[@94, @74, @60],
                                @[@68, @76, @58],
                                @[@64, @87, @56],
                                @[@68, @27, @73],
                                @[@74, @99, @42],
                                @[@7,  @93, @87],
                                @[@51, @69, @40],
                                @[@38, @23, @33],
                                @[@57, @86, @31]
                                ]),
                     
                     AAObject(AASeriesElement)
                     .nameSet(@"2018")
                     .dataSet(
                              @[
                                @[@25, @10, @87],
                                @[@2, @75, @59],
                                @[@11, @54, @8],
                                @[@86, @55, @93],
                                @[@5, @3, @58],
                                @[@90, @63, @44],
                                @[@91, @33, @17],
                                @[@97, @3, @56],
                                @[@15, @67, @48],
                                @[@54, @25, @81]
                                ]),
                     
                     AAObject(AASeriesElement)
                     .nameSet(@"2019")
                     .dataSet(
                              @[
                                @[@47, @47, @21],
                                @[@20, @12, @4],
                                @[@6, @76, @91],
                                @[@38, @30, @60],
                                @[@57, @98, @64],
                                @[@61, @17, @80],
                                @[@83, @60, @13],
                                @[@67, @78, @75],
                                @[@64, @12, @10],
                                @[@30, @77, @82]
                                ]),
                     ]
                   )
        ;
        return chartModel;
        
    }else if ([chartType isEqualToString:AAChartTypePyramid]){
        AAChartModel *chartModel= AAObject(AAChartModel)
        .chartTypeSet(AAChartTypePyramid)
        .titleSet(@"编程语言热度")
        .subtitleSet(@"虚拟数据")
        .yAxisTitleSet(@"摄氏度")
        .seriesSet(
                   @[
                     AAObject(AASeriesElement)
                     .nameSet(@"2020")
                     .dataSet(@[
                                @[@"Swift",       @15654],
                                @[@"Objective-C", @4064],
                                @[@"JavaScript",  @1987],
                                @[@"GO",          @976],
                                @[@"Python",      @846]]),
                     ]
                   )
        ;
        return chartModel;
    }else if ([chartType isEqualToString:AAChartTypeFunnel]){
        AAChartModel *chartModel= AAObject(AAChartModel)
        .chartTypeSet(AAChartTypeFunnel)
        .titleSet(@"编程语言热度")
        .subtitleSet(@"虚拟数据")
        .yAxisTitleSet(@"摄氏度")
        .seriesSet(
                   @[
                     AAObject(AASeriesElement)
                     .nameSet(@"2020")
                     .dataSet(@[
                                @[@"Swift",       @15654],
                                @[@"Objective-C", @4064],
                                @[@"JavaScript",  @1987],
                                @[@"GO",          @976],
                                @[@"Python",      @846]]),
                     ]
                   )
        ;
        return chartModel;
    }
    else {
        return nil;
    }
}


@end
