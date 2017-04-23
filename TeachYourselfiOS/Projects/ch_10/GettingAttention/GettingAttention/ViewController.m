//
//  ViewController.m
//  GettingAttention
//
//  Created by Robert John Zawislak on 12/29/13.
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

- (IBAction)doAlert:(id)sender {
    
    // this just displays the alert & leaves - doesn't do anything with button presses
    UIAlertView *alertDialog;
    alertDialog=[[UIAlertView alloc] initWithTitle:@"Alert Me Selected"
                                     message:@"I need your attention NOW !!"
                                     delegate:nil
                                     cancelButtonTitle:@"OK"
                                     otherButtonTitles:nil];
    [alertDialog show];
}

- (IBAction)doMultiButtonAlert:(id)sender {

    // this just displays the alert - need to add an interface protocol & delegate:self to look for & handle button presses
    UIAlertView *alertDialog;
    alertDialog=[[UIAlertView alloc] initWithTitle:@"Alert With Buttons Selected"
                                           message:@"I need your attention NOW !!"
                                          delegate:self
                                 cancelButtonTitle:@"OK"
                                 otherButtonTitles:@"Maybe Later", @"Never", nil];
    [alertDialog show];
}

// create this method - in tandem w/above delegate:self calls this to handle a button press
- (void) alertView:(UIAlertView *)alertView clickedButtonAtIndex:(NSInteger)buttonIndex {
    NSLog(@"calling alertView clickedButtonAtIndex");
    NSString *buttonTitle=[alertView buttonTitleAtIndex:buttonIndex];
    if ( [buttonTitle isEqualToString:@"Maybe Later"]) {
        self.userOutput.text=@"Clicked Maybe Later";
    }
    else if ([buttonTitle isEqualToString:@"Never"]) {
        self.userOutput.text=@"Clicked Never";
    } else {
        self.userOutput.text=@"Clicked OK";
    }
    
    // we'recoming here for a few button presses,so check the title to see which one is currently executing
    // only do  the following for the email address alert
    if ( [alertView.title isEqualToString:@"Email Address"]) {
        self.userOutput.text=[[alertView textFieldAtIndex:0] text];
    }
}

- (IBAction)doALertInput:(id)sender {

    // this just displays the alert - need to add an interface protocol & delegate:self to look for & handle button presses
    NSLog(@"calling doAlertInput");
    UIAlertView *alertDialog;
    alertDialog=[[UIAlertView alloc] initWithTitle:@"Email Address"
                                           message:@"Please enter your email address :"
                                          delegate:self
                                 cancelButtonTitle:@"OK"
                                 otherButtonTitles:nil];
    alertDialog.alertViewStyle=UIAlertViewStylePlainTextInput;
    [alertDialog show];
}

- (IBAction)doActionSheet:(id)sender {
    // display the action sheet
    //NSLog(@"calling doActionSheet");
    UIActionSheet *actionSheet;
    actionSheet=[[UIActionSheet alloc] initWithTitle:@"Available Actions"
                                          delegate:self
                                   cancelButtonTitle:@"Cancel" destructiveButtonTitle:@"Destroy" otherButtonTitles:@"Negotiate",@"Compromise", nil];
    actionSheet.actionSheetStyle=UIActionSheetStyleBlackTranslucent;
  
    // the following is OK for an iPhone
//    [actionSheet showInView:self.view];
    
    // but this method is good for both iPhone & iPad
    [actionSheet showFromRect:[(UIButton *)sender frame] inView:self.view animated:YES];
}
// create this method - in tandem w/above delegate:self calls this to handle a button press
- (void) actionSheet:(UIActionSheet *)actionSheet clickedButtonAtIndex:(NSInteger)buttonIndex {
    NSLog(@"calling actionSheet clickedButtonAtIndex %d",buttonIndex);
    NSString *buttonTitle=[actionSheet buttonTitleAtIndex:buttonIndex];
    if ( [buttonTitle isEqualToString:@"Destroy"]) {
        self.userOutput.text=@"Clicked Destroy";
    }
    else if ([buttonTitle isEqualToString:@"Negotiate"]) {
        self.userOutput.text=@"Clicked Negotiate";
    } else if ([buttonTitle isEqualToString:@"Compromise"]) {
        self.userOutput.text=@"Clicked Compromise";
    } else {
        self.userOutput.text=@"Clicked Cancel";
    }
    
    // we'recoming here for a few button presses,so check the title to see which one is currently executing
    // only do  the following for the email address alert
//    if ( [alertView.title isEqualToString:@"Email Address"]) {
//        self.userOutput.text=[[alertView textFieldAtIndex:0] text];
//    }
}

- (IBAction)doSound:(id)sender {
    SystemSoundID soundID;
    NSString *soundFile=[[NSBundle mainBundle] pathForResource:@"soundeffect" ofType:@"wav"];
    
    AudioServicesCreateSystemSoundID( (__bridge CFURLRef)
                                      [NSURL fileURLWithPath:soundFile]
                                      , &soundID);
    AudioServicesPlaySystemSound(soundID);
}

- (IBAction)doAlertSound:(id)sender {
    SystemSoundID soundID;
    NSString *soundFile=[[NSBundle mainBundle] pathForResource:@"alertsound" ofType:@"wav"];
    
    AudioServicesCreateSystemSoundID( (__bridge CFURLRef)
                                     [NSURL fileURLWithPath:soundFile]
                                     , &soundID);
    AudioServicesPlayAlertSound(soundID);
}

- (IBAction)doVibration:(id)sender {
    AudioServicesPlaySystemSound(kSystemSoundID_Vibrate);
}
@end
