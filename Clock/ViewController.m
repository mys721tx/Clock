//
//  ViewController.m
//  Clock
//
//  Created by Yishen Miao on 7/24/17.
//  Copyright © 2017 Yishen Miao. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()

@end

@implementation ViewController

@synthesize timeLabel;

- (void)setTimeLabelByDate: (NSTimer *) timer {
    NSDate *now = [NSDate date];
    
    NSDateFormatter *dateFormatter = [[NSDateFormatter alloc] init];
    
    dateFormatter.locale = [NSLocale localeWithLocaleIdentifier:@"en_US_POSIX"];
    dateFormatter.dateFormat = @"HH:mm:ss";
    dateFormatter.timeZone = [NSTimeZone timeZoneWithName:@"UTC"];

    [timeLabel setText:[dateFormatter stringFromDate:now]];
}

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.

    [NSTimer scheduledTimerWithTimeInterval:0.1f target:self selector:@selector(setTimeLabelByDate:) userInfo:nil repeats:YES];
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
