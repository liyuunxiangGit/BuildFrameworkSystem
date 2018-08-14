//
//  NSDictionary+JSON.m
//  ybt
//
//  Created by 郭顺 on 14-9-26.
//  Copyright (c) 2014年 hnzdkj. All rights reserved.
//

#import "NSDictionary+JSON.h"

@implementation NSDictionary (JSON)
-(id)JSONObjectForKey:(NSString *)aKey{
    return [self objectForKey:aKey];
}

-(NSInteger)JSONIntegerObjectForKey:(NSString *)aKey{
    id object = [self objectForKey:aKey];
    if (object == nil) {
        return 0;
    }
    if ([object isKindOfClass:[NSNull class]]) {
        return 0;
    }else{
        return [object integerValue];
    }
}
@end
