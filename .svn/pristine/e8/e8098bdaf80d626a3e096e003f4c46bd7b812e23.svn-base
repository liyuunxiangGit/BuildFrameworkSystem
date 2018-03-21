//
//  SCBaseViewController.h
//  Aisino_iOS_SupplyChain
//
//  Created by 荣学敏 on 2018/3/19.
//

#import <UIKit/UIKit.h>
#import "MBProgressHUD.h"

@interface SCBaseViewController : UIViewController
{
    UIImageView *navBarHairlineImageView;
}
@property(nonatomic,copy)NSString *vcTagName;

-(void)showHudText:(NSString *)content;
-(void)showHudOnlyText:(NSString *)content;
-(void)dismissHud;
-(void)showSuccessHubContent:(NSString *)content;
-(void)showErrorHubContent:(NSString *)content;
/**
 *  tab bar红点显示
 *
 *  @param msg   nil：取消红点，@“ ”显示不带数字的红点，其他显示相应数字
 *  @param index tab bar的序号
 */
-(void)updateBarMsg:(NSString *)msg AtIndex:(NSInteger)index;

-(void)setBarNormalImageName:(NSString *)normal PressImageName:(NSString *)press AtIndex:(NSInteger)index;
-(void)setTabBarBadage;
@end
