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

@implementation AAMoveOverEventMessageModel

@end

/**
 *  The console output log
 */
#ifdef DEBUG // Debug status, open the LOG function
#define AADetailLog(fmt, ...) NSLog((@"-------> %@ [Line %d] \n"fmt "\n\n"), [[NSString stringWithFormat:@"%s",__FILE__] lastPathComponent], __LINE__, ##__VA_ARGS__);
#else // Release status, turn off the LOG function
#define AADetailLog(...)
#endif

static NSString * const kUserContentMessageNameMouseOver = @"mouseover";

@interface AAChartView() <
WKUIDelegate,
WKNavigationDelegate,
WKScriptMessageHandler
> {
    WKUserContentController *_userContentController;
    NSString  *_optionJson;
}

@end

@implementation AAChartView

- (instancetype)initWithFrame:(CGRect)frame {
    _userContentController = [[WKUserContentController alloc] init];
    [_userContentController addScriptMessageHandler:self name:kUserContentMessageNameMouseOver];
    WKWebViewConfiguration *configuration = [[WKWebViewConfiguration alloc] init];
    configuration.userContentController = _userContentController;
    self = [super initWithFrame:frame configuration:configuration];
    if (self) {
        self.UIDelegate = self;
        self.navigationDelegate = self;
        self.backgroundColor = [UIColor whiteColor];
    }
    return self;
}


#pragma mark -***********************CONFIGURE THE CHART VIEW CONTENT WITH `AACHARTMODEL`***********************//
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
#pragma mark -***********************CONFIGURE THE CHART VIEW CONTENT WITH `AACHARTMODEL`***********************//



