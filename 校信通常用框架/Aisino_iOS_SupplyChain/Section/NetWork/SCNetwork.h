//
//  SCNetwork.h
//  Aisino_iOS_SupplyChain
//
//  Created by 荣学敏 on 2018/3/19.
//

#import "SCObject.h"
#import "AFHTTPSessionManager.h"

@interface SCNetwork : SCObject
- (AFHTTPSessionManager *)getManager;

- (NSURLSessionDataTask *)POST:(NSString *)URLString
                    parameters:(id)parameters
                 SectionObject:(SCObject *)section
                       success:(void (^)(NSURLSessionDataTask *operation, id responseObject))success
                       failure:(void (^)(NSURLSessionDataTask *operation, NSError *error))failure;

- (NSURLSessionDataTask *)GET:(NSString *)URLString
                   parameters:(id)parameters
                      success:(void (^)(NSURLSessionDataTask *, id))success
                      failure:(void (^)(NSURLSessionDataTask *, NSError *))failure;



/**
 *  POST请求
 *
 *  @param URLString  URL
 *  @param useCache   是否优先读取缓存
 *  @param overTime   缓存超时时间（分钟）
 *  @param parameters 参数
 *  @param section    section实体
 *  @param success    成功回调，增加返回标致returnType：0缓存，1网络
 *  @param failure    失败回调
 *
 *  @return
 */
- (NSURLSessionDataTask *)POST:(NSString *)URLString
                      useCache:(BOOL)useCache
                  cacheOutTime:(NSInteger)overTime
                    parameters:(id)parameters
                 SectionObject:(SCObject *)section
                       success:(void (^)(NSURLSessionDataTask *operation, id responseObject, NSInteger returnType))success
                       failure:(void (^)(NSURLSessionDataTask *operation, NSError *error))failure;
-(NSDictionary*) addParams:(NSDictionary*)parameters;
@end
