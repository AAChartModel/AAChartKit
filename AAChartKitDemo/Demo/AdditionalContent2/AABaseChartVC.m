//
//  AABaseViewController.m
//  AAChartKitDemo
//
//  Created by AnAn on 2020/7/5.
//  Copyright © 2020 An An. All rights reserved.
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
 * -------------------------------------------------------------------------------
 * And if you want to contribute for this project, please contact me as well
 * GitHub        : https://github.com/AAChartModel
 * StackOverflow : https://stackoverflow.com/users/12302132/codeforu
 * JianShu       : https://www.jianshu.com/u/f1e6753d4254
 * SegmentFault  : https://segmentfault.com/u/huanghunbieguan
 *
 * -------------------------------------------------------------------------------
 
 */

#import "AABaseChartVC.h"
#import "AAChartView+shareInstance.h"
#import "AAChartViewManager.h"

@interface AABaseChartVC ()

@property (nonatomic, strong) NSLayoutConstraint *topConstraint;
@property (nonatomic, assign) BOOL usesSafeAreaLayoutGuideConstraints;

@end

@implementation AABaseChartVC

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.view.backgroundColor = [UIColor whiteColor];
    [self adaptiveScreenRotation];

    [self setupTitle];
    [self setupNextTypeChartButton];

    [self setupChartView];
}

- (void)setupTitle {
    NSString *chartType = self.navigationItemTitleArr[self.selectedIndex];
    self.title = [NSString stringWithFormat:@"%@",chartType];
}

- (void)setupNextTypeChartButton {
    UIBarButtonItem *barItem = [[UIBarButtonItem alloc] initWithTitle:@"➷"
                                                                style:UIBarButtonItemStylePlain
                                                               target:self
                                                               action:@selector(monitorTap)];
    [barItem setTitleTextAttributes:@{
        NSForegroundColorAttributeName: UIColor.redColor,
        NSFontAttributeName: [UIFont systemFontOfSize:28 weight:UIFontWeightBold]
    } forState:UIControlStateNormal];

    self.navigationItem.rightBarButtonItem = barItem;
}

- (void)monitorTap {
    if (self.selectedIndex == self.navigationItemTitleArr.count - 1) {
        self.title = @"❗️This is the last chart❗️";
    } else {
        self.selectedIndex = self.selectedIndex + 1;
        self.title = self.navigationItemTitleArr[self.selectedIndex];
        [self refreshChartWithChartConfiguration];
        NSString *jsStr = [self configureAddEventForXAxisLabelsGroupElementJSFunctionString];
        [self.aaChartView aa_evaluateJavaScriptStringFunction:jsStr];
    }
}


- (void)setupChartView {
    self.aaChartView = [self configureEasyInspectableChartView];
    self.aaChartView.scrollEnabled = NO;
    if (@available(iOS 11.0, *)) {
        self.aaChartView.contentInsetAdjustmentBehavior = UIScrollViewContentInsetAdjustmentNever;
    } else {
        // Fallback on earlier versions
    }
//    [self setupAAChartViewEventBlockHandler];
    [self.view addSubview:self.aaChartView];
    
    AAAnimation *aaAnimation = AAAnimation.new
    .durationSet(@800)
    .easingSet(AAChartAnimationEaseOutQuart);
    [self.aaChartView aa_adaptiveScreenRotationWithAnimation:aaAnimation];
    
    // ⚠️
    self.aaChartView.translatesAutoresizingMaskIntoConstraints = NO;
    NSArray *constraintsArr = [self configureTheConstraintArrayWithSonView:self.aaChartView
                                                                    toFatherView:self.view];
    [self.view addConstraints:constraintsArr];
    
    [self drawChartWithChartConfiguration];
    
}

