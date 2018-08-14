//
//  UIView+CornerRadiu.m
//  IBTest
//
//  Created by 石显军 on 16/2/25.
//  Copyright © 2016年 石显军. All rights reserved.
//

#import "UIView+CornerRadiu.h"

IBInspectable
@implementation UIView (CornerRadiu)

- (void)setCornerRadiu:(CGFloat)cornerRadiu
{
    self.layer.cornerRadius = cornerRadiu;
    self.layer.masksToBounds = cornerRadiu > 0;
}

- (CGFloat)cornerRadiu
{
    return self.layer.cornerRadius;
}

- (void)setBorderColor:(UIColor *)borderColor
{
    self.layer.borderColor = borderColor.CGColor;
}

- (UIColor *)borderColor
{
    return [UIColor colorWithCGColor:self.layer.borderColor];
}

- (void)setBorderWidth:(CGFloat)borderWidth
{
    self.layer.borderWidth = borderWidth;
}

- (CGFloat)borderWidth
{
    return self.layer.borderWidth;
}

@end
