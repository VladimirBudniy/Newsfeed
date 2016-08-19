//
//  VBMainSlideMenuViewController.m
//  Newsfeed
//
//  Created by Vladimir Budniy on 21.07.16.
//  Copyright © 2016 Vladimir Budniy. All rights reserved.
//

#import "VBMainSlideMenuViewController.h"
#import "VBLeftSlideViewController.h"

@interface VBMainSlideMenuViewController ()

@end

@implementation VBMainSlideMenuViewController

- (void)viewWillAppear:(BOOL)animated {
    [super viewWillAppear:animated];
}

- (void)viewDidLoad {
    // according frameworks for AMSlideMenuMainViewController
    self.leftMenu = [VBLeftSlideViewController new];
    [super viewDidLoad];
    self.view.backgroundColor = VBCustormColor;
}

@end
