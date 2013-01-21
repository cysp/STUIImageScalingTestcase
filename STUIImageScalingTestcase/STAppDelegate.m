//
//  STAppDelegate.m
//  STUIImageScalingTestcase
//
//  Copyright (c) 2013 Scott Talbot. All rights reserved.
//

#import "STAppDelegate.h"

#import "STViewController.h"


@implementation STAppDelegate

- (void)setWindow:(UIWindow *)window {
	_window = window;
	[_window makeKeyAndVisible];
}

- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {
	UIWindow *window = [[UIWindow alloc] initWithFrame:[[UIScreen mainScreen] bounds]];

	UIViewController *viewController = [[STViewController alloc] initWithNibName:nil bundle:nil];
	window.rootViewController = viewController;

	self.window = window;

	return YES;
}

@end
