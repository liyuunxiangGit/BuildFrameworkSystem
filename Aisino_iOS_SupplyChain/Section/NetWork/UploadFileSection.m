//
//  UploadFileSection.m
//  Aisino_iOS_SupplyChain
//
//  Created by 荣学敏 on 2018/3/21.
//

#import "UploadFileSection.h"
#import "AFHTTPSessionManager.h"
#import "AFURLRequestSerialization.h"
@implementation UploadFileSection
-(void)uploadFileData:(NSData *)data MsgType:(NSInteger)msgType FileType:(NSInteger)fileType FileName:(NSString *)fileName Params:(NSString *)params
              success:(void (^)(NSURLSessionDataTask *, id))success
              failure:(void (^)(NSURLSessionDataTask *, NSError *))failure{
    [self uploadFileData:data MsgType:msgType FileType:fileType FileName:fileName Params:params success:success failure:failure UploadProgressBlock:^(NSUInteger bytesWritten, long long totalBytesWritten, long long totalBytesExpectedToWrite) {
    }];
}

-(void)uploadFileData:(NSData *)data MsgType:(NSInteger)msgType FileType:(NSInteger)fileType FileName:(NSString *)fileName Params:(NSString *)params
              success:(void (^)(NSURLSessionDataTask *, id))success
              failure:(void (^)(NSURLSessionDataTask *, NSError *))failure UploadProgressBlock:(void (^)(NSUInteger, long long, long long))progress{
    

    NSInteger thisFileType = fileType;

    NSDictionary *dic = [[NSDictionary alloc]initWithObjectsAndKeys:[NSNumber numberWithInteger:msgType],@"msgType",[NSNumber numberWithInteger:thisFileType],@"fileType",params,@"fileParam",fileName,@"fileName", nil];
    
    DDLogInfo(@"%@",dic);
  
    
    // 1. Create `AFHTTPRequestSerializer` which will create your request.
    AFHTTPRequestSerializer *serializer = [AFHTTPRequestSerializer serializer];
    
    // 2. Create an `NSMutableURLRequest`.
    __weak __typeof(self)weakSelf = self;
    NSError *error;
    NSMutableURLRequest *request =
    [serializer multipartFormRequestWithMethod:@"POST" URLString:@"url....."
                                    parameters:dic
                     constructingBodyWithBlock:^(id<AFMultipartFormData> formData) {
                         NSString *mimeType = [weakSelf getFileMimeType:fileType];
                         [formData appendPartWithFileData:data name:@"fileContent" fileName:@"" mimeType:mimeType];
                         //[formData appendPartWithFormData:data name:@"fileContent" ];
                     } error:&error];
    
    
    AFURLSessionManager *manager = [[AFURLSessionManager alloc] initWithSessionConfiguration:[NSURLSessionConfiguration defaultSessionConfiguration]];
    
    NSURLSessionUploadTask *uploadTask;
    uploadTask = [manager
                  uploadTaskWithStreamedRequest:request
                  progress:nil
                  completionHandler:^(NSURLResponse * _Nonnull response, id  _Nullable responseObject, NSError * _Nullable error) {
#warning TODO
                      if (error) {
                          NSLog(@"Error: %@", error);
                      } else {
                          NSLog(@"%@ %@", response, responseObject);
                          success(nil,responseObject);
                      }
                  }];
    
    [uploadTask resume];

}




-(NSString *)getFileMimeType:(NSInteger)type{
    if (type == 1) {
        return @"image/jpeg";
    }
    
    if (type == 2) {
        return @"audio/amr";
    }
    //    if (type == 3){
    //        return @"text/plain";
    //    }
    
    return @"image/jpeg";
}
@end
