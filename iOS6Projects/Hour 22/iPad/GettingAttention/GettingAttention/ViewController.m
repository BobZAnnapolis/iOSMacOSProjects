//
//  ViewController.m
//  GettingAttention
//
//  Created by John Ray on 9/30/12.
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

- (IBAction)doAlert:(id)sender {
    UIAlertView *alertDialog;
    UILocalNotification *scheduledAlert;
    
    alertDialog = [[UIAlertView alloc]
                   initWithTitle: @"Alert Button Selected"
                   message:@"I need your attention NOW (and in a little bit)!"
                   delegate: nil
                   cancelButtonTitle: @"Ok"
                   otherButtonTitles: nil];
    [alertDialog show];
    
    [[UIApplication sharedApplication] cancelAllLocalNotifications];
    scheduledAlert = [[UILocalNotification alloc] init];
    scheduledAlert.applicationIconBadgeNumber=1;
    scheduledAlert.fireDate = [NSDate dateWithTimeIntervalSinceNow:300];
    scheduledAlert.timeZone = [NSTimeZone defaultTimeZone];
    scheduledAlert.repeatInterval =  NSDayCalendarUnit;
    scheduledAlert.soundName=@"soundeffect.wav";
    scheduledAlert.alertBody = @"I’d like to get your attention again!";
    
    [[UIApplication sharedApplication]
     scheduleLocalNotification:scheduledAlert];
}

- (IBAction)doMultiButtonAlert:(id)sender {
    UIAlertView *alertDialog;
    alertDialog = [[UIAlertView alloc]
                   initWithTitle: @"Alert Button Selected"
                   message:@"I need your attention NOW!"
                   delegate: self
                   cancelButtonTitle: @"Ok"
                   otherButtonTitles: @"Maybe Later", @"Never", nil];
	[alertDialog show];
}

- (IBAction)doAlertInput:(id)sender {
    UIAlertView *alertDialog;
	alertDialog = [[UIAlertView alloc]
                   initWithTitle: @"Email Address"
                   message:@"Please enter your email address:"
                   delegate: self
                   cancelButtonTitle: @"Ok"
                   otherButtonTitles: nil];
    alertDialog.alertViewStyle=UIAlertViewStylePlainTextInput;
	[alertDialog show];
}

- (IBAction)doActionSheet:(id)sender {
    UIActionSheet *actionSheet;
	actionSheet=[[UIActionSheet alloc] initWithTitle:@"Available Actions"
                                            delegate:self
                                   cancelButtonTitle:@"Cancel"
                              destructiveButtonTitle:@"Destroy"
                                   otherButtonTitles:@"Negotiate",@"Compromise",nil];
	actionSheet.actionSheetStyle=UIActionSheetStyleBlackTranslucent;
    [actionSheet showFromRect:[(UIButton *)sender frame]
                       inView:self.view animated:YES];
    //	[actionSheet showInView:self.view];
}


- (IBAction)doSound:(id)sender {
    SystemSoundID soundID;
    NSString *soundFile = [[NSBundle mainBundle]
						   pathForResource:@"soundeffect" ofType:@"wav"];
    
    AudioServicesCreateSystemSoundID((__bridge CFURLRef)
									 [NSURL fileURLWithPath:soundFile]
									 , &soundID);
    AudioServicesPlaySystemSound(soundID);
}


- (IBAction)doAlertSound:(id)sender {
    SystemSoundID soundID;
    NSString *soundFile = [[NSBundle mainBundle]
						   pathForResource:@"alertsound" ofType:@"wav"];
    
    AudioServicesCreateSystemSoundID((__bridge CFURLRef)
									 [NSURL fileURLWithPath:soundFile]
									 , &soundID);
    AudioServicesPlayAlertSound(soundID);
}

- (IBAction)doVibration:(id)sender {
    AudioServicesPlaySystemSound(kSystemSoundID_Vibrate);
}

- (void)actionSheet:(UIActionSheet *)actionSheet
                    clickedButtonAtIndex:(NSInteger)buttonIndex {
	NSString *buttonTitle=[actionSheet buttonTitleAtIndex:buttonIndex];
	if ([buttonTitle isEqualToString:@"Destroy"]) {
		self.userOutput.text=@"Clicked 'Destroy'";
	} else if ([buttonTitle isEqualToString:@"Negotiate"]) {
		self.userOutput.text=@"Clicked 'Negotiate'";
	} else if ([buttonTitle isEqualToString:@"Compromise"]) {
		self.userOutput.text=@"Clicked 'Compromise'";
	} else {
		self.userOutput.text=@"Clicked 'Cancel'";
	}
}

- (void)alertView:(UIAlertView *)alertView
                    clickedButtonAtIndex:(NSInteger)buttonIndex {
	NSString *buttonTitle=[alertView buttonTitleAtIndex:buttonIndex];
	if ([buttonTitle isEqualToString:@"Maybe Later"]) {
		self.userOutput.text=@"Clicked 'Maybe Later'";
    } else if ([buttonTitle isEqualToString:@"Never"]) {
		self.userOutput.text=@"Clicked 'Never'";
	} else {
		self.userOutput.text=@"Clicked 'Ok'";
	}
    
    if ([alertView.title
         isEqualToString: @"Email Address"]) {
        self.userOutput.text=[[alertView textFieldAtIndex:0] text];
    }
}

@end
