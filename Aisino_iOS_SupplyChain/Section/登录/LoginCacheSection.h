//
//  LoginCacheSection.h
//  Aisino_iOS_SupplyChain
//
//  Created by 荣学敏 on 2018/3/20.
//

#import "BaseSection.h"

@interface LoginCacheSection : BaseSection
-(void)userLoginByAccount:(NSString *)account Password:(NSString *)password result:(void (^)(BOOL result,NSDictionary *dict))result;
@end
