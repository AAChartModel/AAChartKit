//
//  AAChartView.m
//  AAChartKit
//
//  Created by An An on 17/1/16.
//  Copyright © 2017年 An An. All rights reserved.
//

#import "AAChartView.h"
#import "AAJsonConverter.h"
#import "AAOptionsConstructor.h"
@implementation AAChartView
-(instancetype)initWithFrame:(CGRect)frame{
    self = [super initWithFrame:frame];
    if (self) {
        self.AASelfWebViewDelegate =self;
    }
    return self;
}
-(NSURLRequest *)getJavaScriptFileURLRequest{
    NSString *webPath = [[NSBundle mainBundle] pathForResource:@"AAChartView" ofType:@"html"];
    NSURL *webURL = [NSURL fileURLWithPath:webPath];
    NSURLRequest *URLRequest = [[NSURLRequest alloc] initWithURL:webURL];
    return URLRequest;
}
-(void)configTheOptionsWithChartModel:(AAChartModel *)chartModel{
    AAOptions *options =AAObject(AAOptions);
    options = [AAOptionsConstructor configColumnAndBarAndSoONChartOptionsWithAAChartModel:chartModel];
    self.json = [AAJsonConverter getPureOptionsString:options];
}
-(NSString *)configTheJavaScriptString{
    
    CGFloat chartViewContentWidth = self.contentWidth;;
     
    CGFloat charViewContentHeight;
    if (self.contentHeight ==0) {
        charViewContentHeight = self.frame.size.height;
    }else{
        charViewContentHeight = self.contentHeight;
    }
    
    NSString *javaScriptStr = [NSString stringWithFormat:@"loadTheHighChartView('%@','%@','%@');",self.json,[NSNumber numberWithFloat:chartViewContentWidth],[NSNumber numberWithFloat:charViewContentHeight]];
    return javaScriptStr;
}
#if __IPHONE_OS_VERSION_MAX_ALLOWED >= __IPHONE_9_0
///WKWebView页面加载完成之后调用
- (void)webView:(WKWebView *)webView didFinishNavigation:(WKNavigation *)navigation{
    NSString *javaScriptStr = [self configTheJavaScriptString];
    [self  evaluateJavaScript:javaScriptStr completionHandler:^(id item, NSError * _Nullable error) {
        if (error) {
            NSLog(@"%@",self.json);
            NSLog(@"%@",error);
            
        }
    }];
}
-(void)aa_drawChartWithChartModel:(AAChartModel *)chartModel{
    [self configTheOptionsWithChartModel:chartModel];
    NSURLRequest *URLRequest = [self getJavaScriptFileURLRequest];
    [self loadRequest:URLRequest];
    
}

#elif __IPHONE_OS_VERSION_MAX_ALLOWED < __IPHONE_9_0
-(void)aa_drawChartWithChartModel:(AAChartModel *)chartModel{
    [self configTheOptionsWithChartModel:chartModel];
    NSURLRequest *URLRequest = [self getJavaScriptFileURLRequest];
    [self loadRequest:URLRequest];
}
///UIWebView页面加载完成之后调用
- (void)webViewDidFinishLoad:(UIWebView *)webView {
    NSString *javaScriptStr =[self configTheJavaScriptString];
    [self  stringByEvaluatingJavaScriptFromString:javaScriptStr];
}
#endif

@end
