//
//  AccountPsdView.m
//  Aisino_iOS_SupplyChain
//
//  Created by 航天信息 on 2018/3/19.
//

#import "AccountPsdView.h"
#import "MAsonry.h"

@interface AccountPsdView()<UITextFieldDelegate>
{
    BOOL _isPsdLog; //密码登录
    UILabel *_noLabel;
}
@end

@implementation AccountPsdView

- (instancetype)initWithFrame:(CGRect)frame{
    if (self = [super initWithFrame:frame]) {
     
        _isPsdLog = NO; //
        [self createUI];
    }
    return self;
}

- (void)createUI{
    [self accountView];
    [self userNameField];
    [self psdView];
    [self verificationField];
    [self notRegistBtn];  //未注册|忘记密码
    [self psdBtn];
    [self requestVerBtn]; //获取验证码
    [self logoInBtn];
}

- (UIImageView *)accountView{
    if (!_accountView) {
        _accountView = [[UIImageView alloc]init];
        _accountView.userInteractionEnabled = YES;
        _accountView.image = [UIImage imageNamed:@"login_input"];
        [self addSubview:_accountView];
        [_accountView mas_makeConstraints:^(MASConstraintMaker *make) {
            make.top.mas_equalTo(0);
            make.left.mas_equalTo(0);
            make.right.mas_equalTo(0);
            make.height.mas_equalTo(60);
        }];
    }
    return _accountView;
}

- (UITextField *)userNameField{
    if (!_userNameField) {
        _userNameField = [[UITextField alloc]init];
        _userNameField.placeholder = @"请输入手机号";
        _userNameField.borderStyle = UITextBorderStyleNone;
        _userNameField.delegate= self;
        [_accountView addSubview:_userNameField];
        [_userNameField mas_makeConstraints:^(MASConstraintMaker *make) {
            make.centerY.mas_equalTo(_accountView.mas_centerY);
            make.left.mas_equalTo(_accountView.mas_left).offset(30);
            make.right.mas_equalTo(_accountView.mas_right).offset(-180);
            make.height.mas_equalTo(_accountView.mas_height);
        }];
    }
    return _userNameField;
}

- (UIImageView *)psdView{
    if (!_psdView) {
        _psdView = [[UIImageView alloc]init];
        _psdView.userInteractionEnabled = YES;
        _psdView.image = [UIImage imageNamed:@"login_input"];
        [self addSubview:_psdView];
        [_psdView mas_makeConstraints:^(MASConstraintMaker *make) {
            make.top.mas_equalTo(_accountView.mas_bottom).offset(30);
            make.left.mas_equalTo(0);
            make.right.mas_equalTo(0);
            make.height.mas_equalTo(60);
        }];
    }
    return _psdView;
}
- (UITextField *)verificationField{
    if (!_verificationField) {
        _verificationField = [[UITextField alloc]init];
        _verificationField.placeholder = @"请输入验证码";
        _verificationField.borderStyle = UITextBorderStyleNone;
        _verificationField.delegate= self;
        [_psdView addSubview:_verificationField];
        [_verificationField mas_makeConstraints:^(MASConstraintMaker *make) {
            make.centerY.mas_equalTo(_psdView.mas_centerY);
            make.left.mas_equalTo(_psdView.mas_left).offset(30);
            make.right.mas_equalTo(_psdView.mas_right).offset(-180);
            make.height.mas_equalTo(_psdView.mas_height);
        }];
    }
    return _verificationField;
}

