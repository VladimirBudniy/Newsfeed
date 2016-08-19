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

static NSString * const kVBLeftButtonName  = @"back_button";
static NSString * const kVBRightButtonName    = @"home_button";

@interface VBSelectedNewsViewController ()
@property (nonatomic, readonly) VBSelectedNewsView  *rootView;

- (void)leftButtonClick;
- (void)rightButtonClick;

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
    [self navigationBarColor:[UIColor clearColor]];
}

- (void)viewDidLoad {
    [super viewDidLoad];
    [self.rootView fillWithNews:self.news];
    [self addBarButtons];
}

#pragma mark -
#pragma mark Private

- (void)addBarButtons {
    [self leftButtonWithImageName:self.leftButtonName action:@selector(leftButtonClick) target:self];
    [self rightButtonWithImageName:self.rightButtonName action:@selector(rightButtonClick) target:self];
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
