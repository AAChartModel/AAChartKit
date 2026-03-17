//
//  AppDelegate.m
//  AAChartKit
//
//  Created by An An on 17/3/13.
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
 * -------------------------------------------------------------------------------
 * And if you want to contribute for this project, please contact me as well
 * GitHub        : https://github.com/AAChartModel
 * StackOverflow : https://stackoverflow.com/users/12302132/codeforu
 * JianShu       : https://www.jianshu.com/u/f1e6753d4254
 * SegmentFault  : https://segmentfault.com/u/huanghunbieguan
 *
 * -------------------------------------------------------------------------------
 
 */

// 来源于 Highcharts 中文网资源
/*
若介意本地js代码体积(250KB左右,工程打包压缩后实际体积远小于此)过大，可换用加载网络js代码
<script src="https://img.hcharts.cn/highcharts/highcharts.js">
</script>
<script src="https://img.hcharts.cn/highcharts/highcharts-more.js">
</script>
<script src="https://img.hcharts.cn/highcharts/modules/funnel.js">
</script>
 */



// 来源于 Highcharts 英文官网资源
/*
 若介意本地js代码体积(250KB左右,工程打包压缩后实际体积远小于此)过大，可换用加载网络js代码
<script src="https://code.highcharts.com/highcharts.js"></script>
<script src="https://code.highcharts.com/highcharts-more.js"></script>
<script src="https://code.highcharts.com/modules/funnel.js"></script>
*/

#import "AppDelegate.h"
//#import "AAChartModelListVC.h"
//#import "AAOptionsListVC.h"
//#import "AAOptionsWithJSListVC.h"
//#import "OfficialSamplesListVC.h"
//#import "AdvancedFeaturesListVC.h"
#import "MainVC.h"
#import "AAOptionsWithJSForChartEventsListVC.h"
#import "AAChartModelListVC.h"

static const CGFloat kAASidebarOuterPadding = 12.0;
static const CGFloat kAASidebarColumnSpacing = 10.0;

@interface AASidebarListController : UITableViewController

@property (nonatomic, copy) NSArray<UINavigationController *> *viewControllers;
@property (nonatomic, copy) void (^onSelectViewController)(UINavigationController *viewController);

- (instancetype)initWithViewControllers:(NSArray<UINavigationController *> *)viewControllers;
- (void)aa_setSelectedIndex:(NSInteger)index animated:(BOOL)animated notify:(BOOL)notify;

@end

@interface AASidebarListController ()
@property (nonatomic, strong, nullable) NSIndexPath *aa_selectedIndexPath;
@end

@implementation AASidebarListController

- (instancetype)initWithViewControllers:(NSArray<UINavigationController *> *)viewControllers {
    self = [super initWithStyle:UITableViewStyleInsetGrouped];
    if (self) {
        _viewControllers = [viewControllers copy];
        self.title = @"AAChartKit";
    }
    return self;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    [self.tableView registerClass:[UITableViewCell class] forCellReuseIdentifier:@"SidebarCell"];

#if TARGET_OS_MACCATALYST
    self.tableView.backgroundColor = UIColor.clearColor;
    self.tableView.separatorStyle = UITableViewCellSeparatorStyleNone;
    self.tableView.showsVerticalScrollIndicator = NO;
    self.tableView.rowHeight = 44.0;
    if (@available(iOS 15.0, *)) {
        self.tableView.sectionHeaderTopPadding = 0;
    }
    self.tableView.contentInset = UIEdgeInsetsMake(6, 0, 6, 0);
#endif
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return self.viewControllers.count;
}

- (UIColor *)aa_sidebarAccentColor {
    if (@available(iOS 13.0, *)) {
        return UIColor.systemBlueColor;
    }
    return UIColor.blueColor;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"SidebarCell" forIndexPath:indexPath];
    UINavigationController *nav = self.viewControllers[indexPath.row];
    NSString *title = nav.tabBarItem.title ?: nav.topViewController.title ?: @"";
    UIImage *icon = nav.tabBarItem.image;
    BOOL isSelected = [indexPath isEqual:self.aa_selectedIndexPath];

