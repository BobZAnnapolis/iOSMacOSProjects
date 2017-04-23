//
//  ViewController.m
//  Gestures
//
//  Created by John Ray on 9/25/12.
//  Copyright (c) 2012 John E. Ray. All rights reserved.
//

#import "ViewController.h"

@interface ViewController () {
    CGRect _originalRect;
}
@end

@implementation ViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view, typically from a nib.
    
    
}

- (void)viewDidAppear:(BOOL)animated {
    [super viewDidAppear:animated];
    [self becomeFirstResponder];
    
    _originalRect=self.imageView.frame;

    UIImageView *tempImageView;
    tempImageView=[[UIImageView alloc]
                   initWithImage:[UIImage imageNamed:@"flower.png"]];
    tempImageView.frame=_originalRect;
    [self.view addSubview:tempImageView];
    
    self.imageView=tempImageView;
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (IBAction)foundTap:(id)sender {
    self.outputLabel.text=@"Tapped";
}

- (IBAction)foundSwipe:(id)sender {
    self.outputLabel.text=@"Swiped";
}

- (IBAction)foundPinch:(id)sender {
    UIPinchGestureRecognizer *recognizer;
    NSString *feedback;
    double scale;
    
    recognizer=(UIPinchGestureRecognizer *)sender;
    scale=recognizer.scale;
    self.imageView.transform = CGAffineTransformMakeRotation(0.0);
    feedback=[[NSString alloc]
              initWithFormat:@"Pinched, Scale:%1.2f, Velocity:%1.2f",
              recognizer.scale,recognizer.velocity];
    self.outputLabel.text=feedback;
    self.imageView.frame=CGRectMake(_originalRect.origin.x,
                                    _originalRect.origin.y,
                                    _originalRect.size.width*scale,
                                    _originalRect.size.height*scale);
}


- (IBAction)foundRotation:(id)sender {
    UIRotationGestureRecognizer *recognizer;
    NSString *feedback;
    double rotation;
    
    recognizer=(UIRotationGestureRecognizer *)sender;
    rotation=recognizer.rotation;
    feedback=[[NSString alloc]
              initWithFormat:@"Rotated, Radians:%1.2f, Velocity:%1.2f",
              recognizer.rotation,recognizer.velocity];
    self.outputLabel.text=feedback;
    self.imageView.transform = CGAffineTransformMakeRotation(rotation);
}

- (BOOL)canBecomeFirstResponder{
    return YES;
}

- (void)motionEnded:(UIEventSubtype)motion withEvent:(UIEvent *)event {
    if (motion==UIEventSubtypeMotionShake) {
        self.outputLabel.text=@"Shaking things up!";
        self.imageView.transform = CGAffineTransformIdentity;
        self.imageView.frame=_originalRect;
    }
}

@end
