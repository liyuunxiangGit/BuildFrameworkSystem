//
//  HXNetWorkManager.h
//  Aisino_iOS_SupplyChain
//
//  Created by liuqiang on 2018/5/18.
//

#import "AFHTTPSessionManager.h"
#import <AFNetworking/AFNetworking.h>
#import "QResponse.h"


#define REQUEST_CALLBACK void (^)(QResponse *response)

///**定义请求成功的block*/
//typedef void(^requestSuccess)( NSDictionary * object);
//
///**定义请求失败的block*/
//typedef void(^requestFailure)( NSError *error);

/**定义上传进度block*/
typedef void(^uploadProgress)(float progress);

/**定义下载进度block*/
typedef void(^downloadProgress)(float progress);


@interface HXNetWorkManager : AFHTTPSessionManager



/**
 *  单例方法
 *
 *  @return 实例对象
 */
+(instancetype)shareManager;

/**
 *  网络请求的实例方法     GET
 *
 *  @param urlString    请求的地址
 *  @param paraments    请求的参数
 *  @param callback     返回响应信息
 */

-(void)Get_execute:(NSString *)urlString withParaments:(id)paraments callback:(REQUEST_CALLBACK)callback;


/**
 *  网络请求的实例方法      POST
 *
 *  @param urlString    请求的地址
 *  @param paraments    请求的参数
 *  @param callback     返回响应信息
 */

-(void)Post_execute:(NSString *)urlString withParaments:(id)paraments callback:(REQUEST_CALLBACK)callback;


/**
 *  上传图片
 *
 *  @param operations   上传图片预留参数---视具体情况而定 可移除
 *  @param imageArray   上传的图片数组
 *  @param urlString    上传的url
 *  @param callback     返回响应信息
 *  @param progress     上传进度
 */

+(void)uploadImageWithOperations:(NSDictionary *)operations withImageArray:(NSArray *)imageArray  withUrlString:(NSString *)urlString callback:(REQUEST_CALLBACK)callback withUpLoadProgress:(uploadProgress)progress;


/**
 *  视频上传
 *
 *  @param operations   上传视频预留参数---视具体情况而定 可移除
 *  @param videoPath    上传视频的本地沙河路径
 *  @param urlString     上传的url
 *  @param callback     返回响应信息
 *  @param progress     上传的进度
 */
+(void)uploadVideoWithOperaitons:(NSDictionary *)operations withVideoPath:(NSString *)videoPath withUrlString:(NSString *)urlString callback:(REQUEST_CALLBACK)callback withUploadProgress:(uploadProgress)progress;


/**
 *  文件下载
 *
 *  @param operations   文件下载预留参数---视具体情况而定 可移除
 *  @param savePath     下载文件保存路径
 *  @param urlString        请求的url
 *  @param callback     返回响应信息
 *  @param progress     下载文件的进度显示
 */


+(void)downLoadFileWithOperations:(NSDictionary *)operations withSavaPath:(NSString *)savePath withUrlString:(NSString *)urlString callback:(REQUEST_CALLBACK)callback withDownLoadProgress:(downloadProgress)progress;

/**
 *  取消所有的网络请求
 */


+(void)cancelAllRequest;
/**
 *  取消指定的url请求
 *
 *  @param requestType 该请求的请求类型
 *  @param string      该请求的url
 */

+(void)cancelHttpRequestWithRequestType:(NSString *)requestType requestUrlString:(NSString *)string;



@end
