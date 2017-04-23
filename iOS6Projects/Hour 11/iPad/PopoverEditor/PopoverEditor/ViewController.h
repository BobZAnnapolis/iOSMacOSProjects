//
//  ViewController.h
//  PopoverEditor
//
//  Created by John Ray on 11/3/12.
//  Copyright (c) 2012 John E. Ray. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "EditorViewController.h"

@interface ViewController : UIViewController <UIPopoverControllerDelegate>

@property (weak, nonatomic) IBOutlet UILabel *emailLabel;

@end
