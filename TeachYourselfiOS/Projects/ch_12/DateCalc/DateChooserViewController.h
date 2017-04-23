//
//  DateChooserViewController.h
//  DateCalc
//
//  Created by Robert John Zawislak on 1/25/14.
//  Copyright (c) 2014 Robert John Zawislak. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "ViewController.h"

@interface DateChooserViewController : UIViewController
@property (weak, nonatomic) id delegate;

- (IBAction)setDateTime:(id)sender;
- (IBAction)dismissDateChooser:(id)sender;

@end
