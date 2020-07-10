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

#import "AABaseViewController.h"
#import "AAEasyTool.h"

@interface AABaseViewController ()

@property (nonatomic, strong) NSLayoutConstraint *topConstraint;
@property (nonatomic, strong) NSLayoutConstraint *bottomConstraint;


@end

@implementation AABaseViewController

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
//    self.aaChartView.frame = CGRectMake(0, 0, self.view.frame.size.width, self.view.frame.size.height);
    self.aaChartView.scrollEnabled = NO;
    if (@available(iOS 11.0, *)) {
        self.aaChartView.contentInsetAdjustmentBehavior = UIScrollViewContentInsetAdjustmentNever;
    } else {
        // Fallback on earlier versions
    }
    [self.view addSubview:self.aaChartView];
    
//    AAAnimation *aaAnimation = AAAnimation.new
//    .durationSet(@1000)
//    .easingSet(AAChartAnimationEaseOutQuart);
//    [self.aaChartView aa_adaptiveScreenRotationWithAnimation:aaAnimation];
    
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
    
    if ([self isHairPhone]) {
        topConstraintConstant = 88;
    } else {
        topConstraintConstant = 64;
    }
    
    self.topConstraint =
    [NSLayoutConstraint constraintWithItem:sonView
                                 attribute:NSLayoutAttributeTop
                                 relatedBy:NSLayoutRelationEqual
                                    toItem:fatherView
                                 attribute:NSLayoutAttributeTop
                                multiplier:1.0
                                  constant:topConstraintConstant];
    
    self.bottomConstraint =
    [NSLayoutConstraint constraintWithItem:sonView
                                 attribute:NSLayoutAttributeBottom
                                 relatedBy:NSLayoutRelationEqual
                                    toItem:fatherView
                                 attribute:NSLayoutAttributeBottom
                                multiplier:1.0
                                  constant:0];
    
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
             self.bottomConstraint,
    ];
}

- (void)setupAAChartViewEventBlockHandler {
    //获取图表加载完成事件
    [_aaChartView didFinishLoadHandler:^(AAChartView *aaChartView) {
        NSLog(@"🚀🚀🚀🚀 AAChartView content did finish load!!!");
    }];
    
    //获取图表上的手指点击及滑动事件
    [_aaChartView moveOverEventHandler:^(AAChartView *aaChartView,
                                         AAMoveOverEventMessageModel *message) {
        NSDictionary *messageDic = [AAJsonConverter dictionaryWithObjectInstance:message];
        NSString *prettyPrintedMessageStr = [AAJsonConverter jsonStringWithJsonObject:messageDic];
        NSString *logPrefix = @"👌👌👌👌  user finger moved over!!!,get the move over event series element message:";
        NSString *eventMessage = [NSString stringWithFormat:@"%@ \n %@",
                                  logPrefix,
                                  prettyPrintedMessageStr];
        NSLog(@"%@",eventMessage);
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

- (void)handleDeviceOrientationChangeEvent {
    UIInterfaceOrientation orientation = [UIApplication sharedApplication].statusBarOrientation;
    if (orientation == UIInterfaceOrientationPortrait) {
        if ([self isHairPhone]) {
            self.topConstraint.constant = 88;
        } else {
            self.topConstraint.constant = 64;
        }
        self.bottomConstraint.constant = 0;
    } else {
        self.topConstraint.constant = 44;
        self.bottomConstraint.constant = 0;
    }
    
    [self.view layoutSubviews];
    [self.view layoutIfNeeded];

    AAAnimation *aaAnimation = AAAnimation.new
       .durationSet(@1000)
       .easingSet(AAChartAnimationEaseOutQuart);
    
    [self.aaChartView aa_changeChartSizeWithWidth:self.aaChartView.frame.size.width
                                  height:self.aaChartView.frame.size.height
                               animation:aaAnimation];
    
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

@end
