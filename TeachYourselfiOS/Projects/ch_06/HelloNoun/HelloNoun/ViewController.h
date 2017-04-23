//
//  ViewController.h
//  HelloNoun
//
//  Created by Robert John Zawislak on 12/26/13.
//  Copyright (c) 2013 Robert John Zawislak. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface ViewController : UIViewController

@property (weak, nonatomic) IBOutlet UILabel *userOutput;
@property (weak, nonatomic) IBOutlet UITextField *userInput;

- (IBAction)setOutput:(id)sender;

@end
