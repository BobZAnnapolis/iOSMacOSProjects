//
//  EditorViewController.m
//  ModalEditor
//
//  Created by John Ray on 11/3/12.
//  Copyright (c) 2012 John E. Ray. All rights reserved.
//

#import "EditorViewController.h"

@interface EditorViewController ()

@end

@implementation EditorViewController

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
	
    self.emailField.text=
    ((ViewController *)self.presentingViewController).emailLabel.text;
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (IBAction)updateEditor:(id)sender {
    ((ViewController *)self.presentingViewController).emailLabel.text=
            self.emailField.text;
    //[self dismissViewControllerAnimated:YES completion:nil];
}

@end