- (AAChartView *)configureEasyInspectableChartView {
    /*

    //问:怎么设置 Safari 的网页检查器不关闭? 现在的问题是只要 WKWebView 实例被销毁之后, Safari 的网页检查器就直接关闭了
    //答:在使用 Safari 调试 WKWebView 时，确实会遇到 WKWebView 实例被销毁后，网页检查器（Web Inspector）自动关闭的情况。这是因为网页检查器会与 WKWebView 实例直接绑定，当 WKWebView 被销毁时，Safari 也会相应地关闭检查器窗口。
    
    //目前，Safari 的 Web Inspector 没有内置的设置来防止这种行为。
    //但可以尝试使用单例方法，以延长调试会话的时间：
    //1. 保持 WKWebView 实例存活
    self.aaChartView = [AAChartView sharedInstance];
     //    if (@available(macCatalyst 16.4, *)) {
             self.aaChartView.inspectable = YES;
     //    } else {
     //        // Fallback on earlier versions
     //    }
     
    */
    
//
//    AAChartViewManager *chartViewManager = [AAChartViewManager sharedInstance]; //想要避免网页检查器被频繁关闭, 就使用这个单例方法
    AAChartViewManager *chartViewManager = [[AAChartViewManager alloc]init];

    AAChartView *aaChartView = chartViewManager.aaChartView;
    if (@available(iOS 16.4, macCatalyst 16.4, *)) {
        aaChartView.inspectable = YES;
    } else {
        // Fallback on earlier versions
    }
    return aaChartView;
}

- (NSArray *)configureTheConstraintArrayWithSonView:(UIView *)sonView
                                       toFatherView:(UIView *)fatherView {
    if (@available(iOS 11.0, *)) {
        self.usesSafeAreaLayoutGuideConstraints = YES;
        UILayoutGuide *safeArea = fatherView.safeAreaLayoutGuide;

        self.topConstraint = [sonView.topAnchor constraintEqualToAnchor:safeArea.topAnchor];
        NSLayoutConstraint *leadingConstraint = [sonView.leadingAnchor constraintEqualToAnchor:safeArea.leadingAnchor];
        NSLayoutConstraint *trailingConstraint = [sonView.trailingAnchor constraintEqualToAnchor:safeArea.trailingAnchor];
        NSLayoutConstraint *bottomConstraint = [sonView.bottomAnchor constraintEqualToAnchor:safeArea.bottomAnchor];

        return @[leadingConstraint,
                 trailingConstraint,
                 self.topConstraint,
                 bottomConstraint];
    }

    self.usesSafeAreaLayoutGuideConstraints = NO;

    CGFloat topConstraintConstant;
    // 如果statusBarFrame为CGRectZero,说明状态栏是隐藏的
    CGRect statusBarFrame = [UIApplication sharedApplication].statusBarFrame;
    BOOL isStatusHidden = (statusBarFrame.size.height == 0);
    
    if ([self isHairPhone]) {
        topConstraintConstant = 88;
        if (isStatusHidden == true) {
            topConstraintConstant -= 44;
        }
    } else {
        topConstraintConstant = 64;
        if (isStatusHidden == true) {
            topConstraintConstant -= 20;
        }
    }

    

    
    self.topConstraint =
    [NSLayoutConstraint constraintWithItem:sonView
                                 attribute:NSLayoutAttributeTop
                                 relatedBy:NSLayoutRelationEqual
                                    toItem:fatherView
                                 attribute:NSLayoutAttributeTop
                                multiplier:1.0
                                  constant:topConstraintConstant];
    
    return @[[NSLayoutConstraint constraintWithItem:sonView
                                          attribute:NSLayoutAttributeLeft
                                          relatedBy:NSLayoutRelationEqual
                                             toItem:fatherView
                                          attribute:NSLayoutAttributeLeft
                                         multiplier:1.0
                                           constant:0],
             [NSLayoutConstraint constraintWithItem:sonView
                                          attribute:NSLayoutAttributeRight
                                          relatedBy:NSLayoutRelationEqual
                                             toItem:fatherView
                                          attribute:NSLayoutAttributeRight
                                         multiplier:1.0
                                           constant:0],
             self.topConstraint,
             [NSLayoutConstraint constraintWithItem:sonView
                                          attribute:NSLayoutAttributeBottom
                                          relatedBy:NSLayoutRelationEqual
                                             toItem:fatherView
                                          attribute:NSLayoutAttributeBottom
                                         multiplier:1.0
                                           constant:0]
    ];
}

