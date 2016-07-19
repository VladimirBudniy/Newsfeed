//
//  VBViewController.m
//  Newsfeed
//
//  Created by Vladimir Budniy on 28.06.16.
//  Copyright © 2016 Vladimir Budniy. All rights reserved.
//

#import "VBViewController.h"

static NSString * const kVBLeftButtonName     = @"Categories";
static NSString * const kVBRightButtonName    = @"Settings";

@interface VBViewController ()

- (void)leftButtonClick;
- (void)rightButtonClick;

- (void)leftButtonWithImageName:(NSString *)name;
- (void)rightButtonWithImageName:(NSString *)name;

@end

@implementation VBViewController

@dynamic barTitle;
@dynamic leftButtonName;
@dynamic rightButtonName;

#pragma mark -
#pragma mark Accessors

- (NSString *)barTitle {
    return nil;
}

- (NSString *)leftButtonName {
    return kVBLeftButtonName;
}

- (NSString *)rightButtonName {
    return kVBRightButtonName;
}

#pragma mark -
#pragma mark View LifeCycle

- (void)viewWillAppear:(BOOL)animated {
    [super viewWillAppear:animated];
    [self defaultNavigationBar];
    [self showNavigationBar];
}

#pragma mark -
#pragma mark Public

- (void)clearNavigationBar { //////////////change name of method
    UINavigationBar *navigationBar = self.navigationController.navigationBar;
    navigationBar.backgroundColor = [UIColor clearColor];
    [navigationBar setShadowImage:[[UIImage alloc] init]];
    [navigationBar setBackgroundImage:[[UIImage alloc] init]
                        forBarMetrics:UIBarMetricsDefault];
}

- (void)defaultNavigationBar {
    UINavigationBar *navigationBar = self.navigationController.navigationBar;
    [navigationBar setShadowImage:nil];
    [navigationBar setBackgroundImage:nil forBarMetrics:UIBarMetricsDefault];
}

- (void)hideNavigationBar {
    self.navigationController.navigationBarHidden = YES;
}

- (void)showNavigationBar {
    UINavigationController *navigationController = self.navigationController;
    navigationController.navigationBarHidden = NO;
    navigationController.navigationBar.backgroundColor = [UIColor blueColor];
    self.navigationItem.title = self.barTitle;
    [self leftButtonWithImageName:self.leftButtonName];
    [self rightButtonWithImageName:self.rightButtonName];
}

#pragma mark -
#pragma mark Private

- (void)leftButtonWithImageName:(NSString *)name {
    UIImage *leftImage = [UIImage imageNamed:name];
    leftImage = [leftImage imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal];
    self.navigationItem.leftBarButtonItem = [UIBarButtonItem leftButtonWithImage:leftImage
                                                                          action:@selector(leftButtonClick)
                                                                          target:self];
}

- (void)rightButtonWithImageName:(NSString *)name {
    UIImage *rightImage = [UIImage imageNamed:name];
    rightImage = [rightImage imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal];
    self.navigationItem.rightBarButtonItem = [UIBarButtonItem leftButtonWithImage:rightImage
                                                                           action:@selector(rightButtonClick)
                                                                           target:self];
}

- (void)leftButtonClick {
    [self.navigationController popViewControllerAnimated:YES];
}

- (void)rightButtonClick {
    [self.navigationController popToRootViewControllerAnimated:YES];
}

@end
