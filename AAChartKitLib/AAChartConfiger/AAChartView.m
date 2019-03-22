//
//  AAChartView.m
//  AAChartKit
//
//  Created by An An on 17/1/16.
//  Copyright © 2017年 An An. All rights reserved.
//*************** ...... SOURCE CODE ...... ***************
//***...................................................***
//*** https://github.com/AAChartModel/AAChartKit        ***
//*** https://github.com/AAChartModel/AAChartKit-Swift  ***
//***...................................................***
//*************** ...... SOURCE CODE ...... ***************

/*
 
 * -------------------------------------------------------------------------------
 *
 * 🌕 🌖 🌗 🌘  ❀❀❀   WARM TIPS!!!   ❀❀❀ 🌑 🌒 🌓 🌔
 *
 * Please contact me on GitHub,if there are any problems encountered in use.
 * GitHub Issues : https://github.com/AAChartModel/AAChartKit/issues
 * ------------------------------------------------------------------------------
 * And if you want to contribute for this project, please contact me as well
 * GitHub        : https://github.com/AAChartModel
 * StackOverflow : https://stackoverflow.com/users/7842508/codeforu
 * JianShu       : https://www.jianshu.com/u/f1e6753d4254
 * SegmentFault  : https://segmentfault.com/u/huanghunbieguan
 *
 * -------------------------------------------------------------------------------
 
 */

#import "AAChartView.h"
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

static NSString * const kUserContentMessageNameMouseOver = @"MouseOver";

@interface AAChartView()<WKUIDelegate, WKNavigationDelegate, UIWebViewDelegate, WKScriptMessageHandler> {
    UIWebView *_uiWebView;
    WKWebView *_wkWebView;
    NSString  *_optionJson;
}

@end

@implementation AAChartView

- (instancetype)initWithFrame:(CGRect)frame {
    self = [super initWithFrame:frame];
    if (self) {
        [self setUpBasicWebView];
    }
    return self;
}

- (instancetype)initWithCoder:(NSCoder *)aDecoder {
    self = [super initWithCoder:aDecoder];
    if (self) {
        [self setUpBasicWebView];
    }
    return self;
}

- (void)setUpBasicWebView {
    
    if (AASYSTEM_VERSION >= 9.0) {
        WKUserContentController *userContentController = [[WKUserContentController alloc] init];
        [userContentController addScriptMessageHandler:self name:kUserContentMessageNameMouseOver];
        WKWebViewConfiguration *configuration = [[WKWebViewConfiguration alloc] init];
        configuration.userContentController = userContentController;
        _wkWebView = [[WKWebView alloc] initWithFrame:CGRectZero configuration:configuration];
        _wkWebView.UIDelegate = self;
        _wkWebView.navigationDelegate = self;
        _wkWebView.backgroundColor = [UIColor whiteColor];
        [self addSubview:_wkWebView];
        _wkWebView.translatesAutoresizingMaskIntoConstraints = NO;
        [self addConstraints:[self configureTheConstraintArrayWithItem:_wkWebView toItem:self]];
    } else {
        _uiWebView = [[UIWebView alloc] init];
        _uiWebView.delegate = self;
        _uiWebView.backgroundColor = [UIColor whiteColor];
        [self addSubview:_uiWebView];
        _uiWebView.translatesAutoresizingMaskIntoConstraints = NO;
        [self addConstraints:[self configureTheConstraintArrayWithItem:_uiWebView toItem:self]];
    }
}

- (NSArray *)configureTheConstraintArrayWithItem:(UIView *)childView toItem:(UIView *)fatherView {
    return  @[[NSLayoutConstraint constraintWithItem:childView
                                           attribute:NSLayoutAttributeLeft
                                           relatedBy:NSLayoutRelationEqual
                                              toItem:fatherView
                                           attribute:NSLayoutAttributeLeft
                                          multiplier:1.0
                                            constant:0],
              [NSLayoutConstraint constraintWithItem:childView
                                           attribute:NSLayoutAttributeRight
                                           relatedBy:NSLayoutRelationEqual
                                              toItem:fatherView
                                           attribute:NSLayoutAttributeRight
                                          multiplier:1.0
                                            constant:0],
              [NSLayoutConstraint constraintWithItem:childView
                                           attribute:NSLayoutAttributeTop
                                           relatedBy:NSLayoutRelationEqual
                                              toItem:fatherView
                                           attribute:NSLayoutAttributeTop
                                          multiplier:1.0
                                            constant:0],
              [NSLayoutConstraint constraintWithItem:childView
                                           attribute:NSLayoutAttributeBottom
                                           relatedBy:NSLayoutRelationEqual
                                              toItem:fatherView
                                           attribute:NSLayoutAttributeBottom
                                          multiplier:1.0
                                            constant:0],
              
              ];
}

