//
//  Config.m
//  ybt
//
//  Created by 郭顺 on 14-9-18.
//  Copyright (c) 2014年 hnzdkj. All rights reserved.
//

#import "Config.h"
const NSString *config_file = @"YbtSetting";

@implementation Config
+(id)valueForKey:(NSString *)key{
    NSUserDefaults *defaults = [NSUserDefaults standardUserDefaults];
    return [defaults valueForKey:key];
}

+(void)setValue:(id)value forKey:(NSString *)key{
    NSUserDefaults *defaults = [NSUserDefaults standardUserDefaults];
    [defaults setObject:value forKey:key];
    [defaults synchronize];
}
@end
