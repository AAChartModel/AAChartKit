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
#import "AAJSStringPurer.h"

@interface AAWeakProxy : NSProxy

@property (nonatomic, weak, readonly, nullable) id target;

- (nonnull instancetype)initWithTarget:(nonnull id)target;
+ (nonnull instancetype)proxyWithTarget:(nonnull id)target;

@end

@implementation AAWeakProxy

- (instancetype)initWithTarget:(id)target {
    _target = target;
    return self;
}

+ (instancetype)proxyWithTarget:(id)target {
    return [[AAWeakProxy alloc] initWithTarget:target];
}

- (id)forwardingTargetForSelector:(SEL)selector {
    return _target;
}

- (void)forwardInvocation:(NSInvocation *)invocation {
    void *null = NULL;
    [invocation setReturnValue:&null];
}

- (NSMethodSignature *)methodSignatureForSelector:(SEL)selector {
    return [NSObject instanceMethodSignatureForSelector:@selector(init)];
}

- (BOOL)respondsToSelector:(SEL)aSelector {
    return [_target respondsToSelector:aSelector];
}

- (BOOL)isEqual:(id)object {
    return [_target isEqual:object];
}

- (NSUInteger)hash {
    return [_target hash];
}

- (Class)superclass {
    return [_target superclass];
}

- (Class)class {
    return [_target class];
}

- (BOOL)isKindOfClass:(Class)aClass {
    return [_target isKindOfClass:aClass];
}

- (BOOL)isMemberOfClass:(Class)aClass {
    return [_target isMemberOfClass:aClass];
}

- (BOOL)conformsToProtocol:(Protocol *)aProtocol {
    return [_target conformsToProtocol:aProtocol];
}

- (BOOL)isProxy {
    return YES;
}

- (NSString *)description {
    return [_target description];
}

- (NSString *)debugDescription {
    return [_target debugDescription];
}

@end

@implementation AAMoveOverEventMessageModel

@end

/**
 *  The console output log
 */
#ifdef DEBUG // Debug status, open the LOG function
#define AADetailLog(fmt, ...) NSLog((@"-------> %@ [Line %d] \n"fmt "\n\n"), \
[[NSString stringWithFormat:@"%s",__FILE__] lastPathComponent], __LINE__, ##__VA_ARGS__);
#else // Release status, turn off the LOG function
#define AADetailLog(...)
#endif

static NSString * const kUserContentMessageNameMouseOver = @"mouseover";

@interface AAChartView() <
WKUIDelegate,
WKNavigationDelegate,
WKScriptMessageHandler
> {
    NSString  *_optionJson;
    BOOL _touchEventEnabled;
}

@end

@implementation AAChartView

- (instancetype)initWithFrame:(CGRect)frame {
    WKWebViewConfiguration *config = [[WKWebViewConfiguration alloc] init];
    config.userContentController = [[WKUserContentController alloc] init];
    self = [super initWithFrame:frame configuration:config];
    
    if (self) {
        self.UIDelegate = self;
        self.navigationDelegate = self;
        self.backgroundColor = [UIColor whiteColor];
    }
    return self;
}


#pragma CONFIGURE THE CHART VIEW CONTENT WITH AACHARTMODEL

- (void)aa_drawChartWithChartModel:(AAChartModel *)chartModel {
    AAOptions *options = [AAOptionsConstructor configureChartOptionsWithAAChartModel:chartModel];
    [self aa_drawChartWithOptions:options];
}

- (void)aa_refreshChartWithChartModel:(AAChartModel *)chartModel {
    AAOptions *options = [AAOptionsConstructor configureChartOptionsWithAAChartModel:chartModel];
    [self aa_refreshChartWithOptions:options];
}

- (void)aa_onlyRefreshTheChartDataWithChartModelSeries:(NSArray<AASeriesElement *> *)series {
    [self aa_onlyRefreshTheChartDataWithOptionsSeries:series];
}

