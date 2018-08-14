//
//  AppDelegate.m
//  Aisino_iOS_SupplyChain
//
//  Created by 荣学敏 on 2018/3/13.
//

#import "AppDelegate.h"

@interface AppDelegate ()

@end

@implementation AppDelegate


- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {
    // Override point for customization after application launch.
    [self settingLog];
    return YES;
}
#pragma mark - 日志初始化
- (void)settingLog{
//    DDTTYLogger *logger = [DDTTYLogger sharedInstance];
//
//    //    [DDLog addLogger:[DDTTYLogger sharedInstance]]; // TTY = Xcode console
//    [[DDTTYLogger sharedInstance] setColorsEnabled:YES];
    
    setenv("XcodeColors", "YES", 0);
    static const int ddLogLevel = DDLogLevelVerbose;//定义日志级别
    [DDLog addLogger:[DDTTYLogger sharedInstance]];// 初始化DDLog日志输出
    [[DDTTYLogger sharedInstance] setColorsEnabled:YES];// 启用颜色区分
    
    [[DDTTYLogger sharedInstance] setForegroundColor:[UIColor grayColor] backgroundColor:nil forFlag:DDLogFlagVerbose];
    
    [[DDTTYLogger sharedInstance] setForegroundColor:[UIColor greenColor] backgroundColor:nil forFlag:DDLogFlagDebug];
}

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
