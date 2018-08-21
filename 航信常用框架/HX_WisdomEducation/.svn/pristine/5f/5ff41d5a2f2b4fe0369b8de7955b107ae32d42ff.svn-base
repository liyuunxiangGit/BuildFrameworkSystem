//
//  AppDelegate.m
//  HX_WisdomEducation
//
//  Created by 荣学敏 on 2018/8/13.
//  Copyright © 2018年 HX. All rights reserved.
//

#import "AppDelegate.h"


#import "GlobalFunc.h"

#import "LoginViewController.h"

@interface AppDelegate ()

@end

@implementation AppDelegate


- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {
    [UIApplication sharedApplication].statusBarStyle = UIStatusBarStyleLightContent;
    self.window = [[UIWindow alloc] initWithFrame:[[UIScreen mainScreen] bounds]];
    self.window.backgroundColor = [UIColor whiteColor];
    [self.window makeKeyAndVisible];
//    [UINavigationBar appearance].translucent = NO;
//    [[UINavigationBar appearance] setShadowImage:[UIImage new]];
//    [[UINavigationBar appearance] setBackgroundImage:[[UIImage imageNamed:@"tav_top.png"] stretchableImageWithLeftCapWidth:40 topCapHeight:0] forBarMetrics:UIBarMetricsDefault];
//    [[UINavigationBar appearance] setTitleTextAttributes:@{NSFontAttributeName : [UIFont fontWithName:@"HelveticaNeue-Bold" size:16.0],
//                                                           NSForegroundColorAttributeName :[UIColor whiteColor]
//                                                           }];
    
    NSString *appVerson = [NSString stringWithFormat:@"%@",[[NSUserDefaults standardUserDefaults] objectForKey:kIsHaveGuide]];
    NSString *newAppVerson = [[NSBundle mainBundle] objectForInfoDictionaryKey:@"CFBundleShortVersionString"];
    
    if (![appVerson isEqualToString:newAppVerson]) {//展示图
        
    }
    
    
    
//    if (![GlobalFunc getLoginStatus]) {
//        self.window.rootViewController = [[LoginViewController alloc] initWithNibName:@"LoginViewController" bundle:nil];
//    }else{
        self.window.rootViewController = [self allocInitTabbar];
//    }
    
    
    
    return YES;
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

#pragma mark - Public

-(UITabBarController*)allocInitTabbar{
    
    self.tabbarController = [[HXCustomTabbarController alloc]init];
    return self.tabbarController;
}
@end