- (void)aa_onlyRefreshTheChartDataWithChartModelSeries:(NSArray<AASeriesElement *> *)series
                                             animation:(BOOL)animation {
    [self aa_onlyRefreshTheChartDataWithOptionsSeries:series animation:animation];
}


#pragma CONFIGURE THE CHART VIEW CONTENT WITH AAOPTIONS

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

- (void)aa_onlyRefreshTheChartDataWithOptionsSeries:(NSArray<AASeriesElement *> *)series {
    [self aa_onlyRefreshTheChartDataWithOptionsSeries:series animation:true];
}

- (void)aa_onlyRefreshTheChartDataWithOptionsSeries:(NSArray<AASeriesElement *> *)series
                                          animation:(BOOL)animation {
    NSMutableArray *seriesDicArr = [NSMutableArray arrayWithCapacity:series.count];
    for (AASeriesElement *aaSeriesElement in series) {
        [seriesDicArr addObject:[AAJsonConverter dictionaryWithObjectInstance:aaSeriesElement]];
    }
    
    NSString *seriesJsonStr = [AAJsonConverter pureJsonStringWithJsonObject:seriesDicArr];
    NSString *jsStr = [NSString stringWithFormat:@"onlyRefreshTheChartDataWithSeries('%@','%d')",
                       seriesJsonStr,
                       animation];
    [self safeEvaluateJavaScriptString:jsStr];
}

- (void)aa_updateChartWithOptions:(id)options {
    [self aa_updateChartWithOptions:options redraw:false];
}

- (void)aa_updateChartWithOptions:(id)options redraw:(BOOL)redraw {
    BOOL isOptionsClass = [options isKindOfClass:[AAOptions class]];
    NSDictionary *optionsDic = [AAJsonConverter dictionaryWithObjectInstance:options];
    NSDictionary *finalOptionsDic;
    if (isOptionsClass) {
        finalOptionsDic = optionsDic;
    } else {
        NSString *classNameStr = NSStringFromClass([options class]);
        classNameStr = [classNameStr stringByReplacingOccurrencesOfString:@"AA"
                                                               withString:@""];
        
        //convert fisrt character to be lowercase string
        NSString *firstChar = [classNameStr substringToIndex:1];
        NSString *lowerFirstChar = [firstChar lowercaseString];
        classNameStr = [classNameStr substringFromIndex:1];
        NSString *finalClassNameStr = [NSString stringWithFormat:@"%@%@",
                                       lowerFirstChar,
                                       classNameStr];
        finalOptionsDic = @{finalClassNameStr:optionsDic};
    }
    
    NSString *optionsStr = [AAJsonConverter pureOptionsJsonStringWithOptionsInstance:finalOptionsDic];
    NSString *jsStr = [NSString stringWithFormat:@"updateChart('%@','%d')",
                       optionsStr,
                       redraw];
    [self safeEvaluateJavaScriptString:jsStr];
}

- (void)aa_addPointToChartSeriesElementWithElementIndex:(NSUInteger)elementIndex
                                                options:(id)options {
    [self aa_addPointToChartSeriesElementWithElementIndex:elementIndex
                                                  options:options
                                                    shift:true];
}

- (void)aa_addPointToChartSeriesElementWithElementIndex:(NSUInteger)elementIndex
                                                options:(id)options
                                                  shift:(BOOL)shift {
    [self aa_addPointToChartSeriesElementWithElementIndex:elementIndex
                                                  options:options
                                                   redraw:true
                                                    shift:shift
                                                animation:true];
}

