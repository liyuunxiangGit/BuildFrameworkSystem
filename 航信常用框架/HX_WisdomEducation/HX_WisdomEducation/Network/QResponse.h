//
//  QResponse.h
//  Aisino_iOS_SupplyChain
//
//  Created by liuqiang on 2018/5/18.
//

#import <Foundation/Foundation.h>

@interface QResponse : NSObject

@property (nonatomic,assign)NSInteger errcode;//返回errorcode  1成功，0失败，token失效返2

@property (nonatomic,strong)id QResponseMeassage;//响应内容

@property (nonatomic,strong)NSString *msg;//响应说明(msg)

@property (nonatomic,strong)NSString *errorstring;//错误提示

@property (nonatomic,strong)NSError *error;//错误提示

@property (nonatomic,assign) NSInteger count;


@end
