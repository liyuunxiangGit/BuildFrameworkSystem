//
//  GlobalFunc.h
//  Aisino_iOS_SupplyChain
//
//  Created by 荣学敏 on 2018/3/19.
//

#import <Foundation/Foundation.h>
#import "HXBackController.h"

@interface GlobalFunc : NSObject
//获取缓存目录
+(NSString *)getCachePath;
+(NSString *)getDocumentPath;
+(NSString *)getTmpPath;
+(NSArray *)sortDescriptor:(NSArray *)dataSource;

/**
 获取设备ID
 */
+(NSString *)getDeviceId;
/**
 *  获取软件版本号
 *
 *  @return 版本号
 */
+ (NSString *)getVersion;

/**
 获取UserId

 @return UserId
 */
+ (NSString *)getUserId;


//获取当前屏幕显示的viewcontroller
+ (UIViewController *)getCurrentVC;
/**
 *  强制将一个试图跳转（push）到最前面
 *  @param viewcontroller  要跳转的VC
 *
 */
+ (void)jumpToFontViewController:(HXBackController *)viewcontroller Completion:(void (^ )(void))completion;

//登录状态
+(BOOL)getLoginStatus;
+(void)setLoginStatus:(BOOL)status;

/**
 转化时间格式
 */
+ (NSString*)backDateFormatterOfType:(NSInteger )type withDate:(NSDate *)date;
+ (NSString*)backDateFormatterOfType:(NSInteger )type Datestamp:(NSNumber*)datestamp;

+(void)ShowToastText:(NSString *)content;
+(void)ShowToastText:(NSString *)content delay:(float)delay;
+(NSError *)makeLocalErrorWithDescription:(NSString *)text;
@end
