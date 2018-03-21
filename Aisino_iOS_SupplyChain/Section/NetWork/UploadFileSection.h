//
//  UploadFileSection.h
//  Aisino_iOS_SupplyChain
//
//  Created by 荣学敏 on 2018/3/21.
//

#import "BaseSection.h"

@interface UploadFileSection : BaseSection
-(void)uploadFileData:(NSData *)data MsgType:(NSInteger)msgType FileType:(NSInteger)fileType FileName:(NSString *)fileName Params:(NSString *)params success:(void (^)(NSURLSessionDataTask *operation, id responseObject))success
              failure:(void (^)(NSURLSessionDataTask *operation, NSError *error))failure;

-(void)uploadFileData:(NSData *)data MsgType:(NSInteger)msgType FileType:(NSInteger)fileType FileName:(NSString *)fileName Params:(NSString *)params success:(void (^)(NSURLSessionDataTask *operation, id responseObject))success
              failure:(void (^)(NSURLSessionDataTask *operation, NSError *error))failure UploadProgressBlock:(void(^)(NSUInteger __unused bytesWritten,long long totalBytesWritten,long long totalBytesExpectedToWrite))progress;
@end