#if TARGET_OS_MACCATALYST
    cell.backgroundColor = UIColor.clearColor;
    cell.contentView.backgroundColor = UIColor.clearColor;
    cell.selectionStyle = UITableViewCellSelectionStyleDefault;
    cell.accessoryType = UITableViewCellAccessoryNone;
    cell.layoutMargins = UIEdgeInsetsMake(0, 10, 0, 10);

    if (@available(iOS 14.0, *)) {
        UIListContentConfiguration *content = [UIListContentConfiguration sidebarCellConfiguration];
        content.text = title;
        content.image = icon;
        content.imageToTextPadding = 10.0;
        content.textProperties.font = [UIFont systemFontOfSize:13 weight:UIFontWeightSemibold];
        content.textProperties.color = isSelected ? [self aa_sidebarAccentColor] : UIColor.labelColor;
        content.imageProperties.tintColor = isSelected ? [self aa_sidebarAccentColor] : UIColor.secondaryLabelColor;
        content.imageProperties.preferredSymbolConfiguration = [UIImageSymbolConfiguration configurationWithPointSize:15 weight:UIImageSymbolWeightSemibold];
        content.directionalLayoutMargins = NSDirectionalEdgeInsetsMake(8, 12, 8, 12);
        cell.contentConfiguration = content;
    } else {
        cell.textLabel.text = title;
        cell.textLabel.font = [UIFont systemFontOfSize:13 weight:UIFontWeightSemibold];
        cell.textLabel.textColor = isSelected ? [self aa_sidebarAccentColor] : UIColor.blackColor;
        cell.imageView.image = [icon imageWithRenderingMode:UIImageRenderingModeAlwaysTemplate];
        cell.imageView.tintColor = isSelected ? [self aa_sidebarAccentColor] : UIColor.grayColor;
    }

    UIVisualEffect *selectionBlur = nil;
    if (@available(iOS 13.0, *)) {
        selectionBlur = [UIBlurEffect effectWithStyle:UIBlurEffectStyleSystemUltraThinMaterial];
    } else {
        selectionBlur = [UIBlurEffect effectWithStyle:UIBlurEffectStyleLight];
    }
    UIView *selectedBackgroundView = [[UIView alloc] initWithFrame:CGRectZero];
    selectedBackgroundView.backgroundColor = UIColor.clearColor;

    UIVisualEffectView *selectedView = [[UIVisualEffectView alloc] initWithEffect:selectionBlur];
    selectedView.translatesAutoresizingMaskIntoConstraints = NO;
    selectedView.layer.cornerRadius = 12.0;
    if (@available(iOS 13.0, *)) {
        selectedView.layer.cornerCurve = kCACornerCurveContinuous;
    }
    selectedView.clipsToBounds = YES;
    [selectedBackgroundView addSubview:selectedView];
    [NSLayoutConstraint activateConstraints:@[
        [selectedView.leadingAnchor constraintEqualToAnchor:selectedBackgroundView.leadingAnchor constant:6.0],
        [selectedView.trailingAnchor constraintEqualToAnchor:selectedBackgroundView.trailingAnchor constant:-6.0],
        [selectedView.topAnchor constraintEqualToAnchor:selectedBackgroundView.topAnchor constant:3.0],
        [selectedView.bottomAnchor constraintEqualToAnchor:selectedBackgroundView.bottomAnchor constant:-3.0],
    ]];
    selectedView.alpha = isSelected ? 1.0 : 0.0;

    UIView *strokeView = [[UIView alloc] initWithFrame:CGRectZero];
    strokeView.translatesAutoresizingMaskIntoConstraints = NO;
    strokeView.backgroundColor = UIColor.clearColor;
    strokeView.layer.cornerRadius = 12.0;
    if (@available(iOS 13.0, *)) {
        strokeView.layer.cornerCurve = kCACornerCurveContinuous;
        strokeView.layer.borderColor = [UIColor.separatorColor colorWithAlphaComponent:0.35].CGColor;
    } else {
        strokeView.layer.borderColor = [UIColor.lightGrayColor colorWithAlphaComponent:0.35].CGColor;
    }
    strokeView.layer.borderWidth = 0.6;
    [selectedView.contentView addSubview:strokeView];
    [NSLayoutConstraint activateConstraints:@[
        [strokeView.leadingAnchor constraintEqualToAnchor:selectedView.contentView.leadingAnchor],
        [strokeView.trailingAnchor constraintEqualToAnchor:selectedView.contentView.trailingAnchor],
        [strokeView.topAnchor constraintEqualToAnchor:selectedView.contentView.topAnchor],
        [strokeView.bottomAnchor constraintEqualToAnchor:selectedView.contentView.bottomAnchor],
    ]];

    UIView *highlightView = [[UIView alloc] initWithFrame:CGRectZero];
    highlightView.translatesAutoresizingMaskIntoConstraints = NO;
    highlightView.backgroundColor = [UIColor.whiteColor colorWithAlphaComponent:0.06];
    highlightView.userInteractionEnabled = NO;
    [selectedView.contentView addSubview:highlightView];
    [NSLayoutConstraint activateConstraints:@[
        [highlightView.leadingAnchor constraintEqualToAnchor:selectedView.contentView.leadingAnchor],
        [highlightView.trailingAnchor constraintEqualToAnchor:selectedView.contentView.trailingAnchor],
        [highlightView.topAnchor constraintEqualToAnchor:selectedView.contentView.topAnchor],
        [highlightView.heightAnchor constraintEqualToAnchor:selectedView.contentView.heightAnchor multiplier:0.45],
    ]];

    cell.selectedBackgroundView = selectedBackgroundView;
    [cell setSelected:isSelected animated:NO];
