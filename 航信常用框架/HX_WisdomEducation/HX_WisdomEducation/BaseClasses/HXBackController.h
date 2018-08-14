//
//  HXBackController.h
//  Aisino_iOS_SupplyChain
//
//  Created by liuqiang on 2018/4/18.
//

#import <UIKit/UIKit.h>
#import "CommonShare.h"


@interface HXBackController : UIViewController

@property (nonatomic, assign) NavType navtype;

/**
 初始化 alloc init
 
 @return controller 实例
 */
+ (instancetype _Nullable )controller;

/**
 初始化 initWithNibName
 
 @return controller 实例
 */
+ (instancetype _Nullable )controllerFormXib;


// 返回方法
- (void)chickBackItem;


///**
// 为 nav.rightBarButtonItem 添加一个按钮 *会顶替原本的按钮
// 
// @param type 按钮类型
// @param target 按钮触发的方法 所属
// @param action 按钮触发的方法
// */
//- (void)addNavRightItemWithType:(NavRightItemType)type addTarget:(nullable id)target action:(SEL _Nullable)action;

- (void)loadDataWithAnimation:(BOOL)animation;
- (void)configTableView NS_REQUIRES_SUPER;

@end
