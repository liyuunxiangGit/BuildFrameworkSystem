//
//  GlobalFunc.m
//  Aisino_iOS_SupplyChain
//
//  Created by 荣学敏 on 2018/3/19.
//

#import "GlobalFunc.h"
#import "AppDelegate.h"

UIWindow *GB_JumpUseWindow; //强制跳转用的window，全局
@implementation GlobalFunc
+(NSString *)getCachePath{
    return [NSSearchPathForDirectoriesInDomains(NSCachesDirectory, NSUserDomainMask, YES)objectAtIndex:0];
}

+(NSString *)getTmpPath{
    return NSTemporaryDirectory();
}

+(NSString *)getDocumentPath{
    NSString *path = [NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES) lastObject];
    return path;
    
}

+ (NSString *)getVersion{
    NSString *version = [[[NSBundle mainBundle] infoDictionary] objectForKey:@"CFBundleShortVersionString"];
    return [version stringByReplacingOccurrencesOfString:@"." withString:@""];;
}

+(void)setLoginStatus:(BOOL)status{
    AppDelegate *appdelegate = (AppDelegate *)[[UIApplication sharedApplication]delegate];
    appdelegate.loginStatus = status;
}

+(BOOL)getLoginStatus{
    AppDelegate *appdelegate = (AppDelegate *)[[UIApplication sharedApplication]delegate];
    return appdelegate.loginStatus;
}

+ (UIViewController *)getCurrentVC
{
    UIViewController *topController = [UIApplication sharedApplication].keyWindow.rootViewController;
    while (topController.presentedViewController) {
        topController = topController.presentedViewController;
    }
    
    if ([topController isKindOfClass:[UITabBarController class]]) {
        UITabBarController *tbVC = (UITabBarController *)topController;
        UIViewController *vc = [tbVC selectedViewController];
        NSArray *VCStacks = nil;
        if ([vc isKindOfClass:[UINavigationController class]]) {
            UINavigationController *nav = (UINavigationController *)vc;
            VCStacks = [nav viewControllers];
            if (VCStacks == nil) {
                return topController;
            }else{
                return [VCStacks objectAtIndex:([VCStacks count] - 1)];
            }
        }else{
            VCStacks = [vc.navigationController viewControllers];
            if (VCStacks == nil) {
                return vc;
            }else{
                return [VCStacks objectAtIndex:([VCStacks count] - 1)];
            }
        }
    }else if([topController isKindOfClass:[UINavigationController class]]){
        UINavigationController *nav = (UINavigationController *)topController;
        NSArray *VCStacks = nil;
        VCStacks = [nav viewControllers];
        if (VCStacks == nil) {
            return topController;
        }else{
            return [VCStacks objectAtIndex:([VCStacks count] - 1)];
        }
    }
    else{
        NSArray *VCStacks = [topController.navigationController viewControllers];
        if (VCStacks == nil) {
            return topController;
        }else{
            return [VCStacks objectAtIndex:([VCStacks count] - 1)];
        }
    }
    return topController;
}

+ (UIWindow *)getJumpWindow{
    static dispatch_once_t onceJumpToken;
    dispatch_once(&onceJumpToken,^{
        GB_JumpUseWindow = [[UIWindow alloc] initWithFrame:[[UIScreen mainScreen] bounds]];
    });
    return GB_JumpUseWindow;
}
+ (void)jumpToFontViewController:(SCBaseViewController *)viewcontroller Completion:(void (^)(void))completion{
    UIWindow *window = [self getJumpWindow];
    [viewcontroller setValue:window forKey:@"holderWindow"];
    
    UIViewController *holerVC = [[UIViewController alloc]init];
    holerVC.view.backgroundColor = [UIColor clearColor];
    UINavigationController *nav = [[UINavigationController alloc]initWithRootViewController:holerVC];
    window.rootViewController = nav;
    [holerVC.navigationController pushViewController:viewcontroller animated:YES];
    [window makeKeyAndVisible];
    dispatch_async(dispatch_get_main_queue(), ^{
        if (completion) {
            completion();
        }
    });
}
@end
