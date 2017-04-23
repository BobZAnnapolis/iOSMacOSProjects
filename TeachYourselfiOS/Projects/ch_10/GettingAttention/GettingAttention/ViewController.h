//
//  ViewController.h
//  GettingAttention
//
//  Created by Robert John Zawislak on 12/29/13.
//  Copyright (c) 2013 Robert John Zawislak. All rights reserved.
//

#import <UIKit/UIKit.h>

// import the following  to handle sounds
#import <AudioToolbox/AudioToolbox.h>

// need to add the delegates inorder to process the button presses
@interface ViewController : UIViewController<UIAlertViewDelegate, UIActionSheetDelegate>

// define the outlets
@property (weak, nonatomic) IBOutlet UILabel *userOutput;

// define the actions
- (IBAction)doAlert:(id)sender;
- (IBAction)doMultiButtonAlert:(id)sender;
- (IBAction)doALertInput:(id)sender;
- (IBAction)doActionSheet:(id)sender;
- (IBAction)doSound:(id)sender;
- (IBAction)doAlertSound:(id)sender;
- (IBAction)doVibration:(id)sender;

@end
