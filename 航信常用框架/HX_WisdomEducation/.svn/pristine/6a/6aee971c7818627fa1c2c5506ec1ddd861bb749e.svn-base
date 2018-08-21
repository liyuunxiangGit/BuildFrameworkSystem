//
//  WKMianWebViewController.m
//  JS_OC_WebViewJavascriptBridge
//
//  Created by 李云祥 on 2017/11/21.
//  Copyright © 2017年 Haley. All rights reserved.
//

#import "WKMianWebViewController.h"
#import <AVFoundation/AVFoundation.h>
#import "AppDelegate.h"
//#import "LoginViewController.h"
//#import "OnlionDetailVC.h"
static NSString* const UMS_Title = @"【友盟+】社会化组件U-Share";
static NSString* const UMS_Web_Desc = @"W欢迎使用【友盟+】社会化组件U-Share，SDK包最小，集成成本最低，助力您的产品开发、运营与推广！";
static NSString* const UMS_THUMB_IMAGE = @"https://mobile.umeng.com/images/pic/home/social/img-1.png";

static NSString* const UMS_WebLink = @"http://mobile.umeng.com/social";


@interface WKMianWebViewController ()<WKNavigationDelegate,WKUIDelegate>

@property (nonatomic,copy) NSString *urlString;



@end

@implementation WKMianWebViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor = [UIColor whiteColor];
    
    
//    UIBarButtonItem *rightItem = [[UIBarButtonItem alloc]initWithCustomView:self.rightBarView];
//    self.navigationItem.rightBarButtonItem = rightItem;
    
    
    [self initWKWebView];
    [self isShowJSInteractive];
  
    [self initProgressView];
    
    [self.webView addObserver:self forKeyPath:@"estimatedProgress" options:NSKeyValueObservingOptionNew context:nil];
}
#pragma mark - Private


- (void)initWKWebView
{
    WKWebViewConfiguration *configuration = [[WKWebViewConfiguration alloc] init];
    configuration.userContentController = [WKUserContentController new];
    
    WKPreferences *preferences = [WKPreferences new];
    preferences.javaScriptCanOpenWindowsAutomatically = YES;
    preferences.minimumFontSize = 30.0;
    configuration.preferences = preferences;
    
    SDWebView *webView = [[SDWebView alloc] initWithFrame:CGRectMake(0, 0, SCREEN_WIDTH, SCREEN_HEIGHT-64) configuration:configuration];
    self.webView = webView;
    //如果是本地html，用下面方法：
//    NSString *urlStr = [[NSBundle mainBundle] pathForResource:@"index.html" ofType:nil];
//    NSString *localHtml = [NSString stringWithContentsOfFile:urlStr encoding:NSUTF8StringEncoding error:nil];
//    NSURL *fileURL = [NSURL fileURLWithPath:urlStr];
//    [webView loadHTMLString:localHtml baseURL:fileURL];
    //如果是网址，用下面的方法：
   
//    if (self.controllerType == PublicWelfareView) {
//        _postH5UrlFullPath = _postH5Url;
//    }else
//    {
        AccountModel *model = [AccountModel readSingleModelForKey:Key_LoginUserInfo];
        _postH5UrlFullPath = [NSString stringWithFormat:@"%@%@&userId=%@",SCHOST,self.postH5Url,model.userId];

//    }

    [webView loadRequest:[NSURLRequest requestWithURL:[NSURL URLWithString:_postH5UrlFullPath]]];
    webView.UIDelegate = self;
    [self.view addSubview:webView];
}

/**
 是否用js交互
 */
- (void)isShowJSInteractive{
    //是否增加js交互操作
//    if (self.controllerType == PublicWelfareView) {
//        //跳转其他界面：例如百度---用js交互会导致崩溃。所以这里不增加交互操作
//    }else
//    {
        //增加js交互
        _webViewBridge = [WKWebViewJavascriptBridge bridgeForWebView:self.webView];
        [_webViewBridge setWebViewDelegate:self.webView];
        
        [self registerNativeFunctions];
//    }
}
- (void)initProgressView
{
    CGFloat kScreenWidth = [[UIScreen mainScreen] bounds].size.width;
    UIProgressView *progressView = [[UIProgressView alloc] initWithFrame:CGRectMake(0, 0, kScreenWidth, 2)];
    progressView.tintColor = UIColorMainGreenColor;
    progressView.trackTintColor = UIColorMainGrayColor;
    [self.view addSubview:progressView];
    self.progressView = progressView;
}

//- (void)rightClick
//{
//    //    // 如果不需要参数，不需要回调，使用这个
//    //    [_webViewBridge callHandler:@"testJSFunction"];
//    //    // 如果需要参数，不需要回调，使用这个
//    //    [_webViewBridge callHandler:@"testJSFunction" data:@"一个字符串"];
//    // 如果既需要参数，又需要回调，使用这个
//    [_webViewBridge callHandler:@"publishPost" data:@"native调用js成功" responseCallback:^(id responseData) {
//        NSLog(@"调用完JS后的回调：%@",responseData);
//    }];
//}

- (void)dealloc
{
    NSLog(@"%s",__FUNCTION__);
    [self.webView removeObserver:self forKeyPath:@"estimatedProgress"];
}

