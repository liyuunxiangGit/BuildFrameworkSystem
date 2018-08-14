//
//  BaseSection.m
//  Aisino_iOS_SupplyChain
//
//  Created by 荣学敏 on 2018/3/19.
//

#import "BaseSection.h"

@implementation BaseSection
- (id)init{
    self = [super init];
    if (self) {
        
        _net = [[SCNetwork alloc]init];
    }
    return self;
}

- (void)dealloc {
    _net = nil;
}
@end
