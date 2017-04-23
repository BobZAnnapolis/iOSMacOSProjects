//
//  ViewController.m
//  Flashlight
//
//  Created by John Ray on 11/11/12.
//  Copyright (c) 2012 John E. Ray. All rights reserved.
//

#import "ViewController.h"

#define kOnOffToggle @"onOff"
#define kBrightnessLevel @"brightness"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
    
    NSUserDefaults *userDefaults = [NSUserDefaults standardUserDefaults];
    self.brightnessSlider.value = [userDefaults floatForKey:kBrightnessLevel];
    self.toggleSwitch.on = [userDefaults boolForKey:kOnOffToggle];
    if ([userDefaults boolForKey: kOnOffToggle]) {
        self.lightSource.alpha = [userDefaults floatForKey:kBrightnessLevel];
    } else {
        self.lightSource.alpha = 0.0;
    }
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (IBAction)setLightSourceAlphaValue:(id)sender {
    NSUserDefaults *userDefaults = [NSUserDefaults standardUserDefaults];
    [userDefaults setBool:self.toggleSwitch.on forKey:kOnOffToggle];
    [userDefaults setFloat:self.brightnessSlider.value
                    forKey:kBrightnessLevel];
    [userDefaults synchronize];
    
    if (self.toggleSwitch.on) {
        self.lightSource.alpha = self.brightnessSlider.value;
    } else {
        self.lightSource.alpha = 0.0;
    }
}

@end
