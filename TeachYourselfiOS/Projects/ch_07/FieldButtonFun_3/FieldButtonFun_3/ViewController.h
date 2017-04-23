//
//  ViewController.h
//  FieldButtonFun_3
//
//  Created by Robert John Zawislak on 12/26/13.
//  Copyright (c) 2013 Robert John Zawislak. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface ViewController : UIViewController

@property (weak, nonatomic) IBOutlet UITextField *thePlace;
@property (weak, nonatomic) IBOutlet UITextField *theVerb;
@property (weak, nonatomic) IBOutlet UITextField *theNumber;
@property (weak, nonatomic) IBOutlet UITextView *theTemplate;
@property (weak, nonatomic) IBOutlet UITextView *theStory;
@property (weak, nonatomic) IBOutlet UIButton *theButton;
- (IBAction)createStory:(id)sender;
- (IBAction)hideKeyboard:(id)sender;

@end
