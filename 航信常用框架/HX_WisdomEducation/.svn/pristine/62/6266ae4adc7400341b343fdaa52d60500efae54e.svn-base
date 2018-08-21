//
//  baseControllerProtocl.h
//  DHBaseProject_SD
//
//  Created by The good times on 2017/11/7.
//  Copyright © 2017年 The good times. All rights reserved.
//

#import <Foundation/Foundation.h>

@protocol baseControllerProtocl <NSObject>

@optional
//配置tableView
- (void)configTableView;
//配置collectionView
- (void)configCollectionView;
//设置导航栏
- (void)setNavigationBar;
//加载数据
- (void)loadDataWithAnimation:(BOOL)animation;
//加载数据存在回调
- (void)loadDataWithAnimation:(BOOL)animation completionHandler:(void(^)(void))completion;
//添加headerView下拉刷新
- (void)addRefreshOfHeaderView;
//添加footerView上拉加载
- (void)addLoadOfFooterView;
//加载subviews
- (void)loadSubviews;
//添加通知
- (void)addNotification;
//移除通知
- (void)removeNotification;
//初始化设置
- (void)initializeSet;

@end
