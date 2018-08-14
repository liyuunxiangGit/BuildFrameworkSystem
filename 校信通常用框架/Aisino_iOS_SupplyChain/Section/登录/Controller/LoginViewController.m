//
//  LoginViewController.m
//  Aisino_iOS_SupplyChain
//
//  Created by 荣学敏 on 2018/3/19.
//

#import "LoginViewController.h"
#import "AccountPsdView.h" //登录注册
#import "VerificationView.h"
#import "MAsonry.h"
@interface LoginViewController ()<UIScrollViewDelegate>
@property (nonatomic,strong)UIImageView *logoView;
@property (nonatomic,strong)UIButton *closeBtn;
@property (nonatomic,strong)UIView *middleView;
@property (nonatomic,strong)UIScrollView *contentView; //滚动视图
@property (strong , nonatomic)UIView *indicatorView; //
@property (nonatomic,strong)UIView *titleView;
@property (nonatomic,strong)UIButton *selectBtn; //上一次选中的按钮

@property (nonatomic,strong)AccountPsdView *loginView;
@property (nonatomic,strong)VerificationView *registView;

@end

@implementation LoginViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor = [UIColor colorWithRed:246/255.0 green:249/255.0 blue:250/255.0 alpha:1];
    self.automaticallyAdjustsScrollViewInsets = false;


    [self closeBtn];
    [self logoView];
    [self middleView];
    [self setUpTitleView];
    [self setUpContentView];
    
}

- (UIImageView *)logoView{
    if (!_logoView) {
        _logoView = [[UIImageView alloc]init];
        _logoView.image = [UIImage imageNamed:@"login_logo"];
        [self.view addSubview:_logoView];
        [_logoView mas_makeConstraints:^(MASConstraintMaker *make) {
            make.top.mas_equalTo(64);
            make.left.mas_equalTo(10);
            make.right.mas_equalTo(-10);
            make.height.mas_equalTo(150);
        }];
    }
    return _logoView;
}

- (UIButton *)closeBtn{
    if (!_closeBtn) {
        _closeBtn = [[UIButton alloc]init];
        _closeBtn.backgroundColor = [UIColor whiteColor];
        [_closeBtn setBackgroundImage:[UIImage imageNamed:@"nav_delete_normal"] forState:UIControlStateNormal];
        [_closeBtn addTarget:self action:@selector(closeBtnClick:) forControlEvents:UIControlEventTouchUpInside];
        [self.view addSubview:_closeBtn];
        [_closeBtn mas_makeConstraints:^(MASConstraintMaker *make) {
            make.top.mas_equalTo(30);
            make.left.mas_equalTo(10);
            make.size.mas_equalTo(CGSizeMake(20, 20));
        }];
    }
    return _closeBtn;
}

- (UIView *)middleView{
    if (!_middleView) {
        _middleView = [[UIView alloc]init];
        _middleView.backgroundColor =  [UIColor colorWithRed:246/255.0 green:249/255.0 blue:250/255.0 alpha:1];
        [self.view addSubview:_middleView];
        [_middleView mas_makeConstraints:^(MASConstraintMaker *make) {
            make.top.mas_equalTo(_logoView.mas_bottom);
            make.left.right.bottom.mas_equalTo(0);
        }];
    }
    return _middleView;
}

- (UIScrollView *)contentView{
    if (!_contentView) {
        _contentView = [[UIScrollView alloc]init];
        _contentView.backgroundColor = [UIColor colorWithRed:246/255.0 green:249/255.0 blue:250/255.0 alpha:1];

        [_middleView addSubview:_contentView];
        [_contentView mas_makeConstraints:^(MASConstraintMaker *make) {
            make.top.mas_equalTo(_titleView.mas_bottom);
            make.left.mas_equalTo(_middleView.mas_left);
            make.right.mas_equalTo(_middleView.mas_right);
            make.bottom.mas_equalTo(_middleView.mas_bottom);
        }];
        _contentView.showsVerticalScrollIndicator = NO;
        _contentView.showsHorizontalScrollIndicator = NO;
        _contentView.pagingEnabled = YES;
        _contentView.bounces = NO;
        _contentView.delegate = self;
    }
    return _contentView;
}

