//
//  UIViewController+EmptyData.h
//  DHBaseProject_ZJ
//
//  Created by liuqiang on 17/4/1.
//  Copyright © 2017年 dhyt. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "UIScrollView+EmptyDataSet.h"


@interface UIViewController (EmptyData)<DZNEmptyDataSetSource,DZNEmptyDataSetDelegate>

@property (nonatomic,assign) EmptyDataType emptyDataType;

@property (nonatomic,strong) NSString *descriptionStr;

@property (nonatomic,strong) NSString *buttonTitleStr;

@property (nonatomic,strong) UIImage *bgImage;

/**
 点击刷新按钮Action
 */
- (void)refreshDataAction;

- (void)setEmptyDataType:(EmptyDataType)emptyDataType;

@end
