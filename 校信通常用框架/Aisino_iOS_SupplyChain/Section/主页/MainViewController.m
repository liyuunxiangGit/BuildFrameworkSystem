//
//  MainViewController.m
//  Aisino_iOS_SupplyChain
//
//  Created by 荣学敏 on 2018/3/19.
//

#import "MainViewController.h"
#import "Masonry.h"
#import "AFNetworking.h"
#define  kContentFrame  CGRectMake(0, 0, self.view.frame.size.width, self.view.frame.size.height-kTabbarHeight)
#define  kDockFrame CGRectMake(0, self.view.frame.size.height-kTabbarHeight, self.view.frame.size.width, kTabbarHeight)


#define kMainPageViewWidth 49
#define kMainPageViewHeight 60
#define kMainPageBtnWidth 48
#define kMainPageBtnHeight 52
@interface MainViewController ()

@end

@implementation MainViewController


-(id)initWithCoder:(NSCoder *)aDecoder{
    self = [super initWithCoder:aDecoder];
    if (self) {
        
    }
    return self;
}

- (void)viewDidLoad{
    [super viewDidLoad];
    
  
    //判断网络状态
    [[AFNetworkReachabilityManager sharedManager]setReachabilityStatusChangeBlock:^(AFNetworkReachabilityStatus status) {
        //       DDLogInfo(@"Reachability: %@", AFStringFromNetworkReachabilityStatus(status));
        NSDictionary *dic = @{@"status":[NSNumber numberWithInteger:status]};
        [[NSNotificationCenter defaultCenter] postNotificationName:kNotifierNetStatus object:dic];
        
        if (status == AFNetworkReachabilityStatusReachableViaWWAN || status == AFNetworkReachabilityStatusReachableViaWiFi) {
            //开始没有完成的任务
           
        }
    }];
    
    [[AFNetworkReachabilityManager sharedManager]startMonitoring];

}




- (void)dealloc{
//    [[NSNotificationCenter defaultCenter]removeObserver:self];
//    [[NSNotificationCenter defaultCenter] removeObserver:self name:@"logout" object:nil];
}


//-(void)logout:(NSNotification*)sender{
//    NSString *autoLogin = [sender.userInfo objectForKey:@"autoLogin"];
//    if ([@"NO" isEqualToString:autoLogin]) {
//        [AccountModel saveSingleModel:nil forKey:Key_LoginUserInfo];
//    }
//    for (UIViewController *VC in self.navigationController.viewControllers) {
//        [VC dismissViewControllerAnimated:NO completion:nil];
//    }
//}

- (BOOL)shouldAutorotate{
    return NO;
}

- (UIInterfaceOrientationMask)supportedInterfaceOrientations {
    return UIInterfaceOrientationMaskPortrait;
}


@end
