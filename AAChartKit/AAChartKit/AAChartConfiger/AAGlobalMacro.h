//
//  AAGlobalMacro.h
//  AAChartKit
//
//  Created by An An on 17/3/13.
//  Copyright © 2017年 An An. All rights reserved.
//

#ifndef AAGlobalMacro_h
#define AAGlobalMacro_h


#if __IPHONE_OS_VERSION_MAX_ALLOWED >= __IPHONE_9_0
#import <WebKit/WebKit.h>
#define AAWebView WKWebView
#define AAWebViewDelegate WKNavigationDelegate
#define AASelfWebViewDelegate navigationDelegate

#elif __IPHONE_OS_VERSION_MAX_ALLOWED < __IPHONE_9_0
#import <UIKit/UIKit.h>
#define AAWebView UIWebView
#define AAWebViewDelegate UIWebViewDelegate
#define AASelfWebViewDelegate delegate
#endif


#define AAObject(objectName) [[objectName alloc]init]

#define AAPropStatementAndFuncStatement(propertyModifyWord,className, propertyPointerType, propertyName)        \
@property(nonatomic,propertyModifyWord)propertyPointerType  propertyName;                                               \
- (className * (^) (propertyPointerType propertyName)) propertyName##Set;

#define AAPropSetFuncImplementation(className, propertyPointerType, propertyName)                               \
- (className * (^) (propertyPointerType propertyName))propertyName##Set{                                                \
return ^(propertyPointerType propertyName) {                                                                            \
self.propertyName = propertyName;                                                                                       \
return self;                                                                                                            \
};                                                                                                                      \
}
#endif /* AAGlobalMacro_h */



