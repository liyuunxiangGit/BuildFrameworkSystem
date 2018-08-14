//
//  WKMianWebViewController.h
//  JS_OC_WebViewJavascriptBridge
//
//  Created by 李云祥 on 2017/11/21.
//  Copyright © 2017年 Haley. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "HXBackController.h"
#import <WebKit/WebKit.h>
#import "SDWebView.h"
#import "WKWebViewJavascriptBridge.h"

@interface WKMianWebViewController : HXBackController

/**
 webView 以及 进度条
 */
@property (strong, nonatomic)   SDWebView                   *webView;
@property (strong, nonatomic)   UIProgressView              *progressView;

/**
 用于js交互的
 */
@property WKWebViewJavascriptBridge *webViewBridge;

/**
 上个界面传过来的网址以及本界面的title
 */
@property (nonatomic,copy) NSString *postH5Url;
@property (nonatomic,copy) NSString *mainTitle;


/**
 本界面网址全路径，用于分享
 */
@property (nonatomic,copy) NSString *postH5UrlFullPath;

/**
 该网页的封面图链接，用于分享
 */
@property (nonatomic,copy) NSString *shareImage;
/**
 rightNavigationItem   分享和收藏按钮
 */
@property (nonatomic,strong) UIView *rightBarView;
@property (nonatomic,strong) UIButton *shareBtn;
@property (nonatomic,strong) UIButton *favouriteBtn;


/**
 是从哪个界面跳转进来的
 */
//@property (nonatomic,assign) ControllerType controllerType;

/**
 分享按钮点击方法
 */
- (void)shareBtnClick;


/**
 收藏按钮点击方法
 */
- (void)favouriteBtnClick:(UIButton *)button;
@end
