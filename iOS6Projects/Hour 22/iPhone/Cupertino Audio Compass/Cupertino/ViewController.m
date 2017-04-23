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
#define kDeg2Rad 0.0174532925
#define kRad2Deg 57.2957795
#define kStraight 1
#define kRight 2
#define kLeft 3

@interface ViewController () {
    CLLocationManager *_locMan;
    CLLocation *_recentLocation;
    SystemSoundID _soundStraight;
    SystemSoundID _soundRight;
    SystemSoundID _soundLeft;
    int _lastSound;
}
@end

@implementation ViewController

- (void)locationManager:(CLLocationManager *)manager
    didUpdateToLocation:(CLLocation *)newLocation
           fromLocation:(CLLocation *)oldLocation {
    
    if (newLocation.horizontalAccuracy >= 0) {
        
        // Store the location for use during heading updates
        _recentLocation = newLocation;
        
        CLLocation *Cupertino = [[CLLocation alloc]
                                 initWithLatitude:kCupertinoLatitude
                                 longitude:kCupertinoLongitude];
        CLLocationDistance delta = [Cupertino
                                    distanceFromLocation:newLocation];
        long miles = (delta * 0.000621371) + 0.5; // meters to rounded miles
        if (miles < 3) {
            // Stop updating the location and heading
            [_locMan stopUpdatingLocation];
            [_locMan stopUpdatingHeading];
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

/*
 * According to Movable Type Scripts
 * http://mathforum.org/library/drmath/view/55417.html
 *
 *  Javascript:
 *
 * var y = Math.sin(dLon) * Math.cos(lat2);
 * var x = Math.cos(lat1)*Math.sin(lat2) -
 * Math.sin(lat1)*Math.cos(lat2)*Math.cos(dLon);
 * var brng = Math.atan2(y, x).toDeg();
 */
-(double)headingToLocation:(CLLocationCoordinate2D)desired
                   current:(CLLocationCoordinate2D)current {
    
    // Gather the variables needed by the heading algorithm
    double lat1 = current.latitude*kDeg2Rad;
    double lat2 = desired.latitude*kDeg2Rad;
    double lon1 = current.longitude;
    double lon2 = desired.longitude;
    double dlon = (lon2-lon1)*kDeg2Rad;
    
    double y = sin(dlon)*cos(lat2);
    double x = cos(lat1)*sin(lat2) - sin(lat1)*cos(lat2)*cos(dlon);
    
    double heading=atan2(y,x);
    heading=heading*kRad2Deg;
    heading=heading+360.0;
    heading=fmod(heading,360.0);
    return heading;
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

- (void)locationManager:(CLLocationManager *)manager
       didUpdateHeading:(CLHeading *)newHeading {
    
    if (_recentLocation != nil && newHeading.headingAccuracy >= 0) {
        CLLocation *cupertino = [[CLLocation alloc]
                                 initWithLatitude:kCupertinoLatitude
                                 longitude:kCupertinoLongitude];
        double course = [self headingToLocation:cupertino.coordinate
                                        current:_recentLocation.coordinate];
        double delta = newHeading.trueHeading - course;
        if (abs(delta) <= 10) {
            self.directionArrow.image = [UIImage imageNamed:
                                         @"up_arrow.png"];
            if (_lastSound!=kStraight) {
                AudioServicesPlaySystemSound(_soundStraight);
                _lastSound=kStraight;
            }
        }
        else
        {
            if (delta > 180) {
                self.directionArrow.image = [UIImage imageNamed:
                                             @"right_arrow.png"];
                if (_lastSound!=kRight) {
                    AudioServicesPlaySystemSound(_soundRight);
                    _lastSound=kRight;
                }
            }
            else if (delta > 0) {
                self.directionArrow.image = [UIImage imageNamed:
                                             @"left_arrow.png"];
                if (_lastSound!=kLeft) {
                    AudioServicesPlaySystemSound(_soundLeft);
                    _lastSound=kLeft;
                }
            }
            else if (delta > -180) {
                self.directionArrow.image = [UIImage imageNamed:
                                             @"right_arrow.png"];
                if (_lastSound!=kRight) {
                    AudioServicesPlaySystemSound(_soundRight);
                    _lastSound=kRight;
                }
            }
            else {
                self.directionArrow.image = [UIImage imageNamed:
                                             @"left_arrow.png"];
                if (_lastSound!=kLeft) {
                    AudioServicesPlaySystemSound(_soundLeft);
                    _lastSound=kLeft;
                }
            }
        }
        self.directionArrow.hidden = NO;
    } else {
        self.directionArrow.hidden = YES;
    }
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    
    NSString *soundFile;
    
    soundFile = [[NSBundle mainBundle] pathForResource:@"straight"
                                                ofType:@"wav"];
    AudioServicesCreateSystemSoundID((__bridge CFURLRef)
                                     [NSURL fileURLWithPath:soundFile]
                                     ,&_soundStraight);
    
    soundFile = [[NSBundle mainBundle] pathForResource:@"right"
                                                ofType:@"wav"];
    AudioServicesCreateSystemSoundID((__bridge CFURLRef)
                                     [NSURL fileURLWithPath:soundFile]
                                     ,&_soundRight);
    
    soundFile = [[NSBundle mainBundle] pathForResource:@"left"
                                                ofType:@"wav"];
    AudioServicesCreateSystemSoundID((__bridge CFURLRef)
                                     [NSURL fileURLWithPath:soundFile]
                                     ,&_soundLeft);
    
    _lastSound=0;
    
    // Nothing changes below this line.
    _locMan = [[CLLocationManager alloc] init];
    _locMan.delegate = self;
    _locMan.desiredAccuracy = kCLLocationAccuracyThreeKilometers;
    _locMan.distanceFilter = 1609; // a mile
    [_locMan startUpdatingLocation];
    
    if ([CLLocationManager headingAvailable]) {
        _locMan.headingFilter = 10; // 10 degrees
        [_locMan startUpdatingHeading];
    }
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
