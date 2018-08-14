//
//  HXNetWorkManager.m
//  Aisino_iOS_SupplyChain
//
//  Created by liuqiang on 2018/5/18.
//

#import "HXNetWorkManager.h"
#import "UIImage+Execute.h"
#import "MBProgressHUD+Add.h"
#import <AVFoundation/AVAsset.h>
#import <AVFoundation/AVAssetExportSession.h>
#import <AVFoundation/AVMediaFormat.h>
#import "LoginViewController.h"
#import "AppDelegate.h"
//#define BaseURL @"http://192.168.1.15:80"
#define apikey  @"1"

@implementation HXNetWorkManager

#pragma mark - shareManager
/**
 *  获得全局唯一的网络请求实例单例方法
 *
 *  @return 网络请求类的实例
 */

+(instancetype)shareManager
{
    
    static HXNetWorkManager * manager = nil;
    
    static dispatch_once_t onceToken;
    
    dispatch_once(&onceToken, ^{
        
        manager = [[self alloc] initWithBaseURL:[NSURL URLWithString:SCHOST]];
        
    });
    
    return manager;
}

#pragma mark - 重写initWithBaseURL
/**
 *
 *
 *  @param url baseUrl
 *
 *  @return 通过重写夫类的initWithBaseURL方法,返回网络请求类的实例
 */

-(instancetype)initWithBaseURL:(NSURL *)url
{
    
    if (self = [super initWithBaseURL:url]) {
        
        
        
#warning 可根据具体情况进行设置
        
        NSAssert(url,@"您需要为您的请求设置baseUrl");
        
        /**设置请求超时时间*/
        
        self.requestSerializer.timeoutInterval = 30;
        
        /**设置相应的缓存策略*/
        
        self.requestSerializer.cachePolicy = NSURLRequestReloadIgnoringLocalCacheData;
        
        
        /**分别设置请求以及相应的序列化器*/
        self.requestSerializer = [AFHTTPRequestSerializer serializer];
        
        AFJSONResponseSerializer * response = [AFJSONResponseSerializer serializer];
        
        response.removesKeysWithNullValues = YES;
        
        self.responseSerializer = response;
        
        /**复杂的参数类型 需要使用json传值-设置请求内容的类型*/
        AccountModel *model = [AccountModel readSingleModelForKey:Key_LoginUserInfo];
        if (model.token) {
            [self.requestSerializer setValue:model.token forHTTPHeaderField:@"token"];
        }
        
#warning 此处做为测试 可根据自己应用设置相应的值
        
        /**设置apikey ------类似于自己应用中的tokken---此处仅仅作为测试使用*/
        
        [self.requestSerializer setValue:apikey forHTTPHeaderField:@"token"];
        
        
        
        /**设置接受的类型*/
        [self.responseSerializer setAcceptableContentTypes:[NSSet setWithObjects:@"text/plain",@"application/json",@"text/json",@"text/javascript",@"text/html", nil]];
        
    }
    
    return self;
}

/**
 *  网络请求的实例方法     GET
 *
 *  @param urlString    请求的地址
 *  @param paraments    请求的参数
 *  @param callback     返回响应信息
 */

-(void)Get_execute:(NSString *)urlString withParaments:(id)paraments callback:(REQUEST_CALLBACK)callback{
    if (![[HXNetWorkManager shareManager] reach]) {
        UIWindow *window = [UIApplication sharedApplication].keyWindow;
        window = [[UIApplication sharedApplication].windows objectAtIndex:0];
        [MBProgressHUD showError:@"当前网络不稳定" toView:window];
        return;
    }
    [[HXNetWorkManager shareManager] GET:urlString parameters:paraments progress:^(NSProgress * _Nonnull downloadProgress) {
        
    } success:^(NSURLSessionDataTask * _Nonnull task, id  _Nullable responseObject) {
        
        QResponse *response = [[QResponse alloc] init];
        response.errcode = [[responseObject objectForKey:@"code"] integerValue];
        response.QResponseMeassage = [responseObject objectForKey:@"data"];
        response.msg = [responseObject objectForKey:@"msg"];
        callback(response);
        
    } failure:^(NSURLSessionDataTask * _Nullable task, NSError * _Nonnull error) {
        QResponse *response = [[QResponse alloc] init];
        response.error = error;
        response.errorstring = error.localizedDescription;
        response.errcode = error.code;
        response.QResponseMeassage = error.localizedDescription;
        [[HXNetWorkManager shareManager] afterExecute:response];
        callback(response);
    }];
}


