//
//  TimeUtil.m
//  ybt
//
//  Created by 郭顺 on 14-9-28.
//  Copyright (c) 2014年 hnzdkj. All rights reserved.
//

#import "TimeUtil.h"

@implementation TimeUtil


+(BOOL)isMoreThanSeconds:(NSInteger)secondsCount{
    
    NSString *thistime=[NSString stringWithFormat:@"%f",(double)[[NSDate date] timeIntervalSince1970]*1000];
    
    NSString *lasttime=[[NSUserDefaults standardUserDefaults] objectForKey:@"lastReceive"];
    
    if([thistime doubleValue]-[lasttime doubleValue]>secondsCount){
        [[NSUserDefaults standardUserDefaults] setObject:thistime forKey:@"lastReceive"];
        return YES;
    }
    return NO;
}


+(NSString *)NowTimeString{
    NSDate *now = [[NSDate alloc] init];
    return [self Date2String:now];
}

+(NSString *)Date2String:(NSDate *)date{
    NSDateFormatter *dateFormat = [[NSDateFormatter alloc] init];
    [dateFormat setDateFormat:@"yyyy-MM-dd HH:mm:ss"];
    NSString* timeString = [dateFormat stringFromDate:date];
    return timeString;
}

+(NSDate *)String2Date:(NSString *)strDate{
    //    NSDateFormatter *dateFormatter = [[NSDateFormatter alloc] init];
    //    [dateFormatter setDateFormat: @"yyyy-MM-dd HH:mm:ss"];
    //    NSDate *destDate= [dateFormatter dateFromString:strDate];
    //    return destDate;
    if ([strDate length] < 17) {
        return [self String2Date:strDate formatter:@"yyyy-MM-dd HH:mm"];
    }
    return [self String2Date:strDate formatter:@"yyyy-MM-dd HH:mm:ss"];
}

+(NSDate *)String2Date:(NSString *)strDate formatter:(NSString *)dateFromatter{
    NSDateFormatter *dateFormatter = [[NSDateFormatter alloc] init];
    [dateFormatter setDateFormat: dateFromatter];
    NSDate *destDate= [dateFormatter dateFromString:strDate];
    return destDate;
}
/**
 * 计算指定时间与当前的时间差
 * @param compareDate   某一指定时间
 * @return 多少(秒or分or天or月or年)+前 (比如，3天前、10分钟前)
 */
+(NSString *) DateShowTime:(NSDate*) date
//
{
    NSTimeInterval  timeInterval = [date timeIntervalSinceNow];
    timeInterval = -timeInterval;
    long temp = 0;
    NSString *result;
    if (timeInterval < 60) {
        result = [NSString stringWithFormat:@"刚刚"];
    }
    else if((temp = timeInterval/60) <60){
        result = [NSString stringWithFormat:@"%ld分前",temp];
    }
    
    else if((temp = temp/60) <24){
        result = [NSString stringWithFormat:@"%ld小前",temp];
    }
    
    else if((temp = temp/24) <30){
        result = [NSString stringWithFormat:@"%ld天前",temp];
    }
    
    else if((temp = temp/30) <12){
        result = [NSString stringWithFormat:@"%ld月前",temp];
    }
    else{
        temp = temp/12;
        result = [NSString stringWithFormat:@"%ld年前",temp];
    }
    
    return  result;
}

+(NSUInteger)DateToNow:(NSDate *)date{
    NSTimeInterval  timeInterval = [date timeIntervalSinceNow];
    timeInterval = -timeInterval;
    return timeInterval;
}

+(NSUInteger)minusOfDate:(NSString *)dateFrom ToDate:(NSString *)dateTo{
    
    NSDate * dateF = [TimeUtil stampToDate:dateFrom];
    NSDate * dateT = [TimeUtil stampToDate:dateTo];
    
    NSTimeInterval  timeInterval = [dateF timeIntervalSinceNow];
    NSTimeInterval  timeIntervalTo = [dateT timeIntervalSinceNow];
    
    timeInterval = timeIntervalTo - timeInterval;
    return timeInterval;
}


