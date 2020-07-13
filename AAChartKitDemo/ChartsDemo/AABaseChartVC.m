//
//  AABaseViewController.m
//  AAChartKitDemo
//
//  Created by AnAn on 2020/7/5.
//  Copyright © 2020 Danny boy. All rights reserved.
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
 * StackOverflow : https://stackoverflow.com/users/7842508/codeforu
 * JianShu       : https://www.jianshu.com/u/f1e6753d4254
 * SegmentFault  : https://segmentfault.com/u/huanghunbieguan
 *
 * -------------------------------------------------------------------------------
 
 */

#import "AABaseChartVC.h"
#import "AAEasyTool.h"

@interface AABaseChartVC ()

@property (nonatomic, strong) NSLayoutConstraint *topConstraint;

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
    self.title = [NSString stringWithFormat:@"%@ chart",chartType];
}

- (void)setupNextTypeChartButton {
    UIBarButtonItem *barItem = [[UIBarButtonItem alloc] initWithTitle:@"Next Chart"
                                                                style:UIBarButtonItemStylePlain
                                                               target:self
                                                               action:@selector(monitorTap)];
    self.navigationItem.rightBarButtonItem = barItem;
}

- (void)monitorTap {
    if (self.selectedIndex == self.navigationItemTitleArr.count - 1) {
        self.title = @"❗️This is the last chart❗️";
    } else {
        self.selectedIndex = self.selectedIndex + 1;
        self.title = self.navigationItemTitleArr[self.selectedIndex];
        [self refreshChartWithChartConfiguration];
    }
}


- (void)setupChartView {
    self.aaChartView = [[AAChartView alloc]init];
    self.aaChartView.scrollEnabled = NO;
    if (@available(iOS 11.0, *)) {
        self.aaChartView.contentInsetAdjustmentBehavior = UIScrollViewContentInsetAdjustmentNever;
    } else {
        // Fallback on earlier versions
    }
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
    
    [self setupAAChartViewEventBlockHandler];
}

- (NSArray *)configureTheConstraintArrayWithSonView:(UIView *)sonView
                                       toFatherView:(UIView *)fatherView {
    CGFloat topConstraintConstant;
    // 如果statusBarFrame为CGRectZero,说明状态栏是隐藏的
    CGRect statusBarFrame = [UIApplication sharedApplication].statusBarFrame;
    BOOL istatusHiden = (statusBarFrame.size.height == 0);
    
    if ([self isHairPhone]) {
        topConstraintConstant = 88;
        if (istatusHiden == true) {
            topConstraintConstant -= 44;
        }
    } else {
        topConstraintConstant = 64;
        if (istatusHiden == true) {
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

- (void)setupAAChartViewEventBlockHandler {
    //获取图表加载完成事件
    [_aaChartView didFinishLoadHandler:^(AAChartView *aaChartView) {
        NSLog(@"🚀🚀🚀🚀 AAChartView content did finish load!!!");
    }];
    
    __weak __typeof__(self) weakSelf = self;
    //获取图表上的手指点击及滑动事件
    [_aaChartView moveOverEventHandler:^(AAChartView *aaChartView,
                                         AAMoveOverEventMessageModel *message) {
        NSDictionary *messageDic = [AAJsonConverter dictionaryWithObjectInstance:message];
        [weakSelf printPrettyPrintedJsonStringWithJsonObject:messageDic];
    }];
}

- (void)drawChartWithChartConfiguration {
    id chartConfiguration = [self chartConfigurationWithSelectedIndex:self.selectedIndex];
    if ([chartConfiguration isKindOfClass:AAChartModel.class]) {
        AAChartModel *aaChartModel = chartConfiguration;
        aaChartModel.touchEventEnabled = true;
        [self.aaChartView aa_drawChartWithChartModel:chartConfiguration];
    } else if ([chartConfiguration isKindOfClass:AAOptions.class]) {
        AAOptions *aaOptions = chartConfiguration;
        aaOptions.touchEventEnabled = true;
        [self.aaChartView aa_drawChartWithOptions:chartConfiguration];
    }
}

- (void)refreshChartWithChartConfiguration {
    id chartConfiguration = [self chartConfigurationWithSelectedIndex:self.selectedIndex];
    if ([chartConfiguration isKindOfClass:AAChartModel.class]) {
        AAChartModel *aaChartModel = chartConfiguration;
        aaChartModel.touchEventEnabled = true;
        [self.aaChartView aa_refreshChartWithChartModel:chartConfiguration];
    } else if ([chartConfiguration isKindOfClass:AAOptions.class]) {
        AAOptions *aaOptions = chartConfiguration;
        aaOptions.touchEventEnabled = true;
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

- (NSString*)printPrettyPrintedJsonStringWithJsonObject:(id)jsonObject {
    NSError *error = nil;
    NSData *jsonData = [NSJSONSerialization dataWithJSONObject:jsonObject
                                                       options:NSJSONWritingPrettyPrinted
                                                         error:&error];
    NSString *jsonStr =[[NSString alloc] initWithData:jsonData encoding:NSUTF8StringEncoding];
    NSString *logPrefix = @"👌👌👌👌  user finger moved over!!!,get the move over event series element message:";
    NSString *eventMessage = [NSString stringWithFormat:@"%@ \n %@",
                              logPrefix,
                              jsonStr];
    NSLog(@"%@",eventMessage);
    
    if (error) {
        NSLog(@"❌❌❌ pretty printed JSONString with JSONObject serialization failed：%@", error);
        return nil;
    }
    return jsonStr;
}

- (id)jsonObjectWithJsonString:(NSString *)string {
    if (string && 0 != string.length) {
        NSError *error;
        NSData *jsonData = [string dataUsingEncoding:NSUTF8StringEncoding];
        id jsonObjet = [NSJSONSerialization JSONObjectWithData:jsonData
                                                       options:NSJSONReadingMutableContainers
                                                         error:&error];
        if (error) {
            NSLog(@"❌❌❌ JSONObject with JSONString serialization failed：%@", error);
            return nil;
        }
        return jsonObjet;
    }
    return nil;
}

@end
