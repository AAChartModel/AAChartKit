//
//  AAChartView.h
//  AAChartKit
//
//  Created by An An on 17/1/16.
//  Copyright © 2017年 An An. All rights reserved.
//
#import "AAChartModel.h"
#import "AAOptions.h"

@interface AAChartView : AAWebView<AAWebViewDelegate>
@property(nonatomic,copy)NSString *json;
@property(nonatomic,strong)NSDictionary *optionsDic;

@property(nonatomic,assign)CGFloat contentWidth;//content width of AAChartView
@property(nonatomic,assign)CGFloat contentHeight;//content height of AAChartView
-(void)aa_drawChartWithChartModel:(AAChartModel *)chartModel;//function of drawing chart view
-(void)aa_refreshChartWithChartModel:(AAChartModel *)chartModel;//function of refreshing chart view
@end













































