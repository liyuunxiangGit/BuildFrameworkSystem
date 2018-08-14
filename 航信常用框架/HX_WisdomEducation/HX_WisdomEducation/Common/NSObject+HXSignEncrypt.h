//
//  NSObject+HXSignEncrypt.h
//  Aisino_iOS_SupplyChain
//
//  Created by liuqiang on 2018/4/25.
//

#import <Foundation/Foundation.h>

@interface NSObject (HXSignEncrypt)

- (NSString *)EncryptSignFrom:(NSString *)string;

- (NSString *) md5: (NSString *) inPutText;

@end
