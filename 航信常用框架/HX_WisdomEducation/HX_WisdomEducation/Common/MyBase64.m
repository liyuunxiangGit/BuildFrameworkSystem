//
//  MyBase64.m
//  HX_WisdomPC
//
//  Created by 荣学敏 on 2018/7/3.
//  Copyright © 2018年 HX. All rights reserved.
//

#import "MyBase64.h"

@implementation MyBase64

+ (NSString *)encodeBase64WithStr:(NSString *)string
{
    //先将string转换成data
    NSData *data = [string dataUsingEncoding:NSUTF8StringEncoding];
    
    NSData *base64Data = [data base64EncodedDataWithOptions:0];
    
    NSString *baseString = [[NSString alloc]initWithData:base64Data encoding:NSUTF8StringEncoding];
    
    return baseString;
}
//64解码

+ (NSString *)dencodeBase64WithStr:(NSString *)base64String
{
    //NSData *base64data = [string dataUsingEncoding:NSUTF8StringEncoding];
    
    NSData *data = [[NSData alloc]initWithBase64EncodedString:base64String options:NSDataBase64DecodingIgnoreUnknownCharacters];
    
    NSString *string = [[NSString alloc]initWithData:data encoding:NSUTF8StringEncoding];
    
    return string;
}
@end
