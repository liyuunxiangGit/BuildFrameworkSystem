//
//  CZSegmentProtocol.h
//  ESuperVisionProject
//
//  Created by The good times on 2018/1/15.
//  Copyright © 2018年 dhyt. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>

@protocol CZSegmentProtocol <NSObject>
@optional

- (UIViewController *)contentControllerAtIndex:(NSInteger)index;

- (void)configController:(UIViewController *)controller atIndex:(NSInteger)index;

@end
