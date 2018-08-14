//
//  UIViewController+EmptyData.m
//  DHBaseProject_ZJ
//
//  Created by liuqiang on 17/4/1.
//  Copyright © 2017年 dhyt. All rights reserved.
//

#import "UIViewController+EmptyData.h"
#import <objc/runtime.h>


/** 空数据_图片*/
#define KEmptyData_Image [UIImage imageNamed:@"EmptyData_Icon"];
//空数据_图片_岗位申请
#define KEmptyData_Image_Apply [UIImage imageNamed:@"EmptyData_ApplyIcon"];


@interface UIViewController()

@end

@implementation UIViewController (EmptyData)
@dynamic emptyDataType;

- (UIImage *)bgImage{
    return objc_getAssociatedObject(self, @selector(bgImage));
}
- (void)setBgImage:(UIImage *)bgImage{
    return objc_setAssociatedObject(self, @selector(bgImage), bgImage, OBJC_ASSOCIATION_RETAIN_NONATOMIC);
}

- (NSString *)descriptionStr
{
    return objc_getAssociatedObject(self, @selector(descriptionStr));
}

- (void)setDescriptionStr:(NSString *)descriptionStr
{
    objc_setAssociatedObject(self, @selector(descriptionStr), descriptionStr, OBJC_ASSOCIATION_COPY_NONATOMIC);
}

- (NSString *)buttonTitleStr
{
    return objc_getAssociatedObject(self, @selector(buttonTitleStr));
}

- (void)setButtonTitleStr:(NSString *)buttonTitleStr
{
    objc_setAssociatedObject(self, @selector(buttonTitleStr), buttonTitleStr, OBJC_ASSOCIATION_COPY_NONATOMIC);
}


- (void)setEmptyDataType:(EmptyDataType)emptyDataType{
    switch (emptyDataType) {
        case EmptyDataTypeDefault:
        {
            self.descriptionStr = @"";;
            self.buttonTitleStr = nil;
            self.bgImage = KEmptyData_Image;
        }
            break;
        case EmptyDataTypeHaveButton:
        {
            self.descriptionStr = (self.descriptionStr == nil)?@"暂无数据...":self.descriptionStr;
            
            self.buttonTitleStr = (self.buttonTitleStr == nil)?@"":self.buttonTitleStr;
            
            self.bgImage = KEmptyData_Image_Apply;
        }
            break;
        case EmptyDataTypeCustem:
        {
            self.descriptionStr = (self.descriptionStr == nil)?@"暂无数据":self.descriptionStr;
            
            self.buttonTitleStr = (self.buttonTitleStr == nil)?@"去加载":self.buttonTitleStr;
            
        }
            break;
            
        default:
            break;
    }
}

- (void)refreshDataAction{}

#pragma DZNEmptyDataSetSource
- (UIImage *)imageForEmptyDataSet:(UIScrollView *)scrollView
{
    return self.bgImage;
}
- (nullable NSAttributedString *)descriptionForEmptyDataSet:(UIScrollView *)scrollView{
    if (self.descriptionStr == nil) {
        return nil;
    }
    NSAttributedString *str = [[NSAttributedString alloc] initWithString:self.descriptionStr attributes:@{NSFontAttributeName:[UIFont systemFontOfSize:16],NSForegroundColorAttributeName:kUIColorFromRGB(0xAEADAF)}];
    return  str;
}
- (nullable NSAttributedString *)buttonTitleForEmptyDataSet:(UIScrollView *)scrollView forState:(UIControlState)state{
    if(self.buttonTitleStr == nil){
        return nil;
    }
    NSAttributedString *str = [[NSAttributedString alloc] initWithString:self.buttonTitleStr attributes:@{NSFontAttributeName:[UIFont systemFontOfSize:14],NSForegroundColorAttributeName:[UIColor lightGrayColor]}];
    return str;
}

#pragma DZNEmptyDataSetDelegate
- (BOOL)emptyDataSetShouldAllowScroll:(UIScrollView *)scrollView
{
    return YES;
}
- (void)emptyDataSet:(UIScrollView *)scrollView didTapButton:(UIButton *)button;
{
    
        [self refreshDataAction];
}

@end

