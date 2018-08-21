//
//  BaseModel.m
//  Aisino_iOS_SupplyChain
//
//  Created by liuqiang on 2018/4/17.
//

#import "BaseModel.h"
#import <objc/runtime.h>

@implementation BaseModel
+ (NSArray *)arrayModelWithArray:(NSArray *)array
{
    if (!array || array.count == 0)
    {
        return @[];
    }
    NSMutableArray *tempArr = [[NSMutableArray alloc] initWithCapacity:array.count];
    for (id value in array)
    {
        if (![value isKindOfClass:[NSDictionary class]])
        {
            continue;
        }
        id model = [[self alloc] initWithContent:value];
        if (model)
        {
            [tempArr addObject:model];
        }
    }
    return tempArr.copy;
}



/**
 *@ 初始化数据 格式除了 数组和字典 都将转换为 NSString
 */
- (id)initWithContent:(NSDictionary *)jsonDic
{
    self = [super init];
    if (self) {
        [self setAttributes:[self RemoveNullFormData:jsonDic]];
        
        [self finishInitData];
    }
    return self;
}

/**
 *@ 初始化数据 格式保留原始格式
 */
- (id)initOriginalFormatWithContent:(NSDictionary *)jsonDic
{
    self = [super init];
    if (self) {
        [self setAttributes:jsonDic];
        
    }
    return self;
}

// 格式保留原始格式
- (void)setOriginalFormatWithContent:(NSDictionary *)jsonDic
{
    [self setAttributes:jsonDic];
}


- (void)setAttributes:(NSDictionary *)jsonDic
{
    
    NSDictionary *jsonKeyDic = [self _attributesMap:jsonDic];
    
    
    for (id key in jsonKeyDic) {
        
        SEL sel = [self _stringToSEL:key];
        
        if ([self respondsToSelector:sel]) {
            
            id value = jsonKeyDic[key];
            NSString *content = jsonDic[value];
            
            //            if ([content isEqual:[NSNull null]]) {
            //                content = @"";
            //            }
            //
            //            if ([key isEqualToString:@"user"] || [key isEqualToString:@"retweeted_status"]) {
            //                continue;
            //            }
            
            [self performSelector:sel withObject:content];
        }
    }
}


- (SEL)_stringToSEL:(NSString *)value
{
    NSString *first = [[value substringToIndex:1] uppercaseString];
    
    NSString *end = [value substringFromIndex:1];
    
    NSString *setter = [NSString stringWithFormat:@"set%@%@:",first, end];
    
    return NSSelectorFromString(setter);
}

- (NSDictionary *)_attributesMap:(NSDictionary *)jsonDic
{
    if (![jsonDic isKindOfClass:[NSDictionary class]]) {
        return @{};
    }
    NSMutableDictionary *keys = [NSMutableDictionary dictionaryWithCapacity:[jsonDic count]];
    
    for (id jsonKey in jsonDic) {
        
        if ([jsonKey isEqualToString:@"id"]) {
            NSString *className = NSStringFromClass([self class]);
            NSString *modelKey = [className stringByAppendingString:[jsonKey uppercaseString]];
            [keys setValue:jsonKey forKey:modelKey];
            
        }else {
            
            [keys setValue:jsonKey forKey:jsonKey];
        }
    }
    
    return keys;
}

+ (NSArray *)modelArrayWithArrs:(NSArray *)array
{
    if (!array || array.count == 0)
    {
        return @[];
    }
    NSMutableArray *tempArr = [[NSMutableArray alloc] initWithCapacity:array.count];
    for (id value in array)
    {
        if (![value isKindOfClass:[NSDictionary class]])
        {
            continue;
        }
        id model = [[self alloc] initWithContent:value];
        if (model)
        {
            [tempArr addObject:model];
        }
    }
    return tempArr.copy;
}


/**
 *@ 完成数据的初始赋值
 *@ initWithContent: 方法执行完成之后 调用
 *@ 用于对数据的整理
 */
- (void)finishInitData
{
    
}

-(NSDictionary *)convertModelToDictionary

{
    NSMutableDictionary *dic = [[NSMutableDictionary alloc] init];
    for (NSString *key in [self propertyKeys]) {
        id propertyValue = [self valueForKey:key];
        //该值不为NSNULL，并且也不为nil
        if(propertyValue==NULL||propertyValue==nil||[propertyValue isKindOfClass:[NSNull class]]){
            propertyValue = @"";
        }
        [dic setObject:propertyValue forKey:key];
        
    }
    return dic;
}

- (NSArray*)propertyKeys
{
    unsigned int outCount, i;
    objc_property_t *properties = class_copyPropertyList([self class], &outCount);
    NSMutableArray *keys = [[NSMutableArray alloc] initWithCapacity:outCount];
    for (i = 0; i < outCount; i++) {
        objc_property_t property = properties[i];
        NSString *propertyName = [[NSString alloc] initWithCString:property_getName(property) encoding:NSUTF8StringEncoding];
        [keys addObject:propertyName];
    }
    free(properties);
    return keys;
}


#pragma mark - 清楚数据中的null

- (id)RemoveNullFormData:(id)data
{
    if ([data isKindOfClass:[NSArray class]]) {
        NSMutableArray *newData = [NSMutableArray new];
        for (id subdata in data) {
            [newData addObject:[self RemoveNullFormData:subdata]];
        }
        return newData;
        
    }else if ([data isKindOfClass:[NSDictionary class]]) {
        
        NSMutableDictionary *newData = [NSMutableDictionary new];
        NSArray *arrKeys = [data allKeys];
        for (NSString *key in arrKeys) {
            [newData setObject:[self RemoveNullFormData:[data objectForKey:key]] forKey:key];
        }
        return newData;
        
    }else {
        if (data == [NSNull null]) {
            return @"";
        }else
            return [NSString stringWithFormat:@"%@", data];
    }
}

@end
