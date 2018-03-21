//
//  AccountModel.h
//  Aisino_iOS_SupplyChain
//
//  Created by 荣学敏 on 2018/3/20.
//

#import "SCObject.h"
#import "CoreArchive.h"
@interface AccountModel : SCObject
CoreArchiver_MODEL_H

@property (nonatomic,strong) NSString *mobile;
@property (nonatomic,strong) NSString *userName;

@property (nonatomic,strong) NSString *password;
@property (nonatomic,assign) NSInteger accountId;
@end