/**
 *  网络请求的实例方法     POST
 *
 *  @param urlString    请求的地址
 *  @param paraments    请求的参数
 *  @param callback     返回响应信息
 */

-(void)Post_execute:(NSString *)urlString withParaments:(id)paraments callback:(REQUEST_CALLBACK)callback{
    if (![[HXNetWorkManager shareManager] reach]) {
        UIWindow *window = [UIApplication sharedApplication].keyWindow;
        window = [[UIApplication sharedApplication].windows objectAtIndex:0];
        [MBProgressHUD showError:@"当前网络不稳定" toView:window];
        return;
    }
    AccountModel *model = [AccountModel readSingleModelForKey:Key_LoginUserInfo];
    if (model.token) {
        [self.requestSerializer setValue:model.token forHTTPHeaderField:@"token"];
    }
    [[HXNetWorkManager shareManager] POST:urlString parameters:paraments progress:^(NSProgress * _Nonnull uploadProgress) {

    } success:^(NSURLSessionDataTask * _Nonnull task, id  _Nullable responseObject) {
        
        QResponse *response = [[QResponse alloc] init];
        response.errcode = [[responseObject objectForKey:@"code"]  integerValue];
        response.QResponseMeassage = [responseObject objectForKey:@"data"];
        response.msg = [responseObject objectForKey:@"msg"];
        response.count = [[responseObject objectForKey:@"count"] integerValue];

        if (response.errcode == 2) {
            //如果返回code为2   说明token失效，跳转到登录界面
            [MBProgressHUD showOnlyMessage:@"此账号在其他设备已登录，请重新登录" toView:nil];
//            [NSThread sleepForTimeInterval:1.5];
            [self performSelector:@selector(delayMethod) withObject:nil/*可传任意类型参数*/ afterDelay:2.0];
            
            
//            UIAlertController *alertController = [UIAlertController alertControllerWithTitle:nil message:@"有其他手机已登录，请重新登录" preferredStyle:UIAlertControllerStyleAlert];
//            UIAlertAction *alertAction = [UIAlertAction actionWithTitle:@"好的" style:UIAlertActionStyleCancel handler:^(UIAlertAction * _Nonnull action) {
//                [GlobalFunc setLoginStatus:NO];
//                AppDelegate *app = (AppDelegate *)[UIApplication sharedApplication].delegate;
//                LoginViewController *login = [[LoginViewController alloc] init];
//                app.window.rootViewController = login;
//            }];
//            [alertController addAction:alertAction];
//            [controller presentViewController:alertController animated:nil completion:nil];
            
            
            
            
            
        }else
        {
            callback(response);
        }
        
    } failure:^(NSURLSessionDataTask * _Nullable task, NSError * _Nonnull error) {
        
        QResponse *response = [[QResponse alloc] init];
        response.error = error;
        response.errorstring = error.localizedDescription;
        response.errcode = error.code;
        response.msg = error.localizedDescription;
        response.QResponseMeassage = error.localizedDescription;
        [[HXNetWorkManager shareManager] afterExecute:response];
        callback(response);
        
    }];
}
- (void)delayMethod{
    [GlobalFunc setLoginStatus:NO];
    AppDelegate *app = (AppDelegate *)[UIApplication sharedApplication].delegate;
    LoginViewController *login = [[LoginViewController alloc] init];
    app.window.rootViewController = login;
}

#pragma mark - 多图上传

