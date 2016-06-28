//
//  VBAppDelegate.m
//  Newsfeed
//
//  Created by Vladimir Budniy on 28.06.16.
//  Copyright © 2016 Vladimir Budniy. All rights reserved.
//

#import "IDPActiveRecordKit.h"

#import "VBAppDelegate.h"

static NSString * const kVBCoraDataName = @"NewsfeedCoreData";

@implementation VBAppDelegate

- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {
    [IDPCoreDataManager sharedManagerWithMomName:kVBCoraDataName];
    
    UIWindow *window = [UIWindow window];
    self.window = window;
    
//    VBLoginViewController *viewController = [VBLoginViewController new];
//    UINavigationController *controller = [[UINavigationController alloc]
//                                          initWithRootViewController:viewController];
//    
//    window.rootViewController = controller;
    [window makeKeyAndVisible];
    
    [[UIApplication sharedApplication] setStatusBarStyle:UIStatusBarStyleDefault];
    

    return YES;
}

- (void)applicationWillResignActive:(UIApplication *)application {
    
}

- (void)applicationDidEnterBackground:(UIApplication *)application {
    
}

- (void)applicationWillEnterForeground:(UIApplication *)application {
    
}

- (void)applicationDidBecomeActive:(UIApplication *)application {

}

- (void)applicationWillTerminate:(UIApplication *)application {
    
}

@end