- (UIButton *)notRegistBtn{
    if (!_notRegistBtn) {
        _notRegistBtn = [[UIButton alloc]init];
        _noLabel = [[UILabel alloc]init];
        _noLabel.textAlignment = NSTextAlignmentLeft;
        _noLabel.text = @"未注册手机号验证后自动创建账户";
        _noLabel.textColor = [UIColor blackColor];
        _noLabel.font = [UIFont systemFontOfSize:12];
        [_notRegistBtn addSubview:_noLabel];
        [_noLabel mas_makeConstraints:^(MASConstraintMaker *make) {
            make.left.top.right.bottom.mas_equalTo(0);
        }];

        [self addSubview:_notRegistBtn];
        [_notRegistBtn mas_makeConstraints:^(MASConstraintMaker *make) {
            make.top.mas_equalTo(_psdView.mas_bottom).offset(30);
            make.left.mas_equalTo(_psdView.mas_left).offset(30);
            make.width.mas_equalTo(200);
            make.height.mas_equalTo(25);
        }];
    }
    return _notRegistBtn;
}
- (UIButton *)psdBtn{
    if (!_psdBtn) {
        _psdBtn = [[UIButton alloc]init];
        _psdBtn.backgroundColor = UIColorFromRGB2(246, 249, 250);
        _psdBtn.titleLabel.font = [UIFont systemFontOfSize:12];
        [_psdBtn setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
        [_psdBtn setTitle:@"密码登录" forState:UIControlStateNormal];
        _psdBtn.selected = NO;
        [_psdBtn addTarget:self action:@selector(psdBtnClick:) forControlEvents:UIControlEventTouchUpInside];
        [self addSubview:_psdBtn];
        [_psdBtn mas_makeConstraints:^(MASConstraintMaker *make) {
            make.top.mas_equalTo(_notRegistBtn);
            make.right.mas_equalTo(_psdView.mas_right).offset(-30);
            make.width.mas_equalTo(80);
            make.height.mas_equalTo(25);
        }];
    }
    return _psdBtn;
}

- (UIButton *)requestVerBtn{
    if (!_requestVerBtn) {
        _requestVerBtn = [[UIButton alloc]init];
        _requestVerBtn.backgroundColor = [UIColor whiteColor];
        [_requestVerBtn setTitleColor:UIColorFromRGB2(137, 209, 124) forState:UIControlStateNormal];
        _requestVerBtn.titleLabel.font = [UIFont systemFontOfSize:14];
        _requestVerBtn.titleLabel.textAlignment = NSTextAlignmentRight;
        [_requestVerBtn setTitle:@"获取验证码" forState:UIControlStateNormal];
        [_requestVerBtn addTarget:self action:@selector(requestVerBtnClick:) forControlEvents:UIControlEventTouchUpInside];
        [_accountView addSubview:_requestVerBtn];
        [_requestVerBtn mas_makeConstraints:^(MASConstraintMaker *make) {
            make.centerY.mas_equalTo(_accountView.mas_centerY);
            make.top.mas_equalTo(_accountView.mas_top).offset(10);
            make.right.mas_equalTo(_accountView.mas_right).offset(-30);
            make.left.mas_equalTo(_userNameField.mas_right).offset(10);
            make.bottom.mas_equalTo(_accountView.mas_bottom).offset(-10);
        }];
    }
    return _requestVerBtn;
}

- (UIButton *)logoInBtn{
    if (!_logoInBtn) {
        _logoInBtn = [[UIButton alloc]init];
        [_logoInBtn setBackgroundImage:[UIImage imageNamed:@"login_btn"] forState:UIControlStateNormal];
        [_logoInBtn addTarget:self action:@selector(logoInBtnClick:) forControlEvents:UIControlEventTouchUpInside];
        [_logoInBtn setTitle:@"登录" forState:UIControlStateNormal];
        
        [self addSubview:_logoInBtn];
        [_logoInBtn mas_makeConstraints:^(MASConstraintMaker *make) {
            make.top.mas_equalTo(_notRegistBtn.mas_bottom).offset(60);
            make.left.mas_equalTo(_accountView.mas_left);
            make.right.mas_equalTo(_accountView.mas_right);
            make.height.mas_equalTo(_accountView);
        }];
    }
    return _logoInBtn;
}

- (UIButton *)eyeBtn{
    if (!_eyeBtn) {
        _eyeBtn = [[UIButton alloc]init];
        [_eyeBtn setBackgroundImage:[UIImage imageNamed:@"login_display"] forState:UIControlStateNormal];
        _eyeBtn.selected = NO;
        [_eyeBtn addTarget:self action:@selector(eyeBtnClick:) forControlEvents:UIControlEventTouchUpInside];
        [_psdView addSubview:_eyeBtn];
        [_eyeBtn mas_makeConstraints:^(MASConstraintMaker *make) {
            make.centerY.mas_equalTo(_psdView.mas_centerY);
            make.right.mas_equalTo(_psdView.mas_right).offset(-30);
            make.size.mas_equalTo(CGSizeMake(20, 20));
        }];
    }
    return _eyeBtn;
}

#pragma mark -- 密码登陆
- (void)psdBtnClick:(UIButton *)btn{
    _verificationField.clearsOnBeginEditing = YES;
    if (btn.selected) {
        _isPsdLog = YES;
        btn.selected = NO;
        [btn setTitle:@"密码登录" forState:UIControlStateNormal];
        _noLabel.text = @"未注册手机号验证后自动创建账户";
        _eyeBtn.hidden = YES;
        _requestVerBtn.hidden = NO;
    }else{
        _isPsdLog = NO;
        btn.selected = YES;
        [btn setTitle:@"验证码登录" forState:UIControlStateNormal];
        _notRegistBtn.titleLabel.textAlignment = NSTextAlignmentLeft;
        _noLabel.text = @"忘记密码";

        [self eyeBtn];
        _eyeBtn.hidden = NO;
        _requestVerBtn.hidden = YES;
    }
}
//获取验证码
- (void)requestVerBtnClick:(UIButton *)btn{
    NSLog(@"获取验证码");
}
//登录
- (void)logoInBtnClick:(UIButton *)btn{
    NSLog(@"登录");
}

// 密文明文切换
- (void)eyeBtnClick:(UIButton *)btn{
    if (btn.selected) {
        btn.selected = NO;
        _verificationField.secureTextEntry = NO;
        [btn setBackgroundImage:[UIImage imageNamed:@"login_display"] forState:UIControlStateNormal];
    }else{
        btn.selected = YES;
        _verificationField.secureTextEntry = YES;
        [btn setBackgroundImage:[UIImage imageNamed:@"login_hide"] forState:UIControlStateNormal];
    }
}

@end
