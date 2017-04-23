//
//  ViewController.h
//  ModalEditor
//
//  Created by Robert John Zawislak on 12/30/13.
//  Copyright (c) 2013 Robert John Zawislak. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface ViewController : UIViewController

- (IBAction)exitToHere:(UIStoryboardSegue *)sender;
@property (weak, nonatomic) IBOutlet UILabel *emailLabel;

@end
