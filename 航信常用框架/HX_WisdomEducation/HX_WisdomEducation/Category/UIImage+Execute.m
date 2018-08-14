//
//  UIImage+Execute.m
//  ESuperVisionProject
//
//  Created by carry on 15/11/4.
//  Copyright © 2015年 dhyt. All rights reserved.
//

#import "UIImage+Execute.h"

@implementation UIImage (Execute)

/*
 返回宽或高为1024的图片，压缩不明显，原图2592 × 1936大小为1003959b,
 等比例缩小后到1024 × 765后大小为854925b,数据只压缩了百分之二十
 */
- (UIImage*)imageCompression
{
    if (self.size.height<=1024.0||self.size.width<=1024.0) {
        return self;
    }
    CGSize size;
    
    if (self.size.width>self.size.height) {
        size = CGSizeMake(1024.0, (1024.0*self.size.height)/self.size.width);
    }else
        size = CGSizeMake((1024*self.size.width)/self.size.height, 1024.0);
    
    UIGraphicsBeginImageContext(size);  //size 为CGSize类型，即你所需要的图片尺寸
    [self drawInRect:CGRectMake(0, 0, size.width, size.height)];
    UIImage* scaledImage = UIGraphicsGetImageFromCurrentImageContext();
    UIGraphicsEndImageContext();
    return scaledImage;
}

/*
 返回宽或高为1024的图片字节流，压缩明显，原图2592 × 1936大小为1003959b,
 等比例缩小后到1024 × 765后大小为197961b,数据压缩了百分之八十多，
 并且俩者图像效果对比没有明显区别，
 所以介意使用此方法
 */
- (NSData*)backDataimageCompressio
{
    if (self.size.height<=1024.0||self.size.width<=1024.0) {
        return UIImageJPEGRepresentation(self, 0.8);
    }
    CGSize size;
    
    if (self.size.width>self.size.height) {
        size = CGSizeMake(1024.0, (1024.0*self.size.height)/self.size.width);
    }else
        size = CGSizeMake((1024*self.size.width)/self.size.height, 1024.0);
    
    UIGraphicsBeginImageContext(size);  //size 为CGSize类型，即你所需要的图片尺寸
    [self drawInRect:CGRectMake(0, 0, size.width, size.height)];
    UIImage* scaledImage = UIGraphicsGetImageFromCurrentImageContext();
    UIGraphicsEndImageContext();
    
    return UIImageJPEGRepresentation(scaledImage, 0.8);
}

@end
