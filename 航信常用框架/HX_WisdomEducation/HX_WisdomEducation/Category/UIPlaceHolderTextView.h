//
//  UIPlaceHolderTextView.h
//  ESuperVisionProject
//
//  Created by carry on 16/8/10.
//  Copyright © 2016年 dhyt. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UIPlaceHolderTextView : UITextView

@property(nonatomic, retain) UILabel *placeHolderLabel;

@property(nonatomic, retain) NSString *placeholder;

@property(nonatomic, retain) UIColor *placeholderColor;


-(void)textChanged:(NSNotification*)notification;


@end
