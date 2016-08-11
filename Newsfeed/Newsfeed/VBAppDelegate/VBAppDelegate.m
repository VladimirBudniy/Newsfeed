//
//  VBAppDelegate.m
//  Newsfeed
//
//  Created by Vladimir Budniy on 28.06.16.
//  Copyright © 2016 Vladimir Budniy. All rights reserved.
//

#import "IDPActiveRecordKit.h"

#import "VBAppDelegate.h"
#import "VBMainSlideMenuViewController.h"
#import "VBNewsFeed.h"

static NSString * const kVBCoraDataName = @"Newsfeed";

@implementation VBAppDelegate

- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {
    [IDPCoreDataManager sharedManagerWithMomName:kVBCoraDataName];

    VBMainSlideMenuViewController *viewController = [VBMainSlideMenuViewController new];
    UINavigationController *controller = [[UINavigationController alloc]
                                          initWithRootViewController:viewController];
    
    UIWindow *window = [UIWindow window];
    window.rootViewController = controller;
    self.window = window;
    [window makeKeyAndVisible];
    
    return YES;
}

- (void)applicationWillResignActive:(UIApplication *)application {
    
}

- (void)applicationDidEnterBackground:(UIApplication *)application {
    VBNewsFeed *newsFeed = [VBNewsFeed newsFeed];
    [newsFeed saveManagedObject];
}

- (void)applicationWillEnterForeground:(UIApplication *)application {
    
}

- (void)applicationDidBecomeActive:(UIApplication *)application {

}

- (void)applicationWillTerminate:(UIApplication *)application {
    // remove all data from cache
}

@end