//- (void)setupAAChartViewEventBlockHandler {
//    __weak __typeof__(self) weakSelf = self;
//
//    //获取图表加载完成事件
//    [_aaChartView didFinishLoadHandler:^(AAChartView *aaChartView) {
//        NSLog(@"🚀🚀🚀🚀 AAChartView content did finish load!!!");
//
////        NSString *jsStr = [ weakSelf configureAddEventForXAxisLabelsGroupElementJSFunctionString];
////        [weakSelf.aaChartView aa_evaluateJavaScriptStringFunction:jsStr];
//    }];
//
//    //获取图表上的手指点击事件
//    [_aaChartView clickEventHandler:^(AAChartView *aaChartView,
//                                      AAClickEventMessageModel *message) {
//        NSDictionary *messageDic = [weakSelf eventMessageModelWithMessageBody:message];
//        [weakSelf printPrettyPrintedClickEventMessageJsonStringWithJsonObject:messageDic];
//    }];
//    
//    //获取图表上的手指点击及滑动事件
//    [_aaChartView moveOverEventHandler:^(AAChartView *aaChartView,
//                                         AAMoveOverEventMessageModel *message) {
//        NSDictionary *messageDic = [weakSelf eventMessageModelWithMessageBody:message];
//        [weakSelf printPrettyPrintedMoveOverEventMessageJsonStringWithJsonObject:messageDic];
//    }];
//    
//    //在 didReceiveScriptMessage 代理方法中获得点击 X轴的文字🏷标签的回调
//    [_aaChartView didReceiveScriptMessageHandler:^(AAChartView *aaChartView, WKScriptMessage *message) {
//        NSLog(@"Clicked X axis label,  name is %@", message.body);
//    }];
//}
//
//- (NSMutableDictionary *)eventMessageModelWithMessageBody:(AAEventMessageModel *)eventMessageModel {
//    NSMutableDictionary *messageBody = [NSMutableDictionary dictionary];
//    messageBody[@"name"] = eventMessageModel.name;
//    messageBody[@"x"] = eventMessageModel.x;
//    messageBody[@"y"] = eventMessageModel.y;
//    messageBody[@"category"] = eventMessageModel.category;
//    messageBody[@"offset"] = eventMessageModel.offset;
//    messageBody[@"index"] = @(eventMessageModel.index);
//    return messageBody;
//}

//【案例分享】Highcharts 坐标轴标签点击高亮: https://blog.jianshukeji.com/highcharts/highlight-label-by-click.html
// 实现方法是找到轴标签 DOM，然后手动添加点击事件并处理。其中 x 轴标签的 DOM 是 axis.labelGroup.element, 添加事件我们用 Highcharts.addEvent，

//配置将要注入的自定义事件的 JavaScript 函数
- (NSString *)configureAddEventForXAxisLabelsGroupElementJSFunctionString {
    return @AAJSFunc((Highcharts.addEvent(aaGlobalChart.xAxis[0].labelGroup.element, 'click', e => {
        let category = e.target.innerHTML;
        window.webkit.messageHandlers.customevent.postMessage(category);
    });));
}

- (void)configureChartCredits:(id)chartConfiguration {
    AAOptions *aaOptions = chartConfiguration;
    aaOptions.credits
        .enabledSet(true)
        .textSet(@"https://github.com/AAChartModel/AAChartKit")
//        .hrefSet(@"https://github.com/AAChartModel/AAChartKit")
        .styleSet(AAStyle.new
                  .colorSet(AAColor.redColor)
                  .fontSizeSet(@"9px"));
}

- (void)drawChartWithChartConfiguration {
    id chartConfiguration = [self chartConfigurationWithSelectedIndex:self.selectedIndex];
    if ([chartConfiguration isKindOfClass:AAChartModel.class]) {
        [self.aaChartView aa_drawChartWithChartModel:chartConfiguration];
    } else if ([chartConfiguration isKindOfClass:AAOptions.class]) {
        [self configureChartCredits:chartConfiguration];
        self.aaChartView.scrollEnabled = NO;
        [self.aaChartView aa_drawChartWithOptions:chartConfiguration];
    }
}

- (void)refreshChartWithChartConfiguration {
    id chartConfiguration = [self chartConfigurationWithSelectedIndex:self.selectedIndex];
    if ([chartConfiguration isKindOfClass:AAChartModel.class]) {
        [self.aaChartView aa_refreshChartWithChartModel:chartConfiguration];
    } else if ([chartConfiguration isKindOfClass:AAOptions.class]) {
        [self configureChartCredits:chartConfiguration];
        self.aaChartView.scrollEnabled = NO;
        [self.aaChartView aa_refreshChartWithOptions:chartConfiguration];
    }
}

