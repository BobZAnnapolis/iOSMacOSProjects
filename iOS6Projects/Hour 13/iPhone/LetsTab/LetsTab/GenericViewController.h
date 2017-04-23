//
//  GenericViewController.h
//  LetsTab
//
//  Created by John Ray on 11/9/12.
//  Copyright (c) 2012 John E. Ray. All rights reserved.
//

#import <UIKit/UIKit.h>

#import "CountingTabBarController.h"

@interface GenericViewController : UIViewController

@property (weak, nonatomic) IBOutlet UILabel *outputLabel;
@property (weak, nonatomic) IBOutlet UITabBarItem *barItem;

- (IBAction)incrementCountFirst:(id)sender;
- (IBAction)incrementCountSecond:(id)sender;
- (IBAction)incrementCountThird:(id)sender;

-(void)updateCounts;
-(void)updateBadge;

@end
