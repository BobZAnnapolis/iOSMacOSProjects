//
//  GenericViewController.m
//  LetsNavigate
//
//  Created by John Ray on 11/9/12.
//  Copyright (c) 2012 John E. Ray. All rights reserved.
//

#import "GenericViewController.h"

@interface GenericViewController ()

@end

@implementation GenericViewController

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}

-(void)viewWillAppear:(BOOL)animated {
    [super viewWillAppear:animated];
    NSString *pushText;
    pushText=[[NSString alloc] initWithFormat:@"%d",
              ((CountingNavigationController *)self.parentViewController).pushCount];
    self.countLabel.text=pushText;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view.
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (IBAction)incrementCount:(id)sender {
    ((CountingNavigationController *)self.parentViewController).pushCount++;
}

@end
