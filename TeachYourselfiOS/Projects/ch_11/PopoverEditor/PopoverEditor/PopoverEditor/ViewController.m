//
//  ViewController.m
//  PopoverEditor
//
//  Created by Robert John Zawislak on 1/25/14.
//  Copyright (c) 2014 Robert John Zawislak. All rights reserved.
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

// populate the text field with the current text from the initial screen's email address field
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    UIStoryboardPopoverSegue *popoverSegue;
    popoverSegue=(UIStoryboardPopoverSegue *)segue;
    
    UIPopoverController *popoverController;
    popoverController=popoverSegue.popoverController;
    popoverController.delegate=self;
    
    EditorViewController *editorVC;
    editorVC=(EditorViewController *)popoverController.contentViewController;
    editorVC.emailField.text=self.emailLabel.text;
}

// handle moving the data back into the other filed when the popover is dismissed
- (void) popoverControllerDidDismissPopover:(UIPopoverController *)popoverController {
    NSString *newMail=((EditorViewController *) popoverController.contentViewController).emailField.text;
    self.emailLabel.text=newMail;
}

@end
