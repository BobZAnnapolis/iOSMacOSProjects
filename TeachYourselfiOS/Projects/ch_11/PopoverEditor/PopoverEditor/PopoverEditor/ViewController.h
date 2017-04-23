//
//  ViewController.h
//  PopoverEditor
//
//  Created by Robert John Zawislak on 1/25/14.
//  Copyright (c) 2014 Robert John Zawislak. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "EditorViewController.h"


@interface ViewController : UIViewController <UIPopoverControllerDelegate>

@property (weak, nonatomic) IBOutlet UILabel *emailLabel;

@end
