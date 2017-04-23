//
//  AppDelegate.m
//  Testbed Categories
//
//  Created by Jesse Feiler on 12/14/11.
//  Copyright (c) 2011 Champlain Arts Corp. All rights reserved.
//

#import "AppDelegate.h"
#import "NSApplication+SampleCategory.h"

@implementation AppDelegate

@synthesize window = _window;

- (void)applicationDidFinishLaunching:(NSNotification *)aNotification
{
  // Insert code here to initialize your application
  [NSApp testCategory];

}




























@end