+(NSString *)convertNumber2Date:(NSString *)number{
    if(number == nil || [number isEqual:[NSNull null]])
        return @"";
    
    if ([number length]<10) {
        return @"";
    }
    //去前10位
    NSString *numTime = [number substringToIndex:10];
    NSDateFormatter *formatter = [[NSDateFormatter alloc] init];
    [formatter setDateStyle:NSDateFormatterMediumStyle];
    [formatter setTimeStyle:NSDateFormatterShortStyle];
    [formatter setDateFormat:@"yyyy-MM-dd HH:mm:ss"];
    NSTimeZone* timeZone = [NSTimeZone timeZoneWithName:@"Asia/Shanghai"];
    [formatter setTimeZone:timeZone];
    
    NSDate *confromTimesp = [NSDate dateWithTimeIntervalSince1970:[numTime doubleValue]];
    NSString *confromTimespStr = [formatter stringFromDate:confromTimesp];
    return confromTimespStr;
}

+(NSString *)convertNumber2ShowDate:(NSString *)number{
    if(number == nil || [number isEqual:[NSNull null]])
        return @"";
    
    if ([number length]<10) {
        return @"";
    }
    //去前10位
    NSString *numTime = [number substringToIndex:10];
    NSDateFormatter *formatter = [[NSDateFormatter alloc] init];
    [formatter setDateStyle:NSDateFormatterMediumStyle];
    [formatter setTimeStyle:NSDateFormatterShortStyle];
    [formatter setDateFormat:@"yyyy-MM-dd HH:mm:ss"];
    NSTimeZone* timeZone = [NSTimeZone timeZoneWithName:@"Asia/Shanghai"];
    [formatter setTimeZone:timeZone];
    
    NSDate *confromTimesp = [NSDate dateWithTimeIntervalSince1970:[numTime doubleValue]];
    return [self ShowDate:confromTimesp];
    
}
+(NSString *)convertNumber3ShowDate:(NSString *)number Style:(NSInteger)style
{
    if(number == nil || [number isEqual:[NSNull null]])
        return @"";
    
    if ([number length]<10) {
        return @"";
    }
    //去前10位
    NSDateFormatter *formatter = [[NSDateFormatter alloc] init];
    [formatter setDateStyle:NSDateFormatterMediumStyle];
    [formatter setTimeStyle:NSDateFormatterShortStyle];
    [formatter setDateFormat:@"yyyy-MM-dd HH:mm:ss"];
    NSTimeZone* timeZone = [NSTimeZone systemTimeZone];
    [formatter setTimeZone:timeZone];
    
    NSDate *date=[formatter dateFromString:number];
    
    NSString *numTime=[formatter stringFromDate:date];
    numTime = [numTime stringByReplacingCharactersInRange:NSMakeRange(4, 1) withString:@"年"];
    numTime = [numTime stringByReplacingCharactersInRange:NSMakeRange(7, 1) withString:@"月"];
    
    NSArray *numTimeArr = [numTime componentsSeparatedByString:@" "];
    
    return  numTimeArr[0];
    
    
}
+(NSString *)convertNumber2ShowDate:(NSString *)number Style:(NSInteger)style{
    if(number == nil || [number isEqual:[NSNull null]])
        return @"";
    
    if ([number length]<10) {
        return @"";
    }
    //去前10位
    NSString *numTime = [number substringToIndex:10];
    NSDateFormatter *formatter = [[NSDateFormatter alloc] init];
    [formatter setDateStyle:NSDateFormatterMediumStyle];
    [formatter setTimeStyle:NSDateFormatterShortStyle];
    [formatter setDateFormat:@"yyyy-MM-dd HH:mm:ss"];
    NSTimeZone* timeZone = [NSTimeZone timeZoneWithName:@"Asia/Shanghai"];
    [formatter setTimeZone:timeZone];
    
    NSDate *confromTimesp = [NSDate dateWithTimeIntervalSince1970:[numTime doubleValue]];
    return [self ShowDate:confromTimesp Style:style];
}

//转时间戳
+(NSString *)date2Stmp:(NSDate *)date{
    NSTimeInterval ti = [date timeIntervalSince1970];
    NSString *time = [NSString stringWithFormat:@"%ld",(long)ti];
    if ([time length]>10) {
        time = [time substringToIndex:10];
    }
    return time;
}