- (void)aa_addPointToChartSeriesElementWithElementIndex:(NSUInteger)elementIndex
                                                options:(id)options
                                                 redraw:(BOOL)redraw
                                                  shift:(BOOL)shift
                                              animation:(BOOL)animation {
    NSString *optionsStr;
    if ([options isKindOfClass:[NSNumber class]]) {
        optionsStr = [NSString stringWithFormat:@"%@",options];
    } else if ([options isKindOfClass:[NSArray class]]) {
        optionsStr = [AAJsonConverter pureJsonStringWithJsonObject:options];
    } else {
        NSDictionary *dic = [AAJsonConverter dictionaryWithObjectInstance:options];
        optionsStr = [AAJsonConverter pureJsonStringWithJsonObject:dic];
    }
    
    NSString *jsStr = [NSString stringWithFormat:@"addPointToChartSeries('%tu','%@','%d','%d','%d')",
                       elementIndex,
                       optionsStr,
                       redraw,
                       shift,
                       animation];
    [self safeEvaluateJavaScriptString:jsStr];
}

- (void)aa_addPointsToChartSeriesArrayWithOptionsArray:(NSArray *)optionsArr {
    [self aa_addPointsToChartSeriesArrayWithOptionsArray:optionsArr shift:true animation:true];
}

- (void)aa_addPointsToChartSeriesArrayWithOptionsArray:(NSArray *)optionsArr
                                                 shift:(BOOL)shift
                                             animation:(BOOL)animation {
    [optionsArr enumerateObjectsUsingBlock:^(id  _Nonnull obj, NSUInteger idx, BOOL * _Nonnull stop) {
        [self aa_addPointToChartSeriesElementWithElementIndex:idx
                                                      options:obj
                                                       redraw:false
                                                        shift:shift
                                                    animation:false];
    }];
    [self aa_redrawWithAnimation:animation];
}

- (void)aa_addElementToChartSeriesWithElement:(AASeriesElement *)element {
    NSDictionary * elementDic = [AAJsonConverter dictionaryWithObjectInstance:element];
    NSString *elementStr = [AAJsonConverter pureJsonStringWithJsonObject:elementDic];
    NSString *jsStr = [NSString stringWithFormat:@"addElementToChartSeriesWithElement('%@')",
                       elementStr];
    [self safeEvaluateJavaScriptString:jsStr];
}

- (void)aa_removeElementFromChartSeriesWithElementIndex:(NSUInteger)elementIndex {
    NSString *jsStr = [NSString stringWithFormat:@"removeElementFromChartSeriesWithElementIndex('%tu')",
                       elementIndex];
    [self safeEvaluateJavaScriptString:jsStr];
}


- (void)aa_showTheSeriesElementContentWithSeriesElementIndex:(NSUInteger)elementIndex {
    NSString *jsStr = [NSString stringWithFormat:@"showTheSeriesElementContentWithIndex('%tu')",
                       elementIndex];
    [self safeEvaluateJavaScriptString:jsStr];
}

- (void)aa_hideTheSeriesElementContentWithSeriesElementIndex:(NSUInteger)elementIndex {
    NSString *jsStr = [NSString stringWithFormat:@"hideTheSeriesElementContentWithIndex('%tu')",
                       elementIndex];
    [self safeEvaluateJavaScriptString:jsStr];
}

- (void)aa_evaluateJavaScriptStringFunction:(NSString *)JavaScriptString {
    NSString *pureJSFuncStr = [AAJSStringPurer pureJavaScriptFunctionStringWithString:JavaScriptString];
    
    //remove the useless punctuation: the first "((" and the end "))"
    NSRange range = NSMakeRange(2, pureJSFuncStr.length - 4);
    pureJSFuncStr = [pureJSFuncStr substringWithRange:range];
    
    NSString *jsFunctionNameStr = [NSString stringWithFormat:@"evaluateTheJavaScriptStringFunction('%@')",
                                   pureJSFuncStr];
    [self safeEvaluateJavaScriptString:jsFunctionNameStr];
}

- (void)aa_updateXAxisCategories:(NSArray *)categories {
    [self aa_updateXAxisCategories:categories redraw:true];
}

