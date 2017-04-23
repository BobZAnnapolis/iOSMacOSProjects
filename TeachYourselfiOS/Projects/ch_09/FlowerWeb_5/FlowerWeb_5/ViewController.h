//
//  ViewController.h
//  FlowerWeb_5
//
//  Created by Robert John Zawislak on 12/28/13.
//  Copyright (c) 2013 Robert John Zawislak. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface ViewController : UIViewController

// outlets
@property (weak, nonatomic) IBOutlet UISegmentedControl *colorChoice;
@property (weak, nonatomic) IBOutlet UIWebView *flowerView;
@property (weak, nonatomic) IBOutlet UIWebView *flowerDetailView;

// actions
- (IBAction)getNewFlower:(id)sender;
- (IBAction)toggleFlowerDetail:(id)sender;


@end
