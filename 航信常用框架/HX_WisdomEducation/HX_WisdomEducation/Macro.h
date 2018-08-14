//
//  Macro.h
//  Aisino_iOS_SupplyChain
//
//  Created by 荣学敏 on 2018/3/19.
//
//这里写宏
#ifndef Macro_h
#define Macro_h


#define Key_LoginUserInfo @"LoginUserInfo"
#define kIsHaveGuide @"kIsHaveGuide"

#define JumpToMain  @"JumpToTabbarController"
//占位符动图  300x300.gif  638x380.gif  690x274.gif三种
#define placeHolder_300_300_imageData [NSData dataWithContentsOfFile:[[NSBundle bundleWithPath:[[NSBundle mainBundle] bundlePath]] pathForResource:@"300x300.gif" ofType:nil]]
#define placeHolder_638_380_imageData [NSData dataWithContentsOfFile:[[NSBundle bundleWithPath:[[NSBundle mainBundle] bundlePath]] pathForResource:@"638x380.gif" ofType:nil]]
#define placeHolder_690_274_imageData [NSData dataWithContentsOfFile:[[NSBundle bundleWithPath:[[NSBundle mainBundle] bundlePath]] pathForResource:@"690x274.gif" ofType:nil]]

// image  图片拉伸
#define STRETCH_IMAGE(image, top, left, bottom, right) (CURRENT_SYS_VERSION < 6.0 ? [image stretchableImageWithLeftCapWidth:left topCapHeight:top] : [image resizableImageWithCapInsets:UIEdgeInsetsMake(top, left, bottom, right) resizingMode:UIImageResizingModeStretch])
/*  用法实例  用于图片的拉伸 对于大按钮实用
UIImage *btnImage = [UIImage imageNamed:@"按钮-黄"];
btnImage = STRETCH_IMAGE(btnImage, 10, 10,10, 10);
[_sendGiftBtn setBackgroundImage:btnImage forState:UIControlStateNormal];
*/
#define XH_STRETCH_IMAGE(image, edgeInsets) (CURRENT_SYS_VERSION < 6.0 ? [image stretchableImageWithLeftCapWidth:edgeInsets.left topCapHeight:edgeInsets.top] : [image resizableImageWithCapInsets:edgeInsets resizingMode:UIImageResizingModeStretch])

#define  WEAKSELF  __weak __typeof(self)weakSelf = self;
//判断是否iPhoneX
#define kDevice_Is_iPhoneX ([UIScreen instancesRespondToSelector:@selector(currentMode)] ? CGSizeEqualToSize(CGSizeMake(1125, 2436), [[UIScreen mainScreen] currentMode].size) : NO)
//获取屏幕 宽度、高度
#define SCREEN_WIDTH ([UIScreen mainScreen].bounds.size.width)
#define SCREEN_HEIGHT ([UIScreen mainScreen].bounds.size.height)

//不同屏幕尺寸字体适配
#define kScreenWidthRatio  (UIScreen.mainScreen.bounds.size.width / 375.0)
#define kScreenHeightRatio (UIScreen.mainScreen.bounds.size.height / 667.0)
#define AdaptedWidth(x)  ceilf((x) * kScreenWidthRatio)
#define AdaptedHeight(x) ceilf((x) * kScreenHeightRatio)
#define AdaptedFontSize(R)     [UIFont boldSystemFontOfSize:AdaptedWidth(R)]
#define AdaptedSystemFontSize(R)     [UIFont systemFontOfSize:AdaptedWidth(R)]
#define AdaptedCGRectMake(x,y,width,height) CGRectMake(AdaptedWidth(x), AdaptedHeight(y), AdaptedWidth(width), AdaptedHeight(height))

// device verson float value
#define CURRENT_SYS_VERSION [[[UIDevice currentDevice] systemVersion] floatValue]
#define kNotifierNetStatus @"NetStatusMonitor"
//颜色
#define UIColorFromRGB2(r, g, b) [UIColor colorWithRed:r/255.0 green:g/255.0 blue:b/255.0 alpha:1.0]

#define UIColorFromRGB(rgbValue) [UIColor colorWithRed:((float)((rgbValue & 0xFF0000) >> 16))/255.0 green:((float)((rgbValue & 0xFF00) >> 8))/255.0 blue:((float)(rgbValue & 0xFF))/255.0 alpha:1.0]
#define hll(r, g, b, a) [UIColor colorWithRed:r/255.0 green:g/255.0 blue:b/255.0 alpha:a]

//颜色红定义
#define kUIColorFromRGB(rgbValue) [UIColor \
colorWithRed:((float)((rgbValue & 0xFF0000) >> 16))/255.0 \
green:((float)((rgbValue & 0xFF00) >> 8))/255.0 \
blue:((float)(rgbValue & 0xFF))/255.0 alpha:1.0]

//主色调
//
#define UIColorMainGreenColor UIColorFromRGB2(229,16,16)
#define UIColorMainGrayColor UIColorFromRGB(0xF9F7F5)

/**
 * 空字符串判断
 */
#define NULLString(string) ((string == nil) || ([string isKindOfClass:[NSNull class]]) || (![string isKindOfClass:[NSString class]])||[string isEqualToString:@""] || [string isEqualToString:@"<null>"] || [string isEqualToString:@"(null)"] || [[string stringByTrimmingCharactersInSet:[NSCharacterSet whitespaceCharacterSet]] length]== 0 )

/**
 * 空对象判断
 */
#define NULLObject(obj) (obj == nil || obj == [NSNull null] || ([obj isKindOfClass:[NSString class]] && NULLString((NSString *)obj)))

/**
 iOS 11
 */
#define kStatusBarHeight [[UIApplication sharedApplication] statusBarFrame].size.height
#define kNavBarHeight 44.0
#define kTabBarHeight ([[UIApplication sharedApplication] statusBarFrame].size.height>20?83:49)
#define kTopHeight (kStatusBarHeight + kNavBarHeight)

#define kTopBarHeight     kTopHeight

#define kWeakself __weak typeof(self) weakself = self;


/**
 短信
 */
#define SMSAPPKEY @"259824db86c1c"
#define SMSAPPSECRET @"95fb885fa5a83c89c6144366492cf56f"
#define SMSTEP  @"14967924"

#endif /* Macro_h */
