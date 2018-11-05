//
//  TBCalendarView.m
//  TBCalendar
//
//  Created by Omega on 05/11/2018.
//  Copyright © 2018 Omega. All rights reserved.
//

#import "TBCalendarView.h"
#import "TBCalendarItem.h"

#define random(r, g, b, a) [UIColor colorWithRed:(r)/255.0 green:(g)/255.0 blue:(b)/255.0 alpha:(a)/255.0]
#define randomColor random(arc4random_uniform(256), arc4random_uniform(256), arc4random_uniform(256), arc4random_uniform(256))

@implementation TBCalendarView


- (instancetype)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        self.backgroundColor = [UIColor grayColor];
        
        CGFloat width = frame.size.width;
        CGFloat height = frame.size.height;
        
        CGFloat itemW = width/7;
        CGFloat itemH = height/(5+1);
        NSInteger row = 1;
        
        
        //初始化星期
        for (NSInteger i=0;i<7;i++){
            UILabel *lab = [[UILabel alloc]initWithFrame:CGRectMake(itemW*i, 0, itemW, itemH)];
            lab.text = [self getWeekWithNumber:i+1];
            [self addSubview:lab];
        }
//        初始化日期
        
        NSArray *allDays = [self getAllDaysWithCalender];
        
        for (NSInteger i=0;i<allDays.count;i++){
            
            NSInteger week = [allDays[i] integerValue];
            
            TBCalendarItem *item = [[TBCalendarItem alloc]initWithFrame:CGRectMake(itemW*(week-1), row*itemH, itemW, itemH)];
            item.backgroundColor = randomColor;
            item.week = [NSString stringWithFormat:@"%ld",i+1];
            [self addSubview:item];
            
            if([allDays[i] isEqualToNumber:@(7)]){
                row++;
            }
        }
//        for(NSNumber *x in allDays){
//
//        }
    }
    return self;
}

- (NSString *)getWeekWithNumber:(NSInteger)number{
    NSString *week = @"";
    switch (number) {
        case 1:{
            week = @"星期日";
            break;
        }
        case 2:{
             week = @"星期一";
            break;
        }
        case 3:{
             week = @"星期二";
            break;
        }
        case 4:{
             week = @"星期三";
            break;
        }
        case 5:{
             week = @"星期四";
            break;
        }
        case 6:{
             week = @"星期五";
            break;
        }
        case 7:{
             week = @"星期六";
            break;
        }
        
        default:
            break;
    }
    return week;
}
/**
 *  获取当月中所有天数是周几
 */
- (NSMutableArray *) getAllDaysWithCalender
{
    NSUInteger dayCount = [self getNumberOfDaysInMonth]; //一个月的总天数
    NSDateFormatter * formatter = [[NSDateFormatter alloc] init];
    NSTimeZone *timeZone = [NSTimeZone timeZoneWithAbbreviation:@"GMT+0800"];
    [formatter setTimeZone:timeZone];
    NSDate * currentDate = [NSDate date];
    [formatter setDateFormat:@"yyyy-MM"];
    NSString * str = [formatter stringFromDate:currentDate];
    [formatter setDateFormat:@"yyyy-MM-dd"];
    NSMutableArray * allDaysArray = [[NSMutableArray alloc] init];
    for (NSInteger i = 1; i <= dayCount; i++) {
        NSString * sr = [NSString stringWithFormat:@"%@-%ld",str,i];
        NSDate *suDate = [formatter dateFromString:sr];
        [allDaysArray addObject:[self getweekDayWithDate:suDate]];
    }
    NSLog(@"allDaysArray %@",allDaysArray);
    return allDaysArray;
}

// 获取当月的天数
- (NSInteger)getNumberOfDaysInMonth
{
        NSCalendar * calendar = [[NSCalendar alloc] initWithCalendarIdentifier:NSCalendarIdentifierGregorian]; // 指定日历的算法 NSGregorianCalendar - ios 8
        NSDate * currentDate = [NSDate date];
        NSRange range = [calendar rangeOfUnit:NSCalendarUnitDay  //NSDayCalendarUnit - ios 8
                                                            inUnit: NSCalendarUnitMonth //NSMonthCalendarUnit - ios 8
                                                           forDate:currentDate];
        return range.length;
}


/**
 *  获得某天的数据
 *
 *  获取指定的日期是星期几
 */
- (NSNumber *) getweekDayWithDate:(NSDate *) date
{
    NSCalendar * calendar = [[NSCalendar alloc] initWithCalendarIdentifier:NSCalendarIdentifierGregorian]; // 指定日历的算法
    NSDateComponents *comps = [calendar components:NSWeekdayCalendarUnit fromDate:date];
    
    // 1 是周日，2是周一 3.以此类推
    return @([comps weekday]);
    
}

//获取的时间是国际标准时间，中国用的是东八区的时间，所以你要把时间本地化，然后就行了
/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
}
*/

@end
