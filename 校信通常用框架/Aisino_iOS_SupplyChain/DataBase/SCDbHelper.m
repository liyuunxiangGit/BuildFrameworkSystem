//
//  SCDbHelper.m
//  Aisino_iOS_SupplyChain
//
//  Created by 荣学敏 on 2018/3/20.
//

#import "SCDbHelper.h"
#import "TableBase.h"
#import "SectionCache.h"
#import "AccountModel.h"
@implementation SCDbHelper
static SCDbHelper *g_dbHelper = nil;
-(NSArray *)getTableArray{
    NSMutableArray *array = [[NSMutableArray alloc]init];
    [array addObject:[[SectionCache alloc] init]];
    //这里可以新增数据库
    return array;
}

//新建数据库出发该方法，可在这里执行建表语句
-(void)onCreate:(FMDatabase *)db{
    NSArray *allTables = [self getTableArray];
    for (TableBase *tb in allTables) {
        if([tb respondsToSelector:@selector(CreateTable:)]){
            [tb CreateTable:db];
        }
    }
}


+(SCDbHelper *)instances{
    @synchronized(self){
        //        NSString *strDbName = [AccountModel LoginAccount].mobile;
        NSString *strDbName = [AccountModel readSingleModelForKey:Key_LoginUserInfo].mobile;
        //如果strDbName为nil，则程序当前没有登录，取上次登录的用户名作为数据库名，这样做的目的是为了当程序打开，但是没有登录的时候，个推数据过来但是取不到数据库
        //        if(strDbName == nil || [strDbName isEqual:[NSNull null]]){
        //            NSDictionary *userinfo = [Config valueForKey:kUserInfo];
        //            strDbName = [userinfo objectForKey:kUserName];
        //        }
        if(g_dbHelper != nil && [g_dbHelper.dbName isEqualToString:strDbName] == NO){
            g_dbHelper = nil;
        }
        if (g_dbHelper == nil) {
            NSString *dbname = [NSString stringWithFormat:@"%@",strDbName];
            
            g_dbHelper = [[SCDbHelper alloc]initWithDbName:dbname];
        }
        return g_dbHelper;
    }
}
@end
