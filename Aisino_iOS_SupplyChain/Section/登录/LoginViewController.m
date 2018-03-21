//
//  LoginViewController.m
//  Aisino_iOS_SupplyChain
//
//  Created by 荣学敏 on 2018/3/19.
//

#import "LoginViewController.h"
#import "AccountModel.h"
#import "LoginSection.h"
@interface LoginViewController ()

@end

@implementation LoginViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    //登录数据进行读取
    //用户首次登录
    AccountModel *loginAccount = [[AccountModel alloc]init];
    loginAccount.mobile = nil;
    loginAccount.password = nil;
    loginAccount.accountId = nil;
    [AccountModel saveSingleModel:loginAccount forKey:Key_LoginUserInfo];

    //用户登录数据获取
    AccountModel *lastAccount = (AccountModel *)[AccountModel readSingleModelForKey:Key_LoginUserInfo];
    lastAccount.mobile;
    lastAccount.password;
    lastAccount.accountId;
    //退出登录，密码清空
    AccountModel *model = [AccountModel readSingleModelForKey:Key_LoginUserInfo];
    model.password = @"";
    [AccountModel saveSingleModel:model forKey:Key_LoginUserInfo];
    
    

}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
