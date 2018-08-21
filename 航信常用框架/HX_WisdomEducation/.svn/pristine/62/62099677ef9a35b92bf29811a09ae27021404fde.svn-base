//
//  SectionCache.m
//  Aisino_iOS_SupplyChain
//
//  Created by 荣学敏 on 2018/3/20.
//

#import "SectionCache.h"

@implementation SectionCache
-(NSString *)getTableName{
    return kTableName_SectionCache;
}

-(void)CreateTable:(FMDatabase *)db{
    NSString *sql = [NSString stringWithFormat:@"create table if not exists %@(%@ text,%@ text,%@ text,%@ text)",
                     kTableName_SectionCache,
                     kColumn_SectionCache_SectionName,
                     kColumn_SectionCache_Url,
                     kColumn_SectionCache_content,
                     kColumn_SectionCache_Time];
    [db executeUpdate:sql];
}
@end
