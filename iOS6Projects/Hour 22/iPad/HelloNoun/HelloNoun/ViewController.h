//
//  ViewController.h
//  HelloNoun
//
//  Created by John E. Ray on 9/9/12.
//  Copyright (c) 2012 John E. Ray. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface ViewController : UIViewController

@property (weak, nonatomic) IBOutlet UITextField *userInput;
@property (weak, nonatomic) IBOutlet UILabel *userOutput;

- (IBAction)setOutput:(id)sender;

@end
