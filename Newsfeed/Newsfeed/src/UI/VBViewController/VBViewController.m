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
- (void)addBarButtons;

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
}

- (void)viewDidLoad {
    [super viewDidLoad];
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
    self.navigationController.navigationBar.backgroundColor = [UIColor blueColor];
    UINavigationBar *navigationBar = self.navigationController.navigationBar;
    [navigationBar setShadowImage:nil];
    [navigationBar setBackgroundImage:nil forBarMetrics:UIBarMetricsDefault];
}

- (void)hideNavigationBar {
    self.navigationController.navigationBarHidden = YES;
}

- (void)showNavigationBar {
    self.navigationController.navigationBar.backgroundColor = [UIColor blueColor];
    self.navigationItem.title = self.barTitle;
    [self addBarButtons];
}

- (void)leftButtonWithImageName:(NSString *)name action:(SEL)selector target:(id)object {
    UIImage *leftImage = [UIImage imageNamed:name];
    leftImage = [leftImage imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal];
    self.navigationItem.leftBarButtonItem = [UIBarButtonItem leftButtonWithImage:leftImage
                                                                          action:selector
                                                                          target:object];
}

- (void)rightButtonWithImageName:(NSString *)name action:(SEL)selector target:(id)object {
    UIImage *rightImage = [UIImage imageNamed:name];
    rightImage = [rightImage imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal];
    self.navigationItem.rightBarButtonItem = [UIBarButtonItem rightButtonWithImage:rightImage
                                                                            action:selector
                                                                            target:object];
}

#pragma mark -
#pragma mark Private

- (void)addBarButtons {
    [self leftButtonWithImageName:self.leftButtonName
                           action:@selector(openLeftMenu)
                           target:self.viewController];
    
    [self rightButtonWithImageName:self.rightButtonName
                            action:@selector(openRightMenu)
                            target:self.viewController];
}

@end
