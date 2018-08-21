//
//  UIImage+Execute.h
//  ESuperVisionProject
//
//  Created by carry on 15/11/4.
//  Copyright © 2015年 dhyt. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UIImage (Execute)

/*
 返回宽或高为1024的图片，压缩不明显，原图2592 × 1936大小为1003959b,
 等比例缩小后到1024 × 765后大小为854925b,数据只压缩了百分之二十
 */
- (UIImage*)imageCompression;

/*
 返回宽或高为1024的图片字节流，压缩明显，原图2592 × 1936大小为1003959b,
 等比例缩小后到1024 × 765后大小为197961b,数据压缩了百分之八十多，
 并且俩者图像效果对比没有明显区别，
 所以介意使用此方法
 */
- (NSData*)backDataimageCompressio;

@end
