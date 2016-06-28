//
//  VBHotNewsViewController.m
//  Newsfeed
//
//  Created by Vladimir Budniy on 28.06.16.
//  Copyright © 2016 Vladimir Budniy. All rights reserved.
//

#import "VBHotNewsViewController.h"
#import "VBHotNewsView.h"

@interface VBHotNewsViewController ()
@property (nonatomic, readonly) VBHotNewsView  *rootView;

@end

@implementation VBHotNewsViewController

#pragma mark -
#pragma mark Accessors

VBRootViewAndReturnIfNilMacro(VBHotNewsView);

#pragma mark -
#pragma mark View LifeCycle

- (void)viewWillAppear:(BOOL)animated {
    [super viewWillAppear:animated];
    [super showNavigationBar];    //???????? need remove. including method at parents class
}

@end