#pragma mark - private method
- (void)registerNativeFunctions
{
    [self registTestOneFunction];
}
-(void)registTestOneFunction
{
    WEAKSELF;
    
    [_webViewBridge registerHandler:@"JSPlay" handler:^(id data, WVJBResponseCallback responseCallback) {
        

//        [GlobalFunc setLoginStatus:NO];
//        AppDelegate *app = (AppDelegate *)[UIApplication sharedApplication].delegate;
//        LoginViewController *login = [[LoginViewController alloc] init];
//        app.window.rootViewController = login;
        // data 的类型与 JS中传的参数有关
        NSDictionary *tempDic =  [self JSONStringToDictionaryWithData:data];;
        // 在这里执行分享的操作
        NSString *videoUrl = [tempDic objectForKey:@"videoUrl"];
        videoUrl = [videoUrl stringByReplacingOccurrencesOfString:@"'" withString:@""];

        

//            OnlionDetailVC *detail = [[OnlionDetailVC alloc] init];
//
//            detail.playURL = [NSURL URLWithString:videoUrl];
//            detail.playName = weakSelf.mainTitle;
//            detail.studyCourseId = @"66";
//            detail.studyId = @"66";
//            UINavigationController *nc = [[UINavigationController alloc] initWithRootViewController:detail];
//            [self presentViewController:nc animated:YES completion:nil];

        
        
        responseCallback(nil);
    }];
}

-(NSDictionary *) JSONStringToDictionaryWithData:(NSString *)data{
    NSError * error;
    
    NSData * dadd = [data dataUsingEncoding:NSUTF8StringEncoding];
    NSDictionary *dict = [NSJSONSerialization JSONObjectWithData:dadd options:NSJSONReadingMutableContainers error:&error];
    return dict;
}

#pragma mark - KVO
// 计算wkWebView进度条
- (void)observeValueForKeyPath:(NSString *)keyPath ofObject:(id)object change:(NSDictionary *)change context:(void *)context {
    if (object == self.webView && [keyPath isEqualToString:@"estimatedProgress"]) {
        CGFloat newprogress = [[change objectForKey:NSKeyValueChangeNewKey] doubleValue];
        if (newprogress == 1) {
            [self.progressView setProgress:1.0 animated:YES];
            dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(0.7 * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
                self.progressView.hidden = YES;
                [self.progressView setProgress:0 animated:NO];
            });
            
        }else {
            self.progressView.hidden = NO;
            [self.progressView setProgress:newprogress animated:YES];
        }
    }
}

#pragma mark - WKNavigationDelegate


#pragma mark - WKUIDelegate
- (void)webView:(WKWebView *)webView runJavaScriptAlertPanelWithMessage:(NSString *)message initiatedByFrame:(WKFrameInfo *)frame completionHandler:(void (^)(void))completionHandler
{
    
    
    
    UIAlertController *alert = [UIAlertController alertControllerWithTitle:@"提醒" message:message preferredStyle:UIAlertControllerStyleAlert];
    [alert addAction:[UIAlertAction actionWithTitle:@"知道了" style:UIAlertActionStyleCancel handler:^(UIAlertAction * _Nonnull action) {
//        dispatch_async(dispatch_get_main_queue(), ^{
//            if (completionHandler) {
//                completionHandler();
//            }
//        });
    }]];
    
    [self presentViewController:alert animated:YES completion:nil];
    
    dispatch_async(dispatch_get_main_queue(), ^{
        if (completionHandler) {
            completionHandler();
        }
    });
    
}

#pragma mark -lazy-
- (UIView *)rightBarView
{
    if (!_rightBarView) {
        _rightBarView = [[UIView alloc]initWithFrame:CGRectMake(0, 0, 70, 30)];
        _shareBtn = [UIButton buttonWithType:UIButtonTypeCustom];
        [_shareBtn setFrame:CGRectMake(0, 0, 28, 30)];
        [_shareBtn addTarget:self action:@selector(shareBtnClick) forControlEvents:UIControlEventTouchUpInside];
        [_shareBtn setImage:[UIImage imageNamed:@"ich_Information-details_share"] forState:UIControlStateNormal];

        [_rightBarView addSubview:_shareBtn];
        
        _favouriteBtn = [UIButton buttonWithType:UIButtonTypeCustom];
        [_favouriteBtn setFrame:CGRectMake(28+8, 0, 32, 30)];
        [_favouriteBtn addTarget:self action:@selector(favouriteBtnClick:) forControlEvents:UIControlEventTouchUpInside];

        [_favouriteBtn setImage:[UIImage imageNamed:@"ich_Information-details_collection_default"] forState:UIControlStateNormal];
        [_favouriteBtn setImage:[UIImage imageNamed:@"ich_Information-details_collection_press"] forState:UIControlStateSelected];

        [_rightBarView addSubview:_favouriteBtn];
    }
    return _rightBarView;
}
#pragma mark - Action
- (void)shareBtnClick{

//    [[HXShareManager shareManager] showBottomNormalViewUMS_Title:UMS_Title withUMS_Web_Desc:UMS_Web_Desc withUMS_THUMB_IMAGE:UMS_THUMB_IMAGE withUMS_WebLink:UMS_WebLink];
    NSString *imageUrlStr = [NSString stringWithFormat:@"%@%@",SCHOST_IMG,_shareImage];

//    [[HXShareManager shareManager] showBottomNormalViewUMS_Title:_mainTitle withUMS_Web_Desc:nil withUMS_THUMB_IMAGE:imageUrlStr withUMS_WebLink:_postH5UrlFullPath];
}
- (void)favouriteBtnClick:(UIButton *)button{
    NSLog(@"点击了收藏按钮");
}

@end
