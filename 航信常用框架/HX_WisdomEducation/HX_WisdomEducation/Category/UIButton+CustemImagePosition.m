//
//  UIButton+CustemImagePosition.m
//  DHBaseProject_BM
//
//  Created by liuqiang on 2017/6/29.
//  Copyright © 2017年 dhyt. All rights reserved.
//

#import "UIButton+CustemImagePosition.h"

@implementation UIButton (CustemImagePosition)


- (void)setImagePositionType:(LCustemImagePosition)imagePositionType{
    //拿到title和image的大小：
    CGSize titleSize = self.titleLabel.bounds.size;
    CGSize imageSize = self.imageView.bounds.size;
    switch (imagePositionType) {
        case LCustemImagePositionDefault:
        {
        }
            break;
        case LCustemImagePositionTop:
        {
//            self.imageEdgeInsets = UIEdgeInsetsMake(-imageSize.height/2, titleSize.width/2, imageSize.height/2, -titleSize.width/2);
//            self.titleEdgeInsets = UIEdgeInsetsMake(titleSize.height/2, -imageSize.width/2, -titleSize.height/2, imageSize.width/2);
            [self verticalImageAndTitle:5.0];
        }
            break;
        case LCustemImagePositionRight:
        {
            //分别设置偏移量:记住偏移量是位移
            self.titleEdgeInsets = UIEdgeInsetsMake(0, -imageSize.width, 0, imageSize.width);
            self.imageEdgeInsets = UIEdgeInsetsMake(0, titleSize.width, 0, -titleSize.width);
        }
            break;
            
        default:
            break;
    }
}

- (void)verticalImageAndTitle:(CGFloat)spacing
{
    CGSize imageSize = self.imageView.frame.size;
    CGSize titleSize = self.titleLabel.frame.size;
    CGSize textSize = [self.titleLabel.text sizeWithFont:self.titleLabel.font];
    CGSize frameSize = CGSizeMake(ceilf(textSize.width), ceilf(textSize.height));
    if (titleSize.width + 0.5 < frameSize.width) {
        titleSize.width = frameSize.width;
    }
    CGFloat totalHeight = (imageSize.height + titleSize.height + spacing);
    self.imageEdgeInsets = UIEdgeInsetsMake(- (totalHeight - imageSize.height), 0.0, 0.0, - titleSize.width);
    self.titleEdgeInsets = UIEdgeInsetsMake(0, - imageSize.width, - (totalHeight - titleSize.height), 0);
    
}





@end
