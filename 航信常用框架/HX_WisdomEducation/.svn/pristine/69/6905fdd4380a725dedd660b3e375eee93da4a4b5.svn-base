//
//  LQScrollView.h
//  CycleScrollView
//
//  Created by liuqiang on 15/10/12.
//  Copyright © 2015年 liuqiang. All rights reserved.
//

#import <UIKit/UIKit.h>
#define w [UIScreen mainScreen].bounds.size.width

typedef enum {
    LQScrollViewPageContolAlimentRight,
    LQScrollViewPageContolAlimentCenter
} LQScrollViewPageContolAliment;
@class LQScrollView;
@protocol LQScrollViewDelegate <NSObject>

- (void)cycleScrollView:(LQScrollView *)cycleScrollView didSelectItemAtIndex:(NSInteger)index;

@end
@interface LQScrollView : UIView <UIScrollViewDelegate>

// >>>>>>>>>>>>>>>>>>>>>>>>>>  数据源接口
@property (weak, nonatomic) UIScrollView *scrollView;
//本地图片数组
@property (nonatomic, strong) NSArray *imagesGroup;
//每张图片对应要显示的文字数组
@property (nonatomic, strong) NSArray *titlesGroup;
//网络图片数组
//@property (nonatomic,strong) NSArray *webUrlImagesGroup;
//图片来源－－－NO本地-－－Yes网络(默认)
@property (nonatomic,assign) BOOL imageResourceType;

// >>>>>>>>>>>>>>>>>>>>>>>>>  滚动控制接口
// 自动滚动间隔时间,默认2s
@property (nonatomic, assign) CGFloat autoScrollTimeInterval;

// >>>>>>>>>>>>>>>>>>>>>>>>>  自定义样式接口
// 占位图，用于网络未加载到图片时
@property (nonatomic, copy) NSString *placeholderImageStr;

@property (nonatomic, assign) LQScrollViewPageContolAliment pageControlAliment;
@property (nonatomic, weak) id<LQScrollViewDelegate> delegate;


+ (instancetype)cycleScrollViewWithFrame:(CGRect)frame imagesGroup:(NSArray *)imagesGroup titles:(NSArray *)titles isWebImageType:(BOOL)bo;


@end
