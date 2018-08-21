//
//  DBHelper.m
//  Aisino_iOS_SupplyChain
//
//  Created by 荣学敏 on 2018/3/20.
//

#import "DBHelper.h"

@implementation DBHelper
@dynamic dbQueue;
-(id)initWithDbName:(NSString *)dbName{
    if (self = [super init]) {
        _dbName = dbName;
        [self createDb];
    }
    return self;
}


-(void)setDbQueue:(FMDatabaseQueue *)dbQueue{
    m_dbQueue = dbQueue;
}

-(FMDatabaseQueue *)dbQueue{
    if(m_dbQueue == nil){
        NSString *dbPath = [self getDbPathWithName:_dbName];
        m_dbQueue =  [FMDatabaseQueue databaseQueueWithPath:dbPath];
    }
    return m_dbQueue;
}


-(void)createDb{
    NSString *dbPath = [self getDbPathWithName:_dbName];
#if DEBUG
//    DDLogDebug(@"数据库地址%@",dbPath);
#endif
    m_db = [FMDatabase databaseWithPath:dbPath];
        //新安装APP
        if([self respondsToSelector:@selector(onCreate:)]){
            [self.dbQueue inDatabase:^(FMDatabase *db) {
                [self onCreate:db];
            }];
            
        }
    
}


//判断表是否存在
-(BOOL)isTableExists:(NSString *)tableName{
    __block BOOL ret = NO;
    [self.dbQueue inDatabase:^(FMDatabase *db) {
        FMResultSet *rs = [db executeQuery:@"select count(*) as 'count' from sqlite_master where type ='table' and name = ?", tableName];
        while ([rs next])
        {
            NSInteger count = [rs intForColumn:@"count"];
            //DDLogInfo(@"isTableOK %d", count);
            
            if (0 == count)
            {
                ret = NO;
            }
            else
            {
                ret = YES;
            }
        }
        [rs close];
    }];
    return ret;
}

-(NSString *)getDbPath{
    NSString *path = [NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES) lastObject];
    return path;
}

-(NSString *)getDbPathWithName:(NSString *)dbName{
    NSString *path = [NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES) lastObject];
    path = [path stringByAppendingPathComponent:dbName];
    return path;
    
}


@end
