//
//  GoodsAddress.h
//  Aisino_iOS_SupplyChain
//
//  Created by 荣学敏 on 2018/4/4.
//

#import "TableBase.h"

@interface GoodsAddress : TableBase
//表名
#define kTableName_GoodsAddress             @"GoodsAddress"
//@property (nonatomic,copy) NSString *userName;
//@property (nonatomic,copy) NSString *tel;
//@property (nonatomic,copy) NSString *provinces;
//@property (nonatomic,copy) NSString *city;
//@property (nonatomic,copy) NSString *area;
//@property (nonatomic,copy) NSString *address;
//
//@property (nonatomic,copy) NSString *addressDetail;
//
//@property (nonatomic,assign) BOOL isSelected;
//字段
#define kColumn_GoodsAddress_userName    @"userName"
#define kColumn_GoodsAddress_telPhone            @"telPhone"
#define kColumn_GoodsAddress_provinces        @"provinces"
#define kColumn_GoodsAddress_city           @"city"
#define kColumn_GoodsAddress_area           @"area"
#define kColumn_GoodsAddress_address           @"address"
#define kColumn_GoodsAddress_isSelected           @"isSelected"

@end