- (NSURLRequest *)getJavaScriptFileURLRequest {
    NSBundle *bundle = [NSBundle bundleForClass:[self class]];
    NSString *webPath = [bundle pathForResource:@"AAChartView"
                                         ofType:@"html"
                                    inDirectory:@"AAJSFiles.bundle"];
    NSURL *webURL = [NSURL fileURLWithPath:webPath];
    NSURLRequest *URLRequest = [[NSURLRequest alloc] initWithURL:webURL];
    return URLRequest;
}

- (void)configureTheOptionsJsonStringWithAAOptions:(AAOptions *)options {
    if (self.isClearBackgroundColor == YES) {
        options.chart.backgroundColor = @"rgba(0,0,0,0)";
    }
    _optionJson = [AAJsonConverter getPureOptionsString:options];
 
}

- (NSString *)configTheJavaScriptString {
    CGFloat chartViewContentWidth = self.contentWidth;
    CGFloat contentHeight = self.frame.size.height;
    CGFloat chartViewContentHeight = self.contentHeight == 0 ? contentHeight : self.contentHeight;
    NSString *javaScriptStr = [NSString stringWithFormat:@"loadTheHighChartView('%@','%@','%@')",
                               _optionJson,
                               [NSNumber numberWithFloat:chartViewContentWidth],
                               [NSNumber numberWithFloat:chartViewContentHeight-1]];
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
    if (!_optionJson) {
        [self configureTheOptionsJsonStringWithAAOptions:options];
        NSURLRequest *URLRequest = [self getJavaScriptFileURLRequest];
        if (AASYSTEM_VERSION >= 9.0) {
            [_wkWebView loadRequest:URLRequest];
        } else {
            [_uiWebView loadRequest:URLRequest];
        }
    } else {
        [self aa_refreshChartWithOptions:options];
    }
}

- (void)aa_refreshChartWithOptions:(AAOptions *)options {
    [self configureTheOptionsJsonStringWithAAOptions:options];
    [self drawChart];
}

- (void)aa_onlyRefreshTheChartDataWithOptionsSeries:(NSArray<NSDictionary *> *)series {
    NSString *seriesJsonStr = [AAJsonConverter getPureSeriesString:series];
    NSString *javaScriptStr = [NSString stringWithFormat:@"onlyRefreshTheChartDataWithSeries('%@')",seriesJsonStr];
    [self evaluateJavaScriptWithFunctionNameString:javaScriptStr];
}
//
//=======================CONFIGURE THE CHART VIEW CONTENT WITH `AAOPTIONS`=======================//

- (void)webView:(WKWebView *)webView runJavaScriptAlertPanelWithMessage:(NSString *)message initiatedByFrame:(WKFrameInfo *)frame completionHandler:(void (^)(void))completionHandler {
    UIAlertController *alertController = [UIAlertController alertControllerWithTitle:@"FBI WARNING"
                                                                             message:message
                                                                      preferredStyle:UIAlertControllerStyleAlert];
    [alertController addAction:([UIAlertAction actionWithTitle:@"Okay"
                                                         style:UIAlertActionStyleDefault
                                                       handler:^(UIAlertAction * _Nonnull action) {
        completionHandler();
    }])];
    UIViewController *rootVC = [UIApplication sharedApplication].keyWindow.rootViewController;
    [rootVC presentViewController:alertController
                         animated:YES
                       completion:nil];
}
    
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

- (void)aa_hideTheSeriesElementContentWithSeriesElementIndex:(NSInteger)elementIndex {
    NSString *javaScriptStr = [NSString stringWithFormat:@"hideTheSeriesElementContentWithIndex(%ld)",(long)elementIndex];
    [self evaluateJavaScriptWithFunctionNameString:javaScriptStr];
}

