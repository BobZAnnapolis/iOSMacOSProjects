//
//  ViewController.m
//  SlowCount
//
//  Created by John Ray on 10/13/12.
//  Copyright (c) 2012 John E. Ray. All rights reserved.
//

#import "ViewController.h"

@interface ViewController () {
    int _count;
    UIBackgroundTaskIdentifier _counterTask;
    NSTimer *_theTimer;
}
@end

@implementation ViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view, typically from a nib.
    _counterTask = [[UIApplication sharedApplication]
                   beginBackgroundTaskWithExpirationHandler:^{
                       // If you’re worried about exceeding 10 minutes, handle it here
                   }];
    _count=0;
    _theTimer=[NSTimer scheduledTimerWithTimeInterval:0.1
                                                   target:self
                                                 selector:@selector(countUp)
                                                 userInfo:nil
                                                  repeats:YES];
}

- (void)countUp {
    if (_count==1000) {
        [_theTimer invalidate];
        _theTimer=nil;
        [[UIApplication sharedApplication] endBackgroundTask:_counterTask];
    } else {
        _count++;
        NSString *currentCount;
        currentCount=[[NSString alloc] initWithFormat:@"%d",_count];
        self.theCount.text=currentCount;
    }
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