- (void)aa_updateXAxisCategories:(NSArray *)categories redraw:(BOOL)redraw {
    NSString *originalJsArrStr = @"";
    for (NSString *category in categories) {
        originalJsArrStr = [originalJsArrStr stringByAppendingFormat:@"'%@',",category];
    }
    NSString *finalJSArrStr = [NSString stringWithFormat:@"[%@]",originalJsArrStr];
    
    NSString *jsFunctionStr = [NSString stringWithFormat:@"aaGlobalChart.xAxis[0].setCategories(%@,%d)",
                              finalJSArrStr,
                              redraw];
    [self safeEvaluateJavaScriptString:jsFunctionStr];
}

- (void)aa_updateXAxisExtremesWithMin:(NSUInteger)min max:(NSUInteger)max {
    NSString *jsFuntionStr = [NSString stringWithFormat:@"aaGlobalChart.xAxis[0].setExtremes(%lu,%lu)",
                              min, max];
    [self safeEvaluateJavaScriptString:jsFuntionStr];
}

- (void)aa_redrawWithAnimation:(BOOL)animation {
    NSString *jsStr = [NSString stringWithFormat:@"redrawWithAnimation('%d')",animation];
    [self safeEvaluateJavaScriptString:jsStr];
}

- (void)aa_adaptiveScreenRotation {
    [self aa_adaptiveScreenRotationWithAnimation:nil];
}

- (void)aa_adaptiveScreenRotationWithAnimation:(AAAnimation *)animation {
    __weak __typeof__(self) weakSelf = self;
    [[NSNotificationCenter defaultCenter] addObserverForName:UIDeviceOrientationDidChangeNotification
                                                      object:nil
                                                       queue:nil
                                                  usingBlock:^(NSNotification * _Nonnull note) {
        [weakSelf handleDeviceOrientationChangeEventWithAnimation:animation];
    }];
}

- (void)handleDeviceOrientationChangeEventWithAnimation:(AAAnimation *)animation {
    NSString *animationJsonStr = [AAJsonConverter pureOptionsJsonStringWithOptionsInstance:animation];
    NSString *jsFuntionStr = [NSString stringWithFormat:@"changeChartSize('%f','%f','%@')",
                              self.frame.size.width,
                              self.frame.size.height,
                              animationJsonStr];
    [self safeEvaluateJavaScriptString:jsFuntionStr];
}


- (NSURLRequest *)getJavaScriptFileURLRequest {
    NSString *resourcePath = [[NSBundle bundleForClass:[self class]] resourcePath];
    NSString *bundlePath = [resourcePath stringByAppendingPathComponent:@"/AAChartKitLib.bundle"];
    NSBundle *bundle = [NSBundle bundleWithPath:bundlePath];
    if (!bundle) { //installed manually
        bundle = [NSBundle mainBundle];
    }
    NSString *webPath = [bundle pathForResource:@"AAChartView"
                                         ofType:@"html"
                                    inDirectory:@"AAJSFiles.bundle"];
    NSURL *webURL = [NSURL fileURLWithPath:webPath];
    if ([[UIDevice currentDevice].systemVersion floatValue] < 9.0) {
        webURL = [self localFileURLForBuggyiOS8WKWebViewWithFileURL:webURL];
    }
    
    NSURLRequest *URLRequest = [[NSURLRequest alloc] initWithURL:webURL];
    return URLRequest;
}