- (void)evaluateJavaScriptWithFunctionNameString:(NSString *)functionNameStr {
    if (AASYSTEM_VERSION >= 9.0) {
        [_wkWebView  evaluateJavaScript:functionNameStr completionHandler:^(id item, NSError * _Nullable error) {
            if (error) {
                NSMutableDictionary *errorDic = [NSMutableDictionary dictionary];
                [errorDic setValue:error.domain forKey:@"domain"];
                [errorDic setValue:@(error.code) forKey:@"code"];
                [errorDic setValue:error.userInfo forKey:@"userInfo"];
                AADetailLog(@"☠️☠️💀☠️☠️!!!!!WARNING!!!!! THERE ARE SOME ERROR INFOMATION_______%@",errorDic);
            }
        }];
    } else {
        [_uiWebView  stringByEvaluatingJavaScriptFromString:functionNameStr];
    }
}

// WKScriptMessageHandler
- (void)userContentController:(WKUserContentController *)userContentController didReceiveScriptMessage:(WKScriptMessage *)message {
    if ([message.name isEqualToString:kUserContentMessageNameMouseOver]) {
        if (self.delegate && [self.delegate respondsToSelector:@selector(AAChartView:selecetIndex:Y:Category:)]) {
            [self.delegate AAChartView:self selecetIndex:[message.body[@"index"] unsignedIntegerValue] Y:message.body[@"y"] Category:message.body[@"category"]];
        }
    }
}

#pragma mark -- setter method

- (void)setContentInsetAdjustmentBehavior:(UIScrollViewContentInsetAdjustmentBehavior)contentInsetAdjustmentBehavior {
    _contentInsetAdjustmentBehavior = contentInsetAdjustmentBehavior;
    if (AASYSTEM_VERSION >= 9.0) {
        _wkWebView.scrollView.contentInsetAdjustmentBehavior = _contentInsetAdjustmentBehavior;
    } else {
        _uiWebView.scrollView.contentInsetAdjustmentBehavior = _contentInsetAdjustmentBehavior;
    }
}

- (void)setScrollEnabled:(BOOL)scrollEnabled {
    _scrollEnabled = scrollEnabled;
    if (AASYSTEM_VERSION >= 9.0) {
        _wkWebView.scrollView.scrollEnabled = _scrollEnabled;
    } else {
        _uiWebView.scrollView.scrollEnabled = _scrollEnabled;
    }
}

- (void)setContentWidth:(CGFloat)contentWidth {
    _contentWidth = contentWidth;
    NSString *javaScriptStr = [NSString stringWithFormat:@"setTheChartViewContentWidth(%f)",_contentWidth];
    [self evaluateJavaScriptWithSetterMethodNameString:javaScriptStr];
}

- (void)setContentHeight:(CGFloat)contentHeight {
    _contentHeight = contentHeight;
    NSString *javaScriptStr = [NSString stringWithFormat:@"setTheChartViewContentHeight(%f)",_contentHeight];
    [self evaluateJavaScriptWithSetterMethodNameString:javaScriptStr];
}

- (void)setChartSeriesHidden:(BOOL)chartSeriesHidden {
    _chartSeriesHidden = chartSeriesHidden;
    NSString *jsStr = [NSString stringWithFormat:@"setChartSeriesHidden(%d)",_chartSeriesHidden];
    [self evaluateJavaScriptWithSetterMethodNameString:jsStr];
}

