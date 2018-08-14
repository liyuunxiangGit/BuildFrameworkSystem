//
//  UIAlertController+Custom.h
//  ESuperVisionProject
//
//  Created by 石显军 on 2016/11/7.
//  Copyright © 2016年 dhyt. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UIAlertController (Custom)

/**
 * 显示 提示信息
 *
 * @param controller        显示的controller
 * @param preferredStyle    提示信息格式
 * @param title             标题
 * @param message           信息
 * @param cancelTitle       取消按钮标题
 * @param arrTitles         其他按钮标题 数组 NSString 格式
 * @param handler           点击回调
 * @param alertController   回调 UIAlertController
 * @param action            回调 UIAlertAction
 * @param index             回调 点击按钮排序 0为取消按钮 大于0s时 返回根据arrTitles下标+1
 */
+ (void)showPromptViewWithController:(UIViewController *)controller
                      preferredStyle:(UIAlertControllerStyle)preferredStyle
                               title:(NSString *)title
                             message:(NSString *)message
                   cancelButtonTitle:(NSString *)cancelTitle
                   otherButtonTitles:(NSArray<NSString *> *)arrTitles
                             handler:(void (^)(UIAlertController *alertController, UIAlertAction *action, NSInteger index))handler;


/**
 * 显示 Alert 提示信息
 *
 * @param controller        显示的controller
 * @param title             标题
 * @param message           信息
 * @param cancelTitle       取消按钮标题
 * @param arrTitles         其他按钮标题 数组 NSString 格式
 * @param handler           点击回调
 * @param alertController   回调 UIAlertController
 * @param action            回调 UIAlertAction
 * @param index             回调 点击按钮排序 0为取消按钮 大于0s时 返回根据arrTitles下标+1
 */
+ (void)showAlertViewWithController:(UIViewController *)controller
                              title:(NSString *)title message:(NSString *)message
                  cancelButtonTitle:(NSString *)cancelTitle
                  otherButtonTitles:(NSArray<NSString *> *)arrTitles
                            handler:(void (^)(UIAlertController *alertController, UIAlertAction *action, NSInteger index))handler;

/**
 * 显示 Action 提示信息
 *
 * @param controller        显示的controller
 * @param title             标题
 * @param message           信息
 * @param cancelTitle       取消按钮标题
 * @param arrTitles         其他按钮标题 数组 NSString 格式
 * @param handler           点击回调
 * @param alertController   回调 UIAlertController
 * @param action            回调 UIAlertAction
 * @param index             回调 点击按钮排序 0为取消按钮 大于0s时 返回根据arrTitles下标+1
 */
+ (void)showActionViewWithController:(UIViewController *)controller
                               title:(NSString *)title
                             message:(NSString *)message
                   cancelButtonTitle:(NSString *)cancelTitle
                   otherButtonTitles:(NSArray<NSString *> *)arrTitles
                             handler:(void (^)(UIAlertController *alertController, UIAlertAction *action, NSInteger index))handler;

/**
 * 用于 iPad 显示 Action 提示信息
 *
 * @param controller        显示的controller
 * @param popoverSourceView 点击的视图
 * @param title             标题
 * @param message           信息
 * @param cancelTitle       取消按钮标题
 * @param arrTitles         其他按钮标题 数组 NSString 格式
 * @param handler           点击回调
 * @param alertController   回调 UIAlertController
 * @param action            回调 UIAlertAction
 * @param index             回调 点击按钮排序 0为取消按钮 大于0s时 返回根据arrTitles下标+1
 */
+ (void)showiPadActionViewWithController:(UIViewController *)controller
                       popoverSourceView:(UIView *)popoverSourceView
                                   title:(NSString *)title
                                 message:(NSString *)message
                       cancelButtonTitle:(NSString *)cancelTitle
                       otherButtonTitles:(NSArray<NSString *> *)arrTitles
                                 handler:(void (^)(UIAlertController *alertController, UIAlertAction *action, NSInteger index))handler;

@end
