//
//  ViewController.h
//  Cupertino
//
//  Created by John Ray on 10/12/12.
//  Copyright (c) 2012 John E. Ray. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <CoreLocation/CoreLocation.h>

@interface ViewController : UIViewController <CLLocationManagerDelegate>

@property (weak, nonatomic) IBOutlet UILabel *distanceLabel;
@property (weak, nonatomic) IBOutlet UIView *waitView;
@property (weak, nonatomic) IBOutlet UIView *distanceView;

@end