#else
    cell.textLabel.text = title;
    cell.imageView.image = icon;
#endif

    return cell;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
#if TARGET_OS_MACCATALYST
    NSIndexPath *previous = self.aa_selectedIndexPath;
    self.aa_selectedIndexPath = indexPath;
    if (previous && ![previous isEqual:indexPath]) {
        [tableView reloadRowsAtIndexPaths:@[previous] withRowAnimation:UITableViewRowAnimationNone];
    }
    [tableView reloadRowsAtIndexPaths:@[indexPath] withRowAnimation:UITableViewRowAnimationNone];
#endif
    UINavigationController *nav = self.viewControllers[indexPath.row];
    if (self.onSelectViewController) {
        self.onSelectViewController(nav);
    }
}

- (void)aa_setSelectedIndex:(NSInteger)index animated:(BOOL)animated notify:(BOOL)notify {
    if (index < 0 || index >= (NSInteger)self.viewControllers.count) { return; }
    NSIndexPath *indexPath = [NSIndexPath indexPathForRow:index inSection:0];
    [self.tableView selectRowAtIndexPath:indexPath animated:animated scrollPosition:UITableViewScrollPositionNone];
#if TARGET_OS_MACCATALYST
    self.aa_selectedIndexPath = indexPath;
#endif
    if (!notify) { return; }
    UINavigationController *nav = self.viewControllers[index];
    if (self.onSelectViewController) {
        self.onSelectViewController(nav);
    }
}

@end

@interface AASidebarContainerController : UIViewController <UINavigationControllerDelegate>

- (instancetype)initWithSidebarController:(AASidebarListController *)sidebarController NS_DESIGNATED_INITIALIZER;
- (instancetype)init NS_UNAVAILABLE;
- (instancetype)initWithCoder:(NSCoder *)coder NS_UNAVAILABLE;

@end

@interface AASidebarContainerController ()

@property (nonatomic, strong) AASidebarListController *sidebarController;
@property (nonatomic, strong) UINavigationController *sidebarNavigationController;
@property (nonatomic, strong, nullable) UINavigationController *contentNavigationController;
@property (nonatomic, strong) UIView *sidebarHostView;
@property (nonatomic, strong) UIView *sidebarShadowWrapperView;
@property (nonatomic, strong) NSLayoutConstraint *sidebarWidthConstraint;
@property (nonatomic, strong) UIVisualEffectView *sidebarBlurView;
@property (nonatomic, strong) UIView *sidebarOverlayView;
@property (nonatomic, strong) CAGradientLayer *sidebarGradientLayer;
@property (nonatomic, strong) UIView *sidebarDividerView;
@property (nonatomic, strong) NSLayoutConstraint *contentLeadingConstraint;
@property (nonatomic, assign) BOOL sidebarHidden;
@property (nonatomic, assign) CGFloat lastExpandedSidebarWidth;

@end

@implementation AASidebarContainerController

- (instancetype)initWithSidebarController:(AASidebarListController *)sidebarController {
    self = [super initWithNibName:nil bundle:nil];
    if (self) {
        _sidebarController = sidebarController;
        _sidebarNavigationController = [[UINavigationController alloc] initWithRootViewController:sidebarController];
        _lastExpandedSidebarWidth = 240;
    }
    return self;
}

