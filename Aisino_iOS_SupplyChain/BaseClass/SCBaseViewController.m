//
//  SCBaseViewController.m
//  Aisino_iOS_SupplyChain
//
//  Created by 荣学敏 on 2018/3/19.
//

#import "SCBaseViewController.h"
#import "MBProgressHUD+Add.h"
NSMutableArray *m_tabBadageArray;
@interface SCBaseViewController (){
    NSInteger m_hubShowController;
}

@end

@implementation SCBaseViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    //    增加设置不透明。   //ios7会报错.
    if (CURRENT_SYS_VERSION < 8.0  ) {
        self.navigationController.navigationBar.translucent = NO;
    }

    navBarHairlineImageView = [self findHairlineImageViewUnder:self.navigationController.navigationBar];
}

- (UIImageView *)findHairlineImageViewUnder:(UIView *)view {
    if ([view isKindOfClass:UIImageView.class] && view.bounds.size.height <= 1.0) {
        return (UIImageView *)view;
    }
    for (UIView *subview in view.subviews) {
        UIImageView *imageView = [self findHairlineImageViewUnder:subview];
        if (imageView) {
            return imageView;
        }
    }
    return nil;
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void)viewWillAppear:(BOOL)animated{
    [super viewWillAppear:animated];
    NSString *name = [NSString stringWithUTF8String:object_getClassName(self)];
    navBarHairlineImageView.hidden = YES;
    NSLog(@"%@",[NSString stringWithFormat:@"[VC VWA]Class=%@|Name=%@",[self class],_vcTagName]);
}

- (void)viewDidAppear:(BOOL)animated{
    [super viewDidAppear:animated];
    
    DDLogVerbose(@"%@",[NSString stringWithFormat:@"[VC VDA]Class=%@|Name=%@",[self class],_vcTagName]);
}

- (void)viewWillDisappear:(BOOL)animated{
    [super viewWillDisappear:animated];
    navBarHairlineImageView.hidden = NO;
    DDLogVerbose(@"%@",[NSString stringWithFormat:@"[VC WWD]Class=%@|Name=%@",[self class],_vcTagName]);
}



- (void)viewDidDisappear:(BOOL)animated{
    [super viewDidDisappear:animated];
    //     [self dismissHud];
    NSString *name = [NSString stringWithUTF8String:object_getClassName(self)];
    
    NSLog(@"%@",[NSString stringWithFormat:@"[VC VDD]Class=%@|Name=%@",[self class],_vcTagName]);
}
//点击self.view就让键盘收起
- (void)touchesBegan:(NSSet *)touches withEvent:(UIEvent *)event
{
    [self.view endEditing:YES];
}

//调试定位问题用：http://blog.csdn.net/studyrecord/article/details/7800900
//#ifdef _FOR_DEBUG_
//-(BOOL)respondsToSelector:(SEL)aSelector{
//    printf("SELECTOR: %s\n",[NSStringFromSelector(aSelector)UTF8String]);
//    return[super respondsToSelector:aSelector];
//}
//#endif

/*
 #pragma mark - Navigation
 
 // In a storyboard-based application, you will often want to do a little preparation before navigation
 - (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
 // Get the new view controller using [segue destinationViewController].
 // Pass the selected object to the new view controller.
 }
 */

#pragma mark -指示器
-(void)showHudText:(NSString *)content{
    DDLogDebug(@"showHubText:%@",content);
    if (m_hubShowController > 0) {
        m_hubShowController++;
    }else{
        m_hubShowController = 1;
        dispatch_async(dispatch_get_main_queue(), ^{
            [MBProgressHUD showMessag:content toView:nil];
        });
        
    }
    
}

-(void)showHudOnlyText:(NSString *)content{
    DDLogDebug(@"showHudOnlyText:%@",content);
    dispatch_async(dispatch_get_main_queue(), ^{
        [MBProgressHUD showOnlyMessage:content toView:nil];
    });
    
}

-(void)dismissHud{
    DDLogDebug(@"dismissHud");
    //[MMProgressHUD dismiss];
    m_hubShowController--;
    if (m_hubShowController <= 0) {
        DDLogDebug(@"dismissHud-real");
        dispatch_async(dispatch_get_main_queue(), ^{
            [MBProgressHUD dismissHudForView:nil];
            m_hubShowController = 0;
        });
        
    }
    
}

-(void)showSuccessHubContent:(NSString *)content{
    DDLogDebug(@"showSuccessHubContent:%@",content);
    dispatch_async(dispatch_get_main_queue(), ^{
        [MBProgressHUD showSuccess:content toView:nil];
    });
}

-(void)showErrorHubContent:(NSString *)content{
    DDLogDebug(@"showErrorHubContent:%@",content);
    dispatch_async(dispatch_get_main_queue(), ^{
        [MBProgressHUD showError:content toView:nil];
    });
    
}


- (BOOL)shouldAutorotate{
    return NO;
}

- (UIInterfaceOrientationMask)supportedInterfaceOrientations {
    return UIInterfaceOrientationMaskPortrait;
}



-(void)updateBarMsg:(NSString *)msg AtIndex:(NSInteger)index
{
    NSArray *barItems = self.tabBarController.tabBar.items;
    if (index >= [barItems count]) {
        return;
    }
    UITabBarItem *item = [barItems objectAtIndex:index];
    UILabel *bad = [m_tabBadageArray objectAtIndex:index];
    if ([@" " isEqualToString:msg]) {
        [bad removeFromSuperview]; //这样做是为了红点能够压住绿色的底
        [self.tabBarController.tabBar addSubview:bad];
        [bad setHidden:NO];
    }else{
        [item setBadgeValue:msg];
        [bad setHidden:YES];
    }
}

-(void)setTabBarBadage{
    CGRect frame = self.tabBarController.tabBar.frame;
    NSInteger itemsCount = [self.tabBarController.tabBar.items count];
    m_tabBadageArray = [[NSMutableArray alloc]init];
    CGFloat xdiv = frame.size.width / itemsCount;
    for (NSInteger i = 0; i<itemsCount; i++) {
        CGRect badageFrame = CGRectMake(i*xdiv + xdiv/1.6, 5, xdiv/8, xdiv/8);
        UILabel *bad = [[UILabel alloc]initWithFrame:badageFrame];
        bad.backgroundColor = [UIColor redColor];
        [bad.layer setMasksToBounds:YES];
        [bad.layer setBorderWidth:1.0];
        [bad.layer setBorderColor:[[UIColor clearColor] CGColor]];
        [bad.layer setCornerRadius:bad.frame.size.height / 2.0];
        [bad setHidden:YES];
        [m_tabBadageArray addObject:bad];
        [self.tabBarController.tabBar addSubview:bad];
    }
}

-(void)setBarNormalImageName:(NSString *)normal PressImageName:(NSString *)press AtIndex:(NSInteger)index{
    NSArray *barItems = self.tabBarController.tabBar.items;
    if (index >= [barItems count]) {
        return;
    }
    UITabBarItem *item = [barItems objectAtIndex:index];
//    item.image = [UIImage imageNamed:normal];
//    item.selectedImage = [UIImage imageNamed:press];
    [item setTitleTextAttributes:[NSDictionary dictionaryWithObjectsAndKeys:UIColorFromRGB2(165, 209, 131),UITextAttributeTextColor, nil] forState:UIControlStateSelected];
    [item setImage:[[UIImage imageNamed:normal] imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal]];//普通图片
//    item.imageInsets = UIEdgeInsetsMake(3, 3, 3, 3);
    [item setSelectedImage:[[UIImage imageNamed:press] imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal]];//选中图片
}

@end
