//
//  AppDelegate.m
//  iSA Demo
//
//  Created by Jesse Feiler on 11/27/11.
//  Copyright (c) 2011 another. All rights reserved.
//

#import "AppDelegate.h"

@implementation AppDelegate

@synthesize window = _window;

@synthesize myID;

- (void)applicationDidFinishLaunching:(NSNotification *)aNotification
{
  // Insert code here to initialize your application
  
  myID = [NSNumber numberWithInt: 17];
  
  NSLog([[self.myID class] description]);
  
  NSLog([(NSNumber*)myID stringValue]);
  
  //const char* className = class_getName([id class]);
}

@end