/**
 *  上传图片
 *
 *  @param operations   上传图片预留参数---视具体情况而定 可移除
 *  @param imageArray   上传的图片数组
 *  @param urlString    上传的url
 *  @param callback     返回响应信息
 *  @param progress     上传进度
 */

+(void)uploadImageWithOperations:(NSDictionary *)operations withImageArray:(NSArray *)imageArray  withUrlString:(NSString *)urlString callback:(REQUEST_CALLBACK)callback withUpLoadProgress:(uploadProgress)progress
{
    
    if (![[HXNetWorkManager shareManager] reach]) {
        UIWindow *window = [UIApplication sharedApplication].keyWindow;
        window = [[UIApplication sharedApplication].windows objectAtIndex:0];
        [MBProgressHUD showError:@"当前网络不稳定" toView:window];
        return;
    }
    //1.创建管理者对象
    
    AFHTTPSessionManager *manager = [AFHTTPSessionManager manager];
    
    [manager POST:urlString parameters:operations constructingBodyWithBlock:^(id<AFMultipartFormData>  _Nonnull formData) {
        
        NSUInteger i = 0 ;
        
        /**出于性能考虑,将上传图片进行压缩*/
        for (UIImage * image in imageArray) {
            
            
            NSData * imgData = [image backDataimageCompressio];
            
            //拼接data
            [formData appendPartWithFileData:imgData name:[NSString stringWithFormat:@"picflie%ld",(long)i] fileName:@"image.png" mimeType:@"image/jpeg"];
            
            i++;
        }
        
    } progress:^(NSProgress * _Nonnull uploadProgress) {
        
        progress(uploadProgress.completedUnitCount / uploadProgress.totalUnitCount);
        
    } success:^(NSURLSessionDataTask * _Nonnull task, NSDictionary *  _Nullable responseObject) {
        
        QResponse *response = [[QResponse alloc] init];
        response.errcode = [[responseObject objectForKey:@"code"] integerValue];
        response.QResponseMeassage = [responseObject objectForKey:@"body"];
        callback(response);
        
    } failure:^(NSURLSessionDataTask * _Nullable task, NSError * _Nonnull error) {
        
        QResponse *response = [[QResponse alloc] init];
        response.error = error;
        response.errorstring = error.localizedDescription;
        response.errcode = error.code;
        response.QResponseMeassage = error.localizedDescription;
        [[HXNetWorkManager shareManager] afterExecute:response];
        callback(response);
        
    }];
}



#pragma mark - 视频上传

/**
 *  视频上传
 *
 *  @param operations   上传视频预留参数---视具体情况而定 可移除
 *  @param videoPath    上传视频的本地沙河路径
 *  @param urlString     上传的url
 *  @param callback     返回响应信息
 *  @param progress     上传的进度
 */
