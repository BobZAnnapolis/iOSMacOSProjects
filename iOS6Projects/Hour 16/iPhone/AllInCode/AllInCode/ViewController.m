//
//  ViewController.m
//  AllInCode
//
//  Created by John Ray on 11/15/12.
//  Copyright (c) 2012 John E. Ray. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
    [self initInterface];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (NSUInteger)supportedInterfaceOrientations {
    return UIInterfaceOrientationMaskAll;
}

- (void)didRotateFromInterfaceOrientation:(UIInterfaceOrientation)fromInterfaceOrientation {
    [[self.view subviews] makeObjectsPerformSelector:@selector(removeFromSuperview)];
    [self updateInterface];
}

- (void)initInterface {
    self.buttonA =[UIButton buttonWithType:UIButtonTypeRoundedRect];
    [self.buttonA addTarget:self action:@selector(handleButton:) forControlEvents:UIControlEventTouchDown];
    [self.buttonA setTitle:@"Button A" forState:UIControlStateNormal];
    
    self.buttonB =[UIButton buttonWithType:UIButtonTypeRoundedRect];
    [self.buttonB addTarget:self action:@selector(handleButton:) forControlEvents:UIControlEventTouchDown];
    [self.buttonB setTitle:@"Button B" forState:UIControlStateNormal];
    
    self.theLabel=[[UILabel alloc] init];
    self.theLabel.text=@"Welcome";
    [self updateInterface];
}

- (void)updateInterface {
    float screenWidth;
    float screenHeight;
    screenWidth=self.view.bounds.size.width;
    screenHeight=self.view.bounds.size.height;
    
    if (self.interfaceOrientation==UIInterfaceOrientationPortrait ||
        self.interfaceOrientation==UIInterfaceOrientationPortraitUpsideDown) {
        self.buttonA.frame=CGRectMake(20.0,20.0,screenWidth-40.0,screenHeight/2-40.0);
        self.buttonB.frame=CGRectMake(20.0,screenHeight/2+20,screenWidth-40.0,screenHeight/2-40.0);
        self.theLabel.frame=CGRectMake(screenWidth/2-40,screenHeight/2-10,200.0,20.0);
    } else {
        self.buttonA.frame=CGRectMake(20.0,60.0,screenWidth-40.0,screenHeight/2-40.0);
        self.buttonB.frame=CGRectMake(20.0,screenHeight/2+30,screenWidth-40.0,screenHeight/2-40.0);
        self.theLabel.frame=CGRectMake(screenWidth/2-40,20.0,200.0,20.0);
    }
    
    [self.view addSubview:self.buttonA];
    [self.view addSubview:self.buttonB];
    [self.view addSubview:self.theLabel];
}

- (void)handleButton:(id)sender {
    self.theLabel.text=((UIButton *)sender).currentTitle;
}


@end
