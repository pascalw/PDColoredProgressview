//
//  PDColoredProgressViewDemoAppDelegate.m
//  PDColoredProgressViewDemo
//
//  Created by Pascal Widdershoven on 03-01-09.
//  Copyright P-development 2009. All rights reserved.
//

#import "PDColoredProgressViewDemoAppDelegate.h"
#import "PDColoredProgressViewDemoViewController.h"

@implementation PDColoredProgressViewDemoAppDelegate

@synthesize window;
@synthesize viewController;


- (void)applicationDidFinishLaunching:(UIApplication *)application {    
    
    // Override point for customization after app launch    
    [window addSubview:viewController.view];
    [window makeKeyAndVisible];
}


- (void)dealloc {
    [viewController release];
    [window release];
    [super dealloc];
}


@end
