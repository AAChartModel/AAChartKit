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
@property(nonatomic,assign)CGFloat contentWidth;
@property(nonatomic,assign)CGFloat contentHeight;


-(void)aa_drawChartWithChartModel:(AAChartModel *)chartModel;
@end













































