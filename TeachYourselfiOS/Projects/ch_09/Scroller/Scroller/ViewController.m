//
//  ViewController.m
//  Scroller
//
//  Created by Robert John Zawislak on 12/28/13.
//  Copyright (c) 2013 Robert John Zawislak. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view, typically from a nib.
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

// after the scrollerView appears, u have to press into the trackpad to get it to scroll to the unseen areas
- (void) viewDidAppear:(BOOL)animated {
    [super viewDidAppear:animated];
    self.theScroller.contentSize=CGSizeMake(280.0, 1000.0);
    NSLog(@"calling viewDidAppear -self.theScroller.contentSize=CGSizeMake(280.0, 1000.0);");
}

@end
