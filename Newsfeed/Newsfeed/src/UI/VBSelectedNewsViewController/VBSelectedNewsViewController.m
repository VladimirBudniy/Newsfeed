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

@interface VBSelectedNewsViewController ()
@property (nonatomic, readonly) VBSelectedNewsView  *rootView;

@end

@implementation VBSelectedNewsViewController

#pragma mark -
#pragma mark Accessors

VBRootViewAndReturnIfNilMacro(VBSelectedNewsView);

#pragma mark -
#pragma mark View LifeCycle

- (void)viewDidLoad {
    [super viewDidLoad];
    [self.rootView fillWithNews:self.news];
//    [self.rootView showLoadingViewWithDefaultTextAnimated:YES];
}

- (void)setNews:(VBNewsModel *)news {
    if (_news != news) {
        _news = news;
    }
    
    [self.rootView showLoadingViewWithDefaultTextAnimated:YES];
}

@end
