//
//  ViewController.m
//  ReturnMe
//
//  Created by John Ray on 11/11/12.
//  Copyright (c) 2012 John E. Ray. All rights reserved.
//

#import "ViewController.h"
#define kName @"name"
#define kEmail @"email"
#define kPhone @"phone"
#define kPicture @"picture"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
    [self setValuesFromPreferences];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

-(void)setValuesFromPreferences {
    NSUserDefaults *userDefaults = [NSUserDefaults standardUserDefaults];
    
    NSDictionary *initialDefaults=[[NSDictionary alloc]
                                   initWithObjectsAndKeys:
                                   @"Dog", kPicture,
                                   @"Your Name", kName,
                                   @"you@yours.com",kEmail,
                                   @"(555)555-1212",kPhone,
                                   nil];
    [userDefaults registerDefaults:initialDefaults];
    // [userDefaults synchronize];
    
    NSString *picturePreference = [userDefaults stringForKey:kPicture];
    if ([picturePreference isEqualToString:@"Dog"]) {
        self.picture.image = [UIImage imageNamed:@"dog1.png"];
    } else if ([picturePreference isEqualToString:@"Crazy Dog"]) {
        self.picture.image = [UIImage imageNamed:@"dog2.png"];
    } else {
        self.picture.image = [UIImage imageNamed:@"coral.png"];
    }
    
    self.name.text = [userDefaults stringForKey:kName];
    self.email.text = [userDefaults stringForKey:kEmail];
    self.phone.text = [userDefaults stringForKey:kPhone];
}

@end
