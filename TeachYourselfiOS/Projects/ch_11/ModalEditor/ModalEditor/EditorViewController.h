//
//  EditorViewController.h
//  ModalEditor
//
//  Created by Robert John Zawislak on 12/30/13.
//  Copyright (c) 2013 Robert John Zawislak. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "ViewController.h"

@interface EditorViewController : UIViewController
@property (weak, nonatomic) IBOutlet UITextField *emailField;
- (IBAction)updateEditor:(id)sender;

@end
