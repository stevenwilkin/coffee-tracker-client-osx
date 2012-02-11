//
//  CoffeeTrackerAppDelegate.m
//  CoffeeTracker
//
//  Created by Steven Wilkin on 06/02/2012.
//  Copyright 2012 NullTheory Ltd. All rights reserved.
//

#import "CoffeeTrackerAppDelegate.h"
#import "AFHTTPRequestOperation.h"

@implementation CoffeeTrackerAppDelegate

@synthesize window;
@synthesize button;
@synthesize count;

- (void)applicationDidFinishLaunching:(NSNotification *)aNotification
{
    NSURL *url = [NSURL URLWithString:@"http://0.0.0.0:9292"];
    client = [[AFHTTPClient alloc] initWithBaseURL:url];
    // API key must be set in pre-processor macros
    [client setDefaultHeader:@"X-API-KEY" value:API_KEY];

    // set count label
    [client getPath:@"/api" parameters:nil success:^(AFHTTPRequestOperation *operation, id responseObject) {
        // convert response body to an integer
        int value = 0;
        NSScanner *scanner = [NSScanner scannerWithString:[operation responseString]];
        [scanner scanInt:&value];
        NSString *label = [NSString stringWithFormat:@"%d", value];
        [count setTitle:label];
    } failure:nil];
}

- (void)trackCoffee:(id)sender {
    NSURLRequest *request = [client requestWithMethod:@"POST" path:@"/api" parameters:nil];
    
    AFHTTPRequestOperation *operation = [[AFHTTPRequestOperation alloc] initWithRequest:request];
    [operation setCompletionBlockWithSuccess:^(AFHTTPRequestOperation *operation, id responseObject) {
        [button setEnabled:YES];
    } failure:^(AFHTTPRequestOperation *operation, NSError *error) {
        [button setEnabled:YES];
    }];

    // disable button while POST is in progress
    [button setEnabled:NO];
    
    [operation start];
}

@end
