//
//  HXBackTableViewController.m
//  HX_EducationProject
//
//  Created by 荣学敏 on 2018/5/30.
//  Copyright © 2018年 liuqiang. All rights reserved.
//

#import "HXBackTableViewController.h"
#import "UIViewController+EmptyData.h"

@interface HXBackTableViewController ()
@property (nonatomic, strong) UIButton *btnBack;

@property (nonatomic, strong) UIButton *btnRight;
@end

@implementation HXBackTableViewController


- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    self.view.frame = [UIScreen mainScreen].bounds;
    self.view.backgroundColor = UIColorMainGrayColor;
    [self.navigationController.navigationBar setTitleTextAttributes:@{NSForegroundColorAttributeName: [UIColor whiteColor]}];

    if ([self respondsToSelector:@selector(setEdgesForExtendedLayout:)])
    {
        [self setEdgesForExtendedLayout:UIRectEdgeNone];
    }
    self.navtype = NavType_White;
    [self _loadBackItem];
    [self setEmptyDataType:EmptyDataTypeHaveButton];
    
    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void)viewWillAppear:(BOOL)animated
{
    [super viewWillAppear:animated];
    
    [self _updateNavState];
    
    //    [MobClick beginLogPageView:NSStringFromClass([self class])];
    NSLog(@"======%@进入了=====", NSStringFromClass(self.class));
    
}

- (void)viewWillDisappear:(BOOL)animated
{
    [super viewWillDisappear:animated];
    
    
    [self.btnBack setImage:[UIImage imageNamed:@"tav_return_normal"] forState:UIControlStateNormal];
    [UIApplication sharedApplication].statusBarStyle = UIStatusBarStyleLightContent;
    
    [self.navigationController.navigationBar setTitleTextAttributes:@{NSForegroundColorAttributeName: [UIColor whiteColor]}];
}

- (void)dealloc
{
    NSLog(@"======%@释放了=====", NSStringFromClass(self.class));
}

#pragma mark - Getter
- (UIButton *)btnBack
{
    if (_btnBack == nil) {
        _btnBack = [UIButton buttonWithType:UIButtonTypeCustom];
        _btnBack.frame = CGRectMake(0, 0, 31, 20);
        [_btnBack setImage:[UIImage imageNamed:@"tav_return_normal"] forState:UIControlStateNormal];
        _btnBack.adjustsImageWhenHighlighted = NO;
        [_btnBack addTarget:self action:@selector(chickBackItem) forControlEvents:UIControlEventTouchUpInside];
    }
    return _btnBack;
}

- (UIButton *)btnRight
{
    if (_btnRight == nil) {
        _btnRight = [UIButton buttonWithType:UIButtonTypeCustom];
        _btnRight.frame = CGRectMake(0, 0, 40, 40);
        _btnRight.adjustsImageWhenHighlighted = NO;
        _btnBack.titleLabel.font = [UIFont systemFontOfSize:15];
    }
    return _btnRight;
}


#pragma mark - Setter
- (void)setNavtype:(NavType)navtype
{
    _navtype = navtype;
    
    [self _updateNavState];
    
}


#pragma mark - Private Method
- (void)_loadBackItem
{
    self.navigationController.interactivePopGestureRecognizer.delegate = nil;
    
    [self.navigationItem.backBarButtonItem setTitle:@""];
    
    UIBarButtonItem *backItem = [[UIBarButtonItem alloc] initWithCustomView:self.btnBack];
    
    self.navigationItem.leftBarButtonItem = backItem;
}


- (void)_updateNavState
{
    switch (self.navtype) {
        case NavType_White:
        {
            //            [self.btnBack setImage:[UIImage imageNamed:@"btn_guide-dog_choose_back"] forState:UIControlStateNormal];
            self.navigationItem.leftBarButtonItem.tintColor = [UIColor whiteColor];
            //            [UIApplication sharedApplication].statusBarStyle = UIStatusBarStyleDefault;
            [self.navigationController.navigationBar setBarTintColor:[UIColor whiteColor]];
            
            //            [self.navigationController.navigationBar setTitleTextAttributes:@{NSForegroundColorAttributeName:[UIColor darkGrayColor]}];
        }
            break;
        default:
            break;
    }
}



#pragma mark - Public

//- (void)addNavRightItemWithType:(NavRightItemType)type addTarget:(nullable id)target action:(SEL _Nullable)action;
//{
//    //*** 按钮 颜色暂未处理 可以根据 navtype 进行判断
//
//    self.btnRight = nil;        // 重置
//    switch (type) {
//        case NavRightItemType_Add:
//        {
//            [self.btnRight setImage:[UIImage imageNamed:@"BBS_white_add"] forState:UIControlStateNormal];
//        }
//            break;
//        case NavRightItemType_Done:
//        {
//            [self.btnRight setTitle:@"完成" forState:UIControlStateNormal];
//        }
//            break;
//        case NavRightItemType_Revise:
//        {
//            [self.btnRight setTitle:@"修改" forState:UIControlStateNormal];
//        }
//            break;
//            //...
//        default:
//            break;
//    }

//    self.navigationItem.rightBarButtonItem = [[UIBarButtonItem alloc] initWithCustomView:self.btnRight];
//    [self.btnRight addTarget:target action:action forControlEvents:UIControlEventTouchUpInside];
//}


- (void)loadDataWithAnimation:(BOOL)animation{}
- (void)configTableView{}

#pragma mark - Class Method
+ (instancetype)controller
{
    return [[self alloc] init];
}

+ (instancetype)controllerFormXib
{
    return [[self alloc] initWithNibName:NSStringFromClass([self class]) bundle:[NSBundle mainBundle]];
}

#pragma mark - Action

- (void)chickBackItem
{
    [self.view endEditing:YES];
    
    if (self.navigationController.viewControllers.count <= 1)
    {
        [self dismissViewControllerAnimated:YES completion:nil];
    }else
    {
        [self.navigationController popViewControllerAnimated:YES];
    }
}



@end
