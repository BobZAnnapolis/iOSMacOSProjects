//
//  ViewController.h
//  BestFriend
//
//  Created by John Ray on 10/19/12.
//  Copyright (c) 2012 John E. Ray. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <AddressBook/AddressBook.h>
#import <AddressBookUI/AddressBookUI.h>
#import <MapKit/MapKit.h>
#import <CoreLocation/CoreLocation.h>
#import <MessageUI/MessageUI.h>
#import <Social/Social.h>

@interface ViewController : UIViewController <ABPeoplePickerNavigationControllerDelegate, MFMailComposeViewControllerDelegate>

@property (weak, nonatomic) IBOutlet UILabel *name;
@property (weak, nonatomic) IBOutlet UILabel *email;
@property (weak, nonatomic) IBOutlet UIImageView *photo;
@property (weak, nonatomic) IBOutlet MKMapView *map;

- (IBAction)newBFF:(id)sender;
- (IBAction)sendEmail:(id)sender;
- (IBAction)sendTweet:(id)sender;

- (void)centerMap:(NSString*)zipCode showAddress:(NSDictionary*)fullAddress;

@end