+(NSDate *)now{
    return [[NSDate alloc] init];
}

+(NSDate *)stampToDate:(NSString *)stmp{
    if(stmp == nil || [stmp isEqual:[NSNull null]])
        return nil;
    
    if ([stmp length]<10) {
        return nil;
    }
    //去前10位
    NSString *numTime = [stmp substringToIndex:10];
    //    NSTimeZone* timeZone = [NSTimeZone timeZoneWithName:@"Asia/Shanghai"];
    
    NSDate *confromTimesp = [NSDate dateWithTimeIntervalSince1970:[numTime doubleValue]];
    return confromTimesp;
}



//当时间超长时：style:0 只显示日期，1:只显示时间.2:显示日期和时间
+(NSString *)ShowDate:(NSDate *)date Style:(NSInteger)style{
    NSCalendar *cal = [NSCalendar currentCalendar];
    NSDateComponents *components = [cal components:( NSHourCalendarUnit | NSMinuteCalendarUnit | NSSecondCalendarUnit ) fromDate:[[NSDate alloc] init]];
    
    [components setHour:-[components hour]];
    [components setMinute:-[components minute]];
    [components setSecond:-[components second]];
    NSDate *today = [cal dateByAddingComponents:components toDate:[[NSDate alloc] init] options:0];
    
    [components setHour:-24];
    [components setMinute:0];
    [components setSecond:0];
    NSDate *yesterday = [cal dateByAddingComponents:components toDate: today options:0];
    
    NSDate *dayAfterYesterday = [cal dateByAddingComponents:components toDate: yesterday options:0];
    
    //    NSTimeZone* localzone = [NSTimeZone localTimeZone];
    //    NSTimeZone* GTMzone = [NSTimeZone timeZoneForSecondsFromGMT:8];
    
    NSDateFormatter *formatter = [[NSDateFormatter alloc] init];
    //    [formatter setTimeZone:localzone];
    //    [formatter setDateStyle:NSDateFormatterMediumStyle];
    //    [formatter setTimeStyle:NSDateFormatterShortStyle];
    [formatter setDateFormat:@"yyyy-MM-dd"];
    
    
    NSString *strToday = [formatter stringFromDate:today];
    NSString *strYesterday = [formatter stringFromDate:yesterday];
    NSString *strDayafterYesterday = [formatter stringFromDate:dayAfterYesterday];
    
    NSString *strDay = [formatter stringFromDate:date];
    
    [formatter setDateFormat:@"HH:mm"];
    NSString *time = [formatter stringFromDate:date];
    
    if ([strDay isEqualToString:strToday]) {
        return time;
    } else if([strDay isEqualToString:strYesterday]){
        return [NSString stringWithFormat:@"昨天%@",time];
    }else if([strDay isEqualToString:strDayafterYesterday]){
        return [NSString stringWithFormat:@"前天%@",time];
    }else{
        if (style == 0) {
            [formatter setDateFormat:@"yyyy-MM-dd"];
        }else if(style == 1){
            [formatter setDateFormat:@"HH:mm"];
        }else{
            [formatter setDateFormat:@"yyyy-MM-dd HH:mm"];
        }
        
        return [formatter stringFromDate:date];
    }
}

