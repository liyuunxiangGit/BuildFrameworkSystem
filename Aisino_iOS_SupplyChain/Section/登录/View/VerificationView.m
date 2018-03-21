//
//  VerificationView.m
//  Aisino_iOS_SupplyChain
//
//  Created by 航天信息 on 2018/3/19.
//

#import "VerificationView.h"
#import "MAsonry.h"
@interface VerificationView()<UITextFieldDelegate>
{
   
}
@end
@implementation VerificationView


-(instancetype)initWithFrame:(CGRect)frame{
    if (self = [super initWithFrame:frame]) {
        [self createUI];
    }
    return self;
}

- (void)createUI{
    
    [self accountView];
    [self userNameField];
    [self psdView];
    [self phoneField];
    
    [self psdSixView];
    [self psdSixField];
    
    [self nextBtn];
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
        _userNameField.placeholder = @"请输入用户名";
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
- (UITextField *)phoneField{
    if (!_phoneField) {
        _phoneField = [[UITextField alloc]init];
        _phoneField.placeholder = @"请输入你的手机号";
        _phoneField.borderStyle = UITextBorderStyleNone;
        _phoneField.delegate= self;
        [_psdView addSubview:_phoneField];
        [_phoneField mas_makeConstraints:^(MASConstraintMaker *make) {
            make.centerY.mas_equalTo(_psdView.mas_centerY);
            make.left.mas_equalTo(_psdView.mas_left).offset(30);
            make.right.mas_equalTo(_psdView.mas_right).offset(-180);
            make.height.mas_equalTo(_psdView.mas_height);
        }];
    }
    return _phoneField;
}

- (UIButton *)nextBtn{
    if (!_nextBtn) {
        _nextBtn = [[UIButton alloc]init];
        [_nextBtn setBackgroundImage:[UIImage imageNamed:@"login_btn"] forState:UIControlStateNormal];
        [_nextBtn addTarget:self action:@selector(nextBtnClick:) forControlEvents:UIControlEventTouchUpInside];
        [_nextBtn setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
        [_nextBtn setTitle:@"下一步" forState:UIControlStateNormal];
        [self addSubview:_nextBtn];
        [_nextBtn mas_makeConstraints:^(MASConstraintMaker *make) {
            make.top.mas_equalTo(_psdView.mas_bottom).offset(60);
            make.left.mas_equalTo(_accountView.mas_left);
            make.right.mas_equalTo(_accountView.mas_right);
            make.height.mas_equalTo(_accountView);
        }];    }
    return _nextBtn;
}

- (UIImageView *)psdSixView{
    if (!_psdSixView) {
        _psdSixView = [[UIImageView alloc]init];
        _psdSixView.userInteractionEnabled = YES;
        _psdSixView.image = [UIImage imageNamed:@"login_input"];
        [self addSubview:_psdSixView];
        [_psdSixView mas_makeConstraints:^(MASConstraintMaker *make) {
            make.top.mas_equalTo(_psdSixView.mas_bottom).offset(30);
            make.left.right.mas_equalTo(_accountView);
            make.height.mas_equalTo(0);
        }];
    }
    return _psdSixView;
}

- (UITextField *)psdSixField{
    if (!_psdSixField) {
        _psdSixField = [[UITextField alloc]init];
        _psdSixField.placeholder = @"请输入六位数密码";
        _psdSixField.borderStyle = UITextBorderStyleNone;
        _phoneField.delegate= self;
        [_psdSixView addSubview:_psdSixField];
        [_psdSixField mas_makeConstraints:^(MASConstraintMaker *make) {
            make.centerY.mas_equalTo(_psdSixView.mas_centerY);
            make.left.mas_equalTo(_psdSixView.mas_left).offset(30);
            make.right.mas_equalTo(_psdSixView.mas_right).offset(-180);
            make.height.mas_equalTo(_psdSixView.mas_height);
        }];
    }
    return _psdSixField;
}

- (UIButton *)eyeBtn{
    if (!_eyeBtn) {
        _eyeBtn = [[UIButton alloc]init];
        [_eyeBtn setBackgroundImage:[UIImage imageNamed:@"login_display"] forState:UIControlStateNormal];
        _eyeBtn.selected = NO;
        [_eyeBtn addTarget:self action:@selector(eyeBtnClick:) forControlEvents:UIControlEventTouchUpInside];
        [_psdSixView addSubview:_eyeBtn];
        [_eyeBtn mas_makeConstraints:^(MASConstraintMaker *make) {
            make.centerY.mas_equalTo(_psdSixView.mas_centerY);
            make.right.mas_equalTo(_psdSixView.mas_right).offset(-30);
            make.size.mas_equalTo(CGSizeMake(20, 20));
        }];
    }
    return _eyeBtn;
}

- (UIButton *)sureBtn{
    if (!_sureBtn) {
        _sureBtn = [[UIButton alloc]init];
        [_sureBtn setBackgroundImage:[UIImage imageNamed:@"login_not_check"] forState:UIControlStateNormal];
        _sureBtn.selected = NO;
        [self addSubview:_sureBtn];
        [_sureBtn addTarget:self action:@selector(sureBtnClick:) forControlEvents:UIControlEventTouchUpInside];
        [_sureBtn mas_makeConstraints:^(MASConstraintMaker *make) {
            make.top.mas_equalTo(_psdSixView.mas_bottom).offset(15);
            make.left.mas_equalTo(_psdSixView.mas_left).offset(30);
            make.size.mas_equalTo(CGSizeMake(20, 20));
        }];
    }
    return _sureBtn;
}
- (UIButton *)userDelegateBtn{
    if (!_userDelegateBtn) {
        _userDelegateBtn = [[UIButton alloc]init];
        [self addSubview:_userDelegateBtn];
        _userDelegateBtn.titleLabel.font = [UIFont systemFontOfSize:12];
        [_userDelegateBtn setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
        [_userDelegateBtn setTitle:@"已同意阅读《用户服务协议》" forState:UIControlStateNormal];
        [_userDelegateBtn mas_makeConstraints:^(MASConstraintMaker *make) {
            make.centerY.mas_equalTo(_sureBtn.mas_centerY);
            make.left.mas_equalTo(_sureBtn.mas_right).offset(20);
            make.size.mas_equalTo(CGSizeMake(180, 20));
        }];
    }
    return _userDelegateBtn;
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

#pragma mark -- 下一步
- (void)nextBtnClick:(UIButton *)btn{
    NSLog(@"点击下一步");
    [_psdSixView setNeedsUpdateConstraints];
    [_psdSixView updateFocusIfNeeded];
    [UIView animateWithDuration:0.5 animations:^{
        [_psdSixView mas_updateConstraints:^(MASConstraintMaker *make) {
            make.top.mas_equalTo(_psdView.mas_bottom).offset(30);
            make.left.right.mas_equalTo(_accountView);
            make.height.mas_equalTo(60);
        }];
    }];
    [_nextBtn setNeedsUpdateConstraints];
    [_nextBtn updateFocusIfNeeded];
    [UIView animateWithDuration:0.5 animations:^{
        [_nextBtn mas_remakeConstraints:^(MASConstraintMaker *make) {
            make.top.mas_equalTo(_psdSixView.mas_bottom).offset(60);
            make.left.mas_equalTo(_accountView.mas_left);
            make.right.mas_equalTo(_accountView.mas_right);
            make.height.mas_equalTo(_accountView);
        }];
    }];
    [self sureBtn];
    [self userDelegateBtn];
    [self requestVerBtn];
    [self eyeBtn];
}

//获取验证码
- (void)requestVerBtnClick:(UIButton *)btn{
    NSLog(@"获取验证码");
}
// 密文明文切换
- (void)eyeBtnClick:(UIButton *)btn{
    if (btn.selected) {
        btn.selected = NO;
        _psdSixField.secureTextEntry = NO;
        [btn setBackgroundImage:[UIImage imageNamed:@"login_display"] forState:UIControlStateNormal];
    }else{
        btn.selected = YES;
        _psdSixField.secureTextEntry = YES;
        [btn setBackgroundImage:[UIImage imageNamed:@"login_hide"] forState:UIControlStateNormal];
    }
}

- (void)sureBtnClick:(UIButton *)btn{
    if (btn.selected) {
        btn.selected = NO;
        [btn setBackgroundImage:[UIImage imageNamed:@"login_check"] forState:UIControlStateNormal];
        [_nextBtn setBackgroundImage:[UIImage imageNamed:@"login_btn_press"] forState:UIControlStateNormal];
        [_nextBtn setTitle:@"完成" forState:UIControlStateNormal];

    }else{
        btn.selected = YES;
        [btn setBackgroundImage:[UIImage imageNamed:@"login_not_check"] forState:UIControlStateNormal];
        [_nextBtn setBackgroundImage:[UIImage imageNamed:@"login_btn"] forState:UIControlStateNormal];
        [_nextBtn setTitle:@"下一步" forState:UIControlStateNormal];
    }
}
@end
