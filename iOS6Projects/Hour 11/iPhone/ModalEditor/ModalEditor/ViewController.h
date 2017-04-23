//
//  ViewController.h
//  ModalEditor
//
//  Created by John Ray on 11/3/12.
//  Copyright (c) 2012 John E. Ray. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface ViewController : UIViewController
@property (weak, nonatomic) IBOutlet UILabel *emailLabel;

- (IBAction)exitToHere:(UIStoryboardSegue *)sender;

@end
