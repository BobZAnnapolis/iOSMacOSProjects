//
//  ViewController.h
//  Gestures
//
//  Created by John Ray on 9/26/12.
//  Copyright (c) 2012 John E. Ray. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface ViewController : UIViewController

@property (weak, nonatomic) IBOutlet UILabel *outputLabel;
@property (weak, nonatomic) IBOutlet UIImageView *imageView;

- (IBAction)foundTap:(id)sender;
- (IBAction)foundSwipe:(id)sender;
- (IBAction)foundPinch:(id)sender;
- (IBAction)foundRotation:(id)sender;

@end
