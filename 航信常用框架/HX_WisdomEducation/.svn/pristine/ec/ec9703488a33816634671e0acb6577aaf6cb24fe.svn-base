//
//  GlobalFunc.m
//  Aisino_iOS_SupplyChain
//
//  Created by 荣学敏 on 2018/3/19.
//

#import "GlobalFunc.h"
#import "AppDelegate.h"
#import "JDStatusBarNotification.h"
#import "OpenUDID.h"
#define kLocalErrorDescribe @"LocalErrorDescribe"
#define kLocalError @"NETLocalError"
#define kLocalError_error_InvalidMobile  -1

UIWindow *GB_JumpUseWindow; //强制跳转用的window，全局
@implementation GlobalFunc

+(NSArray *)sortDescriptor:(NSArray *)dataSource{
    NSSortDescriptor *sort = [NSSortDescriptor sortDescriptorWithKey:nil ascending:YES];
    return [dataSource sortedArrayUsingDescriptors:@[sort]];
}
+ (NSString *)getDeviceId
{
    NSString * _DeviceId = [OpenUDID value];
    return _DeviceId;
    
}
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
+ (NSString *)getUserId
{
    AccountModel *loginAccount = [AccountModel readSingleModelForKey:Key_LoginUserInfo];
    return loginAccount.userId;
}

+(void)setLoginStatus:(BOOL)status{
    AccountModel *loginAccount = [AccountModel readSingleModelForKey:Key_LoginUserInfo];
    loginAccount.is_login = status;
    [AccountModel saveSingleModel:loginAccount forKey:Key_LoginUserInfo];

//    AppDelegate *appdelegate = (AppDelegate *)[[UIApplication sharedApplication]delegate];
//    appdelegate.loginStatus = status;
}

+(BOOL)getLoginStatus{

    AccountModel *loginAccount = [AccountModel readSingleModelForKey:Key_LoginUserInfo];
    return loginAccount.is_login;
//    AppDelegate *appdelegate = (AppDelegate *)[[UIApplication sharedApplication]delegate];
//    return appdelegate.loginStatus;

}
+(void)ShowToastText:(NSString *)content{
    [JDStatusBarNotification showWithStatus:content dismissAfter:3.0 styleName:JDStatusBarStyleDefault];
}

+(void)ShowToastText:(NSString *)content delay:(float)delay{
    [JDStatusBarNotification showWithStatus:content dismissAfter:delay styleName:JDStatusBarStyleDefault];
}

+(NSError *)makeLocalErrorWithDescription:(NSString *)text{
    NSDictionary *er = [[NSDictionary alloc] initWithObjectsAndKeys:text, kLocalErrorDescribe, nil];
    NSError *error = [[NSError alloc]initWithDomain:kLocalError code:kLocalError_error_InvalidMobile userInfo:er];
    return error;
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
+ (void)jumpToFontViewController:(HXBackController *)viewcontroller Completion:(void (^)(void))completion{
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

+ (NSString*)backDateFormatterOfType:(NSInteger )type withDate:(NSDate *)date
{
    if (!date)
    {
        return @"";
    }
    NSDateFormatter* formatter = [[NSDateFormatter alloc] init];
    [formatter setDateStyle:NSDateFormatterMediumStyle];
    [formatter setTimeStyle:NSDateFormatterShortStyle];
    if (type == 1) {
        [formatter setDateFormat:@"yyyy.MM.dd"];
    }else if (type == 2)
    {
        [formatter setDateFormat:@"yyyy-MM-dd hh:mm a"];
    }else if (type == 3)
    {
        [formatter setDateFormat:@"yyyy.MM.dd a hh:mm"];
    }else if (type == 4)
    {
        [formatter setDateFormat:@"yyyy-MM-dd"];
        return [formatter stringFromDate:[NSDate date]];
    }else if (type == 5)
    {
        [formatter setDateFormat:@"yyyy-MM-dd"];
    }else if (type == 6)
    {
        [formatter setDateFormat:@"yyyy/MM/dd"];
    }else if (type == 7)
    {
        [formatter setDateFormat:@"MM/dd/yyyy"];
    }else if (type == 8)
    {
        [formatter setDateFormat:@"HH:mm"];
    }else if (type == 9)
    {
        [formatter setDateFormat:@"MM-dd HH:mm"];
    }else if (type == 10)
    {
        [formatter setDateFormat:@"yyyy-MM-dd HH:mm"];
    }else if (type == 11){
        [formatter setDateFormat:@"yyyy年MM月dd日 HH:mm"];
    }else if (type == 12){
        [formatter setDateFormat:@"yyyy年MM月dd日"];
    }
    return [[formatter stringFromDate:date] lowercaseString];
}

+ (NSString*)backDateFormatterOfType:(NSInteger )type Datestamp:(NSNumber*)datestamp
{
    
    if (!datestamp || [datestamp isEqual:[NSNull null]])
    {
        return @"";
    }
    NSDate *date = [NSDate dateWithTimeIntervalSince1970:([datestamp longLongValue])/1000];
    return [self backDateFormatterOfType:type withDate:date];
}
@end
