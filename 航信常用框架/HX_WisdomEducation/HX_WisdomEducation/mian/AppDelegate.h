//
//  AppDelegate.h
//  HX_WisdomEducation
//
//  Created by 荣学敏 on 2018/8/13.
//  Copyright © 2018年 HX. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "HXCustomTabbarController.h"
@interface AppDelegate : UIResponder <UIApplicationDelegate>

@property (strong, nonatomic) UIWindow *window;




@property (strong, nonatomic) NSString *user_token;

/**
 *  登陆装态
 */
@property (nonatomic, assign)BOOL loginStatus;

@property (strong, nonatomic) HXCustomTabbarController *tabbarController;

- (UITabBarController*)allocInitTabbar;

@end

