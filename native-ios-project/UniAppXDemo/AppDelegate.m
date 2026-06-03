//
//  AppDelegate.m
//  UniAppXDemo
//
//  Created by wangzhitong on 2024/6/27.
//

#import "AppDelegate.h"
#import "UniAppX-Swift.h"
@interface AppDelegate ()

@end

@implementation AppDelegate

- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {
    // 1. 创建原生壳工程的导航容器，后续原生页面使用同一个 navigationController push。
    UIViewController *rootViewController = [[UIViewController alloc] init];
    rootViewController.view.backgroundColor = UIColor.whiteColor;
    UINavigationController *navigationController = [[UINavigationController alloc] initWithRootViewController:rootViewController];
    navigationController.navigationBarHidden = YES;

    // 2. 创建主窗口。这里不再进入原生 Demo 测试页，启动后直接进入 uni-app-x。
    self.window = [[UIWindow alloc] initWithFrame:UIScreen.mainScreen.bounds];
    self.window.rootViewController = navigationController;
    [self.window makeKeyAndVisible];

    // 3. 初始化并转发启动事件给 uni-app-x SDK。
    [UniAppBridge applicationDidFinishLaunchingWithOptions:application :launchOptions];

    // 4. 启动 uni-app-x 应用资源。
    [UniAppBridge startUniAppXWithRootViewController:rootViewController];
    return YES;
}

#pragma mark - UniAppX SDK lifecycle forwarding

- (void)applicationDidBecomeActive:(UIApplication *)application{
    [UniAppBridge applicationDidBecomeActive:application];
}

- (void)applicationDidEnterBackground:(UIApplication *)application{
    [UniAppBridge applicationDidEnterBackground:application];
}
- (void)applicationWillEnterForeground:(UIApplication *)application{
    [UniAppBridge applicationWillEnterForeground:application];
}
- (void)applicationWillResignActive:(UIApplication *)application{
    [UniAppBridge applicationWillResignActive:application];
}

- (BOOL)application:(UIApplication *)app openURL:(NSURL *)url options:(NSDictionary<UIApplicationOpenURLOptionsKey,id> *)options{
    [UniAppBridge applicationOpenURLOptions:app :url :options];
    return YES;
}

- (BOOL)application:(UIApplication *)application continueUserActivity:(NSUserActivity *)userActivity restorationHandler:(void (^)(NSArray<id<UIUserActivityRestoring>> * _Nullable))restorationHandler{
    [UniAppBridge applicationContinueUserActivityRestorationHandler:application :userActivity :restorationHandler];
    return YES;
}

#pragma mark - Remote notification forwarding

- (void)application:(UIApplication *)application didRegisterForRemoteNotificationsWithDeviceToken:(NSData *)deviceToken{
    [UniAppBridge didRegisterForRemoteNotifications:deviceToken];
}
- (void)application:(UIApplication *)application didFailToRegisterForRemoteNotificationsWithError:(NSError *)error{
    [UniAppBridge didFailToRegisterForRemoteNotifications:error];
}

- (void)application:(UIApplication *)application didReceiveRemoteNotification:(NSDictionary *)userInfo fetchCompletionHandler:(void (^)(UIBackgroundFetchResult))completionHandler{
    [UniAppBridge applicationDidReceiveRemoteNotificationCompletionHandler:application :userInfo :completionHandler];
}


@end
