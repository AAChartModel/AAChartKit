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

@interface AASidebarListController : UITableViewController

@property (nonatomic, copy) NSArray<UINavigationController *> *viewControllers;
@property (nonatomic, copy) void (^onSelectViewController)(UINavigationController *viewController);

- (instancetype)initWithViewControllers:(NSArray<UINavigationController *> *)viewControllers;

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
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return self.viewControllers.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"SidebarCell" forIndexPath:indexPath];
    UINavigationController *nav = self.viewControllers[indexPath.row];
    NSString *title = nav.tabBarItem.title ?: nav.topViewController.title ?: @"";
    cell.textLabel.text = title;
    cell.imageView.image = nav.tabBarItem.image;
    return cell;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    UINavigationController *nav = self.viewControllers[indexPath.row];
    if (self.onSelectViewController) {
        self.onSelectViewController(nav);
    }
}

@end

@interface AppDelegate ()<UISplitViewControllerDelegate>

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
    return [self createSidebarSplitViewController];
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

// 创建一个 macOS 左侧侧边栏风格的 SplitViewController
- (UISplitViewController *)createSidebarSplitViewController {
    UISplitViewController *splitViewController = [[UISplitViewController alloc] initWithStyle:UISplitViewControllerStyleDoubleColumn];
    splitViewController.delegate = self;
    splitViewController.preferredDisplayMode = UISplitViewControllerDisplayModeOneBesideSecondary;
    splitViewController.preferredSplitBehavior = UISplitViewControllerSplitBehaviorTile;
    splitViewController.presentsWithGesture = YES;
    splitViewController.displayModeButtonVisibility = UISplitViewControllerDisplayModeButtonVisibilityNever;
    splitViewController.minimumPrimaryColumnWidth = 220;
    splitViewController.maximumPrimaryColumnWidth = 320;
    splitViewController.preferredPrimaryColumnWidthFraction = 0.25;
    splitViewController.primaryBackgroundStyle = UISplitViewControllerBackgroundStyleSidebar;
    
    NSMutableArray<UINavigationController *> *viewControllers = [NSMutableArray array];
    UINavigationController *firstVC = [self createFirstNavigationController];
    [viewControllers addObject:firstVC];
    
    UINavigationController *secondVC = [self createSecondNavigationController];
    [viewControllers addObject:secondVC];
    
    UINavigationController *thirdVC = [self createThirdNavigationController];
    [viewControllers addObject:thirdVC];
    
    AASidebarListController *sidebarController = [[AASidebarListController alloc] initWithViewControllers:viewControllers];
    UINavigationController *sidebarNav = [[UINavigationController alloc] initWithRootViewController:sidebarController];
    
    __weak UISplitViewController *weakSplitVC = splitViewController;
    sidebarController.onSelectViewController = ^(UINavigationController *viewController) {
        if (!weakSplitVC) { return; }
        [weakSplitVC setViewController:sidebarNav forColumn:UISplitViewControllerColumnPrimary];
        [weakSplitVC setViewController:viewController forColumn:UISplitViewControllerColumnSecondary];
        weakSplitVC.preferredDisplayMode = UISplitViewControllerDisplayModeOneBesideSecondary;
    };
    
    splitViewController.viewControllers = @[sidebarNav, firstVC];
    [sidebarController.tableView selectRowAtIndexPath:[NSIndexPath indexPathForRow:0 inSection:0]
                                             animated:NO
                                       scrollPosition:UITableViewScrollPositionNone];
    return splitViewController;
}

#pragma mark - UISplitViewControllerDelegate

- (UISplitViewControllerDisplayMode)splitViewControllerPreferredDisplayMode:(UISplitViewController *)svc {
    return UISplitViewControllerDisplayModeOneBesideSecondary;
}

- (BOOL)splitViewController:(UISplitViewController *)svc
 collapseSecondaryViewController:(UIViewController *)secondaryViewController
       ontoPrimaryViewController:(UIViewController *)primaryViewController {
    return NO;
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