#pragma mark -- 登录|注册
- (void)setUpTitleView{

    _titleView = [UIView new];
    _titleView.backgroundColor = [UIColor colorWithRed:246/255.0 green:249/255.0 blue:250/255.0 alpha:1];
    _titleView.frame = CGRectMake(0, 0,SCREEN_WIDTH, 35);
    [_middleView addSubview:_titleView];
    
    NSArray *titleArr = @[@"登录",@"注册"];
    for (int i = 0; i<titleArr.count; i++) {
        UIButton *button = [UIButton  buttonWithType:UIButtonTypeCustom];
        [button setTitle:titleArr[i] forState:UIControlStateNormal];
        button.titleLabel.font = [UIFont systemFontOfSize:17];
        button.tag = i;
        [button setTitleColor:[UIColor darkGrayColor] forState:UIControlStateNormal];
        button.frame = CGRectMake(i*(SCREEN_WIDTH/2- 100)+(SCREEN_WIDTH/2- 100), 0, 80, 33);
        [button addTarget:self action:@selector(buttonClick:) forControlEvents:UIControlEventTouchUpInside];
        [_titleView addSubview:button];
    }
    UIButton *firstBtn = _titleView.subviews[0];
    [self buttonClick:firstBtn];
    
    _indicatorView = [[UIView alloc]init];
    [_titleView addSubview:_indicatorView];
    _indicatorView.backgroundColor = [firstBtn titleColorForState:UIControlStateSelected];
    [firstBtn.titleLabel sizeToFit];
    [_indicatorView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.mas_equalTo(firstBtn.mas_left);
        make.top.mas_equalTo(firstBtn.mas_bottom);
        make.size.mas_equalTo(CGSizeMake(firstBtn.frame.size.width, 2));
    }];
    self.contentView.contentSize = CGSizeMake(SCREEN_WIDTH * titleArr.count, 0);
}


- (AccountPsdView *)loginView{
    if (!_loginView) {
        _loginView = [[AccountPsdView alloc]init];
        _loginView.backgroundColor =  [UIColor colorWithRed:246/255.0 green:249/255.0 blue:250/255.0 alpha:1];
        [_contentView addSubview:_loginView];
        [_loginView mas_makeConstraints:^(MASConstraintMaker *make) {
            make.top.mas_equalTo(_titleView.mas_bottom);
            make.left.mas_equalTo(_contentView.mas_left);
            make.width.mas_equalTo(SCREEN_WIDTH);
            make.height.mas_equalTo(360);
        }];
    }
    return _loginView;
}

- (VerificationView *)registView{
    if (!_registView) {
        _registView = [[VerificationView alloc]init];
        _registView.backgroundColor = [UIColor colorWithRed:246/255.0 green:249/255.0 blue:250/255.0 alpha:1];
        [_contentView addSubview:_registView];
        [_registView mas_makeConstraints:^(MASConstraintMaker *make) {
            make.top.mas_equalTo(_titleView.mas_bottom);
            make.left.mas_equalTo(_loginView.mas_right);
            make.width.mas_equalTo(SCREEN_WIDTH);
            make.height.mas_equalTo(360);
        }];
    }
    return _registView;
}

#pragma mark -- 内容
- (void)setUpContentView{
    [self contentView];
    [self loginView];
    [self registView];
    
}

#pragma mark - 按钮点击
- (void)buttonClick:(UIButton *)button
{
    button.selected = !button.selected;
    [_selectBtn setTitleColor:[UIColor darkGrayColor] forState:UIControlStateNormal];
    [button setTitleColor:UIColorFromRGB2(137, 209, 124) forState:UIControlStateNormal];
    
    _selectBtn = button;
    
    [_indicatorView setNeedsLayout];
    [_indicatorView layoutIfNeeded];
    [UIView animateWithDuration:0.25 animations:^{
        [_indicatorView mas_remakeConstraints:^(MASConstraintMaker *make) {
                make.left.mas_equalTo(button.mas_left);
                make.top.mas_equalTo(button.mas_bottom);
                make.size.mas_equalTo(CGSizeMake(button.frame.size.width, 2));
            make.centerX.mas_equalTo(button.mas_centerX);
        }];
    }];

    CGPoint offset = _contentView.contentOffset;
    offset.x = _contentView.frame.size.width * button.tag;
    [_contentView setContentOffset:offset animated:YES];
}

-(void)scrollViewDidEndDecelerating:(UIScrollView *)scrollView
{
    NSInteger index = scrollView.contentOffset.x / scrollView.frame.size.width;
    UIButton *button = _titleView.subviews[index];
    
    [self buttonClick:button];
}

// 退出
- (void)closeBtnClick:(UIButton *)btn{
    
    [self dismissViewControllerAnimated:YES completion:nil];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
