//
//  ViewController.h
//  SlowCount
//
//  Created by John Ray on 10/13/12.
//  Copyright (c) 2012 John E. Ray. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface ViewController : UIViewController 

@property (weak, nonatomic) IBOutlet UILabel *theCount;

- (void)countUp;

@end