- (void)viewDidLoad {
    [super viewDidLoad];

    if (@available(iOS 13.0, *)) {
        self.view.backgroundColor = UIColor.systemBackgroundColor;
    } else {
        self.view.backgroundColor = UIColor.whiteColor;
    }

    self.sidebarHostView = [[UIView alloc] initWithFrame:CGRectZero];
    self.sidebarHostView.translatesAutoresizingMaskIntoConstraints = NO;
    self.sidebarHostView.clipsToBounds = YES;
    self.sidebarHostView.layer.cornerRadius = 18.0;
    if (@available(iOS 13.0, *)) {
        self.sidebarHostView.layer.cornerCurve = kCACornerCurveContinuous;
    }
    if (@available(iOS 13.0, *)) {
        self.sidebarHostView.layer.borderColor = [UIColor.separatorColor colorWithAlphaComponent:0.20].CGColor;
    } else {
        self.sidebarHostView.layer.borderColor = [UIColor.lightGrayColor colorWithAlphaComponent:0.20].CGColor;
    }
    self.sidebarHostView.layer.borderWidth = 0.5;

    UIVisualEffect *blurEffect = nil;
    if (@available(iOS 13.0, *)) {
        blurEffect = [UIBlurEffect effectWithStyle:UIBlurEffectStyleSystemUltraThinMaterial];
    } else {
        blurEffect = [UIBlurEffect effectWithStyle:UIBlurEffectStyleLight];
    }
    self.sidebarBlurView = [[UIVisualEffectView alloc] initWithEffect:blurEffect];
    self.sidebarBlurView.translatesAutoresizingMaskIntoConstraints = NO;

    self.sidebarOverlayView = [[UIView alloc] initWithFrame:CGRectZero];
    self.sidebarOverlayView.translatesAutoresizingMaskIntoConstraints = NO;
    self.sidebarOverlayView.backgroundColor = [UIColor.whiteColor colorWithAlphaComponent:0.02];
    self.sidebarOverlayView.userInteractionEnabled = NO;

    self.sidebarGradientLayer = [CAGradientLayer layer];
    self.sidebarGradientLayer.colors = @[
        (__bridge id)[UIColor.whiteColor colorWithAlphaComponent:0.08].CGColor,
        (__bridge id)[UIColor.whiteColor colorWithAlphaComponent:0.005].CGColor,
        (__bridge id)[UIColor.clearColor CGColor],
    ];
    self.sidebarGradientLayer.locations = @[@0.0, @0.45, @1.0];
    self.sidebarGradientLayer.startPoint = CGPointMake(0.0, 0.0);
    self.sidebarGradientLayer.endPoint = CGPointMake(1.0, 1.0);
    [self.sidebarOverlayView.layer insertSublayer:self.sidebarGradientLayer atIndex:0];

    // Use a wrapper for shadow so we can keep rounded corners (clipsToBounds) on the host.
    self.sidebarShadowWrapperView = [[UIView alloc] initWithFrame:CGRectZero];
    self.sidebarShadowWrapperView.translatesAutoresizingMaskIntoConstraints = NO;
    self.sidebarShadowWrapperView.backgroundColor = UIColor.clearColor;
    self.sidebarShadowWrapperView.layer.shadowColor = [UIColor.blackColor colorWithAlphaComponent:0.12].CGColor;
    self.sidebarShadowWrapperView.layer.shadowOpacity = 1.0;
    self.sidebarShadowWrapperView.layer.shadowRadius = 14.0;
    self.sidebarShadowWrapperView.layer.shadowOffset = CGSizeMake(0, 6);
    if (@available(iOS 13.0, *)) {
        self.sidebarShadowWrapperView.layer.cornerRadius = self.sidebarHostView.layer.cornerRadius;
        self.sidebarShadowWrapperView.layer.cornerCurve = kCACornerCurveContinuous;
    } else {
        self.sidebarShadowWrapperView.layer.cornerRadius = self.sidebarHostView.layer.cornerRadius;
    }

    [self.view addSubview:self.sidebarShadowWrapperView];
    [self.sidebarShadowWrapperView addSubview:self.sidebarHostView];
    [self.sidebarHostView addSubview:self.sidebarBlurView];
    [self.sidebarHostView addSubview:self.sidebarOverlayView];

    [self addChildViewController:self.sidebarNavigationController];
    [self.sidebarHostView addSubview:self.sidebarNavigationController.view];
    [self.sidebarNavigationController didMoveToParentViewController:self];

    self.sidebarNavigationController.view.translatesAutoresizingMaskIntoConstraints = NO;
    self.sidebarNavigationController.view.backgroundColor = UIColor.clearColor;

    if (@available(iOS 13.0, *)) {
        UINavigationBarAppearance *appearance = [[UINavigationBarAppearance alloc] init];
        [appearance configureWithTransparentBackground];
        appearance.backgroundEffect = [UIBlurEffect effectWithStyle:UIBlurEffectStyleSystemUltraThinMaterial];
        appearance.backgroundColor = [UIColor.clearColor colorWithAlphaComponent:0.0];
        appearance.shadowColor = [UIColor.clearColor colorWithAlphaComponent:0.0];
        appearance.titleTextAttributes = @{
            NSForegroundColorAttributeName : UIColor.labelColor,
            NSFontAttributeName : [UIFont systemFontOfSize:16 weight:UIFontWeightSemibold],
        };
        self.sidebarNavigationController.navigationBar.standardAppearance = appearance;
        self.sidebarNavigationController.navigationBar.scrollEdgeAppearance = appearance;
        self.sidebarNavigationController.navigationBar.compactAppearance = appearance;
        self.sidebarNavigationController.navigationBar.tintColor = UIColor.labelColor;
        self.sidebarNavigationController.navigationBar.translucent = YES;
        self.sidebarNavigationController.navigationBar.prefersLargeTitles = NO;
    }

    UILayoutGuide *safeArea = self.view.safeAreaLayoutGuide;
    [NSLayoutConstraint activateConstraints:@[
        [self.sidebarShadowWrapperView.leadingAnchor constraintEqualToAnchor:safeArea.leadingAnchor constant:kAASidebarOuterPadding],
        [self.sidebarShadowWrapperView.topAnchor constraintEqualToAnchor:safeArea.topAnchor constant:kAASidebarOuterPadding],
        [self.sidebarShadowWrapperView.bottomAnchor constraintEqualToAnchor:safeArea.bottomAnchor constant:-kAASidebarOuterPadding],
    ]];

    self.sidebarWidthConstraint = [self.sidebarHostView.widthAnchor constraintEqualToConstant:240];
    self.sidebarWidthConstraint.active = YES;

    [NSLayoutConstraint activateConstraints:@[
        [self.sidebarHostView.leadingAnchor constraintEqualToAnchor:self.sidebarShadowWrapperView.leadingAnchor],
        [self.sidebarHostView.trailingAnchor constraintEqualToAnchor:self.sidebarShadowWrapperView.trailingAnchor],
        [self.sidebarHostView.topAnchor constraintEqualToAnchor:self.sidebarShadowWrapperView.topAnchor],
        [self.sidebarHostView.bottomAnchor constraintEqualToAnchor:self.sidebarShadowWrapperView.bottomAnchor],

        [self.sidebarBlurView.leadingAnchor constraintEqualToAnchor:self.sidebarHostView.leadingAnchor],
        [self.sidebarBlurView.trailingAnchor constraintEqualToAnchor:self.sidebarHostView.trailingAnchor],
        [self.sidebarBlurView.topAnchor constraintEqualToAnchor:self.sidebarHostView.topAnchor],
        [self.sidebarBlurView.bottomAnchor constraintEqualToAnchor:self.sidebarHostView.bottomAnchor],

        [self.sidebarOverlayView.leadingAnchor constraintEqualToAnchor:self.sidebarHostView.leadingAnchor],
        [self.sidebarOverlayView.trailingAnchor constraintEqualToAnchor:self.sidebarHostView.trailingAnchor],
        [self.sidebarOverlayView.topAnchor constraintEqualToAnchor:self.sidebarHostView.topAnchor],
        [self.sidebarOverlayView.bottomAnchor constraintEqualToAnchor:self.sidebarHostView.bottomAnchor],

        [self.sidebarNavigationController.view.leadingAnchor constraintEqualToAnchor:self.sidebarHostView.leadingAnchor],
        [self.sidebarNavigationController.view.trailingAnchor constraintEqualToAnchor:self.sidebarHostView.trailingAnchor],
        [self.sidebarNavigationController.view.topAnchor constraintEqualToAnchor:self.sidebarHostView.topAnchor],
        [self.sidebarNavigationController.view.bottomAnchor constraintEqualToAnchor:self.sidebarHostView.bottomAnchor],
    ]];

    __weak __typeof(self) weakSelf = self;
    self.sidebarController.onSelectViewController = ^(UINavigationController *viewController) {
        [weakSelf aa_setContentNavigationController:viewController];
    };

    [self.sidebarController loadViewIfNeeded];
    [self.sidebarController aa_setSelectedIndex:0 animated:NO notify:YES];

    self.sidebarDividerView = [[UIView alloc] initWithFrame:CGRectZero];
    self.sidebarDividerView.translatesAutoresizingMaskIntoConstraints = NO;
    if (@available(iOS 13.0, *)) {
        self.sidebarDividerView.backgroundColor = [UIColor.separatorColor colorWithAlphaComponent:0.35];
    } else {
        self.sidebarDividerView.backgroundColor = [UIColor.lightGrayColor colorWithAlphaComponent:0.35];
    }
    [self.view addSubview:self.sidebarDividerView];
    [NSLayoutConstraint activateConstraints:@[
        [self.sidebarDividerView.leadingAnchor constraintEqualToAnchor:self.sidebarHostView.trailingAnchor constant:kAASidebarColumnSpacing / 2.0],
        [self.sidebarDividerView.widthAnchor constraintEqualToConstant:0.5],
        [self.sidebarDividerView.topAnchor constraintEqualToAnchor:safeArea.topAnchor constant:kAASidebarOuterPadding],
        [self.sidebarDividerView.bottomAnchor constraintEqualToAnchor:safeArea.bottomAnchor constant:-kAASidebarOuterPadding],
    ]];
}

