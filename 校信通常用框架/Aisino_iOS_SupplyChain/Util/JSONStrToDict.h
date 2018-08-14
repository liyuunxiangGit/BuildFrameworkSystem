//
//  JSONStrToDict.h
//  ybt
//
//  Created by cocoabanana on 14/10/25.
//  Copyright (c) 2014年 hnzdkj. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface JSONStrToDict : NSObject
+ (NSDictionary *)dictionaryWithJsonString:(NSString *)jsonString;
@end
