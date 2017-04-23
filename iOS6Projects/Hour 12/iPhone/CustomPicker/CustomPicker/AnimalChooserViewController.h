//
//  AnimalChooserViewController.h
//  CustomPicker
//
//  Created by John Ray on 11/4/12.
//  Copyright (c) 2012 John E. Ray. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "ViewController.h"

@interface AnimalChooserViewController : UIViewController <UIPickerViewDataSource, UIPickerViewDelegate>

@property (weak, nonatomic) id delegate;

- (IBAction)dismissAnimalChooser:(id)sender;

@end
