//
//  VBSelectedNewsViewController.m
//  Newsfeed
//
//  Created by Vladimir Budniy on 02.07.16.
//  Copyright © 2016 Vladimir Budniy. All rights reserved.
//

#import "VBSelectedNewsViewController.h"
#import "VBSelectedNewsView.h"
#import "VBNewsModel.h"

static NSString * const kVBLeftButtonName  = @"Back_button";
static NSString * const kVBRightButtonName    = @"Home_button";

@interface VBSelectedNewsViewController ()
@property (nonatomic, readonly) VBSelectedNewsView  *rootView;

@end

@implementation VBSelectedNewsViewController

#pragma mark -
#pragma mark Accessors

VBRootViewAndReturnIfNilMacro(VBSelectedNewsView);

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
    [self clearNavigationBar];
}

- (void)viewDidLoad {
    [super viewDidLoad];
    [self.rootView fillWithNews:self.news];
}

#pragma mark -
#pragma mark NavigationBar Action

- (void)leftButtonClick {
    [self.navigationController popViewControllerAnimated:YES];
}

- (void)rightButtonClick {
    [self.navigationController popToRootViewControllerAnimated:YES];
}

@end
