//
//  EditorViewController.m
//  ModalEditor
//
//  Created by Robert John Zawislak on 12/30/13.
//  Copyright (c) 2013 Robert John Zawislak. All rights reserved.
//

#import "EditorViewController.h"

@interface EditorViewController ()

@end

@implementation EditorViewController

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
    
    self.emailField.text=((ViewController *)self.presentingViewController).emailLabel.text;
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (IBAction)updateEditor:(id)sender {
    ((ViewController *)self.presentingViewController).emailLabel.text=self.emailField.text;

}
@end
