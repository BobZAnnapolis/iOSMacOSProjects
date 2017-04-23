//
//  MasterViewController.h
//  FlowerDetail
//
//  Created by John Ray on 10/27/12.
//  Copyright (c) 2012 John E. Ray. All rights reserved.
//

#import <UIKit/UIKit.h>

@class DetailViewController;

@interface MasterViewController : UITableViewController

@property (strong, nonatomic) DetailViewController *detailViewController;
- (void)createFlowerData;
@end
