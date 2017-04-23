//
//  ViewController.m
//  FieldButtonFun_3
//
//  Created by Robert John Zawislak on 12/26/13.
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
    
    // set up the custom buttons
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

- (IBAction)createStory:(id)sender {
    NSLog(@"createStory called with place %@, verb %@, number %@", self.thePlace.text, self.theVerb.text, self.theNumber.text);
    self.theStory.text = [ self.theTemplate.text stringByReplacingOccurrencesOfString:@"<place>" withString:self.thePlace.text];
    self.theStory.text = [ self.theStory.text stringByReplacingOccurrencesOfString:@"<verb>" withString:self.theVerb.text];
    self.theStory.text = [ self.theStory.text stringByReplacingOccurrencesOfString:@"<number>" withString:self.theNumber.text];
}

- (IBAction)hideKeyboard:(id)sender {
    [self.thePlace resignFirstResponder];
    [self.theVerb resignFirstResponder];
    [self.theNumber resignFirstResponder];
    [self.theTemplate resignFirstResponder];
}
@end