+(NSString *)ClassZoneShowDate:(NSDate *)date NewDate:(NSDate *)nowDate Style:(NSInteger)style
{
    NSCalendar *cal = [NSCalendar currentCalendar];
    NSDateComponents *components = [cal components:( NSHourCalendarUnit | NSMinuteCalendarUnit | NSSecondCalendarUnit ) fromDate:[[NSDate alloc] init]];
    
    [components setHour:-[components hour]];
    [components setMinute:-[components minute]];
    [components setSecond:-[components second]];
    NSDate *today = [cal dateByAddingComponents:components toDate:[[NSDate alloc] init] options:0];
    
    [components setHour:-24];
    [components setMinute:0];
    [components setSecond:0];
    NSDate *yesterday = [cal dateByAddingComponents:components toDate: today options:0];
    
    NSDate *dayAfterYesterday = [cal dateByAddingComponents:components toDate: yesterday options:0];
    
    //    NSTimeZone* localzone = [NSTimeZone localTimeZone];
    //    NSTimeZone* GTMzone = [NSTimeZone timeZoneForSecondsFromGMT:8];
    
    NSDateFormatter *formatter = [[NSDateFormatter alloc] init];
    //    [formatter setTimeZone:localzone];
    //    [formatter setDateStyle:NSDateFormatterMediumStyle];
    //    [formatter setTimeStyle:NSDateFormatterShortStyle];
    [formatter setDateFormat:@"yyyy-MM-dd"];
    
    
    NSString *strToday = [formatter stringFromDate:today];
    NSString *strYesterday = [formatter stringFromDate:yesterday];
    NSString *strDayafterYesterday = [formatter stringFromDate:dayAfterYesterday];
    
    NSString *strDay = [formatter stringFromDate:date];
    
    [formatter setDateFormat:@"HH:mm"];
    NSString *time = [formatter stringFromDate:date];
    
    if ([strDay isEqualToString:strToday]) {
        long dd = (long)([nowDate  timeIntervalSince1970] - [date timeIntervalSince1970]);
        if ( dd < 300) {
            return @"刚刚";
        }else if (dd >= 300 && dd <= 900){
            return [NSString stringWithFormat:@"%ld分钟前", dd/60];
        }else{
            return [NSString stringWithFormat:@"今天%@",time];
        }
    } else if([strDay isEqualToString:strYesterday]){
        return [NSString stringWithFormat:@"昨天%@",time];
    }else if([strDay isEqualToString:strDayafterYesterday]){
        return @"前天";
    }else{
        if (style == 0) {
            [formatter setDateFormat:@"yyyy-MM-dd"];
        }else if(style == 1){
            [formatter setDateFormat:@"HH:mm"];
        }else if(style == 2){
            [formatter setDateFormat:@"MM/dd HH:mm"];
        }else{
            [formatter setDateFormat:@"yyyy-MM-dd HH:mm"];
        }
        
        return [formatter stringFromDate:date];
    }
    
    
    
}
+(NSString *)ShowDate:(NSDate *)date{
    NSCalendar *cal = [NSCalendar currentCalendar];
    NSDateComponents *components = [cal components:( NSHourCalendarUnit | NSMinuteCalendarUnit | NSSecondCalendarUnit ) fromDate:[[NSDate alloc] init]];
    
    [components setHour:-[components hour]];
    [components setMinute:-[components minute]];
    [components setSecond:-[components second]];
    NSDate *today = [cal dateByAddingComponents:components toDate:[[NSDate alloc] init] options:0];
    
    [components setHour:-24];
    [components setMinute:0];
    [components setSecond:0];
    NSDate *yesterday = [cal dateByAddingComponents:components toDate: today options:0];
    
    NSDate *dayAfterYesterday = [cal dateByAddingComponents:components toDate: yesterday options:0];
    
    //    NSTimeZone* localzone = [NSTimeZone localTimeZone];
    //    NSTimeZone* GTMzone = [NSTimeZone timeZoneForSecondsFromGMT:8];
    
    NSDateFormatter *formatter = [[NSDateFormatter alloc] init];
    //    [formatter setTimeZone:localzone];
    //    [formatter setDateStyle:NSDateFormatterMediumStyle];
    //    [formatter setTimeStyle:NSDateFormatterShortStyle];
    [formatter setDateFormat:@"yyyy-MM-dd"];
    
    
    NSString *strToday = [formatter stringFromDate:today];
    NSString *strYesterday = [formatter stringFromDate:yesterday];
    NSString *strDayafterYesterday = [formatter stringFromDate:dayAfterYesterday];
    
    NSString *strDay = [formatter stringFromDate:date];
    
    [formatter setDateFormat:@"HH:mm"];
    NSString *time = [formatter stringFromDate:date];
    
    if ([strDay isEqualToString:strToday]) {
        return time;
    } else if([strDay isEqualToString:strYesterday]){
        return [NSString stringWithFormat:@"昨天%@",time];
    }else if([strDay isEqualToString:strDayafterYesterday]){
        return [NSString stringWithFormat:@"前天%@",time];
    }else{
        [formatter setDateFormat:@"yyyy-MM-dd HH:mm"];
        return [formatter stringFromDate:date];
    }
}


