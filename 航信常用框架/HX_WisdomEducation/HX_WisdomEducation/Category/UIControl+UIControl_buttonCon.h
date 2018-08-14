//
//  UIControl+UIControl_buttonCon.h
//  Aisino_iOS_SupplyChain
//
//  Created by 吕峰 on 2018/5/17.
//

#define defaultInterval .5//默认时间间隔
#import <UIKit/UIKit.h>
#import <objc/runtime.h>
@interface UIControl (UIControl_buttonCon)
@property(nonatomic,assign)NSTimeInterval timeInterval;//用这个给重复点击加间隔
@property(nonatomic,assign)BOOL isIgnoreEvent;//YES不允许点击NO允许点击

@end