- (void)viewDidLayoutSubviews {
    [super viewDidLayoutSubviews];

    CGFloat viewWidth = self.view.bounds.size.width;
    if (viewWidth <= 0) { return; }

    CGFloat desiredWidth = viewWidth * 0.25;
    desiredWidth = MAX(220, MIN(desiredWidth, 320));
    if (!self.sidebarHidden) {
        self.lastExpandedSidebarWidth = desiredWidth;
        if (fabs(self.sidebarWidthConstraint.constant - desiredWidth) > 0.5) {
            self.sidebarWidthConstraint.constant = desiredWidth;
        }
    }

    self.sidebarGradientLayer.frame = self.sidebarOverlayView.bounds;
}

- (UIBarButtonItem *)aa_sidebarToggleBarButtonItem {
    UIImage *image = nil;
    if (@available(iOS 13.0, *)) {
        image = [UIImage systemImageNamed:@"sidebar.left"];
        if (!image) {
            image = [UIImage systemImageNamed:@"line.3.horizontal"];
        }
    }

    UIBarButtonItem *item = nil;
    if (image) {
        item = [[UIBarButtonItem alloc] initWithImage:image style:UIBarButtonItemStylePlain target:self action:@selector(aa_toggleSidebar)];
    } else {
        item = [[UIBarButtonItem alloc] initWithTitle:@"☰" style:UIBarButtonItemStylePlain target:self action:@selector(aa_toggleSidebar)];
    }
    item.accessibilityLabel = @"Toggle Sidebar";
    return item;
}

