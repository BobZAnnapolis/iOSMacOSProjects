//
//  iPadViewController.m
//  UniversalToo
//
//  Created by John Ray on 10/4/12.
//  Copyright (c) 2012 John E. Ray. All rights reserved.
//

#import "iPadViewController.h"

@interface iPadViewController ()

@end

@implementation iPadViewController

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view.
    self.deviceType.text=@"iPad";
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
