//
//  GenericViewController.h
//  LetsNavigate
//
//  Created by John Ray on 11/9/12.
//  Copyright (c) 2012 John E. Ray. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "CountingNavigationController.h"

@interface GenericViewController : UIViewController

@property (weak, nonatomic) IBOutlet UILabel *countLabel;

- (IBAction)incrementCount:(id)sender;

@end
