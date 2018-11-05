//
//  ViewController.m
//  TBCalendar
//
//  Created by Omega on 05/11/2018.
//  Copyright © 2018 Omega. All rights reserved.
//

#import "ViewController.h"
#import "TBCalendarView.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
  
    TBCalendarView *calendarView = [[TBCalendarView alloc]initWithFrame:CGRectMake(0, 50, self.view.frame.size.width, 260)];
    
    [self.view addSubview:calendarView];
}




@end
