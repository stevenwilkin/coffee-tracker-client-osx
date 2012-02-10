//
//  CoffeeTrackerAppDelegate.h
//  CoffeeTracker
//
//  Created by Steven Wilkin on 06/02/2012.
//  Copyright 2012 NullTheory Ltd. All rights reserved.
//

#import <Cocoa/Cocoa.h>
#import "AFHTTPClient.h"

@interface CoffeeTrackerAppDelegate : NSObject <NSApplicationDelegate> {
    NSWindow *window;
    NSButton *button;
    AFHTTPClient *client;
}

@property (assign) IBOutlet NSWindow *window;
@property (assign) IBOutlet NSButton *button;

- (IBAction)trackCoffee:(id)sender;

@end