+(void)uploadVideoWithOperaitons:(NSDictionary *)operations withVideoPath:(NSString *)videoPath withUrlString:(NSString *)urlString callback:(REQUEST_CALLBACK)callback withUploadProgress:(uploadProgress)progress
{
    
    
    /**获得视频资源*/
    if (![[HXNetWorkManager shareManager] reach]) {
        UIWindow *window = [UIApplication sharedApplication].keyWindow;
        window = [[UIApplication sharedApplication].windows objectAtIndex:0];
        [MBProgressHUD showError:@"当前网络不稳定" toView:window];
        return;
    }
    AVURLAsset * avAsset = [AVURLAsset assetWithURL:[NSURL URLWithString:videoPath]];
    
    /**压缩*/
    
    //    NSString *const AVAssetExportPreset640x480;
    //    NSString *const AVAssetExportPreset960x540;
    //    NSString *const AVAssetExportPreset1280x720;
    //    NSString *const AVAssetExportPreset1920x1080;
    //    NSString *const AVAssetExportPreset3840x2160;
    
    AVAssetExportSession  *  avAssetExport = [[AVAssetExportSession alloc] initWithAsset:avAsset presetName:AVAssetExportPreset640x480];
    
    /**创建日期格式化器*/
    
    NSDateFormatter * formatter = [[NSDateFormatter alloc] init];
    
    [formatter setDateFormat:@"yyyy-MM-dd-HH:mm:ss"];
    
    /**转化后直接写入Library---caches*/
    
    NSString *  videoWritePath = [[NSSearchPathForDirectoriesInDomains(NSCachesDirectory, NSUserDomainMask, YES) firstObject] stringByAppendingString:[NSString stringWithFormat:@"/output-%@.mp4",[formatter stringFromDate:[NSDate date]]]];
    
    
    avAssetExport.outputURL = [NSURL URLWithString:videoWritePath];
    
    
    avAssetExport.outputFileType =  AVFileTypeMPEG4;
    
    
    [avAssetExport exportAsynchronouslyWithCompletionHandler:^{
        
        
        switch ([avAssetExport status]) {
                
                
            case AVAssetExportSessionStatusCompleted:
            {
                
                
                
                AFHTTPSessionManager * manager = [AFHTTPSessionManager manager];
                
                [manager POST:urlString parameters:operations constructingBodyWithBlock:^(id<AFMultipartFormData>  _Nonnull formData) {
                    
                    //获得沙盒中的视频内容
                    
                    [formData appendPartWithFileURL:[NSURL fileURLWithPath:videoWritePath] name:@"write you want to writre" fileName:videoWritePath mimeType:@"video/mpeg4" error:nil];
                    
                } progress:^(NSProgress * _Nonnull uploadProgress) {
                    
                    progress(uploadProgress.completedUnitCount / uploadProgress.totalUnitCount);
                    
                } success:^(NSURLSessionDataTask * _Nonnull task, NSDictionary *  _Nullable responseObject) {
                    
                    QResponse *response = [[QResponse alloc] init];
                    response.errcode = [[responseObject objectForKey:@"code"] integerValue];
                    response.QResponseMeassage = [responseObject objectForKey:@"body"];
                    callback(response);
                    
                } failure:^(NSURLSessionDataTask * _Nullable task, NSError * _Nonnull error) {
                    
                    QResponse *response = [[QResponse alloc] init];
                    response.error = error;
                    response.errorstring = error.localizedDescription;
                    response.errcode = error.code;
                    response.QResponseMeassage = error.localizedDescription;
                    [[HXNetWorkManager shareManager] afterExecute:response];
                    callback(response);
                    
                }];
                
                break;
            }
            default:
                break;
        }
        
        
    }];
    
}

#pragma mark - 文件下载


/**
 *  文件下载
 *
 *  @param operations   文件下载预留参数---视具体情况而定 可移除
 *  @param savePath     下载文件保存路径
 *  @param urlString        请求的url
 *  @param callback     返回响应信息
 *  @param progress     下载文件的进度显示
 */


+(void)downLoadFileWithOperations:(NSDictionary *)operations withSavaPath:(NSString *)savePath withUrlString:(NSString *)urlString callback:(REQUEST_CALLBACK)callback withDownLoadProgress:(downloadProgress)progress
{
    if (![[HXNetWorkManager shareManager] reach]) {
        UIWindow *window = [UIApplication sharedApplication].keyWindow;
        window = [[UIApplication sharedApplication].windows objectAtIndex:0];
        [MBProgressHUD showError:@"当前网络不稳定" toView:window];
        return;
    }
    
    AFHTTPSessionManager * manager = [AFHTTPSessionManager manager];
    
    
    [manager downloadTaskWithRequest:[NSURLRequest requestWithURL:[NSURL URLWithString:urlString]] progress:^(NSProgress * _Nonnull downloadProgress) {
        
        progress(downloadProgress.completedUnitCount / downloadProgress.totalUnitCount);
        
        
    } destination:^NSURL * _Nonnull(NSURL * _Nonnull targetPath, NSURLResponse * _Nonnull response) {
        
        return  [NSURL URLWithString:savePath];
        
    } completionHandler:^(NSURLResponse * _Nonnull response, NSURL * _Nullable filePath, NSError * _Nullable error) {
        
        if (error) {
            
            QResponse *response = [[QResponse alloc] init];
            response.error = error;
            response.errorstring = error.localizedDescription;
            response.errcode = error.code;
            response.QResponseMeassage = error.localizedDescription;
            [[HXNetWorkManager shareManager] afterExecute:response];
            callback(response);
        }else{
            QResponse *response = [[QResponse alloc] init];
//            response.errcode = [[responseObject objectForKey:@"code"] integerValue];
//            response.QResponseMeassage = [responseObject objectForKey:@"body"];
            callback(response);
        }
        
    }];
    
}


