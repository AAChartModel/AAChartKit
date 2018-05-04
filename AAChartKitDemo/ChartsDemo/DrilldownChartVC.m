//
//  DrilldownChartVC.m
//  AAChartKit
//
//  Created by An An on 2017/9/4.
//  Copyright © 2017年 An An. All rights reserved.
//

#import "DrilldownChartVC.h"
#import "AAChartKit.h"

@interface DrilldownChartVC ()
    
    @property (nonatomic, strong) AAChartModel *chartModel;
    @property (nonatomic, strong) AAChartView  *chartView;
    
    @end

@implementation DrilldownChartVC
    
- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor = [UIColor whiteColor];
    
    
    UILabel *label = [[UILabel alloc]init];
    label.frame = CGRectMake(0, 0, 55, 66);
    [self.view addSubview:label];
    
    
    NSArray *series = @[@{
                            @"name":@"浏览器品牌",
                            @"colorByPoint": @YES,
                            @"data": @[@{
                                           @"name":@"Microsoft Internet Explorer",
                                           @"y": @56.33,
                                           @"drilldown":@"Microsoft Internet Explorer"
                                           }, @{
                                           @"name":@"Chrome",
                                           @"y": @24.03,
                                           @"drilldown":@"Chrome"
                                           }, @{
                                           @"name":@"Firefox",
                                           @"y": @10.38,
                                           @"drilldown":@"Firefox"
                                           }, @{
                                           @"name":@"Safari",
                                           @"y": @4.77,
                                           @"drilldown":@"Safari"
                                           }, @{
                                           @"name":@"Opera",
                                           @"y": @0.91,
                                           @"drilldown":@"Opera"
                                           }, @{
                                           @"name":@"Proprietary or Undetectable",
                                           @"y": @0.2,
                                           @"drilldown":@""
                                           }]
                            }];
    
    
    NSDictionary *drilldown = @{
                                @"series": @[@{
                                                 @"name": @"Microsoft Internet Explorer",
                                                 @"id": @"Microsoft Internet Explorer",
                                                 @"data": @[
                                                         @[
                                                             @"v11.0",
                                                             @24.13
                                                             ],
                                                         @[
                                                             @"v8.0",
                                                             @17.2
                                                             ],
                                                         @[
                                                             @"v9.0",
                                                             @8.11
                                                             ],
                                                         @[
                                                             @"v10.0",
                                                             @5.33
                                                             ],
                                                         @[
                                                             @"v6.0",
                                                             @1.06
                                                             ],
                                                         @[
                                                             @"v7.0",
                                                             @0.5
                                                             ]
                                                         ]
                                                 }, @{
                                                 @"name": @"Chrome",
                                                 @"id": @"Chrome",
                                                 @"data": @[
                                                         @[
                                                             @"v40.0",
                                                             @5
                                                             ],
                                                         @[
                                                             @"v41.0",
                                                             @4.32
                                                             ],
                                                         @[
                                                             @"v42.0",
                                                             @3.68
                                                             ],
                                                         @[
                                                             @"v39.0",
                                                             @2.96
                                                             ],
                                                         @[
                                                             @"v36.0",
                                                             @2.53
                                                             ],
                                                         @[
                                                             @"v43.0",
                                                             @1.45
                                                             ],
                                                         @[
                                                             @"v31.0",
                                                             @1.24
                                                             ],
                                                         @[
                                                             @"v35.0",
                                                             @0.85
                                                             ],
                                                         @[
                                                             @"v38.0",
                                                             @0.6
                                                             ],
                                                         @[
                                                             @"v32.0",
                                                             @0.55
                                                             ],
                                                         @[
                                                             @"v37.0",
                                                             @0.38
                                                             ],
                                                         @[
                                                             @"v33.0",
                                                             @0.19
                                                             ],
                                                         @[
                                                             @"v34.0",
                                                             @0.14
                                                             ],
                                                         @[
                                                             @"v30.0",
                                                             @0.14
                                                             ]
                                                         ]
                                                 }, @{
                                                 @"name": @"Firefox",
                                                 @"id": @"Firefox",
                                                 @"data": @[
                                                         @[
                                                             @"v35",
                                                             @2.76
                                                             ],
                                                         @[
                                                             @"v36",
                                                             @2.32
                                                             ],
                                                         @[
                                                             @"v37",
                                                             @2.31
                                                             ],
                                                         @[
                                                             @"v34",
                                                             @1.27
                                                             ],
                                                         @[
                                                             @"v38",
                                                             @1.02
                                                             ],
                                                         @[
                                                             @"v31",
                                                             @0.33
                                                             ],
                                                         @[
                                                             @"v33",
                                                             @0.22
                                                             ],
                                                         @[
                                                             @"v32",
                                                             @0.15
                                                             ]
                                                         ]
                                                 }, @{
                                                 @"name": @"Safari",
                                                 @"id": @"Safari",
                                                 @"data": @[
                                                         @[
                                                             @"v8.0",
                                                             @2.56
                                                             ],
                                                         @[
                                                             @"v7.1",
                                                             @0.77
                                                             ],
                                                         @[
                                                             @"v5.1",
                                                             @0.42
                                                             ],
                                                         @[
                                                             @"v5.0",
                                                             @0.3
                                                             ],
                                                         @[
                                                             @"v6.1",
                                                             @0.29
                                                             ],
                                                         @[
                                                             @"v7.0",
                                                             @0.26
                                                             ],
                                                         @[
                                                             @"v6.2",
                                                             @0.17
                                                             ]
                                                         ]
                                                 }, @{
                                                 @"name": @"Opera",
                                                 @"id": @"Opera",
                                                 @"data": @[
                                                         @[
                                                             @"v12.x",
                                                             @0.34
                                                             ],
                                                         @[
                                                             @"v28",
                                                             @0.24
                                                             ],
                                                         @[
                                                             @"v27",
                                                             @0.17
                                                             ],
                                                         @[
                                                             @"v29",
                                                             @0.16
                                                             ]
                                                         ]
                                                 }]
                                };
    
    
    NSDictionary *chart= @{
                           @"type": @"column"
                           };
    NSDictionary *title= @{
                           @"text": @"2015年1月-5月，各浏览器的市场份额"
                           };
    
    NSDictionary *xAxis= @{
                           @"type": @"category"
                           };
    
    AAOptions *options = AAObject(AAOptions);
    options.chart = (id)chart;
    options.title = (id)title;
    options.xAxis = (id)xAxis;
    options.series = series;
//    options.colors = @[@"#b5282a",@"#e7a701",@"#50c18d",@"#fd4800",@"#f1c6c5"];
    
    
    AAChartView *chartView =[[AAChartView alloc]initWithFrame:CGRectMake(0, 60, self.view.frame.size.width, self.view.frame.size.height)];
    chartView.contentHeight = chartView.frame.size.height-80;
    [self.view addSubview:chartView];
    [chartView aa_drawChartWithOptions:options];
    
    
}
    
    
    
    @end