/**
 *  生成一个在程序中向外展示的时间
 *
 *  @param strDate 时间
 *
 *  @return 时间，例如昨天18：15
 */
+(NSString *)dateToShowTime:(NSString *)strDate{
    NSDate *date = [TimeUtil String2Date:strDate];
    NSCalendar *cal = [NSCalendar currentCalendar];
    NSDateComponents *components = [cal components:( NSHourCalendarUnit | NSMinuteCalendarUnit | NSSecondCalendarUnit ) fromDate:[[NSDate alloc] init]];
    
    [components setHour:-[components hour]];
    [components setMinute:-[components minute]];
    [components setSecond:-[components second]];
    NSDate *today = [cal dateByAddingComponents:components toDate:[[NSDate alloc] init] options:0];
    
    [components setHour:-24];
    [components setMinute:0];
    [components setSecond:0];
    NSDate *yesterday = [cal dateByAddingComponents:components toDate: today options:0];
    
    NSDate *dayAfterYesterday = [cal dateByAddingComponents:components toDate: yesterday options:0];
    
    //    NSTimeZone* localzone = [NSTimeZone localTimeZone];
    //    NSTimeZone* GTMzone = [NSTimeZone timeZoneForSecondsFromGMT:8];
    
    
    [components setHour:+24];
    NSDate *tomorrow = [cal dateByAddingComponents:components toDate: today options:0];
    NSDate *dayAftertomorrow = [cal dateByAddingComponents:components toDate: tomorrow options:0];
    
    
    NSDateFormatter *formatter = [[NSDateFormatter alloc] init];
    //    [formatter setTimeZone:localzone];
    //    [formatter setDateStyle:NSDateFormatterMediumStyle];
    //    [formatter setTimeStyle:NSDateFormatterShortStyle];
    [formatter setDateFormat:@"yyyy-MM-dd"];
    
    
    NSString *strToday = [formatter stringFromDate:today];
    NSString *strYesterday = [formatter stringFromDate:yesterday];
    NSString *strDayafterYesterday = [formatter stringFromDate:dayAfterYesterday];
    NSString *strTomorrow = [formatter stringFromDate:tomorrow];
    NSString *strDayAftertomorrow = [formatter stringFromDate:dayAftertomorrow];
    
    NSString *strDay = [formatter stringFromDate:date];
    
    [formatter setDateFormat:@"HH:mm"];
    NSString *time = [formatter stringFromDate:date];
    
    if ([strDay isEqualToString:strToday]) {
        return time;
    } else if([strDay isEqualToString:strYesterday]){
        return [NSString stringWithFormat:@"昨天%@",time];
    }else if([strDay isEqualToString:strDayafterYesterday]){
        return [NSString stringWithFormat:@"前天%@",time];
    } else if([strDay isEqualToString:strTomorrow]){
        return [NSString stringWithFormat:@"明天%@",time];
    }else if([strDay isEqualToString:strDayAftertomorrow]){
        return [NSString stringWithFormat:@"后天%@",time];
    }else{
        [formatter setDateFormat:@"yyyy-MM-dd HH:mm"];
        return [formatter stringFromDate:date];
    }
}

+(NSString *)getTimeStmp{
    //产生一个TaskId，时间戳，精确到微秒
    static NSObject *taskTimeObj = nil;
    static dispatch_once_t taskOnceToken;
    dispatch_once(&taskOnceToken, ^{
        taskTimeObj = [[NSObject alloc] init];
    });
    
    @synchronized(taskTimeObj){
        UInt64 recordTime = [[NSDate date] timeIntervalSince1970]*1000*1000;
        NSString *taskId = [NSString stringWithFormat:@"%llu",recordTime];
        return taskId;
    }
}


/**
 *  获取未来某个日期是星期几
 *  注意：featureDate 传递过来的格式 必须 和 formatter.dateFormat 一致，否则endDate可能为nil
 *
 */
