//
//  VBLeftSlideViewController.m
//  Newsfeed
//
//  Created by Vladimir Budniy on 21.07.16.
//  Copyright © 2016 Vladimir Budniy. All rights reserved.
//

#import "VBLeftSlideViewController.h"
#import "VBHotNewsViewController.h"
#import "VBLeftTableViewCell.h"

@interface VBLeftSlideViewController ()

@end

@implementation VBLeftSlideViewController

#pragma mark -
#pragma mark View LifeCycle

- (void)viewDidLoad {
    [super viewDidLoad];
    self.array = [@[@"All news", @"Sport", @"Economic"] mutableCopy];
}

#pragma mark
#pragma mark TableView Datasource

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return 1;
}

- (NSString *)tableView:(UITableView *)tableView titleForHeaderInSection:(NSInteger)section {
    return @"Categories";
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return self.array.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    VBLeftTableViewCell *cell = [tableView dequeueReusableCellWithBundleClass:[VBLeftTableViewCell class]];
    cell.cellLabel.text = self.array[indexPath.row];
    
    return cell;
}

#pragma mark
#pragma mark TableView Delegate

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    [tableView deselectRowAtIndexPath:indexPath animated:NO];
    
    UIViewController *viewController;

    switch (indexPath.row) {
        case 0:
            viewController = [VBHotNewsViewController new];
            break;
            
//        case 1:
//            viewController = [[VBSecondVC alloc] initWithNibName:@"VBSecondVC" bundle:nil];
//            break;
//            
//        case 2:
//            viewController = [[VBThirdVC alloc] initWithNibName:@"VBThirdVC" bundle:nil];
//            break;
    }
    
    UINavigationController *controller = [[UINavigationController alloc]
                                                    initWithRootViewController:viewController];
    [self openContentNavigationController:controller];
}

@end