#pragma mark - =======================CONFIGURE THE CHART VIEW CONTENT WITH `AAOPTIONS`=======================//
//
- (void)aa_drawChartWithOptions:(AAOptions *)options {
    if (!_optionJson) {
        [self configureTheOptionsJsonStringWithAAOptions:options];
        NSURLRequest *URLRequest = [self getJavaScriptFileURLRequest];
        [self loadRequest:URLRequest];
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
#pragma mark - =======================CONFIGURE THE CHART VIEW CONTENT WITH `AAOPTIONS`=======================//

- (void)aa_updateChartWithOptions:(NSObject *)options {
    [self aa_updateChartWithOptions:options redraw:false];
}

- (void)aa_updateChartWithOptions:(NSObject *)options redraw:(BOOL)redraw {
    NSString *classNameStr = NSStringFromClass([options class]);
    classNameStr = [classNameStr stringByReplacingOccurrencesOfString:@"AA" withString:@""];
    
    //convert fisrt character to be lowercase string
    NSString *firstChar = [classNameStr substringToIndex:1];
    NSString *lowercaseFirstChar = [firstChar lowercaseString];
    classNameStr = [classNameStr substringFromIndex:1];
    NSString *finalClassNameStr = [NSString stringWithFormat:@"%@%@",lowercaseFirstChar,classNameStr];
    
    NSDictionary *optionsDic = [AAJsonConverter getObjectData:options];
    NSDictionary *finalOptionsDic = @{finalClassNameStr:optionsDic};
    
    NSString *optionsStr = [AAJsonConverter getPureOptionsString:finalOptionsDic];
    NSString *javaScriptStr = [NSString stringWithFormat:@"updateChart('%@','%d')",optionsStr,redraw];
    [self evaluateJavaScriptWithFunctionNameString:javaScriptStr];
}

- (void)aa_addPointToChartSeriesWithSeriesElementIndex:(unsigned int)elementIndex
                                               options:(NSObject *)options {
    [self aa_addPointToChartSeriesWithSeriesElementIndex:elementIndex options:options shift:false];
}

- (void)aa_addPointToChartSeriesWithSeriesElementIndex:(unsigned int)elementIndex
                                               options:(NSObject *)options
                                                 shift:(BOOL)shift {
    [self aa_addPointToChartSeriesWithSeriesElementIndex:elementIndex
                                                 options:options
                                                  redraw:true
                                                   shift:shift
                                               animation:true];
}

- (void)aa_addPointToChartSeriesWithSeriesElementIndex:(unsigned int)elementIndex
                                               options:(NSObject *)options
                                                redraw:(BOOL)redraw
                                                 shift:(BOOL)shift
                                             animation:(BOOL)animation {
    NSString *optionsStr;
    if ([options isKindOfClass:[NSString class]]) {
        optionsStr = [NSString stringWithFormat:@"%@",options];
    } else if ([options isKindOfClass:[NSArray class]]) {
        optionsStr = [AAJsonConverter getPureOptionsString:options];
    } else {
        id objc = [AAJsonConverter getObjectData:options];
        optionsStr = [AAJsonConverter getPureOptionsString:objc];
    }

    NSString *javaScriptStr = [NSString stringWithFormat:@"addPointToChartSeries('%u','%@','%d','%d','%d')",
                               elementIndex, optionsStr, redraw, shift, animation];
    [self evaluateJavaScriptWithFunctionNameString:javaScriptStr];
}


- (void)aa_showTheSeriesElementContentWithSeriesElementIndex:(NSInteger)elementIndex {
    NSString *javaScriptStr = [NSString stringWithFormat:@"showTheSeriesElementContentWithIndex('%ld')",(long)elementIndex];
    [self evaluateJavaScriptWithFunctionNameString:javaScriptStr];
}

- (void)aa_hideTheSeriesElementContentWithSeriesElementIndex:(NSInteger)elementIndex {
    NSString *javaScriptStr = [NSString stringWithFormat:@"hideTheSeriesElementContentWithIndex('%ld')",(long)elementIndex];
    [self evaluateJavaScriptWithFunctionNameString:javaScriptStr];
}

- (NSURLRequest *)getJavaScriptFileURLRequest {
    NSString *resourcePath = [[NSBundle bundleForClass:[self class]] resourcePath];
    NSString *bundlePath = [resourcePath stringByAppendingPathComponent:@"/AAChartKitLib.bundle"];
    NSBundle *bundle = [NSBundle bundleWithPath:bundlePath];
    if (!bundle) { //installed manually
        bundle = [NSBundle bundleForClass:[self class]];
    }
    NSString *webPath = [bundle pathForResource:@"AAChartView"
                                         ofType:@"html"
                                    inDirectory:@"AAJSFiles.bundle"];
    NSURL *webURL = [NSURL fileURLWithPath:webPath];
    NSURLRequest *URLRequest = [[NSURLRequest alloc] initWithURL:webURL];
    return URLRequest;
}

- (void)configureTheOptionsJsonStringWithAAOptions:(AAOptions *)aaOptions {
    if (self.isClearBackgroundColor) {
        aaOptions.chart.backgroundColor = @"rgba(0,0,0,0)";
    }
    _optionJson = [AAJsonConverter getPureOptionsString:aaOptions];
}

- (NSString *)configTheJavaScriptString {
    CGFloat chartViewContentWidth = self.contentWidth;
    CGFloat contentHeight = self.frame.size.height;
    CGFloat chartViewContentHeight = self.contentHeight == 0 ? contentHeight : self.contentHeight;
    NSString *javaScriptStr = [NSString stringWithFormat:@"loadTheHighChartView('%@','%@','%@')",
                               _optionJson,
                               @(chartViewContentWidth),
                               @(chartViewContentHeight - 1)];
    return javaScriptStr;
}



#pragma mark - WKUIDelegate
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

#pragma mark - WKNavigationDelegate
//WKWebView did finish load
- (void)webView:(WKWebView *)webView didFinishNavigation:(WKNavigation *)navigation {
    [self drawChart];
    if (self.delegate) {
        if ([self.delegate respondsToSelector:@selector(aaChartViewDidFinishLoad:)]) {
            [self.delegate aaChartViewDidFinishLoad:self];
        }
    }
}

#pragma mark - WKScriptMessageHandler
- (void)userContentController:(WKUserContentController *)userContentController
      didReceiveScriptMessage:(WKScriptMessage *)message {
    if ([message.name isEqualToString:kUserContentMessageNameMouseOver]) {
        if (self.delegate) {
            if ([self.delegate respondsToSelector:@selector(aaChartView:moveOverEventWithMessage:)]) {
                AAMoveOverEventMessageModel *eventMessageModel = [self eventMessageModelWithMessageBody:message.body];
                [self.delegate aaChartView:self moveOverEventWithMessage:eventMessageModel];
            }
        }
    }
}

- (AAMoveOverEventMessageModel *)eventMessageModelWithMessageBody:(id)messageBody {
    AAMoveOverEventMessageModel *eventMessageModel = AAMoveOverEventMessageModel.new;
    eventMessageModel.name = messageBody[@"name"];
    eventMessageModel.x = messageBody[@"x"];
    eventMessageModel.y = messageBody[@"y"];
    eventMessageModel.category = messageBody[@"category"];
    eventMessageModel.offset = messageBody[@"offset"];
    eventMessageModel.index = [messageBody[@"index"] unsignedIntegerValue];
    return eventMessageModel;
}


- (void)evaluateJavaScriptWithFunctionNameString:(NSString *)functionNameStr {
    if (_optionJson) {
        [self evaluateJavaScript:functionNameStr completionHandler:^(id item, NSError * _Nullable error) {
            if (error) {
                NSMutableDictionary *errorDic = [NSMutableDictionary dictionary];
                [errorDic setValue:error.domain forKey:@"domain"];
                [errorDic setValue:@(error.code) forKey:@"code"];
                [errorDic setValue:error.userInfo forKey:@"userInfo"];
                AADetailLog(@"☠️☠️💀☠️☠️!!!!!WARNING!!!!! THERE ARE SOME ERROR INFOMATION_______%@",errorDic);
            }
        }];
    } else {
        AADetailLog("AAChartView did not finish loading!!!")
    }
}

#pragma mark -- setter method

- (void)setContentInsetAdjustmentBehavior:(UIScrollViewContentInsetAdjustmentBehavior)contentInsetAdjustmentBehavior {
    _contentInsetAdjustmentBehavior = contentInsetAdjustmentBehavior;
    self.scrollView.contentInsetAdjustmentBehavior = _contentInsetAdjustmentBehavior;
}

- (void)setScrollEnabled:(BOOL)scrollEnabled {
    _scrollEnabled = scrollEnabled;
    self.scrollView.scrollEnabled = _scrollEnabled;
}

- (void)setContentWidth:(CGFloat)contentWidth {
    _contentWidth = contentWidth;
    NSString *javaScriptStr = [NSString stringWithFormat:@"setTheChartViewContentWidth('%f')",_contentWidth];
    [self evaluateJavaScriptWithFunctionNameString:javaScriptStr];
}

- (void)setContentHeight:(CGFloat)contentHeight {
    _contentHeight = contentHeight;
    NSString *javaScriptStr = [NSString stringWithFormat:@"setTheChartViewContentHeight('%f')",_contentHeight];
    [self evaluateJavaScriptWithFunctionNameString:javaScriptStr];
}

- (void)setChartSeriesHidden:(BOOL)chartSeriesHidden {
    _chartSeriesHidden = chartSeriesHidden;
    NSString *jsStr = [NSString stringWithFormat:@"setChartSeriesHidden('%d')",_chartSeriesHidden];
    [self evaluateJavaScriptWithFunctionNameString:jsStr];
}

- (void)setIsClearBackgroundColor:(BOOL)isClearBackgroundColor {
    _isClearBackgroundColor = isClearBackgroundColor;
    if (_isClearBackgroundColor) {
        self.backgroundColor = [UIColor clearColor];
        [self setBackgroundColor:[UIColor clearColor]];
        [self setOpaque:NO];
    }
}

- (void)dealloc{
    [_userContentController removeScriptMessageHandlerForName:kUserContentMessageNameMouseOver];
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
        for (NSUInteger i = 0; i < propsCount; i++) {
            objc_property_t prop = props[i];
            
            NSString *propName = [NSString stringWithUTF8String:property_getName(prop)];
            id value = [objc valueForKey:propName];
            if (value == nil) {
                value = [NSNull null];
                continue;
            } else {
                value = [self getObjectInternal:value];
            }
            dic[propName] = value;
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
        for (NSUInteger i = 0; i < objcArr.count; i++) {
            arr[i] = [self getObjectInternal:objcArr[i]];
        }
        return arr;
    }
    
    if ([objc isKindOfClass:[NSDictionary class]]) {
        NSDictionary *objcDic = objc;
        NSMutableDictionary *dic = [NSMutableDictionary dictionaryWithCapacity:[objcDic count]];
        for (NSString *key in objcDic.allKeys) {
            dic[key] = [self getObjectInternal:objcDic[key]];
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
    return [self getPureStringWithJSONObject:series];
}

+ (NSString *)getPureStringWithJSONObject:(id)objc {
    NSError *parseError = nil;
    NSData *jsonData = [NSJSONSerialization dataWithJSONObject:objc
                                                       options:NSJSONWritingPrettyPrinted
                                                         error:&parseError];
    NSString *seriesStr = [[NSString alloc] initWithData:jsonData encoding:NSUTF8StringEncoding];
    return [self wipeOffTheLineBreakAndBlankCharacter:seriesStr];
}

+ (NSDictionary *)dictionaryWithJsonString:(NSString *)string {
    if (string && 0 != string.length) {
        NSError *error;
        NSData *jsonData = [string dataUsingEncoding:NSUTF8StringEncoding];
        NSDictionary *jsonDic = [NSJSONSerialization JSONObjectWithData:jsonData
                                                                options:NSJSONReadingMutableContainers
                                                                  error:&error];
        if (error) {
            AADetailLog(@"serialize json failed：%@", error);
            return nil;
        }
        return jsonDic;
    }
    return nil;
}

@end



