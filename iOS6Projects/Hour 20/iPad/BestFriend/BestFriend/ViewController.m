//
//  ViewController.m
//  BestFriend
//
//  Created by John Ray on 10/20/12.
//  Copyright (c) 2012 John E. Ray. All rights reserved.
//

#import "ViewController.h"

@interface ViewController () {
    MKPlacemark *_zipAnnotation;
}
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

- (IBAction)newBFF:(id)sender {
    ABPeoplePickerNavigationController *picker;
    picker=[[ABPeoplePickerNavigationController alloc] init];
	picker.peoplePickerDelegate = self;
    [self presentViewController:picker animated:YES completion:nil];
}

- (void)peoplePickerNavigationControllerDidCancel:
(ABPeoplePickerNavigationController *)peoplePicker {
    [self dismissViewControllerAnimated:YES completion:nil];
}

- (BOOL)peoplePickerNavigationController:
(ABPeoplePickerNavigationController *)peoplePicker
      shouldContinueAfterSelectingPerson:(ABRecordRef)person
                                property:(ABPropertyID)property
                              identifier:(ABMultiValueIdentifier)identifier {
    //We won't get to this delegate method
	
    return NO;
}

- (BOOL)peoplePickerNavigationController:
(ABPeoplePickerNavigationController *)peoplePicker
	  shouldContinueAfterSelectingPerson:(ABRecordRef)person {
	
	// Retrieve the friend's name from the address book person record
    NSString *friendName;
    NSString *friendEmail;
    NSString *friendZip;
    
    friendName=(__bridge NSString *)ABRecordCopyValue
    (person, kABPersonFirstNameProperty);
    self.name.text = friendName;
    
    ABMultiValueRef friendAddressSet;
	NSDictionary *friendFirstAddress;
    friendAddressSet = ABRecordCopyValue
    (person, kABPersonAddressProperty);
    
    if (ABMultiValueGetCount(friendAddressSet)>0) {
        friendFirstAddress = (__bridge NSDictionary *)
        ABMultiValueCopyValueAtIndex(friendAddressSet,0);
        friendZip = friendFirstAddress[@"ZIP"];
        [self centerMap:friendZip showAddress:friendFirstAddress];
    }
    
    ABMultiValueRef friendEmailAddresses;
    friendEmailAddresses = ABRecordCopyValue
    (person, kABPersonEmailProperty);
    
    if (ABMultiValueGetCount(friendEmailAddresses)>0) {
        friendEmail=(__bridge NSString *)
        ABMultiValueCopyValueAtIndex(friendEmailAddresses, 0);
        self.email.text = friendEmail;
    }
    
	if (ABPersonHasImageData(person)) {
		self.photo.image = [UIImage imageWithData:
                            (__bridge NSData *)ABPersonCopyImageData(person)];
	}
	
    [self dismissViewControllerAnimated:YES completion:nil];
	return NO;
}

- (void)centerMap:(NSString*)zipCode
      showAddress:(NSDictionary*)fullAddress {
    NSString *queryURL;
    NSString *queryResults;
    NSArray *queryData;
    double latitude;
    double longitude;
    MKCoordinateRegion mapRegion;
    
    queryURL = [[NSString alloc]
                initWithFormat:
                @"http://maps.google.com/maps/geo?output=csv&q=%@",
                zipCode];
    
    queryResults = [[NSString alloc]
                    initWithContentsOfURL: [NSURL URLWithString:queryURL]
                    encoding: NSUTF8StringEncoding
                    error: nil];
    queryData = [queryResults componentsSeparatedByString:@","];
    
    if([queryData count]==4) {
        latitude=[queryData[2] doubleValue];
        longitude=[queryData[3] doubleValue];
        //     CLLocationCoordinate2D;
        mapRegion.center.latitude=latitude;
        mapRegion.center.longitude=longitude;
        mapRegion.span.latitudeDelta=0.2;
        mapRegion.span.longitudeDelta=0.2;
        [self.map setRegion:mapRegion animated:YES];
		
		if (_zipAnnotation!=nil) {
			[self.map removeAnnotation: _zipAnnotation];
		}
		_zipAnnotation = [[MKPlacemark alloc]
                          initWithCoordinate:mapRegion.center
                          addressDictionary:fullAddress];
        [self.map addAnnotation: _zipAnnotation];
    }
}

- (MKAnnotationView *)mapView:(MKMapView *)mapView
            viewForAnnotation:(id <MKAnnotation>)annotation {
    MKPinAnnotationView *pinDrop=[[MKPinAnnotationView alloc]
                                  initWithAnnotation:annotation
                                  reuseIdentifier:@"myspot"];
    pinDrop.animatesDrop=YES;
    pinDrop.canShowCallout=YES;
    pinDrop.pinColor=MKPinAnnotationColorPurple;
    return pinDrop;
}

- (IBAction)sendEmail:(id)sender {
    MFMailComposeViewController *mailComposer;
    NSArray *emailAddresses;
    emailAddresses=[[NSArray alloc]initWithObjects: self.email.text,nil];
    
    mailComposer=[[MFMailComposeViewController alloc] init];
    mailComposer.mailComposeDelegate=self;
    [mailComposer setToRecipients:emailAddresses];
    [self presentViewController:mailComposer animated:YES completion:nil];
}

- (void)mailComposeController:(MFMailComposeViewController*)controller
          didFinishWithResult:(MFMailComposeResult)result
                        error:(NSError*)error {
    [self dismissViewControllerAnimated:YES completion:nil];
}

- (IBAction)sendTweet:(id)sender {
    SLComposeViewController *tweetComposer;
    tweetComposer=[SLComposeViewController composeViewControllerForServiceType:
                   SLServiceTypeTwitter];
    if ([SLComposeViewController isAvailableForServiceType: SLServiceTypeTwitter]) {
        [tweetComposer setInitialText:@"I'm on my way."];
        [self presentViewController:tweetComposer animated:YES completion:nil];
    }
}

@end