- (void)aa_toggleSidebar {
    [self aa_setSidebarHidden:!self.sidebarHidden animated:YES];
}

- (void)aa_setSidebarHidden:(BOOL)hidden animated:(BOOL)animated {
    if (self.sidebarHidden == hidden) { return; }
    self.sidebarHidden = hidden;

    CGFloat targetWidth = hidden ? 0.0 : MAX(200.0, self.lastExpandedSidebarWidth);
    CGFloat targetAlpha = hidden ? 0.0 : 1.0;
    CGFloat targetDividerAlpha = hidden ? 0.0 : 1.0;
    CGFloat targetLeadingConstant = hidden ? 0.0 : (kAASidebarOuterPadding + kAASidebarColumnSpacing);

    self.sidebarWidthConstraint.constant = targetWidth;
    self.contentLeadingConstraint.constant = targetLeadingConstant;

    void (^animations)(void) = ^{
        self.sidebarShadowWrapperView.alpha = targetAlpha;
        self.sidebarDividerView.alpha = targetDividerAlpha;
        [self.view layoutIfNeeded];
    };

    void (^completion)(BOOL) = ^(__unused BOOL finished) {
        self.sidebarShadowWrapperView.hidden = hidden;
        self.sidebarDividerView.hidden = hidden;
        self.sidebarHostView.userInteractionEnabled = !hidden;
    };

    if (!animated) {
        animations();
        completion(YES);
        return;
    }

    if (!hidden) {
        self.sidebarShadowWrapperView.hidden = NO;
        self.sidebarDividerView.hidden = NO;
    }

    [UIView animateWithDuration:0.22
                          delay:0
                        options:UIViewAnimationOptionCurveEaseInOut | UIViewAnimationOptionBeginFromCurrentState
                     animations:animations
                     completion:completion];
}

