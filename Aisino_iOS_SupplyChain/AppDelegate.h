//
//  AppDelegate.h
//  Aisino_iOS_SupplyChain
//
//  Created by 荣学敏 on 2018/3/13.
//

#import <UIKit/UIKit.h>

@interface AppDelegate : UIResponder <UIApplicationDelegate>

@property (strong, nonatomic) UIWindow *window;

// 用来判断是否是通过点击通知栏开启（唤醒）APP
@property (nonatomic) BOOL isLaunchedByNotification;

/**
 *  登陆装态
 */
@property (nonatomic, assign)BOOL loginStatus;
/**
 *  是否正在登录
 */
@property (nonatomic, assign)BOOL isLogining;
@end

