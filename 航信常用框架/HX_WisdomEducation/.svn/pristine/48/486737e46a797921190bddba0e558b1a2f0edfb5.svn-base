//
//  GoodsAddress.m
//  Aisino_iOS_SupplyChain
//
//  Created by 荣学敏 on 2018/4/4.
//

#import "GoodsAddress.h"

@implementation GoodsAddress
-(NSString *)getTableName{
    return kTableName_GoodsAddress;
}
/*
 #define kColumn_GoodsAddress_userName    @"userName"
 #define kColumn_GoodsAddress_telPhone            @"telPhone"
 #define kColumn_GoodsAddress_provinces        @"provinces"
 #define kColumn_GoodsAddress_city           @"city"
 #define kColumn_GoodsAddress_area           @"area"
 #define kColumn_GoodsAddress_address           @"address"
 #define kColumn_GoodsAddress_isSelected           @"isSelected"
*/
-(void)CreateTable:(FMDatabase *)db{
    NSString *sql = [NSString stringWithFormat:@"create table if not exists %@(%@ text,%@ text,%@ text,%@ text,%@ text,%@ text,%@ bit)",
                     kTableName_GoodsAddress,
                     kColumn_GoodsAddress_userName,
                     kColumn_GoodsAddress_telPhone,
                     kColumn_GoodsAddress_provinces,
                     kColumn_GoodsAddress_city,
                     kColumn_GoodsAddress_area,
                     kColumn_GoodsAddress_address,
                     kColumn_GoodsAddress_isSelected
                     ];
    [db executeUpdate:sql];
}
@end
