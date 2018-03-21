//
//  TimeUtil.h
//  ybt
//
//  Created by 郭顺 on 14-9-28.
//  Copyright (c) 2014年 hnzdkj. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface TimeUtil : NSObject
+(NSString *)NowTimeString;
+(NSString *)Date2String:(NSDate *)date;
+(NSDate *)String2Date:(NSString *)strDate;
+(NSString *) DateShowTime:(NSDate*) date;
//与当前时间比较,返回分钟数
+(NSUInteger)DateToNow:(NSDate *)date;
//返回分钟数，比较两个时间戳相差的秒数
+(NSUInteger)minusOfDate:(NSString *)dateFrom ToDate:(NSString *)dateTo;

//将一长串数字转为时间字符串
+(NSString *)convertNumber2Date:(NSString *)number;

//当时间超长时：style:0 只显示日期，1:只显示时间.2:显示日期和时间
+(NSString *)convertNumber2ShowDate:(NSString *)number Style:(NSInteger)style;
//格式变化
+(NSString *)convertNumber3ShowDate:(NSString *)number Style:(NSInteger)style;

+(NSString *)convertNumber2ShowDate:(NSString *)number;
+(NSString *)date2Stmp:(NSDate *)date;
+(NSDate *)now;
+(NSDate *)stampToDate:(NSString *)stmp;
+(NSString *)ShowDate:(NSDate *)date Style:(NSInteger)style;
//班级圈时间显示
+(NSString *)ClassZoneShowDate:(NSDate *)date NewDate:(NSDate *)nowDate Style:(NSInteger)style;

+(NSString *)dateToShowTime:(NSString *)strDate;
+(BOOL)isMoreThanSeconds:(NSInteger)secondsCount;
+(NSString *)getTimeStmp;   //产生一个时间戳，精确到微秒，原子操作，保证在程序中每次得到的时间戳都不一样

// 获取当前是星期几
+ (NSInteger)getNowWeekday;

/**
 *  获取未来某个日期是星期几
 *  注意：featureDate 传递过来的格式 必须 和 formatter.dateFormat 一致，否则endDate可能为nil
 *
 */
+ (NSString *)featureWeekdayWithDate:(NSString *)featureDate;

/**
 *  计算2个日期相差天数
 *  startDate   起始日期
 *  endDate     截至日期
 */
+(NSInteger)daysFromDate:(NSDate *)startDate toDate:(NSDate *)endDate;
+(NSString *)getNanoTimeStmp;
@end
