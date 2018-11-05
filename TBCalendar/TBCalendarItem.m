//
//  TBCalendarItem.m
//  TBCalendar
//
//  Created by Omega on 05/11/2018.
//  Copyright © 2018 Omega. All rights reserved.
//

#import "TBCalendarItem.h"

@interface TBCalendarItem()

@property (nonatomic,strong) UILabel *lab;

@end

@implementation TBCalendarItem


- (instancetype)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        _lab = [[UILabel alloc]initWithFrame:self.bounds];
        _lab.textAlignment = NSTextAlignmentCenter;
        [self addSubview:_lab];
    }
    return self;
}

- (void)setWeek:(NSString *)week{
    _week = week;
    self.lab.text = week;
}
/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
}
*/

@end
