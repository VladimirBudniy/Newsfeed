//
//  VBViewController.m
//  Newsfeed
//
//  Created by Vladimir Budniy on 28.06.16.
//  Copyright © 2016 Vladimir Budniy. All rights reserved.
//

#import "VBViewController.h"

static NSString * const kVBLeftButtonName     = @"categories";
static NSString * const kVBRightButtonName    = @"settings";

@interface VBViewController ()
- (void)addBarButtons;
- (NSDictionary *)defaultAttributes;
- (void)barTitle:(NSString *)title attributes:(NSDictionary *)attributes;

@end

@implementation VBViewController

@dynamic leftButtonName;
@dynamic rightButtonName;

#pragma mark -
#pragma mark Accessors

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
    [self showNavigationBar];
}

#pragma mark -
#pragma mark Public

- (void)clearNavigationBar {
    UINavigationBar *navigationBar = self.navigationController.navigationBar;
    navigationBar.backgroundColor = [UIColor clearColor];
    [navigationBar setShadowImage:[[UIImage alloc] init]];
    [navigationBar setBackgroundImage:[[UIImage alloc] init]
                        forBarMetrics:UIBarMetricsDefault];
}

- (void)showNavigationBar {
    self.view.backgroundColor = VBCustormColor;
    [self clearNavigationBar];
    [self barTitle:self.barTitle attributes:[self defaultAttributes]];
    [self addBarButtons];
}

- (void)hideNavigationBar {
    self.navigationController.navigationBarHidden = YES;
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


- (void)barTitle:(NSString *)title attributes:(NSDictionary *)attributes {
    self.navigationItem.title = title;
    [self.navigationController.navigationBar setTitleTextAttributes:attributes];
}

- (NSDictionary *)defaultAttributes {
    NSShadow *shadow = [NSShadow new];
    shadow.shadowColor = [UIColor darkGrayColor];
    shadow.shadowOffset = CGSizeMake(0, 2);
    UIFont *font = [UIFont fontWithName:kVBBarTitleTextStyle size:kVBBarTitleTextSize];
    NSDictionary *textTitleOptions = @{NSForegroundColorAttributeName:[UIColor whiteColor],
                                                NSShadowAttributeName:shadow,
                                                  NSFontAttributeName:font};
    
    return textTitleOptions;
}

- (void)addBarButtons {
    [self leftButtonWithImageName:self.leftButtonName
                           action:@selector(openLeftMenu)
                           target:self.viewController];
    
    [self rightButtonWithImageName:self.rightButtonName
                            action:@selector(openRightMenu)
                            target:self.viewController];
}

@end
