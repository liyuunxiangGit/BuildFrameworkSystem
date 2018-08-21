//
//  LoginViewController.m
//  HX_WisdomPC
//
//  Created by 荣学敏 on 2018/6/27.
//  Copyright © 2018年 HX. All rights reserved.
//

#import "LoginViewController.h"
#import "AppDelegate.h"
#import "StringUtil.h"
#import "MyBase64.h"

@interface LoginViewController ()<UITextFieldDelegate>

@end

@implementation LoginViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
    self.title = @"登录";
    
    
    self.userNameTextField.delegate = self;
    self.passwordTextField.delegate = self;
    
    
    
    
  
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}
#pragma mark - Action
- (IBAction)loginBtnClick:(id)sender {
    WEAKSELF
    [GlobalFunc getDeviceId];
    NSString *passWord = [MyBase64 encodeBase64WithStr:self.passwordTextField.text];
    NSString *devideId = [GlobalFunc getDeviceId];
    NSMutableDictionary *dict = [NSMutableDictionary dictionary];
    
    [dict setValue:devideId forKey:@"device"];
    [dict setValue:passWord forKey:@"passWord"];
    [dict setValue:self.userNameTextField.text forKey:@"loginName"];
    
    
//    NSDictionary *param = [DictionaryToJsonStr dictionaryToNetDict:dict];

    MBProgressHUD *hud = [MBProgressHUD showMessag:@"" toView:self.view];
    [[HXNetWorkManager shareManager] Post_execute:WP_login withParaments:dict callback:^(QResponse *response) {
        [hud setHidden:YES];
        if (response.errcode == 1) {
            AppDelegate *app = (AppDelegate *)[UIApplication sharedApplication].delegate;
            app.user_token = [response.QResponseMeassage objectForKey:@"token"];
            AccountModel *loginAccount = [[AccountModel alloc]init];
            loginAccount.is_login = YES;
            loginAccount.token = [response.QResponseMeassage objectForKey:@"token"];
            loginAccount.userId = [response.QResponseMeassage objectForKey:@"userId"];
            [AccountModel saveSingleModel:loginAccount forKey:Key_LoginUserInfo];
            [GlobalFunc setLoginStatus:loginAccount.is_login];

            [[NSNotificationCenter defaultCenter] postNotificationName:JumpToMain object:nil];
            app.window.rootViewController = [app allocInitTabbar];
        }else{
            [MBProgressHUD showError:response.msg toView:weakSelf.view];
        }
        
    }];
    
    
}

#pragma mark - Private


#pragma mark - lazy


#pragma mark - UITextFieldDelegate


- (void)textFieldDidBeginEditing:(UITextField *)textField{
 
    if (textField.tag == 1) {
        [self.userNameImageView setHighlighted:YES];
        [self.userNameUnderLine setHighlighted:YES];
    }else if(textField.tag == 2){
        [self.passwordImageView setHighlighted:YES];
        [self.passwordUnderLine setHighlighted:YES];

    }
    
    
    
}

- (void)textFieldDidEndEditing:(UITextField *)textField{
    if (NULLString(self.userNameTextField.text) ) {
        [self.userNameImageView setHighlighted:NO];
        [self.userNameUnderLine setHighlighted:NO];
    }else
    {
        [self.userNameImageView setHighlighted:YES];
        [self.userNameUnderLine setHighlighted:YES];

    }
    
    
    if (NULLString(self.passwordTextField.text) ) {
        [self.passwordImageView setHighlighted:NO];
        [self.passwordUnderLine setHighlighted:NO];
    }else
    {
        [self.passwordImageView setHighlighted:YES];
        [self.passwordUnderLine setHighlighted:YES];
        
    }
}

- (BOOL)textField:(UITextField *)textField shouldChangeCharactersInRange:(NSRange)range replacementString:(NSString *)string{
    
    // 不让输入表情
    if ([textField isFirstResponder]) {
        if ([[[textField textInputMode] primaryLanguage] isEqualToString:@"emoji"] || ![[textField textInputMode] primaryLanguage]) {
            return NO;
        }
    }
    
    
   
    //判断登录按钮是否可以点击
    if (self.userNameTextField.text.length < 2  || self.passwordTextField.text.length < 2) {
        self.loginBtn.enabled = NO;
    }else
    {
        self.loginBtn.enabled = YES;
    }
    
         return YES;
    

}

- (BOOL)textFieldShouldClear:(UITextField *)textField{
    self.loginBtn.enabled = NO;
    return YES;
}





@end
