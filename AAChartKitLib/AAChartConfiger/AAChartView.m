//
//  AAChartView.m
//  AAChartKit
//
//  Created by An An on 17/1/16.
//  Copyright © 2017年 An An. All rights reserved.
//  source code ----*** https://github.com/AAChartModel/AAChartKit ***--- source code
//

#import "AAChartView.h"
#import "AAJsonConverter.h"
#import "AAOptionsConstructor.h"
#import <WebKit/WebKit.h>

/**
 *  获得系统版本号
 */
#define AASYSTEM_VERSION [[[UIDevice currentDevice] systemVersion] floatValue]
/**
 *  控制台日志输出
 */
#ifdef DEBUG // 调试状态, 打开LOG功能
#define AADetailLog(fmt, ...) NSLog((@"-------> %@ [Line %d] \n"fmt "\n\n"), [[NSString stringWithFormat:@"%s",__FILE__] lastPathComponent], __LINE__, ##__VA_ARGS__);
#else // 发布状态, 关闭LOG功能
#define AADetailLog(...)
#endif

@interface AAChartView()<WKNavigationDelegate,UIWebViewDelegate> {
    UIWebView *_uiWebView;
    WKWebView *_wkWebView;
}
@end

@implementation AAChartView {
    NSString *_optionJson;
}

- (instancetype)initWithFrame:(CGRect)frame {
    self = [super initWithFrame:frame];
    if (self) {
        self.backgroundColor = [UIColor whiteColor];
        [self setUpBasicWebView];
    }
    return self;
}

- (void)setUpBasicWebView {
    if (AASYSTEM_VERSION > 8.0) {
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

- (void)configTheOptionsJsonWithChartModel:(AAChartModel *)chartModel {
    AAOptions *options =AAObject(AAOptions);
    options = [AAOptionsConstructor configureChartOptionsWithAAChartModel:chartModel];
    _optionJson = [AAJsonConverter getPureOptionsString:options];
}

- (void)configTheOptionsJsonWithOptions:(AAOptions *)options {
    _optionJson = [AAJsonConverter getPureOptionsString:options];
}

- (NSString *)configTheJavaScriptString {
    CGFloat chartViewContentWidth = self.contentWidth;
    CGFloat chartViewContentHeight = self.contentHeight == 0?self.frame.size.height:self.contentHeight;
    NSString *javaScriptStr = [NSString stringWithFormat:@"loadTheHighChartView('%@','%@','%@')",_optionJson,[NSNumber numberWithFloat:chartViewContentWidth],[NSNumber numberWithFloat:chartViewContentHeight]];
    return javaScriptStr;
}

- (void)aa_drawChartWithChartModel:(AAChartModel *)chartModel {
    [self configTheOptionsJsonWithChartModel:chartModel];
    NSURLRequest *URLRequest = [self getJavaScriptFileURLRequest];
    if (AASYSTEM_VERSION > 8.0) {
        [_wkWebView loadRequest:URLRequest];
    } else {
        [_uiWebView loadRequest:URLRequest];
    }
}

- (void)aa_refreshChartWithChartModel:(AAChartModel *)chartModel {
    [self configTheOptionsJsonWithChartModel:chartModel];
    [self drawChart];
}

- (void)aa_onlyRefreshTheChartDataWithChartModelSeries:(NSArray<NSDictionary *> *)series {
        NSString *seriesJsonStr=[AAJsonConverter getPureSeriesString:series];
        NSString *javaScriptStr = [NSString stringWithFormat:@"onlyRefreshTheChartDataWithSeries('%@')",seriesJsonStr];
        [self evaluateJavaScriptWithFunctionNameString:javaScriptStr];
}

- (void)aa_drawChartWithOptions:(AAOptions *)options {
    [self configTheOptionsJsonWithOptions:options];
    NSURLRequest *URLRequest = [self getJavaScriptFileURLRequest];
    if (AASYSTEM_VERSION > 8.0) {
        [_wkWebView loadRequest:URLRequest];
    } else {
        [_uiWebView loadRequest:URLRequest];
    }
}

- (void)aa_refreshChartWithOptions:(AAOptions *)options {
    [self configTheOptionsJsonWithOptions:options];
    [self drawChart];
}

- (void)aa_onlyRefreshTheChartDataWithOptionsSeries:(NSArray<NSDictionary *> *)series {
    [self aa_onlyRefreshTheChartDataWithChartModelSeries:series];
}

- (void)drawChart {
    NSString *javaScriptStr = [self configTheJavaScriptString];
    [self evaluateJavaScriptWithFunctionNameString:javaScriptStr];
}

///WKWebView页面加载完成之后调用
- (void)webView:(WKWebView *)webView didFinishNavigation:(WKNavigation *)navigation {
    [self drawChart];
    [self.delegate AAChartViewDidFinishLoad];
}

- (void)webViewDidFinishLoad:(UIWebView *)webView {
    [self drawChart];
    [self.delegate AAChartViewDidFinishLoad];
}

- (void)setChartSeriesHidden:(BOOL)chartSeriesHidden {
    _chartSeriesHidden = chartSeriesHidden;
    NSString *javaScriptStr = [NSString stringWithFormat:@"chartSeriesContentHideOrShow(%d)",_chartSeriesHidden];
    [self evaluateJavaScriptWithFunctionNameString:javaScriptStr];
}

- (void)aa_showTheSeriesElementContentWithSeriesElementIndex:(NSInteger)elementIndex {
    NSString *javaScriptStr = [NSString stringWithFormat:@"showTheSeriesElementContentWithIndex(%ld)",(long)elementIndex];
    [self evaluateJavaScriptWithFunctionNameString:javaScriptStr];
}

- (void)evaluateJavaScriptWithFunctionNameString:(NSString *)funcitonNameStr {
    if (AASYSTEM_VERSION > 8.0) {
        [_wkWebView  evaluateJavaScript:funcitonNameStr completionHandler:^(id item, NSError * _Nullable error) {
            if (error) {
                AADetailLog(@"💀💀💀WARNING!!!!! THERE ARE SOME ERROR INFOMATION_______%@",error);
            }
        }];
    } else {
        [_uiWebView  stringByEvaluatingJavaScriptFromString:funcitonNameStr];
    }
}
@end