- (void)aa_setContentNavigationController:(UINavigationController *)viewController {
    if (self.contentNavigationController == viewController) { return; }

    if (self.contentNavigationController) {
        self.contentNavigationController.delegate = nil;
        [self.contentNavigationController willMoveToParentViewController:nil];
        [self.contentNavigationController.view removeFromSuperview];
        [self.contentNavigationController removeFromParentViewController];
    }

    self.contentNavigationController = viewController;

    if (self.contentNavigationController.parentViewController) {
        [self.contentNavigationController willMoveToParentViewController:nil];
        [self.contentNavigationController.view removeFromSuperview];
        [self.contentNavigationController removeFromParentViewController];
    }

    [self addChildViewController:self.contentNavigationController];
    [self.view addSubview:self.contentNavigationController.view];
    [self.contentNavigationController didMoveToParentViewController:self];

    self.contentNavigationController.view.translatesAutoresizingMaskIntoConstraints = NO;

    UILayoutGuide *safeArea = self.view.safeAreaLayoutGuide;
    self.contentLeadingConstraint = [self.contentNavigationController.view.leadingAnchor constraintEqualToAnchor:self.sidebarHostView.trailingAnchor constant:(kAASidebarOuterPadding + kAASidebarColumnSpacing)];
    [NSLayoutConstraint activateConstraints:@[
        self.contentLeadingConstraint,
        [self.contentNavigationController.view.topAnchor constraintEqualToAnchor:safeArea.topAnchor constant:kAASidebarOuterPadding],
        [self.contentNavigationController.view.bottomAnchor constraintEqualToAnchor:safeArea.bottomAnchor constant:-kAASidebarOuterPadding],
        [self.contentNavigationController.view.trailingAnchor constraintEqualToAnchor:safeArea.trailingAnchor constant:-kAASidebarOuterPadding],
    ]];

    self.contentNavigationController.delegate = (id<UINavigationControllerDelegate>)self;
    UIViewController *topVC = self.contentNavigationController.topViewController;
    topVC.navigationItem.leftItemsSupplementBackButton = YES;
    topVC.navigationItem.leftBarButtonItem = [self aa_sidebarToggleBarButtonItem];
}

#pragma mark - UINavigationControllerDelegate

- (void)navigationController:(UINavigationController *)navigationController
      willShowViewController:(UIViewController *)viewController
                    animated:(BOOL)animated {
    (void)animated;
    if (navigationController != self.contentNavigationController) { return; }
    viewController.navigationItem.leftItemsSupplementBackButton = YES;
    viewController.navigationItem.leftBarButtonItem = [self aa_sidebarToggleBarButtonItem];
}

@end

@interface AppDelegate ()
@end

@implementation AppDelegate


- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {
    // Override point for customization after application launch.
    
    // 创建 UIWindow 实例
    self.window = [[UIWindow alloc] initWithFrame:[UIScreen mainScreen].bounds];
    
    // 创建根视图控制器
    UIViewController *rootViewController = [self createRootViewController];
    
    // 将根视图控制器设置为窗口
    self.window.rootViewController = rootViewController;
    
    // 设置窗口可见
    [self.window makeKeyAndVisible];
    
    return YES;
}

- (UIViewController *)createRootViewController {
#if TARGET_OS_MACCATALYST
    return [self createSidebarContainerController];
#else
    return [self createTabBarController];
#endif
}

// 创建一个 UITabBarController
- (UITabBarController *)createTabBarController {
    // 创建一个 UITabBarController
    UITabBarController *tabBarController = [[UITabBarController alloc] init];
    
    // 创建一个数组来保存所有的视图控制器
    NSMutableArray<UINavigationController *> *viewControllers = [NSMutableArray array];
    
    UINavigationController *firstVC = [self createFirstNavigationController];
    [viewControllers addObject:firstVC];
    
    UINavigationController *secondVC = [self createSecondNavigationController];
    [viewControllers addObject:secondVC];
    
    UINavigationController *thirdVC = [self createThirdNavigationController];
    [viewControllers addObject:thirdVC];
    
//    UINavigationController *fourthVC = [self createFourthNavigationController];
//    [viewControllers addObject:fourthVC];
//    
//    UINavigationController *fifthVC = [self createFifthNavigationController];
//    [viewControllers addObject:fifthVC];
    
    // 将数组赋值给 UITabBarController
    tabBarController.viewControllers = viewControllers;
    
    // 返回 UITabBarController
    return tabBarController;
}

// 创建一个“永不遮挡”的自定义左右分栏容器（不用 UISplitViewController，避免 overlay/collapse 行为）
- (UIViewController *)createSidebarContainerController {
    NSMutableArray<UINavigationController *> *navigationControllers = [NSMutableArray array];
    [navigationControllers addObject:[self createFirstNavigationController]];
    [navigationControllers addObject:[self createSecondNavigationController]];
    [navigationControllers addObject:[self createThirdNavigationController]];

    AASidebarListController *sidebarController = [[AASidebarListController alloc] initWithViewControllers:navigationControllers];
    AASidebarContainerController *containerController = [[AASidebarContainerController alloc] initWithSidebarController:sidebarController];
    return containerController;
}

- (UIViewController *)createFirstViewController {
    // 创建第一个视图控制器
    MainVC *firstVC = [[MainVC alloc] init];
    firstVC.tabBarItem = [[UITabBarItem alloc] initWithTabBarSystemItem:UITabBarSystemItemBookmarks tag:0];
    
    // 在这里添加第一个视图控制器的其他配置
    
    return firstVC;
}

