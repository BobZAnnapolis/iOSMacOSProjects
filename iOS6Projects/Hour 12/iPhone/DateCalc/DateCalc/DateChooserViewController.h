//
//  DateChooserViewController.h
//  DateCalc
//
//  Created by John Ray on 11/4/12.
//  Copyright (c) 2012 John E. Ray. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "ViewController.h"

@interface DateChooserViewController : UIViewController

@property (weak, nonatomic) id delegate;

- (IBAction)dismissDateChooser:(id)sender;
- (IBAction)setDateTime:(id)sender;

@end
