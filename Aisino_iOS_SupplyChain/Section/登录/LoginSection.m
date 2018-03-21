//
//  LoginSection.m
//  Aisino_iOS_SupplyChain
//
//  Created by 荣学敏 on 2018/3/20.
//

#import "LoginSection.h"

@implementation LoginSection
-(void)userLoginByAccount:(NSString *)account Password:(NSString *)password result:(void (^)(BOOL result, NSDictionary *))result
{
    //这里写要传入请求的参数
    NSMutableDictionary *params = [NSMutableDictionary dictionary];
    [params setObject:account forKey:@"userName"];
    [params setObject:password forKey:@"password"];
    
    
    [self.net POST:URL_SC_LOGIN parameters:params SectionObject:self success:^(NSURLSessionDataTask *operation, id responseObject) {
        //在这里对数据进行操作，例如转模型等。。。排序等等。。。然后block返回给主页想要的数据。
        NSError *error;
        NSDictionary *dict = [NSJSONSerialization JSONObjectWithData:responseObject options:NSJSONReadingMutableContainers error:&error];
        result(YES,dict);
    } failure:^(NSURLSessionDataTask *operation, NSError *error) {
        result(NO,nil);
    }];
}
@end