- (UIViewController *)createSecondViewController {
    // 创建第二个视图控制器
    AAOptionsWithJSForChartEventsListVC *secondVC = [[AAOptionsWithJSForChartEventsListVC alloc] init];
    secondVC.tabBarItem = [[UITabBarItem alloc] initWithTabBarSystemItem:UITabBarSystemItemHistory tag:1];
    
    // 在这里添加第二个视图控制器的其他配置
    
    return secondVC;
}


- (UIViewController *)createThirdViewController {
    // 创建第三个视图控制器
    AAChartModelListVC *thirdVC = [[AAChartModelListVC alloc] init];
    thirdVC.tabBarItem = [[UITabBarItem alloc] initWithTabBarSystemItem:UITabBarSystemItemFavorites tag:2];
    
    // 在这里添加第三个视图控制器的其他配置
    
    return thirdVC;
}

/*
- (UIViewController *)createFourthViewController {
    // 创建第四个视图控制器
    OfficialSamplesListVC *fourthVC = [[OfficialSamplesListVC alloc] init];
    fourthVC.tabBarItem = [[UITabBarItem alloc] initWithTabBarSystemItem:UITabBarSystemItemFavorites tag:3];
    
    // 在这里添加第四个视图控制器的其他配置
    
    return fourthVC;
}

- (UIViewController *)createFifthViewController {
    // 创建第五个视图控制器
    AdvancedFeaturesListVC *fifthVC = [[AdvancedFeaturesListVC alloc] init];
    fifthVC.tabBarItem = [[UITabBarItem alloc] initWithTabBarSystemItem:UITabBarSystemItemFavorites tag:4];
    
    // 在这里添加第五个视图控制器的其他配置
    
    return fifthVC;
}
 */

// 创建导航控制器，并将第一个视图控制器设置为根视图控制器
- (UINavigationController *)createFirstNavigationController {
    UIViewController *firstViewController = [self createFirstViewController];
    UINavigationController *navigationController = [[UINavigationController alloc] initWithRootViewController:firstViewController];
    navigationController.tabBarItem = firstViewController.tabBarItem;
    return navigationController;
}

// 创建导航控制器，并将第二个视图控制器设置为根视图控制器
- (UINavigationController *)createSecondNavigationController {
    UIViewController *secondViewController = [self createSecondViewController];
    UINavigationController *navigationController = [[UINavigationController alloc] initWithRootViewController:secondViewController];
    navigationController.tabBarItem = secondViewController.tabBarItem;
    return navigationController;
}


// 创建导航控制器，并将第三个视图控制器设置为根视图控制器
- (UINavigationController *)createThirdNavigationController {
    UIViewController *thirdViewController = [self createThirdViewController];
    UINavigationController *navigationController = [[UINavigationController alloc] initWithRootViewController:thirdViewController];
    navigationController.tabBarItem = thirdViewController.tabBarItem;
    return navigationController;
}

/*
// 创建导航控制器，并将第四个视图控制器设置为根视图控制器
- (UINavigationController *)createFourthNavigationController {
    OfficialSamplesListVC *fourthViewController = [self createFourthViewController];
    UINavigationController *navigationController = [[UINavigationController alloc] initWithRootViewController:fourthViewController];
    return navigationController;
}

// 创建导航控制器，并将第五个视图控制器设置为根视图控制器
- (UINavigationController *)createFifthNavigationController {
    AdvancedFeaturesListVC *fifthViewController = [self createFifthViewController];
    UINavigationController *navigationController = [[UINavigationController alloc] initWithRootViewController:fifthViewController];
    return navigationController;
}
*/

- (void)applicationWillResignActive:(UIApplication *)application {
    // Sent when the application is about to move from active to inactive state. This can occur for certain types of temporary interruptions (such as an incoming phone call or SMS message) or when the user quits the application and it begins the transition to the background state.
    // Use this method to pause ongoing tasks, disable timers, and invalidate graphics rendering callbacks. Games should use this method to pause the game.
}


- (void)applicationDidEnterBackground:(UIApplication *)application {
    // Use this method to release shared resources, save user data, invalidate timers, and store enough application state information to restore your application to its current state in case it is terminated later.
    // If your application supports background execution, this method is called instead of applicationWillTerminate: when the user quits.
}


- (void)applicationWillEnterForeground:(UIApplication *)application {
    // Called as part of the transition from the background to the active state; here you can undo many of the changes made on entering the background.
}


- (void)applicationDidBecomeActive:(UIApplication *)application {
    // Restart any tasks that were paused (or not yet started) while the application was inactive. If the application was previously in the background, optionally refresh the user interface.
}


- (void)applicationWillTerminate:(UIApplication *)application {
    // Called when the application is about to terminate. Save data if appropriate. See also applicationDidEnterBackground:.
}


@end
