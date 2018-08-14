//
//  TableBase.m
//  Aisino_iOS_SupplyChain
//
//  Created by 荣学敏 on 2018/3/20.
//

#import "TableBase.h"

@implementation TableBase
#pragma mark - 查询
-(FMResultSet *)QueryAll:(FMDatabase *)db;{
    if([self respondsToSelector:@selector(getTableName)]){
        NSString *tableName = [self getTableName];
        NSString *sql = [NSString stringWithFormat:@"select * from %@",tableName];
        return [db executeQuery:sql];
    }
    return nil;
}

#pragma mark -

-(BOOL)removeAllFromDb:(FMDatabase *)db{
    if([self respondsToSelector:@selector(getTableName)]){
        NSString *tableName = [self getTableName];
        NSString *deleteSql = [NSString stringWithFormat:@"delete from %@",tableName];
        return [db executeUpdate:deleteSql];
    }
    return NO;
}

-(NSUInteger)getRowCount:(FMDatabase *)db{
    if([self respondsToSelector:@selector(getTableName)]){
        NSUInteger count = 0;
        NSString *tableName = [self getTableName];
        NSString *Sql = [NSString stringWithFormat:@"select count(*) from %@",tableName];
        FMResultSet *set = [db executeQuery:Sql];
        if ([set next]) {
            count = [set intForColumnIndex:0];
        }
        
        [set close];
        return count;
    }
    return 0;
}

-(NSString *)getTableName{
    return @"";
}

-(void)CreateTable:(FMDatabase *)db{
    
}

-(void)upgradeTable:(FMDatabase *)db OldVersion:(NSInteger)oldversion NewVersion:(NSInteger)newversion{
    
}

-(BOOL)IsTableExist:(FMDatabase *)db{
    return [db tableExists:[self getTableName]];
}

-(BOOL)IsColumn:(NSString *)Column inDataBase:(FMDatabase *)db{
    return [db columnExists:Column inTableWithName:[self getTableName]];
}
@end
