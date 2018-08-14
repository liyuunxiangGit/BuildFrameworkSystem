//
//  BaseModel.h
//  Aisino_iOS_SupplyChain
//
//  Created by liuqiang on 2018/4/17.
//

#import <Foundation/Foundation.h>

@interface BaseModel : NSObject
+ (NSArray *)arrayModelWithArray:(NSArray *)array;

/**
 *@ 初始化数据 格式保留原始格式
 */
- (id)initOriginalFormatWithContent:(NSDictionary *)jsonDic;

/**
 *@ 初始化数据 格式除了 数组和字典 都将转换为 NSString
 */
- (id)initWithContent:(NSDictionary *)jsonDic;


- (void)setAttributes:(NSDictionary *)jsonDic;

// 格式保留原始格式
- (void)setOriginalFormatWithContent:(NSDictionary *)jsonDic;

+ (NSArray *)modelArrayWithArrs:(NSArray *)array;

/** 完成数据的初始赋值 */
- (void)finishInitData;

-(NSDictionary *)convertModelToDictionary;
@end
