//
//  UIViewController+CreateModel.h
//  ESuperVisionProject
//
//  Created by liuqiang on 16/6/2.
//  Copyright © 2016年 dhyt. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UIViewController (CreateModel)
#pragma mark -- 用字典生成model代码

-(void)createModelCodeWithDictionary:(NSDictionary *)dict modelName:(NSString *)modelName;
@end
