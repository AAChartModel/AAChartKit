//
//  AAChartView.m
//  AAChartKit
//
//  Created by An An on 17/1/16.
//  Copyright © 2017年 An An. All rights reserved.
//  source code ----*** https://github.com/AAChartModel/AAChartKit ***--- source code
//

/*
 
 * -------------------------------------------------------------------------------
 *
 * ❀❀❀   WARM TIPS!!!   ❀❀❀
 *
 * Please contact me on GitHub,if there are any problems encountered in use.
 * GitHub Issues : https://github.com/AAChartModel/AAChartKit/issues
 * ------------------------------------------------------------------------------
 * And if you want to contribute for this project, please contact me as well
 * GitHub        : https://github.com/AAChartModel
 * StackOverflow : https://stackoverflow.com/users/7842508/codeforu
 * JianShu       : http://www.jianshu.com/u/f1e6753d4254
 * SegmentFault  : https://segmentfault.com/u/huanghunbieguan
 *
 * -------------------------------------------------------------------------------
 
 */

#import "AAChartView.h"
#import "AAJsonConverter.h"
#import "AAOptionsConstructor.h"
#import <WebKit/WebKit.h>

/**
 *  Get the system version number
 */
#define AASYSTEM_VERSION [[[UIDevice currentDevice] systemVersion] floatValue]
/**
 *  The console output log
 */
#ifdef DEBUG // Debug status, open the LOG function
#define AADetailLog(fmt, ...) NSLog((@"-------> %@ [Line %d] \n"fmt "\n\n"), [[NSString stringWithFormat:@"%s",__FILE__] lastPathComponent], __LINE__, ##__VA_ARGS__);
#else // Release status, turn off the LOG function
#define AADetailLog(...)
#endif

@interface AAChartView()<WKNavigationDelegate,UIWebViewDelegate> {
    UIWebView *_uiWebView;
    WKWebView *_wkWebView;
    NSString  *_optionJson;
}
@end

@implementation AAChartView

- (instancetype)initWithFrame:(CGRect)frame {
    self = [super initWithFrame:frame];
    if (self) {
        self.backgroundColor = [UIColor whiteColor];
        [self setUpBasicWebView];
    }
    return self;
}

- (void)setUpBasicWebView {
    if (AASYSTEM_VERSION >= 9.0) {
        _wkWebView = [[WKWebView alloc] init];
        _wkWebView.frame = CGRectMake(0, 0, self.frame.size.width, self.frame.size.height);
        _wkWebView.navigationDelegate = self;
        _wkWebView.backgroundColor = [UIColor whiteColor];
//        _wkWebView.scrollView.bounces = NO;
        [self addSubview:_wkWebView];
    } else {
        _uiWebView = [[UIWebView alloc] init];
        _uiWebView.frame = CGRectMake(0, 0, self.frame.size.width, self.frame.size.height);
        _uiWebView.delegate = self;
        _uiWebView.backgroundColor = [UIColor whiteColor];
//        _uiWebView.scrollView.bounces = NO;
        [self addSubview:_uiWebView];
    }
}

- (NSURLRequest *)getJavaScriptFileURLRequest {
    NSString *webPath = [[NSBundle mainBundle] pathForResource:@"AAChartView" ofType:@"html"];
    NSURL *webURL = [NSURL fileURLWithPath:webPath];
    NSURLRequest *URLRequest = [[NSURLRequest alloc] initWithURL:webURL];
    return URLRequest;
}

- (void)configureTheOptionsJsonStringWithAAOptions:(AAOptions *)options {
    _optionJson = [AAJsonConverter getPureOptionsString:options];
}

- (NSString *)configTheJavaScriptString {
    CGFloat chartViewContentWidth = self.contentWidth;
    CGFloat chartViewContentHeight = self.contentHeight == 0?self.frame.size.height:self.contentHeight;
    NSString *javaScriptStr = [NSString stringWithFormat:@"loadTheHighChartView('%@','%@','%@')",_optionJson,[NSNumber numberWithFloat:chartViewContentWidth],[NSNumber numberWithFloat:chartViewContentHeight]];
    return javaScriptStr;
}

//***********************CONFIGURE THE CHART VIEW CONTENT WITH `AACHARTMODEL`***********************//
//
- (void)aa_drawChartWithChartModel:(AAChartModel *)chartModel {
    AAOptions *options = [AAOptionsConstructor configureChartOptionsWithAAChartModel:chartModel];
    [self aa_drawChartWithOptions:options];
}

- (void)aa_refreshChartWithChartModel:(AAChartModel *)chartModel {
     AAOptions *options = [AAOptionsConstructor configureChartOptionsWithAAChartModel:chartModel];
    [self aa_refreshChartWithOptions:options];
}

