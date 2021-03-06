//
//  ViewController.m
//  HelloSimulator
//
//  Created by Ray, John on 9/13/12.
//  Copyright (c) 2012 John E. Ray. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)motionEnded:(UIEventSubtype)motion withEvent:(UIEvent *)event {
	UIAlertView *alertDialog;
	
	alertDialog = [[UIAlertView alloc]
				   initWithTitle: @"Stop shaking me!!!"
				   message:@"I'm about to get seasick!"
				   delegate: nil
				   cancelButtonTitle: @"Ok"
				   otherButtonTitles: nil];
	[alertDialog show];
}

- (BOOL)canBecomeFirstResponder {
	return YES;
}

- (void)didReceiveMemoryWarning
{
    UIAlertView *alertDialog;
	alertDialog = [[UIAlertView alloc]
				   initWithTitle: @"Where did my memory go ?"
				   message:@"I'm losing my mind!"
				   delegate: nil
				   cancelButtonTitle: @"Ok"
				   otherButtonTitles: nil];
	[alertDialog show];
    [super didReceiveMemoryWarning];
    // Release any cached data, images, etc that aren't in use.
}

#pragma mark - View lifecycle

- (void)viewDidLoad
{
    [self.webView loadHTMLString:@"<html><body style='width:100%;text-align: center; font-family: Helvetica; font-size:72px; margin-right:0px; margin-left:0px; margin-top:25px;'>Hello<br/> iOS Simulator<br/><br/><img style='width:100%' src='http://www.floraphotographs.com/showrandom.php'></body></html>" baseURL:nil];
	[self.view becomeFirstResponder];
    [super viewDidLoad];
	// Do any additional setup after loading the view, typically from a nib.
}

- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation
{
    // Return YES for supported orientations
    return (interfaceOrientation != UIInterfaceOrientationPortraitUpsideDown);
}

@end