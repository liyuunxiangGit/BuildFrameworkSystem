//
//  UIView+Nib.m
//  hxBaseProject_ZJ
//
//  Created by 我的大好时光 on 2017/4/1.
//  Copyright © 2017年 hxyt. All rights reserved.
//

#import "UIView+Nib.h"

@implementation UIView (Nib)
#pragma mark - Nibs
+ (UINib *)hx_loadNib
{
        return [self hx_loadNibNamed:NSStringFromClass([self class])];
}
+ (UINib *)hx_loadNibNamed:(NSString*)nibName
{
        return [self hx_loadNibNamed:nibName bundle:[NSBundle mainBundle]];
}
+ (UINib *)hx_loadNibNamed:(NSString*)nibName bundle:(NSBundle *)bundle
{
        return [UINib nibWithNibName:nibName bundle:bundle];
}
+ (instancetype)hx_loadInstanceFromNib
{
        return [self hx_loadInstanceFromNibWithName:NSStringFromClass([self class])];
}
+ (instancetype)hx_loadInstanceFromNibWithName:(NSString *)nibName
{
        return [self hx_loadInstanceFromNibWithName:nibName owner:nil];
}
+ (instancetype)hx_loadInstanceFromNibWithName:(NSString *)nibName owner:(id)owner
{
        return [self hx_loadInstanceFromNibWithName:nibName owner:owner bundle:[NSBundle mainBundle]];
}
+ (instancetype)hx_loadInstanceFromNibWithName:(NSString *)nibName owner:(id)owner bundle:(NSBundle *)bundle
{
        UIView *result = nil;
        NSArray* elements = [bundle loadNibNamed:nibName owner:owner options:nil];
        for (id object in elements)
        {
                if ([object isKindOfClass:[self class]])
                {
                        result = object;
                        break;
                }
        }
        return result;
}
@end