#pragma mark -  取消所有的网络请求

/**
 *  取消所有的网络请求
 *  a finished (or canceled) operation is still given a chance to execute its completion block before it iremoved from the queue.
 */

+(void)cancelAllRequest
{
    
    [[HXNetWorkManager shareManager].operationQueue cancelAllOperations];
    
}



#pragma mark -   取消指定的url请求/
/**
 *  取消指定的url请求
 *
 *  @param requestType 该请求的请求类型
 *  @param string      该请求的完整url
 */

+(void)cancelHttpRequestWithRequestType:(NSString *)requestType requestUrlString:(NSString *)string
{
    
    NSError * error;
    
    /**根据请求的类型 以及 请求的url创建一个NSMutableURLRequest---通过该url去匹配请求队列中是否有该url,如果有的话 那么就取消该请求*/
    
    NSString * urlToPeCanced = [[[[HXNetWorkManager shareManager].requestSerializer requestWithMethod:requestType URLString:string parameters:nil error:&error] URL] path];
    
    
    for (NSOperation * operation in [HXNetWorkManager shareManager].operationQueue.operations) {
        
        //如果是请求队列
        if ([operation isKindOfClass:[NSURLSessionTask class]]) {
            
            //请求的类型匹配
            BOOL hasMatchRequestType = [requestType isEqualToString:[[(NSURLSessionTask *)operation currentRequest] HTTPMethod]];
            
            //请求的url匹配
            
            BOOL hasMatchRequestUrlString = [urlToPeCanced isEqualToString:[[[(NSURLSessionTask *)operation currentRequest] URL] path]];
            
            //两项都匹配的话  取消该请求
            if (hasMatchRequestType&&hasMatchRequestUrlString) {
                
                [operation cancel];
                
            }
        }
        
    }
}


#pragma mark - 检测网络连接

- (BOOL)reach
{
    // 如果要检测网络状态的变化,必须用检测管理器的单例的startMonitoring
    [[AFNetworkReachabilityManager sharedManager] startMonitoring];
    
    // 检测网络连接的单例,网络变化时的回调方法
    [[AFNetworkReachabilityManager sharedManager] setReachabilityStatusChangeBlock:^(AFNetworkReachabilityStatus status) {
        switch (status) {
            case AFNetworkReachabilityStatusUnknown:                // 未知
            case AFNetworkReachabilityStatusNotReachable:           // 无连接
            {
                [[HXNetWorkManager shareManager].operationQueue setSuspended:YES];
            }
                break;
            case AFNetworkReachabilityStatusReachableViaWWAN:       // 3G 花钱
            case AFNetworkReachabilityStatusReachableViaWiFi:       // 局域网络,不花钱
            {
                [[HXNetWorkManager shareManager].operationQueue setSuspended:NO];
            }
                break;
                
            default:
                break;
        }
    }];
    return YES;
}

//服务器错误errorCode提示
- (BOOL) afterExecute:(QResponse *) response {
    
    if (response.error == nil) {
        return TRUE;
    }else{
        
        UIWindow *window = [UIApplication sharedApplication].keyWindow;
        window = [[UIApplication sharedApplication].windows objectAtIndex:0];
    }
    
    if ([response.error code] == NSURLErrorNotConnectedToInternet) {
        UIWindow *window = [UIApplication sharedApplication].keyWindow;
        window = [[UIApplication sharedApplication].windows objectAtIndex:0];
        [MBProgressHUD showError:@"当前网络不稳定" toView:window];
        return FALSE;
    }
    return true;
}

@end
