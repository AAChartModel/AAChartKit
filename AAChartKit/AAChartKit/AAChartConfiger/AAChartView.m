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
#if __IPHONE_OS_VERSION_MAX_ALLOWED >= __IPHONE_9_0
///WKWebView页面加载完成之后调用
- (void)webView:(WKWebView *)webView didFinishNavigation:(WKNavigation *)navigation{
    NSString *javaScriptStr = [NSString stringWithFormat:@"loadTheHighChartView('%@','%@');",self.json,[NSNumber numberWithFloat:self.frame.size.height]];
    [self  evaluateJavaScript:javaScriptStr completionHandler:^(id item, NSError * _Nullable error) {
        if (error) {
            //            [AAHelperTools warningView:@"加载JavaScript文件出现错误了"];
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
    NSString *javaScriptStr = [NSString stringWithFormat:@"loadTheHighChartView('%@');",self.json];
    [self  stringByEvaluatingJavaScriptFromString:javaScriptStr];
}
#endif

@end
