//
//  ViewController.h
//  DateCalc
//
//  Created by Robert John Zawislak on 1/25/14.
//  Copyright (c) 2014 Robert John Zawislak. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "DateChooserViewController.h"

@interface ViewController : UIViewController

@property (weak, nonatomic) IBOutlet UILabel *outputLabel;
@property (weak, nonatomic) IBOutlet UIToolbar *showDateChooser;
@property (nonatomic) Boolean dateChooserVisible;

@end
