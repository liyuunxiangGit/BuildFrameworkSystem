//
//  UIView+LFExtension.m
//  Aisino_iOS_SupplyChain
//
//  Created by 吕峰 on 2018/4/26.
//

#import "UIView+LFExtension.h"

@implementation UIView (LFExtension)
- (CGFloat)lf_top {
    return self.frame.origin.y;
}

- (void)setLf_top:(CGFloat)lf_top {
    CGRect frame = self.frame;
    frame.origin.y = lf_top;
    self.frame = frame;
}

- (CGFloat)lf_left {
    return self.frame.origin.x;
}

- (void)setLf_left:(CGFloat)lf_left {
    CGRect frame = self.frame;
    frame.origin.x = lf_left;
    self.frame = frame;
}


- (CGFloat)lf_right {
    return CGRectGetMaxX(self.frame);
}

- (void)setLf_right:(CGFloat)lf_right {
    self.lf_x = lf_right - self.lf_width;
}


- (CGFloat)lf_bottom {
    return CGRectGetMaxY(self.frame);
}

- (void)setLf_bottom:(CGFloat)lf_bottom {
    self.lf_y = lf_bottom - self.lf_height;
}

- (void)setLf_x:(CGFloat)lf_x {
    CGRect frame = self.frame;
    frame.origin.x = lf_x;
    self.frame = frame;
}

- (void)setLf_y:(CGFloat)lf_y
{
    CGRect frame = self.frame;
    frame.origin.y = lf_y;
    self.frame = frame;
}

- (CGFloat)lf_x
{
    return self.frame.origin.x;
}

- (CGFloat)lf_y
{
    return self.frame.origin.y;
}

- (void)setLf_centerX:(CGFloat)lf_centerX
{
    CGPoint center = self.center;
    center.x = lf_centerX;
    self.center = center;
}

- (CGFloat)lf_centerX
{
    return self.center.x;
}

- (void)setLf_centerY:(CGFloat)lf_centerY
{
    CGPoint center = self.center;
    center.y = lf_centerY;
    self.center = center;
}

- (CGFloat)lf_centerY
{
    return self.center.y;
}

- (void)setLf_width:(CGFloat)lf_width
{
    CGRect frame = self.frame;
    frame.size.width = lf_width;
    self.frame = frame;
}

- (void)setLf_height:(CGFloat)lf_height
{
    CGRect frame = self.frame;
    frame.size.height = lf_height;
    self.frame = frame;
}

- (CGFloat)lf_height
{
    return self.frame.size.height;
}

- (CGFloat)lf_width
{
    return self.frame.size.width;
}

- (void)setLf_size:(CGSize)lf_size
{
    CGRect frame = self.frame;
    frame.size = lf_size;
    self.frame = frame;
}

- (CGSize)lf_size
{
    return self.frame.size;
}

- (void)setLf_origin:(CGPoint)lf_origin
{
    CGRect frame = self.frame;
    frame.origin = lf_origin;
    self.frame = frame;
}

- (CGPoint)lf_origin
{
    return self.frame.origin;
}


- (instancetype)lf_cornerAllCornersWithCornerRadius:(CGFloat)cornerRadius {
    
    CAShapeLayer *shapeLayer = [CAShapeLayer layer];
    UIBezierPath *path = [UIBezierPath bezierPathWithRoundedRect:self.bounds byRoundingCorners:UIRectCornerAllCorners cornerRadii:CGSizeMake(cornerRadius, cornerRadius)];
    shapeLayer.path = path.CGPath;
    self.layer.mask = shapeLayer;
    return self;
}
@end
