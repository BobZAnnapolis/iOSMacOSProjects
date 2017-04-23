//
//  ViewController.m
//  HelloNoun
//
//  Created by John E. Ray on 9/9/12.
//  Copyright (c) 2012 John E. Ray. All rights reserved.
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

- (IBAction)setOutput:(id)sender {
    //    [[self userOutput]setText:[[self userInput] text]];
    self.userOutput.text=self.userInput.text;
}

@end
