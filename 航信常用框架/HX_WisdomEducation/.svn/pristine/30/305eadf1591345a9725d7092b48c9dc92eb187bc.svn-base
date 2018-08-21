//
//  DBHelper.h
//  Aisino_iOS_SupplyChain
//
//  Created by 荣学敏 on 2018/3/20.
//

#import <Foundation/Foundation.h>
#import "FMDatabase.h"
#import "FMDatabaseQueue.h"
@protocol DBHelperInterface <NSObject>

@optional
-(void)onCreate:(FMDatabase *)db;

@end
@interface DBHelper : NSObject<DBHelperInterface>{
    FMDatabase *m_db;
    FMDatabaseQueue *m_dbQueue;
}
@property(nonatomic,retain)NSString *dbName;
@property(nonatomic,assign)NSInteger dbVersion;
@property(nonatomic,retain)FMDatabaseQueue *dbQueue;

//数据库初始化
-(id)initWithDbName:(NSString *)dbName;
//判断表是否存在
-(BOOL)isTableExists:(NSString *)tableName;

@end
