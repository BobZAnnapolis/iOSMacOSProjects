//
//  ViewController.m
//  DateCalc
//
//  Created by Robert John Zawislak on 1/25/14.
//  Copyright (c) 2014 Robert John Zawislak. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view, typically from a nib.
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

// set the delegate during the segue
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // 
    ((DateChooserViewController *)segue.destinationViewController).delegate=self;
}

- (IBAction)showDateChooser:(id)sender {
    if (self.dateChooserVisible != YES) {
        [self performSegueWithIdentifier:@"toDateChooser" sender:sender];
        self.dateChooserVisible=YES;
    }
}

@end
