//
//  Config.h
//  ybt
//  //配置文件
//  Created by 郭顺 on 14-9-18.
//  Copyright (c) 2014年 hnzdkj. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface Config : NSObject
+(id)valueForKey:(NSString *)key;
+(void)setValue:(id)value forKey:(NSString *)key;
@end
