//
//  ViewController.m
//  FieldButtonFun
//
//  Created by Ray, John on 9/19/12.
//  Copyright (c) 2012 John E. Ray. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view, typically from a nib.
    UIImage *normalImage = [[UIImage imageNamed:@"whiteButton.png"]
                            stretchableImageWithLeftCapWidth:12.0
							topCapHeight:0.0];
	UIImage *pressedImage = [[UIImage imageNamed:@"blueButton.png"]
                             stretchableImageWithLeftCapWidth:12.0
                             topCapHeight:0.0];
    [self.theButton setBackgroundImage:normalImage
                              forState:UIControlStateNormal];
	[self.theButton setBackgroundImage:pressedImage
                              forState:UIControlStateHighlighted];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*  1:*/- (IBAction)createStory:(id)sender {
    /*  2:*/    self.theStory.text=[self.theTemplate.text
    /*  3:*/                        stringByReplacingOccurrencesOfString:@"<place>"
    /*  4:*/                        withString:self.thePlace.text];
    /*  5:*/    self.theStory.text=[self.theStory.text
    /*  6:*/                        stringByReplacingOccurrencesOfString:@"<verb>"
    /*  7:*/                        withString:self.theVerb.text];
    /*  8:*/    self.theStory.text=[self.theStory.text
    /*  9:*/                        stringByReplacingOccurrencesOfString:@"<number>"
    /* 10:*/                        withString:self.theNumber.text];
    /* 11:*/}


- (IBAction)hideKeyboard:(id)sender {
    [self.thePlace resignFirstResponder];
    [self.theVerb resignFirstResponder];
    [self.theNumber resignFirstResponder];
    [self.theTemplate resignFirstResponder];
}

@end
