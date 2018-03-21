//
//  GlobalFunc.h
//  Aisino_iOS_SupplyChain
//
//  Created by 荣学敏 on 2018/3/19.
//

#import <Foundation/Foundation.h>
#import "SCBaseViewController.h"

@interface GlobalFunc : NSObject
//获取缓存目录
+(NSString *)getCachePath;
+(NSString *)getDocumentPath;
+(NSString *)getTmpPath;

/**
 *  获取软件版本号
 *
 *  @return 版本号
 */
+ (NSString *)getVersion;


//获取当前屏幕显示的viewcontroller
+ (UIViewController *)getCurrentVC;
/**
 *  强制将一个试图跳转（push）到最前面
 *  @param viewcontroller  要跳转的VC
 *
 */
+ (void)jumpToFontViewController:(SCBaseViewController *)viewcontroller Completion:(void (^ )(void))completion;

//登录状态
+(BOOL)getLoginStatus;
+(void)setLoginStatus:(BOOL)status;
@end