+ (NSString *)featureWeekdayWithDate:(NSString *)featureDate{
    // 创建 格式 对象
    NSDateFormatter *formatter = [[NSDateFormatter alloc] init];
    // 设置 日期 格式 可以根据自己的需求 随时调整， 否则计算的结果可能为 nil
    formatter.dateFormat = @"yyyy-MM-dd";
    // 将字符串日期 转换为 NSDate 类型
    NSDate *endDate = [formatter dateFromString:featureDate];
    // 判断当前日期 和 未来某个时刻日期 相差的天数
    NSArray *weekdays = [NSArray arrayWithObjects: [NSNull null], @"周日", @"周一", @"周二", @"周三", @"周四", @"周五", @"周六", nil];
    
    NSCalendar *calendar = [[NSCalendar alloc] initWithCalendarIdentifier:NSGregorianCalendar];
    
    NSTimeZone *timeZone = [[NSTimeZone alloc] initWithName:@"Asia/Shanghai"];
    
    [calendar setTimeZone: timeZone];
    
    NSCalendarUnit calendarUnit = NSWeekdayCalendarUnit;
    
    NSDateComponents *theComponents = [calendar components:calendarUnit fromDate:endDate];
    
    return [weekdays objectAtIndex:theComponents.weekday];
    
    
    
}

/**
 *  计算2个日期相差天数
 *  startDate   起始日期
 *  endDate     截至日期
 */
+(NSInteger)daysFromDate:(NSDate *)startDate toDate:(NSDate *)endDate {
    NSDateFormatter *dateFormatter=[[NSDateFormatter alloc] init];
    // 话说在真机上需要设置区域，才能正确获取本地日期，天朝代码:zh_CN
    dateFormatter.locale = [[NSLocale alloc] initWithLocaleIdentifier:@"zh_CN"];
    [dateFormatter setDateFormat:@"yyyy-MM-dd HH:mm:ss"];
    //得到相差秒数
    NSTimeInterval time = [endDate timeIntervalSinceDate:startDate];
    int days = ((int)time)/(3600*24);
    int hours = ((int)time)%(3600*24)/3600;
    int minute = ((int)time)%(3600*24)/3600/60;
    if (days <= 0 && hours <= 0&&minute<= 0) {
        NSLog(@"0天0小时0分钟");
        return 0;
    }
    else {
        NSLog(@"%@",[[NSString alloc] initWithFormat:@"%i天%i小时%i分钟",days,hours,minute]);
        // 之所以要 + 1，是因为 此处的days 计算的结果 不包含当天 和 最后一天\
        （如星期一 和 星期四，计算机 算的结果就是2天（星期二和星期三），日常算，星期一——星期四相差3天，所以需要+1）\
        对于时分 没有进行计算 可以忽略不计
        return days + 1;
    }
}



// 获取当前是星期几
+ (NSInteger)getNowWeekday {
    NSCalendar *calendar = [[NSCalendar alloc] initWithCalendarIdentifier:NSGregorianCalendar];
    NSDateComponents *comps = [[NSDateComponents alloc] init];
    NSInteger unitFlags = NSYearCalendarUnit | NSMonthCalendarUnit | NSDayCalendarUnit | NSWeekdayCalendarUnit |
    NSHourCalendarUnit | NSMinuteCalendarUnit | NSSecondCalendarUnit;
    NSDate *now = [NSDate date];
    // 话说在真机上需要设置区域，才能正确获取本地日期，天朝代码:zh_CN
    calendar.locale = [[NSLocale alloc] initWithLocaleIdentifier:@"zh_CN"];
    comps = [calendar components:unitFlags fromDate:now];
    return [comps weekday];
}


+(NSString *)getNanoTimeStmp{
    //产生一个TaskId，时间戳，精确到微秒
    static NSObject *taskTimeObj = nil;
    static dispatch_once_t taskOnceToken;
    dispatch_once(&taskOnceToken, ^{
        taskTimeObj = [[NSObject alloc] init];
    });
    
    @synchronized(taskTimeObj){
        UInt64 recordTime = [[NSDate date] timeIntervalSince1970]*1000*1000*1000;
        NSString *taskId = [NSString stringWithFormat:@"%llu",recordTime];
        return taskId;
    }
}

@end
