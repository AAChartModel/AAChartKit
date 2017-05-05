//
//  AAChartView.h
//  AAChartKit
//
//  Created by An An on 17/1/16.
//  Copyright © 2017年 An An. All rights reserved.
//  source code ----*** https://github.com/AAChartModel/AAChartKit ***--- source code
//
#import "AAChartModel.h"
#import "AAOptions.h"

#if __IPHONE_OS_VERSION_MAX_ALLOWED >= __IPHONE_9_0
#import <WebKit/WebKit.h>
#define AAWebView WKWebView
#define AAWebViewDelegate WKNavigationDelegate
#define AASelfWebViewDelegate navigationDelegate
#elif
#import <UIKit/UIKit.h>
#define AAWebView UIWebView
#define AAWebViewDelegate UIWebViewDelegate
#define AASelfWebViewDelegate delegate
#endif

@interface AAChartView : AAWebView<AAWebViewDelegate>
@property(nonatomic,copy)NSString *json;
@property(nonatomic,strong)NSDictionary *optionsDic;

@property(nonatomic,assign)CGFloat contentWidth;//content width of AAChartView
@property(nonatomic,assign)CGFloat contentHeight;//content height of AAChartView
-(void)aa_drawChartWithChartModel:(AAChartModel *)chartModel;//function of drawing chart view
-(void)aa_refreshChartWithChartModel:(AAChartModel *)chartModel;//function of refreshing chart view
@end













































