//
//  HXCustomTabbarController.m
//  HX_WisdomPC
//
//  Created by liuqiang on 2018/5/24.
//  Copyright © 2018年 liuqiang. All rights reserved.
//

#import "HXCustomTabbarController.h"
//#import "MainViewController.h"
#import "AppDelegate.h"
//#import "ActivityViewController.h"
//#import "OnlineEduvationTypeVC.h"
//#import "MyViewController.h"
@interface HXCustomTabbarController ()<UIAlertViewDelegate>

@end

@implementation HXCustomTabbarController
{
    
}

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    //获取未读消息数，此时并没有把self注册为SDK的delegate，读取出的未读数是上次退出程序时的
    //    [self didUnreadMessagesCountChanged];
    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(setupUntreatedApplyCount) name:@"setupUntreatedApplyCount" object:nil];
    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(setupUnreadMessageCount) name:@"setupUnreadMessageCount" object:nil];
    
    [self allocInitTabbar];
    
    [self setupUnreadMessageCount];
    [self setupUntreatedApplyCount];
    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}



-(void)allocInitTabbar{
    
    [[UINavigationBar appearance] setBarTintColor:[UIColor whiteColor]];
    [[UINavigationBar appearance] setTitleTextAttributes:@{NSFontAttributeName : [UIFont fontWithName:@"HelveticaNeue-Bold" size:16.0f],
                                                           NSForegroundColorAttributeName :[UIColor blackColor]
                                                           }];
    [UINavigationBar appearance].translucent = NO;
    [[UINavigationBar appearance] setShadowImage:[UIImage new]];
    [[UINavigationBar appearance] setBackgroundImage:[[UIImage imageNamed:@"tav_top.png"] stretchableImageWithLeftCapWidth:40 topCapHeight:0] forBarMetrics:UIBarMetricsDefault];
    [self.tabBar setShadowImage:[UIImage new]];
    [self.tabBar setBackgroundImage:[UIImage new]];
    self.tabBar.backgroundColor = [UIColor whiteColor];
    [[UITabBarItem appearance] setTitleTextAttributes:@{NSFontAttributeName : [UIFont fontWithName:@"HelveticaNeue-Bold" size:10.0f],
                                                        NSForegroundColorAttributeName :UIColorFromRGB2(61, 103, 237)
                                                        } forState:UIControlStateSelected];
    
    [[UITabBarItem appearance] setTitleTextAttributes:@{NSFontAttributeName : [UIFont fontWithName:@"HelveticaNeue-Bold" size:10.0f],
                                                        NSForegroundColorAttributeName :kUIColorFromRGB(0xADB1B6)
                                                        } forState:UIControlStateNormal];
    
    UIViewController *project;
    project = [[UIViewController alloc] init];
    project.view.backgroundColor = [UIColor lightGrayColor];
//    project.title = @"消息";
    project.tabBarItem.title=@"消息";
    project.tabBarItem.image = [[UIImage imageNamed:@"tab_message_normal"] imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal];
        project.tabBarItem.selectedImage = [[UIImage imageNamed:@"tab_message_selected"] imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal];
    project.navigationItem.title = @"消息";
    UINavigationController *projectnavigation = [[UINavigationController alloc] initWithRootViewController:project];
    
    
    UIViewController *c2=[[UIViewController alloc]init];
//    c2.title = @"工作台";
    c2.tabBarItem.title=@"工作台";
        c2.tabBarItem.image = [[UIImage imageNamed:@"tab_workbench_normal"] imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal];
        c2.tabBarItem.selectedImage = [[UIImage imageNamed:@"tab_workbench_selected"] imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal];
    c2.navigationItem.title = @"工作台";
    UINavigationController *navigation2 = [[UINavigationController alloc] initWithRootViewController:c2];
    
    
    UIViewController *c3=[[UIViewController alloc]init];
//    c3.title = @"服务中心";
    c3.tabBarItem.title=@"服务中心";
    c3.navigationItem.title = @"服务中心";
        c3.tabBarItem.image = [[UIImage imageNamed:@"tab_service_normal"] imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal];
        c3.tabBarItem.selectedImage = [[UIImage imageNamed:@"tab_service_selected"] imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal];
    UINavigationController *navigation3 = [[UINavigationController alloc] initWithRootViewController:c3];
    
    
    UIViewController *c4=[[UIViewController alloc]init];
//    c4.title = @"我的";
    c4.tabBarItem.title=@"我的";
    c4.navigationItem.title = @"我的";
        c4.tabBarItem.image = [[UIImage imageNamed:@"tab_mine_normal"] imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal];
        c4.tabBarItem.selectedImage = [[UIImage imageNamed:@"tab_mine_selected"] imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal];
    UINavigationController *navigation4 = [[UINavigationController alloc] initWithRootViewController:c4];
    
    

    self.viewControllers = @[projectnavigation,navigation2,navigation3,navigation4];
}

// 统计未读消息数
- (void)setupUnreadMessageCount
{
    
    //    UIApplication *application = [UIApplication sharedApplication];
    //    [application setApplicationIconBadgeNumber:unreadCount];
}

- (void)setupUntreatedApplyCount
{
    
}


#pragma mark - public

- (void)jumpToChatList
{
}

- (void)viewWillDisappear:(BOOL)animated
{
    [super viewWillDisappear:animated];
}

- (void)dealloc
{
    [[NSNotificationCenter defaultCenter] removeObserver:self];
}

@end
