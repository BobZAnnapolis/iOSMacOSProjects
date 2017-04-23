//
//  ViewController.m
//  FlowerWeb_5
//
//  Created by Robert John Zawislak on 12/28/13.
//  Copyright (c) 2013 Robert John Zawislak. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view, typically from a nib.
    
    // add this so that whenit 1st appears, we have something to look at
    // this shows that it is successfully talking to the website
    self.flowerDetailView.hidden=YES;
    [self getNewFlower:nil];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (IBAction)getNewFlower:(id)sender {
    
    // declare all the variables
    NSURL   *imageURL;
    NSURL   *detailsURL;
    NSString    *imageURLString;
    NSString    *detailsURLString;
    NSString    *color;
    int     sessionID;
    
    // get the currently selected color string form screen & set site seed value
    color=[self.colorChoice titleForSegmentAtIndex:self.colorChoice.selectedSegmentIndex];
    sessionID=random()%50000;
    
    // init our website's URL strings w/current screen vals
    imageURLString=[[NSString alloc] initWithFormat:@"http://www.floraphotographs.com/showrandomios.php?color=%@&session=%d", color, sessionID];
    detailsURLString=[[NSString alloc] initWithFormat:@"http://www.floraphotographs.com/detailios.php?session=%d", sessionID];
    
    // create the URIs
    imageURL=[[NSURL alloc] initWithString:imageURLString];
    detailsURL=[[NSURL alloc] initWithString:detailsURLString];
    
    // tell the webviews to update their areas
    [self.flowerView loadRequest:[NSURLRequest requestWithURL:imageURL]];
    [self.flowerDetailView loadRequest:[NSURLRequest requestWithURL:detailsURL]];
    
    // coupled w/alpha val creates a nice overlay
    self.flowerDetailView.backgroundColor=[UIColor clearColor];
}

- (IBAction)toggleFlowerDetail:(id)sender {
    self.flowerDetailView.hidden=![sender isOn];
}
@end
