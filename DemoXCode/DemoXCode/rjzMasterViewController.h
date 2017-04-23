//
//  rjzMasterViewController.h
//  DemoXCode
//
//  Created by Robert John Zawislak on 11/30/13.
//  Copyright (c) 2013 Robert John Zawislak. All rights reserved.
//

#import <UIKit/UIKit.h>

@class rjzDetailViewController;

@interface rjzMasterViewController : UITableViewController

@property (strong, nonatomic) rjzDetailViewController *detailViewController;

@end
