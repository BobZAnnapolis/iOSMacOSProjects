//
//  AppDelegate.h
//  Testbed Mac 11
//
//  Created by Jesse Feiler on 12/2/11.
//  Copyright (c) 2011 another. All rights reserved.
//

#import <Cocoa/Cocoa.h>

@interface AppDelegate : NSObject <NSApplicationDelegate>

@property (assign) IBOutlet NSWindow *window;

- (IBAction)experimentMenuItemClicked:(id)sender;

@end
