//
//  DownloadSection.m
//  Aisino_iOS_SupplyChain
//
//  Created by 荣学敏 on 2018/3/21.
//

#import "DownloadSection.h"

@implementation DownloadSection
//{
//    NSString *_url;
//    NSString *_destPath;
//    NSString *_name;
//    void (^result_success)(NSURLSessionDataTask *operation,id responseObject);
//    void (^result_failsure)(NSURLSessionDataTask *operation,NSError *error);
//    NSInteger type;
//    
//}
//-(id)initDownFileUrl:(NSString *)url ToPath:(NSString *)destPath FileName:(NSString *)name success:(void (^)(NSURLSessionDataTask *operation, id responseObject))success
//             failure:(void (^)(NSURLSessionDataTask *operation, NSError *error))failure
//{
//    if (self=[super init]) {
//        _url=url;
//        _destPath=destPath;
//        _name=name;
//        result_success=success;
//        result_failsure=failure;
//        type = 0;   //GET
//    }
//    return self;
//}
//
//- (id)initGetMethodDownFileUrl:(NSString *)url ToPath:(NSString *)destPath FileName:(NSString *)name success:(void (^)(NSURLSessionDataTask *, id))success failure:(void (^)(NSURLSessionDataTask *, NSError *))failure{
//    if (self=[super init]) {
//        _url=url;
//        _destPath=destPath;
//        _name=name;
//        result_success=success;
//        result_failsure=failure;
//        type = 1;   //POST
//    }
//    return self;
//}
//-(void)exec
//{
//    [super exec];
//    //    if (type == 1) {
//    
//    
//    NSURLSessionConfiguration *configuration = [NSURLSessionConfiguration defaultSessionConfiguration];
//    AFURLSessionManager *manager = [[AFURLSessionManager alloc] initWithSessionConfiguration:configuration];
//    
//    NSURL *URL = [NSURL URLWithString:_url];
//    NSURLRequest *request = [NSURLRequest requestWithURL:URL];
//    
//    NSURLSessionDownloadTask *downloadTask = [manager downloadTaskWithRequest:request progress:nil destination:^NSURL *(NSURL *targetPath, NSURLResponse *response) {
//        NSURL *documentsDirectoryURL = [[NSFileManager defaultManager] URLForDirectory:NSDocumentDirectory inDomain:NSUserDomainMask appropriateForURL:nil create:NO error:nil];
//        //            return [documentsDirectoryURL URLByAppendingPathComponent:[response suggestedFilename]];
//        return [NSURL URLWithString:[_destPath stringByAppendingPathComponent:_name]];
//    } completionHandler:^(NSURLResponse *response, NSURL *filePath, NSError *error) {
//        NSLog(@"File downloaded to: %@", filePath);
//        
//    }];
//    [downloadTask resume];
//    
//}
@end
