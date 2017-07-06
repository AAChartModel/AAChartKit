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

@implementation AAChartView {
    NSString *_optionJson;
}

- (instancetype)initWithFrame:(CGRect)frame {
    self = [super initWithFrame:frame];
    if (self) {
        self.AASelfWebViewDelegate =self;
        self.backgroundColor = [UIColor whiteColor];
    }
    return self;
}

- (NSURLRequest *)getJavaScriptFileURLRequest {
    NSString *webPath = [[NSBundle mainBundle] pathForResource:@"AAChartView" ofType:@"html"];
    NSURL *webURL = [NSURL fileURLWithPath:webPath];
    NSURLRequest *URLRequest = [[NSURLRequest alloc] initWithURL:webURL];
    return URLRequest;
}

- (void)configTheOptionsWithChartModel:(AAChartModel *)chartModel {
    AAOptions *options =AAObject(AAOptions);
    options = [AAOptionsConstructor configureChartOptionsWithAAChartModel:chartModel];
    _optionJson = [AAJsonConverter getPureOptionsString:options];
}

- (NSString *)configTheJavaScriptString {
    CGFloat chartViewContentWidth = self.contentWidth;
     
    CGFloat chartViewContentHeight;
    if (self.contentHeight ==0) {
        chartViewContentHeight = self.frame.size.height;
    }else{
        chartViewContentHeight = self.contentHeight;
    }
    
    NSString *javaScriptStr = [NSString stringWithFormat:@"loadTheHighChartView('%@','%@','%@')",_optionJson,[NSNumber numberWithFloat:chartViewContentWidth],[NSNumber numberWithFloat:chartViewContentHeight]];
    return javaScriptStr;
}

- (void)aa_drawChartWithChartModel:(AAChartModel *)chartModel {
    [self configTheOptionsWithChartModel:chartModel];
    NSURLRequest *URLRequest = [self getJavaScriptFileURLRequest];
    [self loadRequest:URLRequest];
    
}

- (void)aa_refreshChartWithChartModel:(AAChartModel *)chartModel {
    [self configTheOptionsWithChartModel:chartModel];
    [self drawChart];
}

- (void)printTheErrorMessageWithError:(NSError *)error {
    if (error) {
        NSLog(@"%@",error);
    }
}

#if __IPHONE_OS_VERSION_MAX_ALLOWED >= __IPHONE_9_0
///WKWebView页面加载完成之后调用
- (void)webView:(WKWebView *)webView didFinishNavigation:(WKNavigation *)navigation {
    [self drawChart];
    [self.delegate AAChartViewDidFinishLoad];
}

- (void)drawChart {
    NSString *javaScriptStr = [self configTheJavaScriptString];
    [self  evaluateJavaScript:javaScriptStr completionHandler:^(id item, NSError * _Nullable error) {
        [self printTheErrorMessageWithError:error];
    }];
}

- (void)aa_onlyRefreshTheChartDataWithChartModel:(AAChartModel *)chartModel {
    NSString *seriesJsonStr=[AAJsonConverter getPureOptionsString:chartModel];
    NSString *javaScriptStr = [NSString stringWithFormat:@"onlyRefreshTheChartDataWithSeries('%@')",seriesJsonStr];
    [self  evaluateJavaScript:javaScriptStr completionHandler:^(id item, NSError * _Nullable error) {
        [self printTheErrorMessageWithError:error];
    }];
}

#elif
///UIWebView页面加载完成之后调用
- (void)webViewDidFinishLoad:(UIWebView *)webView {
    [self drawChart];
    [self.delegate AAChartViewDidFinishLoad];
}

- (void)webView:(UIWebView *)webView didFailLoadWithError:(nullable NSError *)error {
    [self printTheErrorMessageWithError:error];
}

- (void)drawChart {
    NSString *javaScriptStr =[self configTheJavaScriptString];
    [self  stringByEvaluatingJavaScriptFromString:javaScriptStr];
}

- (void)aa_onlyRefreshTheChartDataWithChartModel:(AAChartModel *)chartModel {
    NSString *seriesJsonStr=[AAJsonConverter getPureOptionsString:chartModel];
    NSString *javaScriptStr = [NSString stringWithFormat:@"onlyRefreshTheChartDataWithSeries('%@')",seriesJsonStr];
    [self  stringByEvaluatingJavaScriptFromString:javaScriptStr];

}

#endif

@end
