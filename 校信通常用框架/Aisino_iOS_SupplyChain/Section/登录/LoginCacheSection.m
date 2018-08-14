//
//  LoginCacheSection.m
//  Aisino_iOS_SupplyChain
//
//  Created by 荣学敏 on 2018/3/20.
//

#import "LoginCacheSection.h"

@implementation LoginCacheSection
-(void)userLoginByAccount:(NSString *)account Password:(NSString *)password result:(void (^)(BOOL result, NSDictionary *))result
{
    //这里写要传入请求的参数
    NSMutableDictionary *params = [NSMutableDictionary dictionary];
    [params setObject:account forKey:@"userName"];
    [params setObject:password forKey:@"password"];
    [self.net POST:@"http://10.123.88.119:9000/phone/login.action"  useCache:YES cacheOutTime:2 parameters:params SectionObject:self success:^(NSURLSessionDataTask *operation, id responseObject, NSInteger returnType) {
        NSError *error;
        NSDictionary *dict = [NSJSONSerialization JSONObjectWithData:responseObject options:NSJSONReadingMutableContainers error:&error];
        result(YES,dict);
    } failure:^(NSURLSessionDataTask *operation, NSError *error) {
        result(NO,nil);
    }];

}
@end
