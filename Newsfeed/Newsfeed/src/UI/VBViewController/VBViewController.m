//
//  VBViewController.m
//  Newsfeed
//
//  Created by Vladimir Budniy on 28.06.16.
//  Copyright © 2016 Vladimir Budniy. All rights reserved.
//

#import "VBViewController.h"

static NSString * const kVBLeftButtonName     = @"left_arrow.png";
static NSString * const kVBRightButtonName    = @"home.png";

@interface VBViewController ()

- (void)leftButtonClick;
- (void)rightButtonClick;

- (void)leftButtonWithImageName:(NSString *)name;
- (void)rightButtonWithImageName:(NSString *)name;

- (void)addHandlers;

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
    [self showNavigationBar];
}

#pragma mark -
#pragma mark Public

- (void)hideNavigationBar {
    self.navigationController.navigationBarHidden = YES;
}

- (void)showNavigationBar {
//    [self.navigationController.navigationBar setBackgroundImage:[UIImage new]
//                                                  forBarMetrics:UIBarMetricsDefault]; //UIImageNamed:@"transparent.png"
//    self.navigationController.navigationBar.shadowImage = [UIImage new];////UIImageNamed:@"transparent.png"
//    self.navigationController.navigationBar.translucent = YES;
//    self.navigationController.view.backgroundColor = [UIColor clearColor];

    self.navigationController.navigationBarHidden = NO;
    self.navigationItem.title = self.barTitle;
    [self leftButtonWithImageName:self.leftButtonName];
    [self rightButtonWithImageName:self.rightButtonName];
}

- (void)successLoadObject:(id)object {
    
}

- (void)faildLoadObject:(id)object {
    
}

#pragma mark -
#pragma mark Private

- (void)addHandlers {
    //    VBWeakSelfMacro;
    //    [_context addHandler:^(id object) {
    //        VBStrongSelfAndReturnNilMacro;
    //        [strongSelf successLoadObject:object];
    //    } forState:kVBModelLoadedState
    //                  object:self];
    //
    //    [_context addHandler:^(id object) {
    //        VBStrongSelfAndReturnNilMacro;
    //        [strongSelf faildLoadObject:object];
    //    } forState:kVBModelFailedState
    //                  object:self];
}

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
