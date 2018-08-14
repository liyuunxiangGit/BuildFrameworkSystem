//
//  UIView+Nib.h
//  DHBaseProject_ZJ
//
//  Created by 我的大好时光 on 2017/4/1.
//  Copyright © 2017年 dhyt. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UIView (Nib)
+ (UINib *)hx_loadNib;
+ (UINib *)hx_loadNibNamed:(NSString*)nibName;
+ (UINib *)hx_loadNibNamed:(NSString*)nibName bundle:(NSBundle *)bundle;

+ (instancetype)hx_loadInstanceFromNib;
+ (instancetype)hx_loadInstanceFromNibWithName:(NSString *)nibName;
+ (instancetype)hx_loadInstanceFromNibWithName:(NSString *)nibName owner:(id)owner;
+ (instancetype)hx_loadInstanceFromNibWithName:(NSString *)nibName owner:(id)owner bundle:(NSBundle *)bundle;
@end
