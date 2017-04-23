//
//  ViewController.h
//  ColorTilt
//
//  Created by John Ray on 10/8/12.
//  Copyright (c) 2012 John E. Ray. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <CoreMotion/CoreMotion.h>

@interface ViewController : UIViewController

@property (weak, nonatomic) IBOutlet UIView *colorView;
@property (weak, nonatomic) IBOutlet UISwitch *toggleAccelerometer;
@property (weak, nonatomic) IBOutlet UISwitch *toggleGyroscope;

- (IBAction)controlHardware:(id)sender;
- (void)doAcceleration:(CMAcceleration)acceleration;
- (void)doRotation:(CMRotationRate)rotation;

@end
