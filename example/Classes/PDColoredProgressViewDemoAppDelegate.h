//
//  PDColoredProgressViewDemoAppDelegate.h
//  PDColoredProgressViewDemo
//
//  Created by Pascal Widdershoven on 03-01-09.
//  Copyright P-development 2009. All rights reserved.
//

#import <UIKit/UIKit.h>

@class PDColoredProgressViewDemoViewController;

@interface PDColoredProgressViewDemoAppDelegate : NSObject <UIApplicationDelegate> {
    UIWindow *window;
    PDColoredProgressViewDemoViewController *viewController;
}

@property (nonatomic, retain) IBOutlet UIWindow *window;
@property (nonatomic, retain) IBOutlet PDColoredProgressViewDemoViewController *viewController;

@end

