//
//  DateChooserViewController.m
//  DateCalc
//
//  Created by John Ray on 11/4/12.
//  Copyright (c) 2012 John E. Ray. All rights reserved.
//

#import "DateChooserViewController.h"

@interface DateChooserViewController ()

@end

@implementation DateChooserViewController

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view.
}

-(void)viewDidAppear:(BOOL)animated {
    [super viewDidAppear:animated];
    ViewController *initialView;
    initialView=(ViewController *)self.delegate;
    [initialView calculateDateDifference:[NSDate date]];
}

-(void)viewWillDisappear:(BOOL)animated {
    ((ViewController *)self.delegate).dateChooserVisible=NO;
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (IBAction)dismissDateChooser:(id)sender {
    [self dismissViewControllerAnimated:YES completion:nil];
}

- (IBAction)setDateTime:(id)sender {
    [(ViewController *)self.delegate calculateDateDifference:((UIDatePicker *)sender).date];
}

@end
