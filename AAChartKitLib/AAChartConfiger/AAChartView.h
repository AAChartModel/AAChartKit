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

@protocol AAChartViewDidFinishLoadDelegate<NSObject>

/**
 The delegate method of chart view finish loading
 */
- (void)AAChartViewDidFinishLoad;

@end

@interface AAChartView : AAWebView<AAWebViewDelegate>

@property(nonatomic,weak)id<AAChartViewDidFinishLoadDelegate>delegate;

/**
 Content width of AAChartView
 */
@property(nonatomic,assign)CGFloat contentWidth;

/**
 Content height of AAChartView
 */
@property(nonatomic,assign)CGFloat contentHeight;


/**
 Function of drawing chart view

 @param chartModel The instance object of chart model
 */
- (void)aa_drawChartWithChartModel:(AAChartModel *)chartModel;

/**
 Function of refreshing whole chart view content

 @param chartModel The instance object of chart model
 */
- (void)aa_refreshChartWithChartModel:(AAChartModel *)chartModel;

/**
 Function of only refresh the chart data

 @param chartModel  The instance object of chart model
 */
- (void)aa_onlyRefreshTheChartDataWithChartModel:(AAChartModel *)chartModel;

@end

