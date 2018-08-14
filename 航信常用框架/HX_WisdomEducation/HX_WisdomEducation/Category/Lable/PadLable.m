//
//  PadLable.m
//  ESuperVisionProject
//
//  Created by liuqiang on 2018/1/26.
//  Copyright © 2018年 dhyt. All rights reserved.
//

#import "PadLable.h"

@implementation PadLable

/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
}
*/

- (void)drawTextInRect:(CGRect)rect {
    UIEdgeInsets insets = {5, 8, 5, 8};
    [super drawTextInRect:UIEdgeInsetsInsetRect(rect, insets)];
}

@end
