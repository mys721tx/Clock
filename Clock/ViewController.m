//
//  ViewController.m
//  Clock
//
//  Created by Yishen Miao on 7/24/17.
//  Copyright © 2017-2018 Yishen Miao. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()

@end

static NSDateFormatter *dateFormatter = nil;

@implementation ViewController

@synthesize timeLabel;
@synthesize dateLabel;

+ (void) initialize {
    if (!dateFormatter) {
        dateFormatter = [[NSDateFormatter alloc] init];
        dateFormatter.locale = [NSLocale localeWithLocaleIdentifier:@"en_US_POSIX"];
        dateFormatter.dateFormat = @"YYYY-MM-dd,HH:mm:ss";
        dateFormatter.timeZone = [NSTimeZone timeZoneWithName:@"UTC"];
    }
}

- (void)setTimeLabelByDate: (NSTimer *) timer {
    NSDate *now = [NSDate date];

    NSArray *strings = [[dateFormatter stringFromDate:now] componentsSeparatedByString:@","];

    [dateLabel setText:strings[0]];
    [timeLabel setText:strings[1]];
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
