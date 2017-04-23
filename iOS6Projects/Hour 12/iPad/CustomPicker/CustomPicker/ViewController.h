//
//  ViewController.h
//  CustomPicker
//
//  Created by John Ray on 11/4/12.
//  Copyright (c) 2012 John E. Ray. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "AnimalChooserViewController.h"

@interface ViewController : UIViewController

@property (weak, nonatomic) IBOutlet UILabel *outputLabel;
@property (nonatomic) Boolean animalChooserVisible;

- (void)displayAnimal:(NSString *)chosenAnimal withSound:(NSString *)chosenSound fromComponent:(NSString *)chosenComponent;
- (IBAction)showAnimalChooser:(id)sender;

@end

