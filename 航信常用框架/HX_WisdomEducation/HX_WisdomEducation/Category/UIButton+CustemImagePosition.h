//
//  UIButton+CustemImagePosition.h
//  DHBaseProject_BM
//
//  Created by liuqiang on 2017/6/29.
//  Copyright © 2017年 dhyt. All rights reserved.
//

#import <UIKit/UIKit.h>

typedef NS_ENUM(NSInteger,LCustemImagePosition){
    LCustemImagePositionDefault = 0,    //图左
    LCustemImagePositionTop,            //图上
    LCustemImagePositionRight,          //图右
};

@interface UIButton (CustemImagePosition)

@property(nonatomic, assign) LCustemImagePosition imagePositionType;

- (void)verticalImageAndTitle:(CGFloat)spacing;

@end