- (NSURL *)localFileURLForBuggyiOS8WKWebViewWithFileURL:(NSURL *)fileURL {
    // Create "/tmp/www" directory
    NSError *creatDirError = nil;
    NSFileManager *fileManager= [NSFileManager defaultManager];
    NSURL *tmpWwwDirURL = [[NSURL fileURLWithPath:NSTemporaryDirectory()] URLByAppendingPathComponent:@"www"];
    NSString *htmlFileName = @"AAChartView.html";
    NSString *tmpJsFilesDir = [tmpWwwDirURL.absoluteString stringByAppendingString:@"/"];
    NSURL *destURL = [NSURL URLWithString:[tmpJsFilesDir stringByAppendingString:htmlFileName]];

    BOOL isDir = NO;
    BOOL isTmpWwwDirExist = [fileManager fileExistsAtPath:tmpWwwDirURL.path isDirectory:&isDir];
    if (isTmpWwwDirExist) {
        return destURL;
    }
    
    [fileManager createDirectoryAtURL:tmpWwwDirURL
          withIntermediateDirectories:YES
                           attributes:nil
                                error:&creatDirError];
    if (creatDirError) {
        AADetailLog("creat directory error%@",creatDirError);
    }
    
    NSString *bundleFilesDir = [fileURL.absoluteString stringByReplacingOccurrencesOfString:htmlFileName
                                                                                 withString:@""];
    
    NSArray *array = @[htmlFileName,
                       @"AAEasing.js",
                       @"AAFunnel.js",
                       @"AAHighchartsLib.js",
                       @"AAHighchartsMore.js",
                       ];
    
    [array enumerateObjectsUsingBlock:^(id  _Nonnull obj, NSUInteger idx, BOOL * _Nonnull stop) {
        NSString *bundleFilePath = [bundleFilesDir stringByAppendingString:obj];
        NSString *tmpFilePath = [tmpJsFilesDir stringByAppendingString:obj];
        // Now copy bundle files to the temp directory
        NSError *copyItemError = nil;
        [fileManager copyItemAtURL:[NSURL URLWithString:bundleFilePath]
                             toURL:[NSURL URLWithString:tmpFilePath]
                             error:&copyItemError];
        if (copyItemError) {
            AADetailLog("copy file Error%@",copyItemError);
        }
    }];
    return destURL;
}

- (void)configureTheOptionsJsonStringWithAAOptions:(AAOptions *)aaOptions {
    if (self.isClearBackgroundColor) {
        aaOptions.chart.backgroundColor = @"rgba(0,0,0,0)";
    }
    if (   aaOptions.touchEventEnabled == true
        && _touchEventEnabled == false) {
        _touchEventEnabled = true;
        AAWeakProxy *proxy = [AAWeakProxy proxyWithTarget:self];
        [self.configuration.userContentController addScriptMessageHandler:(id<WKScriptMessageHandler>)proxy
                                                                     name:kUserContentMessageNameMouseOver];
    }
    _optionJson = [AAJsonConverter pureOptionsJsonStringWithOptionsInstance:aaOptions];
}

- (NSString *)configTheJavaScriptString {
    CGFloat chartViewContentWidth = self.contentWidth;
    CGFloat contentHeight = self.frame.size.height;
    CGFloat chartViewContentHeight = self.contentHeight == 0 ? contentHeight : self.contentHeight;
    NSString *jsStr = [NSString stringWithFormat:@"loadTheHighChartView('%@','%f','%f')",
                       _optionJson,
                       chartViewContentWidth,
                       chartViewContentHeight];
    return jsStr;
}



#pragma mark - WKUIDelegate
- (void)webView:(WKWebView *)webView runJavaScriptAlertPanelWithMessage:(NSString *)message initiatedByFrame:(WKFrameInfo *)frame completionHandler:(void (^)(void))completionHandler {
    UIAlertController *alertController = [UIAlertController alertControllerWithTitle:@"JS WARNING"
                                                                             message:message
                                                                      preferredStyle:UIAlertControllerStyleAlert];
    [alertController addAction:([UIAlertAction actionWithTitle:@"Okay"
                                                         style:UIAlertActionStyleDefault
                                                       handler:^(UIAlertAction * _Nonnull action) {
        completionHandler();
    }])];
    
    UIViewController *alertHelperController = [[UIViewController alloc]init];
    [self addSubview:alertHelperController.view];
    
    [alertHelperController presentViewController:alertController animated:YES completion:nil];
}

- (void)drawChart {
    NSString *jsStr = [self configTheJavaScriptString];
    [self safeEvaluateJavaScriptString:jsStr];
}

