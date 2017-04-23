//
//  ViewController.h
//  Survey
//
//  Created by John Ray on 11/11/12.
//  Copyright (c) 2012 John E. Ray. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface ViewController : UIViewController

@property (weak, nonatomic) IBOutlet UITextView *resultsView;
@property (weak, nonatomic) IBOutlet UITextField *firstName;
@property (weak, nonatomic) IBOutlet UITextField *lastName;
@property (weak, nonatomic) IBOutlet UITextField *email;

- (IBAction)storeSurvey:(id)sender;
- (IBAction)showResults:(id)sender;
- (IBAction)hideKeyboard:(id)sender;

@end
