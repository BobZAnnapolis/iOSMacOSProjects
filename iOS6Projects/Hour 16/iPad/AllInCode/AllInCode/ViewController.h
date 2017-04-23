//
//  ViewController.h
//  AllInCode
//
//  Created by John Ray on 11/15/12.
//  Copyright (c) 2012 John E. Ray. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface ViewController : UIViewController

@property (weak,nonatomic) UIButton *buttonA;
@property (weak,nonatomic) UIButton *buttonB;
@property (strong,nonatomic) UILabel *theLabel;

- (void)initInterface;
- (void)updateInterface;
- (void)handleButton:(id)sender;

@end
