//
//  EditorViewController.h
//  ModalEditor
//
//  Created by John Ray on 11/3/12.
//  Copyright (c) 2012 John E. Ray. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "ViewController.h"

@interface EditorViewController : UIViewController
@property (weak, nonatomic) IBOutlet UITextField *emailField;

- (IBAction)updateEditor:(id)sender;

@end
