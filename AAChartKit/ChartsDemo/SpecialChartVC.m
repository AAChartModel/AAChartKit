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
    switch (self.SpecialChartVCChartType) {
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
        case 4:
            [self configTheChartView:AAChartTypeColumnrange];
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
    }else if ([chartType isEqualToString:AAChartTypeColumnrange]){
        AAChartModel *chartModel= AAObject(AAChartModel)
        .chartTypeSet(AAChartTypeFunnel)
        .titleSet(@"城市气温指数")
        .subtitleSet(@"虚拟数据")
        .yAxisTitleSet(@"摄氏度")
        .categoriesSet(@[@"一月", @"二月", @"三月", @"四月", @"五月", @"六月", @"七月", @"八月", @"九月", @"十月", @"十一月", @"十二月"])
        .dataLabelEnabledSet(true)
        .seriesSet(@[
                     AAObject(AASeriesElement)
                     .typeSet(AAChartTypeColumnrange)
                     .nameSet(@"温度")
                     .dataSet(@[
                                @[@-9.7, @9.4],
                                @[@-8.7, @6.5],
                                @[@-3.5, @9.4],
                                @[@-1.4, @19.9],
                                @[@0.0, @22.6],
                                @[@2.9, @29.5],
                                @[@9.2, @30.7],
                                @[@7.3, @26.5],
                                @[@4.4, @18.0],
                                @[@-3.1, @11.4],
                                @[@-5.2, @10.4],
                                @[@-13.5, @9.8]
                                ]),
                     
                     AAObject(AASeriesElement)
                     .typeSet(AAChartTypeSpline)
                     .nameSet(@"东京")
                     .dataSet(@[@7.0, @6.9, @9.5, @14.5, @18.2, @21.5, @25.2, @26.5, @23.3, @18.3, @13.9, @9.6]),
                     
                     AAObject(AASeriesElement)
                     .typeSet(AAChartTypeSpline)
                     .nameSet(@"纽约")
                     .dataSet(@[@-0.2, @0.8, @5.7, @11.3, @17.0, @22.0, @24.8, @24.1, @20.1, @14.1, @8.6, @2.5]),
                     
                     AAObject(AASeriesElement)
                     .typeSet(AAChartTypeSpline)
                     .nameSet(@"柏林")
                     .dataSet(@[@-0.9, @0.6, @3.5, @8.4, @13.5, @17.0, @18.6, @17.9, @14.3, @9.0, @3.9, @1.0]),
                     
                     AAObject(AASeriesElement)
                     .typeSet(AAChartTypeSpline)
                     .nameSet(@"伦敦")
                     .dataSet(@[@3.9, @4.2, @5.7, @8.5, @11.9, @15.2, @17.0, @16.6, @14.2, @10.3, @6.6, @4.8]),
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