- (void)aa_onlyRefreshTheChartDataWithChartModelSeries:(NSArray<NSDictionary *> *)series {
    [self aa_onlyRefreshTheChartDataWithOptionsSeries:series];
}
//
//***********************CONFIGURE THE CHART VIEW CONTENT WITH `AACHARTMODEL`***********************//



//=======================CONFIGURE THE CHART VIEW CONTENT WITH `AAOPTIONS`=======================//
//
- (void)aa_drawChartWithOptions:(AAOptions *)options {
    [self configureTheOptionsJsonStringWithAAOptions:options];
    NSURLRequest *URLRequest = [self getJavaScriptFileURLRequest];
    if (AASYSTEM_VERSION >= 9.0) {
        [_wkWebView loadRequest:URLRequest];
    } else {
        [_uiWebView loadRequest:URLRequest];
    }
}

- (void)aa_refreshChartWithOptions:(AAOptions *)options {
    [self configureTheOptionsJsonStringWithAAOptions:options];
    [self drawChart];
}

- (void)aa_onlyRefreshTheChartDataWithOptionsSeries:(NSArray<NSDictionary *> *)series {
    NSString *seriesJsonStr=[AAJsonConverter getPureSeriesString:series];
    NSString *javaScriptStr = [NSString stringWithFormat:@"onlyRefreshTheChartDataWithSeries('%@')",seriesJsonStr];
    [self evaluateJavaScriptWithFunctionNameString:javaScriptStr];
}
//
//=======================CONFIGURE THE CHART VIEW CONTENT WITH `AAOPTIONS`=======================//

- (void)drawChart {
    NSString *javaScriptStr = [self configTheJavaScriptString];
    [self evaluateJavaScriptWithFunctionNameString:javaScriptStr];
}

///WKWebView did finish load
- (void)webView:(WKWebView *)webView didFinishNavigation:(WKNavigation *)navigation {
    [self drawChart];
    [self.delegate AAChartViewDidFinishLoad];
}

//UIWebView did finish load
- (void)webViewDidFinishLoad:(UIWebView *)webView {
    [self drawChart];
    [self.delegate AAChartViewDidFinishLoad];
}

- (void)aa_showTheSeriesElementContentWithSeriesElementIndex:(NSInteger)elementIndex {
    NSString *javaScriptStr = [NSString stringWithFormat:@"showTheSeriesElementContentWithIndex(%ld)",(long)elementIndex];
    [self evaluateJavaScriptWithFunctionNameString:javaScriptStr];
}

- (void)evaluateJavaScriptWithFunctionNameString:(NSString *)funcitonNameStr {
    if (AASYSTEM_VERSION >= 9.0) {
        [_wkWebView  evaluateJavaScript:funcitonNameStr completionHandler:^(id item, NSError * _Nullable error) {
            if (error) {
                AADetailLog(@"💀💀💀WARNING!!!!! THERE ARE SOME ERROR INFOMATION_______%@",error);
            }
        }];
    } else {
        [_uiWebView  stringByEvaluatingJavaScriptFromString:funcitonNameStr];
    }
}

#pragma mark -- setter method
- (void)setContentWidth:(CGFloat)contentWidth {
    _contentWidth = contentWidth;
    NSString *javaScriptStr = [NSString stringWithFormat:@"setTheChartViewContentWidth(%f)",_contentWidth];
    [self evaluateJavaScriptWithFunctionNameString:javaScriptStr];
}

- (void)setContentHeight:(CGFloat)contentHeight {
    _contentHeight = contentHeight;
    NSString *javaScriptStr = [NSString stringWithFormat:@"setTheChartViewContentHeight(%f)",_contentHeight];
    [self evaluateJavaScriptWithFunctionNameString:javaScriptStr];
}

- (void)setChartSeriesHidden:(BOOL)chartSeriesHidden {
    _chartSeriesHidden = chartSeriesHidden;
    NSString *javaScriptStr = [NSString stringWithFormat:@"setChartSeriesHidden(%d)",_chartSeriesHidden];
    [self evaluateJavaScriptWithFunctionNameString:javaScriptStr];
}

- (void)setIsClearBackgroundColor:(BOOL)isClearBackgroundColor {
    _isClearBackgroundColor = isClearBackgroundColor;
    if (_isClearBackgroundColor == YES) {
        self.backgroundColor = [UIColor clearColor];
        if (AASYSTEM_VERSION >= 9.0) {
            [_wkWebView setBackgroundColor:[UIColor clearColor]];
            [_wkWebView setOpaque:NO];
        } else {
            [_uiWebView setBackgroundColor:[UIColor clearColor]];
            [_uiWebView setOpaque:NO];
        }
    }
}
@end
