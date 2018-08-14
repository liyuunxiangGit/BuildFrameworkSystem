//
//  UIViewController+CreateModel.m
//  ESuperVisionProject
//
//  Created by liuqiang on 16/6/2.
//  Copyright © 2016年 dhyt. All rights reserved.
//

#import "UIViewController+CreateModel.h"

@implementation UIViewController (CreateModel)
#pragma mark -- 用字典生成model代码

-(void)createModelCodeWithDictionary:(NSDictionary *)dict modelName:(NSString *)modelName

{
    printf("\n@interface %s : NSObject\n",modelName.UTF8String);
    for (NSString *key in dict) {
        printf("@property (copy,nonatomic) NSString *%s;\n",key.UTF8String);
    }
}
@end
