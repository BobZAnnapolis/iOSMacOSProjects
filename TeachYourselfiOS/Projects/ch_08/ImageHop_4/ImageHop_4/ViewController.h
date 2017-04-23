//
//  ViewController.h
//  ImageHop_4
//
//  Created by Robert John Zawislak on 12/28/13.
//  Copyright (c) 2013 Robert John Zawislak. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface ViewController : UIViewController

// define the outlets/Properties
@property (weak, nonatomic) IBOutlet UIImageView *bunnyView1;
@property (weak, nonatomic) IBOutlet UIImageView *bunnyView2;
@property (weak, nonatomic) IBOutlet UIImageView *bunnyView3;
@property (weak, nonatomic) IBOutlet UIImageView *bunnyView4;
@property (weak, nonatomic) IBOutlet UIImageView *bunnyView5;
@property (weak, nonatomic) IBOutlet UISlider *speedSlider;
@property (weak, nonatomic) IBOutlet UIStepper *speedStepper;
@property (weak, nonatomic) IBOutlet UILabel *hopsPerSecond;
@property (weak, nonatomic) IBOutlet UIButton *hopButton;

// define the Actions
- (IBAction)toggleAnimation:(id)sender;
- (IBAction)setSpeed:(id)sender;
- (IBAction)setIncrement:(id)sender;

@end
