//
//  LoginViewController.h
//  HX_WisdomPC
//
//  Created by 荣学敏 on 2018/6/27.
//  Copyright © 2018年 HX. All rights reserved.
//

#import "HXBackController.h"
#import "OpenUDID.h"
@interface LoginViewController : HXBackController
@property (weak, nonatomic) IBOutlet UIImageView *userNameImageView;

@property (weak, nonatomic) IBOutlet UITextField *userNameTextField;


@property (weak, nonatomic) IBOutlet UIImageView *userNameUnderLine;

@property (weak, nonatomic) IBOutlet UIImageView *passwordImageView;

@property (weak, nonatomic) IBOutlet UITextField *passwordTextField;

@property (weak, nonatomic) IBOutlet UIImageView *passwordUnderLine;

@property (weak, nonatomic) IBOutlet UIButton *loginBtn;


@end
