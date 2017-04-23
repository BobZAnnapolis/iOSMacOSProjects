//
//  ViewController.m
//  Cupertino
//
//  Created by John Ray on 10/12/12.
//  Copyright (c) 2012 John E. Ray. All rights reserved.
//

#import "ViewController.h"

#define kCupertinoLatitude  37.3229978
#define kCupertinoLongitude -122.0321823

@interface ViewController () {
    CLLocationManager *_locMan;
}
@end

@implementation ViewController

- (void)locationManager:(CLLocationManager *)manager
    didUpdateToLocation:(CLLocation *)newLocation
           fromLocation:(CLLocation *)oldLocation {
    
    if (newLocation.horizontalAccuracy >= 0) {
        CLLocation *Cupertino = [[CLLocation alloc]
                                 initWithLatitude:kCupertinoLatitude
                                 longitude:kCupertinoLongitude];
        CLLocationDistance delta = [Cupertino
                                    distanceFromLocation:newLocation];
        long miles = (delta * 0.000621371) + 0.5; // meters to rounded miles
        if (miles < 3) {
            // Stop updating the location
            [_locMan stopUpdatingLocation];
            // Congratulate the user
            self.distanceLabel.text = @"Enjoy the\nMothership!";
        } else {
            NSNumberFormatter *commaDelimited = [[NSNumberFormatter alloc]
                                                 init];
            [commaDelimited setNumberStyle:NSNumberFormatterDecimalStyle];
            self.distanceLabel.text = [NSString stringWithFormat:
                                       @"%@ miles to the\nMothership",
                                       [commaDelimited stringFromNumber:
                                        [NSNumber numberWithLong:miles]]];
        }
        self.waitView.hidden = YES;
        self.distanceView.hidden = NO;
    }
}

- (void)locationManager:(CLLocationManager *)manager
       didFailWithError:(NSError *)error {
    
    if (error.code == kCLErrorDenied) {
        // Turn off the location manager updates
        [_locMan stopUpdatingLocation];
        _locMan=nil;
    }
    self.waitView.hidden = YES;
    self.distanceView.hidden = NO;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view, typically from a nib.
    _locMan = [[CLLocationManager alloc] init];
    _locMan.delegate = self;
    _locMan.desiredAccuracy = kCLLocationAccuracyThreeKilometers;
    _locMan.distanceFilter = 1609; // a mile
    [_locMan startUpdatingLocation];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
