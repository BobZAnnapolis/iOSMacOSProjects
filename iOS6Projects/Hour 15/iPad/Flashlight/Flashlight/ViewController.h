//
//  ViewController.h
//  Flashlight
//
//  Created by John Ray on 11/11/12.
//  Copyright (c) 2012 John E. Ray. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface ViewController : UIViewController

@property (weak, nonatomic) IBOutlet UISwitch *toggleSwitch;
@property (weak, nonatomic) IBOutlet UISlider *brightnessSlider;
@property (weak, nonatomic) IBOutlet UIView *lightSource;

- (IBAction)setLightSourceAlphaValue:(id)sender;

@end