#pragma mark - AAChartView Event Handler
- (void)didFinishLoadHandler:(AADidFinishLoadBlock)handler {
    self.didFinishLoadBlock = handler;
}

- (void)moveOverEventHandler:(AAMoveOverEventBlock)handler {
    self.moveOverEventBlock = handler;
}

#pragma mark - WKNavigationDelegate
- (void)webView:(WKWebView *)webView didFinishNavigation:(WKNavigation *)navigation {
    [self drawChart];
    if (self.didFinishLoadBlock) {
        self.didFinishLoadBlock(self);
        return;
    }
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
        AAMoveOverEventMessageModel *eventMessageModel = [self eventMessageModelWithMessageBody:message.body];
        if (self.moveOverEventBlock) {
            self.moveOverEventBlock(self, eventMessageModel);
            return;
        }
        if (self.delegate) {
            if ([self.delegate respondsToSelector:@selector(aaChartView:moveOverEventWithMessage:)]) {
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


- (void)safeEvaluateJavaScriptString:(NSString *)functionNameStr {
    if (_optionJson) {
        [self evaluateJavaScript:functionNameStr completionHandler:^(id item, NSError * _Nullable error) {
            
#if DEBUG
            if (!error) return;
            NSMutableDictionary *errorDic = [NSMutableDictionary dictionary];
            [errorDic setValue:error.domain forKey:@"domain"];
            [errorDic setValue:@(error.code) forKey:@"code"];
            [errorDic setValue:error.userInfo forKey:@"userInfo"];
            
            NSString *basicErrorInfo = @"                                                 \n  \
☠️☠️💀☠️☠️WARNING!!!!!!!!!!!!!!!!!! JS ERROR WARNING !!!!!!!!!!!!!!!!!!WARNING☠️☠️💀☠️☠️   \
⇩⇩⇩⇩⇩⇩⇩⇩⇩⇩⇩⇩⇩⇩⇩⇩⇩⇩⇩⇩⇩⇩⇩⇩⇩⇩⇩⇩⇩⇩⇩⇩⇩⇩⇩⇩⇩⇩⇩⇩⇩⇩⇩⇩⇩⇩⇩⇩⇩⇩⇩⇩⇩⇩⇩⇩⇩⇩⇩⇩⇩⇩⇩⇩⇩⇩⇩⇩⇩⇩⇩⇩⇩⇩⇩⇩⇩⇩⇩⇩⇩⇩⇩⇩⇩⇩⇩⇩⇩⇩    \
------------------------------------------------------------------------------------------\n  \
%@                                                                                            \
------------------------------------------------------------------------------------------    \
⇧⇧⇧⇧⇧⇧⇧⇧⇧⇧⇧⇧⇧⇧⇧⇧⇧⇧⇧⇧⇧⇧⇧⇧⇧⇧⇧⇧⇧⇧⇧⇧⇧⇧⇧⇧⇧⇧⇧⇧⇧⇧⇧⇧⇧⇧⇧⇧⇧⇧⇧⇧⇧⇧⇧⇧⇧⇧⇧⇧⇧⇧⇧⇧⇧⇧⇧⇧⇧⇧⇧⇧⇧⇧⇧⇧⇧⇧⇧⇧⇧⇧⇧⇧⇧⇧⇧⇧⇧⇧\n  \
☠️☠️💀☠️☠️WARNING!!!!!!!!!!!!!!!!!! JS ERROR WARNING !!!!!!!!!!!!!!!!!!WARNING☠️☠️💀☠️☠️";
            
            NSString *errorInfoStr = [NSString stringWithFormat:basicErrorInfo,errorDic];
            NSLog(@"%@",errorInfoStr);
#endif
            
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
    NSString *jsStr = [NSString stringWithFormat:@"setTheChartViewContentWidth('%f')",
                       _contentWidth];
    [self safeEvaluateJavaScriptString:jsStr];
}

- (void)setContentHeight:(CGFloat)contentHeight {
    _contentHeight = contentHeight;
    NSString *jsStr = [NSString stringWithFormat:@"setTheChartViewContentHeight('%f')",
                       _contentHeight];
    [self safeEvaluateJavaScriptString:jsStr];
}

- (void)setChartSeriesHidden:(BOOL)chartSeriesHidden {
    _chartSeriesHidden = chartSeriesHidden;
    NSString *jsStr = [NSString stringWithFormat:@"setChartSeriesHidden('%d')",
                       _chartSeriesHidden];
    [self safeEvaluateJavaScriptString:jsStr];
}

- (void)setIsClearBackgroundColor:(BOOL)isClearBackgroundColor {
    _isClearBackgroundColor = isClearBackgroundColor;
    if (_isClearBackgroundColor) {
        [self setBackgroundColor:[UIColor clearColor]];
        [self setOpaque:NO];
    } else {
        self.backgroundColor = [UIColor whiteColor];
        [self setOpaque:YES];
    }
}

- (void)dealloc {
    [self.configuration.userContentController removeScriptMessageHandlerForName:kUserContentMessageNameMouseOver];
    [[NSNotificationCenter defaultCenter] removeObserver:self];
}

@end



#import <objc/runtime.h>

@implementation AAJsonConverter

+ (NSDictionary*)dictionaryWithObjectInstance:(id)objc {
    unsigned int propsCount;
    objc_property_t *props = class_copyPropertyList([objc class], &propsCount);
    NSMutableDictionary *propsDic = [NSMutableDictionary dictionaryWithCapacity:propsCount];

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
        propsDic[propName] = value;
    }
    free(props);
    
    return propsDic;
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
        for (id element in objcArr) {
            [arr addObject:[self getObjectInternal:element]];
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
    
    return [self dictionaryWithObjectInstance:objc];
}

+ (NSString*)wipeOffTheLineBreakCharacter:(NSString *)originalString {
    originalString = [originalString stringByReplacingOccurrencesOfString:@"\n" withString:@""];
    return originalString;
}

+ (NSString *)pureOptionsJsonStringWithOptionsInstance:(id)optionsObject {
    NSDictionary *dic;
    if ([optionsObject isKindOfClass:[NSDictionary class]] ) {
        dic = optionsObject;
    } else {
        dic = [self dictionaryWithObjectInstance:optionsObject];
    }
    return [self pureJsonStringWithJsonObject:dic];
}

+ (NSString *)pureJsonStringWithJsonObject:(id)jsonObjc {
    NSString *seriesStr = [self jsonStringWithJsonObject:jsonObjc];
    AADetailLog(@"----------- console log AAOptions JSON information of AAChartView -----------:\n%@",seriesStr);
    return [self wipeOffTheLineBreakCharacter:seriesStr];
}

+ (NSString*)jsonStringWithJsonObject:(id)jsonObject {
    NSError *error = nil;
    NSData *jsonData = [NSJSONSerialization dataWithJSONObject:jsonObject
                                                       options:NSJSONWritingPrettyPrinted
                                                         error:&error];
    NSString *string =[[NSString alloc] initWithData:jsonData encoding:NSUTF8StringEncoding];
    if (error) {
        AADetailLog(@"❌❌❌ data with JSONObject serialization failed：%@", error);
        return nil;
    }
    return string;
}

+ (id)jsonObjectWithJsonString:(NSString *)string {
    if (string && 0 != string.length) {
        NSError *error;
        NSData *jsonData = [string dataUsingEncoding:NSUTF8StringEncoding];
        id jsonObjet = [NSJSONSerialization JSONObjectWithData:jsonData
                                                       options:NSJSONReadingMutableContainers
                                                         error:&error];
        if (error) {
            AADetailLog(@"❌❌❌ JSONObject with data serialization failed：%@", error);
            return nil;
        }
        return jsonObjet;
    }
    return nil;
}

@end




