//
//  PDColoredProgressViewDemoViewController.m
//  PDColoredProgressViewDemo
//
//  Created by Pascal Widdershoven on 03-01-09.
//  Copyright P-development 2009. All rights reserved.
//

#import "PDColoredProgressViewDemoViewController.h"
#import "PDColoredProgressView.h"

@implementation PDColoredProgressViewDemoViewController

- (void)viewDidLoad {
    [super viewDidLoad];
	
	/**
	 In the following lines of code we will draw some progressviews with a few colors just to demonstrate it.
	 **/
	
	NSArray *colors = [NSArray arrayWithObjects: 
					   [UIColor redColor], 
					   [UIColor purpleColor], 
					   [UIColor blueColor],
					   [UIColor colorWithRed: 27.0/255.0 green: 175.0/255.0 blue: 57.0/255.0 alpha: 1],
					   [UIColor orangeColor], 
					   [UIColor magentaColor],
					   [UIColor brownColor],
					   [UIColor blackColor],
					   nil];
	
	int i = 0;
	
	for(i = 0 ; i < [colors count] ; i++)
	{
		PDColoredProgressView *progressView = [[PDColoredProgressView alloc] initWithProgressViewStyle: UIProgressViewStyleDefault];
		CGRect frame = progressView.frame;
		frame.size.width = 300;
		frame.origin.x = 10;
		frame.origin.y = 10 * (i + 1) + 10 * i;
		progressView.frame = frame;
        [progressView setProgress:(i+1) * (1.0/[colors count])];
		[progressView setTintColor: [colors objectAtIndex: i]];
    // You can customize the background as well
 		// [progressView setBackgroundColor: [colors lastObject]];
		[self.view addSubview: progressView];
		[progressView release];
	}
	
	i+= 3;
	
	//draw an original UIProgressView to compare to the PDColoredProgressView
	UIProgressView *progressView = [[UIProgressView alloc] initWithProgressViewStyle: UIProgressViewStyleDefault];
	CGRect frame = progressView.frame;
	frame.size.width = 300;
	frame.origin.x = 10;
	frame.origin.y = 10 * (i + 1) + 10 * i;
	progressView.frame = frame;
    progressView.progress = 0.5;
	[self.view addSubview: progressView];
	[progressView release];
	
	PDColoredProgressView *pView = [[PDColoredProgressView alloc] initWithProgressViewStyle: UIProgressViewStyleDefault];
	frame = pView.frame;
	frame.size.width = 300;
	frame.origin.x = 10;
	frame.origin.y = 10 * (i + 1) + 10 * i + 20;
	pView.frame = frame;
	pView.progress = 0.5;
	[pView setTintColor: [UIColor blackColor]];
	[self.view addSubview: pView];
	[pView release];
	
	/** Draw a progressview and set the progress animated **/
	PDColoredProgressView *animatedProgressView = [[PDColoredProgressView alloc] initWithProgressViewStyle: UIProgressViewStyleDefault];
	frame = pView.frame;
	frame.origin.y += 50;
	animatedProgressView.frame = frame;
	[animatedProgressView setProgress: 0.75 animated: YES];
	[animatedProgressView setTintColor: [UIColor redColor]];
	[self.view addSubview: animatedProgressView];
	[animatedProgressView release];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning]; // Releases the view if it doesn't have a superview
    // Release anything that's not essential, such as cached data
}


- (void)dealloc {
    [super dealloc];
}

@end
