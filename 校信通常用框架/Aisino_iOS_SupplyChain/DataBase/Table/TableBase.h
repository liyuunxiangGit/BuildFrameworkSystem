//
//  TableBase.h
//  Aisino_iOS_SupplyChain
//
//  Created by 荣学敏 on 2018/3/20.
//

#import <Foundation/Foundation.h>
#import "SCDbHelper.h"
#import "FMDatabaseAdditions.h"


@protocol TableBaseInterface <NSObject>

-(void)CreateTable:(FMDatabase *)db;
-(NSString *)getTableName;

@end

@interface TableBase : NSObject<TableBaseInterface>

-(FMResultSet *)QueryAll:(FMDatabase *)db;
-(BOOL)removeAllFromDb:(FMDatabase *)db;
-(NSUInteger)getRowCount:(FMDatabase *)db;

-(BOOL)IsTableExist:(FMDatabase *)db;
-(BOOL)IsColumn:(NSString *)Column inDataBase:(FMDatabase *)db;

@end
