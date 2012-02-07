//
//  CoffeeTrackerAppDelegate.m
//  CoffeeTracker
//
//  Created by Steven Wilkin on 06/02/2012.
//  Copyright 2012 NullTheory Ltd. All rights reserved.
//

#import "CoffeeTrackerAppDelegate.h"
#import "AFHTTPClient.h"
#import "AFHTTPRequestOperation.h"

@implementation CoffeeTrackerAppDelegate

@synthesize window;

- (void)applicationDidFinishLaunching:(NSNotification *)aNotification
{
}

- (void)trackCoffee:(id)sender {
    NSURL *url = [NSURL URLWithString:@"http://0.0.0.0:9292"];
    AFHTTPClient *client = [[AFHTTPClient alloc] initWithBaseURL:url];
    NSURLRequest *request = [client requestWithMethod:@"POST" path:@"/" parameters:nil];
    
    AFHTTPRequestOperation *operation = [[AFHTTPRequestOperation alloc] initWithRequest:request];
    [operation setCompletionBlockWithSuccess:^(AFHTTPRequestOperation *operation, id responseObject) {
        NSLog(@"success!");
    } failure:^(AFHTTPRequestOperation *operation, NSError *error) {
        NSLog(@"failure :/");
    }];
    
    [operation start];
}

@end
