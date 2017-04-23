//
//  ViewController.m
//  HelloNoun
//
//  Created by Robert John Zawislak on 12/26/13.
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
    _userInput.delegate = self;
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (IBAction)setOutput:(id)sender {
    self.userOutput.text = self.userInput.text;
}

#pragma mark - viewcontroller snippet to dismiss simulator keyboard
//_userInput.delegate = self; - move this to viewDidLoad - use textField
- (BOOL)textFieldShouldReturn:(UITextField *)textField
{
    [textField resignFirstResponder];
    return YES;
}
@end
