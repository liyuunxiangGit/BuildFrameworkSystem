//
//  NSObject+Reflection.h
//  hxBaseProject_ZJ
//
//  Created by 我的大好时光 on 2017/4/1.
//  Copyright © 2017年 hxyt. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface NSObject (Reflection)

//类名
- (NSString *)hx_className;
+ (NSString *)hx_className;
//父类名称
- (NSString *)hx_superClassName;
+ (NSString *)hx_superClassName;

//实例属性字典
-(NSDictionary *)hx_propertyDictionary;

//属性名称列表
- (NSArray*)hx_propertyKeys;
+ (NSArray *)hx_propertyKeys;

//属性详细信息列表
- (NSArray *)hx_propertiesInfo;
+ (NSArray *)hx_propertiesInfo;

//格式化后的属性列表
+ (NSArray *)hx_propertiesWithCodeFormat;

//方法列表
-(NSArray*)hx_methodList;
+(NSArray*)hx_methodList;

-(NSArray*)hx_methodListInfo;

//创建并返回一个指向所有已注册类的指针列表
+ (NSArray *)hx_registedClassList;
//实例变量
+ (NSArray *)hx_instanceVariable;

//协议列表
-(NSDictionary *)hx_protocolList;
+ (NSDictionary *)hx_protocolList;


- (BOOL)hx_hasPropertyForKey:(NSString*)key;
- (BOOL)hx_hasIvarForKey:(NSString*)key;

@end
