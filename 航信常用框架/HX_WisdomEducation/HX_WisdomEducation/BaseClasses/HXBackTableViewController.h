//
//  HXBackTableViewController.h
//  HX_EducationProject
//
//  Created by 荣学敏 on 2018/5/30.
//  Copyright © 2018年 liuqiang. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface HXBackTableViewController : UITableViewController
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
