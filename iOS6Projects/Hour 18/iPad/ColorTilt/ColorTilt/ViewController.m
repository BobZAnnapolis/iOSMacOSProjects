//
//  ViewController.m
//  ColorTilt
//
//  Created by John Ray on 10/8/12.
//  Copyright (c) 2012 John E. Ray. All rights reserved.
//

#import "ViewController.h"

@interface ViewController () {
    CMMotionManager *_motionManager;
}
@end

@implementation ViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view, typically from a nib.
    _motionManager = [[CMMotionManager alloc] init];
    _motionManager.accelerometerUpdateInterval = .01;
    _motionManager.gyroUpdateInterval = .01;
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (NSUInteger)supportedInterfaceOrientations
{
    return UIInterfaceOrientationMaskPortrait;
}

- (IBAction)controlHardware:(id)sender {
    if ([self.toggleAccelerometer isOn]) {
        [_motionManager
         startAccelerometerUpdatesToQueue:[NSOperationQueue currentQueue]
         withHandler:^(CMAccelerometerData *accelData, NSError *error) {
             [self doAcceleration:accelData.acceleration];
         }];
	} else {
        [_motionManager stopAccelerometerUpdates];
    }
    
    if ([self.toggleGyroscope isOn] && _motionManager.gyroAvailable) {
        [_motionManager
         startGyroUpdatesToQueue:[NSOperationQueue currentQueue]
         withHandler:^(CMGyroData *gyroData, NSError *error) {
             [self doRotation:gyroData.rotationRate];
         }];
    } else {
		[self.toggleGyroscope setOn:NO animated:YES];
        [_motionManager stopGyroUpdates];
    }
}

- (void)doAcceleration:(CMAcceleration)acceleration {
    if (acceleration.x > 1.3) {
        self.colorView.backgroundColor = [UIColor greenColor];
    } else if (acceleration.x < -1.3) {
        self.colorView.backgroundColor = [UIColor orangeColor];
    } else if (acceleration.y > 1.3) {
        self.colorView.backgroundColor = [UIColor redColor];
    } else if (acceleration.y < -1.3) {
        self.colorView.backgroundColor = [UIColor blueColor];
    } else if (acceleration.z > 1.3) {
        self.colorView.backgroundColor = [UIColor yellowColor];
    } else if (acceleration.z < -1.3) {
        self.colorView.backgroundColor = [UIColor purpleColor];
    }
    
    double value = fabs(acceleration.x);
    if (value > 1.0) { value = 1.0;}
    self.colorView.alpha = value;
}

- (void)doRotation:(CMRotationRate)rotation {
    double value = (fabs(rotation.x)+fabs(rotation.y)+fabs(rotation.z))/12.5;
    if (value > 1.0) { value = 1.0;}
    self.colorView.alpha = value;
}


@end
