//
//  ViewController.h
//  DateCalc
//
//  Created by John Ray on 11/4/12.
//  Copyright (c) 2012 John E. Ray. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "DateChooserViewController.h"

@interface ViewController : UIViewController

@property (weak, nonatomic) IBOutlet UILabel *outputLabel;
@property (nonatomic) Boolean dateChooserVisible;

- (IBAction)showDateChooser:(id)sender;
- (void)calculateDateDifference:(NSDate *)chosenDate;

@end