- (void)evaluateJavaScriptWithSetterMethodNameString:(NSString *)JSFunctionStr {
    if (_optionJson) {
          [self evaluateJavaScriptWithFunctionNameString:JSFunctionStr];
    }
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

- (void)setBlurEffectEnabled:(BOOL)blurEffectEnabled {
    _blurEffectEnabled = blurEffectEnabled;
    if (_blurEffectEnabled) {
        UIBlurEffect *effect = [UIBlurEffect effectWithStyle:UIBlurEffectStyleLight];
        UIVisualEffectView *effectView = [[UIVisualEffectView alloc] initWithEffect:effect];
        [self addSubview:effectView];
        [self sendSubviewToBack:effectView];
        
        effectView.translatesAutoresizingMaskIntoConstraints = NO;
        [self addConstraints:[self configureTheConstraintArrayWithItem:effectView toItem:self]];
    }
}

@end



#import <objc/runtime.h>

@implementation AAJsonConverter

+ (NSDictionary*)getObjectData:(id)objc {
    NSMutableDictionary *dic = [NSMutableDictionary dictionary];
    unsigned int propsCount;
    Class class = [objc class];
    do {
        objc_property_t *props = class_copyPropertyList(class, &propsCount);
        for (int i = 0;i < propsCount; i++) {
            objc_property_t prop = props[i];
            
            NSString *propName = [NSString stringWithUTF8String:property_getName(prop)];
            id value = [objc valueForKey:propName];
            if (value == nil) {
                value = [NSNull null];
                continue;
            } else {
                value = [self getObjectInternal:value];
            }
            [dic setObject:value forKey:propName];
        }
        free(props);
        class = [class superclass];
    } while (class != [NSObject class]);
    
    return dic;
}

+ (NSData*)getJSON:(id)objc options:(NSJSONWritingOptions)options error:(NSError**)error {
    return [NSJSONSerialization dataWithJSONObject:[self getObjectData:objc]
                                           options:options
                                             error:error];
}

+ (id)getObjectInternal:(id)objc {
    if (   [objc isKindOfClass:[NSString class]]
        || [objc isKindOfClass:[NSNumber class]]
        || [objc isKindOfClass:[NSNull   class]] ) {
        return objc;
    }
    
    if ([objc isKindOfClass:[NSArray class]]) {
        NSArray *objcArr = objc;
        NSMutableArray *arr = [NSMutableArray arrayWithCapacity:objcArr.count];
        for (int i = 0;i < objcArr.count; i++) {
            [arr setObject:[self getObjectInternal:[objcArr objectAtIndex:i]] atIndexedSubscript:i];
        }
        return arr;
    }
    
    if ([objc isKindOfClass:[NSDictionary class]]) {
        NSDictionary *objcDic = objc;
        NSMutableDictionary *dic = [NSMutableDictionary dictionaryWithCapacity:[objcDic count]];
        for (NSString *key in objcDic.allKeys) {
            [dic setObject:[self getObjectInternal:[objcDic objectForKey:key]] forKey:key];
        }
        return dic;
    }
    return [self getObjectData:objc];
}

+ (NSString*)convertDictionaryIntoJson:(NSDictionary *)dictionary {
    NSError *parseError = nil;
    NSData *jsonData = [NSJSONSerialization dataWithJSONObject:dictionary
                                                       options:NSJSONWritingPrettyPrinted
                                                         error:&parseError];
    NSString *string =[[NSString alloc] initWithData:jsonData encoding:NSUTF8StringEncoding];
    return string;
}

+ (NSString*)wipeOffTheLineBreakAndBlankCharacter:(NSString *)originalString {
    originalString = [originalString stringByReplacingOccurrencesOfString:@"\0" withString:@""];
    originalString = [originalString stringByReplacingOccurrencesOfString:@"\n" withString:@""];
    return originalString;
}

+ (NSString *)getPureOptionsString:(id)optionsObject {
    NSDictionary *dic;
    if ([optionsObject isKindOfClass:[NSDictionary class]] ) {
        dic = optionsObject;
    } else {
        dic = [self getObjectData:optionsObject];
    }
    NSString *str = [self convertDictionaryIntoJson:dic];
    return [self wipeOffTheLineBreakAndBlankCharacter:str];
}

+ (NSString *)getPureSeriesString:(NSArray<NSDictionary*> *)series {
    NSError *parseError = nil;
    NSData *jsonData = [NSJSONSerialization dataWithJSONObject:series
                                                       options:NSJSONWritingPrettyPrinted
                                                         error:&parseError];
    NSString *seriesStr = [[NSString alloc] initWithData:jsonData encoding:NSUTF8StringEncoding];
    return [self wipeOffTheLineBreakAndBlankCharacter:seriesStr];
}

+ (NSDictionary *)jsonDictWithString:(NSString *)string
{
    if (string && 0 != string.length){
        NSError *error;
        NSData *jsonData = [string dataUsingEncoding:NSUTF8StringEncoding];
        NSDictionary *jsonDict = [NSJSONSerialization JSONObjectWithData:jsonData options:NSJSONReadingMutableContainers error:&error];
        if (error) {
            NSLog(@"json解析失败：%@", error);
            return nil;
        }
        return jsonDict;
    }
    return nil;
}

@end