- (id)chartConfigurationWithSelectedIndex:(NSUInteger)selectedIndex {
   return nil;
}


- (void)adaptiveScreenRotation {
    __weak __typeof__(self) weakSelf = self;
    [[NSNotificationCenter defaultCenter] addObserverForName:UIDeviceOrientationDidChangeNotification
                                                      object:nil
                                                       queue:nil
                                                  usingBlock:^(NSNotification * _Nonnull note) {
        [weakSelf handleDeviceOrientationChangeEvent];
    }];
}

//屏幕旋转后动态调整 autolayout 布局参数
- (void)handleDeviceOrientationChangeEvent {
    if (self.usesSafeAreaLayoutGuideConstraints) {
        [self.view setNeedsLayout];
        [self.view layoutIfNeeded];
        return;
    }

    UIInterfaceOrientation orientation = [UIApplication sharedApplication].statusBarOrientation;
    if (orientation == UIInterfaceOrientationPortrait || orientation == UIInterfaceOrientationPortraitUpsideDown) {
        if ([self isHairPhone]) {
            self.topConstraint.constant = 88;
        } else {
            self.topConstraint.constant = 64;
        }
        } else {
            self.topConstraint.constant = 44;
        }
    
    //very important https://www.jianshu.com/p/945502f7062e
    [self.view layoutSubviews];
    [self.view layoutIfNeeded];//立即调用更改后的布局约束,否则 AAChartView 的自适应屏幕旋转的 contentView 高度会有点问题(我找了半天才找到问题😅)
}

- (BOOL)isHairPhone {
    if (@available(iOS 11.0, *)) {
        if ([[UIApplication sharedApplication] delegate].window.safeAreaInsets.bottom > 0) {
          return true;
        }
        return false;
    } else {
        return false;
    }

}

//- (NSString*)printPrettyPrintedClickEventMessageJsonStringWithJsonObject:(id)jsonObject {
//    NSError *error = nil;
//    NSData *jsonData = [NSJSONSerialization dataWithJSONObject:jsonObject
//                                                       options:NSJSONWritingPrettyPrinted
//                                                         error:&error];
//    NSString *jsonStr =[[NSString alloc] initWithData:jsonData encoding:NSUTF8StringEncoding];
//    NSString *logPrefix = @"🖱🖱🖱🖱  user finger clicked!!!,get the clicked event series element message:";
//    NSString *eventMessage = [NSString stringWithFormat:@"%@ \n %@",
//                              logPrefix,
//                              jsonStr];
//    NSLog(@"%@",eventMessage);
//    
//    if (error) {
//        NSLog(@"❌❌❌ pretty printed JSONString with JSONObject serialization failed：%@", error);
//        return nil;
//    }
//    return jsonStr;
//}
//
//- (NSString*)printPrettyPrintedMoveOverEventMessageJsonStringWithJsonObject:(id)jsonObject {
//    NSError *error = nil;
//    NSData *jsonData = [NSJSONSerialization dataWithJSONObject:jsonObject
//                                                       options:NSJSONWritingPrettyPrinted
//                                                         error:&error];
//    NSString *jsonStr =[[NSString alloc] initWithData:jsonData encoding:NSUTF8StringEncoding];
//    NSString *logPrefix = @"👌👌👌👌  user finger moved over!!!,get the move over event series element message:";
//    NSString *eventMessage = [NSString stringWithFormat:@"%@ \n %@",
//                              logPrefix,
//                              jsonStr];
//    NSLog(@"%@",eventMessage);
//    
//    if (error) {
//        NSLog(@"❌❌❌ pretty printed JSONString with JSONObject serialization failed：%@", error);
//        return nil;
//    }
//    return jsonStr;
//}
//
//- (id)jsonObjectWithJsonString:(NSString *)string {
//    if (string && 0 != string.length) {
//        NSError *error;
//        NSData *jsonData = [string dataUsingEncoding:NSUTF8StringEncoding];
//        id jsonObjet = [NSJSONSerialization JSONObjectWithData:jsonData
//                                                       options:NSJSONReadingMutableContainers
//                                                         error:&error];
//        if (error) {
//            NSLog(@"❌❌❌ JSONObject with JSONString serialization failed：%@", error);
//            return nil;
//        }
//        return jsonObjet;
//    }
//    return nil;
//}

@end
